#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const char PERSONARCHIVENAME[] = "./data/allthepeople.bin"; //ah yeah, this pathing here will prolly cause a major fuckup in unix and stuff, beware.
static const char CARARCHIVENAME[] = "./data/allthecars.bin";

//some small rant following
/*the smart and educated and civilized way of doing this 
is by organizing both archives by cpf, since the search would output
the useful info real faster. I was specifically asked to not do this.
Good stuff this is not production ready and never will be anyways o.O */

//more small rant following
/*
    The fact i gotta use c for this one is the actual major fuckup.
    I had to sort a fucking binary file, meaning loading an entire binary
    on memory and using qsort, WHICH I HAVEN'T TESTE YET, BTW, and it makes
    me wanna puke blood real bad. Maybe the real fuckup is the 
    triple funny we made along the way.
*/



typedef struct person{
    char name[128]; //this is just for funzies, not actually useful.
    char cpf[11]; //This is the primary key
} person;

typedef struct car{
    char cpf[11]; //this is what links the car to some person. If these match, every tiny thing is right in this bloody world.
    char crlv[12]; // this is the actual primary key;
} car;


//data-getter functions
void getcar(car *somecar, person *someperson) {
    printf("Input the car's crlv: ");
    scanf("%s", somecar->crlv);
    strcpy(somecar->cpf, someperson->cpf);
}

void getperson(person *someperson){
    printf("Input the person's name: ");
    scanf("%s", someperson->name);
    printf("Input the person's cpf: ");
    scanf("%s", someperson->cpf);   
}

FILE *addtofile(char *name){
    FILE *f = fopen(name, "ab");
    return f;
}

FILE *openfile(char *name){ //this is for reading data :>
    FILE *f;
    f = fopen(name, "rb");
    if(f == NULL){
        f = makefile(name);
    }
    return f;
}

FILE *makefile(char *name){ //this guy *specifically* makes a new file. Use it if the openfile functions returns a NULL, else you'll overwrite your stuff and prolly fuck it up!
    FILE *f;
    f = fopen(name, "wb"); //THIS IS GOING FULL BIN INSIDE THE FS. DO NOT FUCKING PUT .TXT OR SOME SHIT LIKE THAT. USE .BIN!
    return f; //return a pointer to the guy you told us, simple as.
}

void writeperson(person *someperson){ //this should be used only when you made sure this person does not already exists!!!
    FILE *f = addtofile(PERSONARCHIVENAME);
    if(f == NULL){
        f = makefile(PERSONARCHIVENAME);
        if(f == NULL){
            printf("Missing archive and unable to be created.\n");
            fclose(f);
            return;
        }
    }
    else{
        fwrite(someperson, sizeof(person), 1, f);
    }
    fclose(f);
}

void writecar(car *somecar){
    FILE *f = addtofile(CARARCHIVENAME);
    if(f == NULL){
        f = makefile(CARARCHIVENAME);
        if(f == NULL){
            printf("Missing archive and unable to be created.\n");
            fclose(f);
            return;
        }
    }
    else{
        fwrite(somecar, sizeof(car), 1, f);
    }
    fclose(f);
}

void visualizeperson(char cpf[11]){
    // open the stuff :>
    FILE *fperson = openfile(PERSONARCHIVENAME);
    FILE *fcars = openfile(CARARCHIVENAME);

    if(fperson == NULL || fcars == NULL){
        printf("Error opening files! Verify if files are missing...\n");
        return;
    }

    person someperson;
    car somecar;
    int hit = 0;
    while(EOF != feof(fperson)){
        fread(&someperson, sizeof(person), 1, fperson);
        if(0 == strcmp(someperson.cpf, cpf)){
            hit = 1;
            break;
        }
    }
    if(hit == 0){
        printf("Person not found!!");
    }
    else{
        printf("Person found!\n");
        printf("Name: %s\n", someperson.name);
        printf("Cpf: %s\n", someperson.cpf);
        printf("-------------cars------------\n");
        hit = 0;
        int i = 0;
        while(EOF != feof(fcars)){
            fread(&somecar, sizeof(car), 1, fcars);
            if(0 == strcmp(somecar.cpf, cpf)){
                hit = 1;
                i++;
                printf("%d. - CRLV: %s\n", i, somecar.crlv);
            }
        }
        if(hit == 0){
            printf("!NO CARS FOUND!");
        }
    }
    // cleanup;
    fclose(fperson);
    fclose(fcars);
}

int compare_crlv(const void* a, const void* b)
{ //base function copied from cppreference. Very useful.
    long arg1 = strtol(((car*)a)->crlv, NULL, 10);
    long arg2 = strtol(((car*)b)->crlv, NULL, 10);
 
    if (arg1 < arg2) return -1;
    if (arg1 > arg2) return 1;
    return 0;
 
    //following comments are from vanilla cppreference steal:
    // return (arg1 > arg2) - (arg1 < arg2); // possible shortcut
 
    // return arg1 - arg2; // erroneous shortcut: undefined behavior in case of
                           // integer overflow, such as with INT_MIN here
}

int compare_cpf(const void* a, const void* b)
{ //base function copied from cppreference. Very useful.
    long arg1 = strtol(((person*)a)->cpf, NULL, 10); //strtol here is used for the sake of comparing numerically cpfs, else we outta have major major fuckups!
    long arg2 = strtol(((person*)b)->cpf, NULL, 10);
 
    if (arg1 < arg2) return -1;
    if (arg1 > arg2) return 1;
    return 0;
 
    //following comments are from vanilla cppreference steal:
    // return (arg1 > arg2) - (arg1 < arg2); // possible shortcut
 
    // return arg1 - arg2; // erroneous shortcut: undefined behavior in case of
                           // integer overflow, such as with INT_MIN here
}


//following are sort funcs using qsort. Might work. Might also blow up in our faces, we'll see.
void sortpeople(){
    char temp[] = "./data/temp.bin";
    FILE *ftemp = makefile(temp);
    FILE *fperson = openfile(PERSONARCHIVENAME);
    int i = 0;
    person someperson;

    //first we find how many of these fuckers we got on the file.
    while(EOF != feof(fperson)){
        fread(&someperson, sizeof(person), 1, fperson);
        i++;
    }
    person personarray[i];//then we gotta save each and every one of these bastards on the array so they get very sorted :).
    fseek(fperson, sizeof(person), SEEK_SET); //a cleanup a day keeps a fuckup away
    i = 0;
    while(EOF != feof(fperson)){
        fread(&someperson, sizeof(person), 1, fperson);
        strcpy(personarray[i].name, someperson.name);
        strcpy(personarray[i].cpf, someperson.cpf);
        i++;
    }

    //now comes the "easy" part.
    qsort(personarray, sizeof(person), i, compare_cpf);
    i = 0; // small cleanup keeps small fuckup far far away!
    
    //and we write on temp ->
    while (EOF != feof(ftemp))
    {
        fwrite(&personarray[i], sizeof(person), 1, ftemp);
        i++;
    }
    fclose(ftemp);
    fclose(fperson);
    remove(PERSONARCHIVENAME);
    rename(temp, PERSONARCHIVENAME);

    //IM NOT EVEN CLOSE TO FINISHING THIS PIECE OF SHIT SOFTWARE, BTW :)
}

void sortcars(){
    char temp[] = "./data/temp.bin";
    FILE *ftemp = makefile(temp);
    FILE *fcars = openfile(CARARCHIVENAME);
    int i = 0;
    car somecar;

    //first we find how many of these fuckers we got on the file.
    while(EOF != feof(fcars)){
        fread(&somecar, sizeof(car), 1, fcars);
        i++;
    }
    car cararray[i];//then we gotta save each and every one of these bastards on the array so they get very sorted :).
    fseek(fcars, sizeof(person), SEEK_SET); //a cleanup a day keeps a fuckup away
    i = 0;
    while(EOF != feof(fcars)){
        fread(&somecar, sizeof(person), 1, fcars);
        strcpy(cararray[i].crlv, somecar.crlv);
        strcpy(cararray[i].cpf, somecar.cpf);
        i++;
    }

    //now comes the "easy" part.
    qsort(cararray, sizeof(person), i, compare_cpf);
    i = 0; // small cleanup keeps small fuckup far far away!
    
    //and we write on temp ->
    while (EOF != feof(ftemp))
    {
        fwrite(&cararray[i], sizeof(person), 1, ftemp);
        i++;
    }
    fclose(ftemp);
    fclose(fcars);
    remove(CARARCHIVENAME);
    rename(temp, CARARCHIVENAME);
}

void sortall(){
    sortpeople();
    sortcars();
}

void datagetter(){ //this one is dedicated to running registration routine. Supposedly, very very simple. We'll see in practice.
    //this function also assumes the user already decided to start registering a person with naught or more cars.
    person *someperson = malloc(sizeof(person));
    person personholder;

    FILE *fpersons = openfile(PERSONARCHIVENAME);
    FILE *fcars = openfile(CARARCHIVENAME);
    int hit = 0;
    printf("input name of person: \n");
    scanf("%s", someperson->name);
    printf("input cpf of person: \n" );
    scanf("%s", someperson->cpf);

    while(EOF != feof(fpersons)){
        fread(&personholder, sizeof(person), 1, fpersons);
        if(strcmp(personholder.cpf, someperson->cpf) == 0){// if its equal, person already in, no doubles allowed.
            hit = 1; //then we got a hit.
            break;
        } 
    }
    if(hit == 1){
        printf("PERSON ALREADY REGISTERED!");
        fclose(fpersons);
        free(someperson);
        return;
    }
    else
    { // meaning no same cpf found, then hit == 0 returns 1;
        fclose(fpersons);
        writeperson(someperson);
        int zetta = 0;
        printf("Input numbers of cars you wish to register: \n");
        scanf("%d", &zetta);
        car allcars[zetta];
        car somecar;
        int z;
        char somecrlv[12] = "";
        for (int i = 0; i < zetta; i++){
            hit = 0;
            z = i + 1; //this is purelly for text formatting stuff. pretty plz do not do not use this var for vector manip.
            if(i%10 == 0){
                printf("Input the crlv of the %dst car: \n", z);
            }
            else if(i%10 == 1){
                printf("Input the crlv of the %dnd car: \n", z);
            }
            else if(i%10 == 2){
                printf("Input the crlv of the %drd car: \n", z);
            }
            else {
                printf("Input the crlv of the %dth car: \n", z);
            }
            
            //this piece below should only be exec'd if the crlv inputed is unique.

            scanf("%s", &somecrlv);
            while(EOF != feof(fcars)){
                fread(&somecar, sizeof(car), 1, fcars);
                if(strcmp(somecar.crlv, somecrlv) == 0){
                    hit = 1;
                }
            }
            if(hit == 1){
                printf("Car already registered!");
                i -= 1;
                continue;
            }
            else{
            strcpy(allcars[i].crlv, somecrlv);
            strcpy(allcars[i].cpf, someperson->cpf);
            }
        }
        //and then we write a bunch of cars to memory!
        fclose(fcars); //gotta be closed so writecar works :P
        for (int i = 0; i < zetta; i++){ //todo!
            writecar(&allcars[i]);
        }
    }
    //the lines below avoid major malfunctions, brother!
    free(someperson);
    //and guess what? after all this, we gotta write two big other functions! FUCKME!!!!!!
}

void carkiller(char *cpf){
    char temp[] = "./data/temp.bin";
    FILE *ftemp = fopen(temp, "wb");
    FILE *fcars = openfile(CARARCHIVENAME);
    car somecar;
    int hit = 0;
    while(EOF != feof(fcars)){
        fread(&somecar, sizeof(car), 1, fcars);
        if(strcmp(somecar.cpf, cpf) == 0){
            continue;
        }
        else{
            fwrite(&somecar, sizeof(car), 1, fcars);
        }
    }
    if(hit == 0){
        printf("Person not found!");
    }   
    fclose(fcars);
    fclose(ftemp);
    remove(CARARCHIVENAME);
    rename(temp, CARARCHIVENAME);
}

void personkiller(char *cpf){
    char temp[] = "./data/temp.bin";
    //create and open files
    FILE *ftemp = fopen(temp, "wb");
    FILE *fperson = openfile(PERSONARCHIVENAME);
    person someperson;
    int hit = 0;
    while(EOF != feof(fperson)){
        fread(&someperson, sizeof(person), 1, fperson);
        if(strcmp(someperson.cpf, cpf) == 0){
            continue;
        }
        else{
            fwrite(&someperson, sizeof(person), 1, ftemp);
        }
    }
    if(hit == 0){
        printf("Person not found!");
    }
    fclose(fperson);
    fclose(ftemp);
    remove(PERSONARCHIVENAME);
    rename(temp, PERSONARCHIVENAME);
    carkiller(cpf);
}
void menu(){
    printf("welcome to the amazing program\n");
    int option;
    while (1)
    {
        printf("options:\n1. register new person and cars\n2. visualize registered person and cars\n3. erase person and cars\n4. exit\n Select option: ");
        scanf("%d", &option);
        switch(option){
            case 1:
                datagetter();
            case 2:
                char somecpf[11];
                printf("Input the cpf to be searched: ");
                scanf("%s", somecpf);
                visualizeperson(somecpf);
            case 3:
                int selection;
                printf("WARINING, THIS FUNCTION !!WILL!! ERASE PERSON AND CARS LINKED TO THIS PERSON.\n");
                printf("Are you sure you want to continue?\n0. no\n1. yes\nSelection: ");
                scanf("%d", &selection);
                if(selection == 1){
                    char somecpf[11];
                    printf("Input the cpf of the person to be erased: ");
                    scanf("%s", somecpf);
                    personkiller(somecpf);
                }
            case 4:
                printf("now exiting...");
                break;
        }
    }
}

int main(){
    menu();
    return 0;
}


/*
coded in 20032024 by bclocvst. Forgiveness is asked for the terrible software that comes forth.
*/
//NOTE1: "->" operator is used to access data from a struct pointer.

#include <stdlib.h>
#include <stdio.h>

typedef struct holder{
    person **persons;
    car ***cars3;
    int sizeofpersons;
    int sizeofcars;
} holder;

typedef struct person{
    char name[128];
    char cpf[11];
} person;

typedef struct car{
    char crlv[12];
} car;

void menu(int *option ){
    printf("welcome to the cardb.\n");
    printf("please select an option: \n");
    printf("1. register \n");
    printf("2. exit \n");
    scanf("%d", option);
    //printf("%d", *option); // test stuff, if it works, the thing got saved alright!
}

void visualizedata(person **persons, car ***cars){


}

void runrest(holder *someholder){
    int zetta1, zetta2;
    zetta1 = zetta2 = 0;

    //BEWARE WHAT YOU ANSWER RIGHT HERE. THIS WILL DIRECTLY INFLUENCE IN THE MEMORY CONSUMED. BE-FUCKING-WARE THIS!
    printf("input the number of people you wish to register!\n");
    scanf("%d", &zetta1);
    person **persons[zetta1];
    car ***cars3[zetta1]; // this gets defined by the number of people;
    int nums[zetta1];
    printf("input the number of cars these people have, respectively...\n");

    
    for (int i = 0; i < zetta1; i++){
        scanf("%d", zetta2);
        car **cars2[zetta2];
        cars3[i] = cars2;
        nums[i] = zetta2;
    }

    // THIS IS FORLOOP HELL, WELCOME! THIS SHIT RUNS FOR THE SUM OF CARS DECLARED FOR EVERY PERSON! GET READY TO TYPE TO DEATH!
    for (int i = 0; i < zetta1; i++){ // this guy runs for every people you chose it to run up there.
        person *newperson = malloc(sizeof(person));
        char newname[128];
        char newcpf[11];
        printf("input the name of this person:\n");
        scanf("%s", newname);
        printf("input the cpf of this person:\n");
        scanf("%s", newcpf);
        strcpy(newperson->name, newname);
        strcpy(newperson->cpf, newcpf);
        persons[i] = newperson;
        zetta2 = nums[i];
        for (int j = 0; j < zetta2; j++){ //this guy should run for every person's informed number of vehicles.
            car *somecar = malloc(sizeof(car));

        }
    }

    return
}

int main(){
    int stuff = -1;
    menu(&stuff);
    printf("\n option selected: %d", stuff);
    if(stuff == 1){
        holder *someholder = malloc(sizeof(holder));
        runrest(someholder);
    }
    else{
        
    }
    return 0;
}
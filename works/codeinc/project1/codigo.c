/*
coded in 20032024 by bclocvst. Forgiveness is asked for the terrible software that comes forth.
*/

#include <stdlib.h>
#include <stdio.h>

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

void runrest(){
    int zetta1, zetta2;
    zetta1 = zetta2 = 0;
    printf("select number of people you wish to register!\n");
    scanf("%d", &zetta1);

    
    //THIS IS FORLOOP HELL, WELCOME!
    for (int i = 0; i < zetta1; i++){//this guy run for every people
        
        printf("how many cars do you wish to register to this person?");
        scanf("%d", &zetta2); //this guy scans the number of cars this person has and got to register
        for(int j = 0; j < zetta2; j++){
        
        }  
    }
}

int main(){
    int stuff = -1;
    menu(&stuff);
    printf("\n option selected: %d", stuff);
    if(stuff == 1){
        runrest();
    }
    else{
        
    }
    return 0;
}
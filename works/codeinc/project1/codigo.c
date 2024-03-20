#include <stdlib.h>
#include <stdio.h>

void menu(int *option ){
    printf("welcome to the cardb.\n");
    printf("please select an option: \n");
    printf("1. register \n");
    printf("2. exit \n");
    scanf("%d", option);
    //printf("%d", *option); // test stuff, if it works, the thing got saved alright!

}

int main(){
    int stuff = -1;
    menu(&stuff);
    printf("\n option selected: %d", stuff);

    return 0;
}
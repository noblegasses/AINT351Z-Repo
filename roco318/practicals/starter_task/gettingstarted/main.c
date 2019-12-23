#include <stdio.h>
#define n 1024
int main(){
    int array[n];
    printf("\ntype some letters, separated with ENTER, terminate with *.");
    int  o = 0; //array offset variable
    int c = 0; //char value
    do{
        c = getchar();
        if (c != '*' ){
            array[o] = c;
            o++;
       }
    } while(c != '*');
    printf("\nYou entered ");
    for (int i=0;i<o; i++){
        printf ("%c", array[i]);
    }
return 0;
}

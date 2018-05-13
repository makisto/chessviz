#include <stdio.h>
#include <stdlib.h>
#include "p.h"
#include "P.h"
#include "board.h"

int main()
{
    system("clear");
    char s[9][9], k[5];
    int z1 = 0, z2 = 0, z3 = 0, z4 = 0, flag1 = 0;

    fillboard(s);  
    board(s);

while (1){
    if (flag1 == 0) printf("Малые\n");
    else if (flag1 == 1) printf("Большие\n");
    for(int i = 0;i <= 5;i++) {
    k[i] = getchar();
    }

    system("clear");

    if (flag1 == 0) {
    z1=pmove(k, s);
    z2=phack(k, s);
    if ((z1 == 1) && (z2 == 1)) {
    system("clear");
    printf("Неправильный ход"); 
    puts("\n");
    z1 = 0; 
    z2 = 0;
}
    else{
    z1 = 0; 
    z2 = 0; 
    flag1 = 1;
}
}

    else if (flag1 == 1) {
    z3 = Pmove(k, s);
    z4 = Phack(k, s);
    if ((z3 == 1) && (z4 == 1)) { 
    system("clear");
    printf("Неправильный ход"); 
    puts("\n");
    z3=0; 
    z4=0; 
}
    else {
    z3=0; 
    z4=0; 
    flag1=0;
}
}

    board(s);
}
    return 0;
}

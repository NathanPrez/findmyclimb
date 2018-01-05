//
//  main.c
//  check
//
//  Created by Nathan Preston on 18/01/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <string.h>
#include <stdio.h>
#include <stdlib.h>


int main() {
    char char1, char2, char3, password[6], i1[6], i2[6];
    int add=0, loop3=0, end = 0, cmp = 0;
/*
    printf("Input password: ");
    scanf("%s", &password[0]);
    
    while(loop3<3){
        add=0;
        printf("Input: ");
        scanf(" %c,%c,%c", &char1, &char2, &char3);
        
        for(int x=0; x<sizeof(password);x++){
            if((char1 == password[x]||char2 == password[x]||char3 == password[x])){
                add++;
                if(add==3){
                    loop3=3;
                    end=1;
                    break;
                }
            }
        }
        loop3++;
    }
    
*/
    
    printf("input1: ");
    scanf("%s", &i1[0]);
    printf("input2: ");
    scanf(" %s", &i2[0]);
    cmp = strcmp(i1, i2);
    printf(" %d", cmp);

    return(0);
}



//
//  main.c
//  Login
//
//  Created by Nathan Preston on 18/01/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
    int loop1= 0, loop2 =3, loop3=3, add = 0, enter=0, pin=0, pinIN =0, cmp;
    char userID[6], userIDIN[6], password[20], char1, char2, char3;
    

    
    printf("This is for testing\n");
    printf("Input UserID: ");
    scanf("%s", &userID[0]);
    printf("Input Pin: ");
    scanf("%d", &pin);
    printf("Input password: ");
    scanf("%s", &password[0]);

    while(loop1<3){
        printf("\n\n\nInput UserID: ");
        scanf("%s", &userIDIN[0]);
        cmp = strcmp(userIDIN, userID);
        if(cmp==0){
            loop2 =0;
            break;
        }
        else{
            loop1++;
        }
    }
    
    while(loop2<1){
        printf("Input Pin: ");
        scanf("%d", &pinIN);
        if(pinIN==pin){
            loop3 =0;
            break;
        }
        else{
            loop2++;
        }
    }
    
    while(loop3<3){
        add=0;
        printf("Input: ");
        scanf(" %c,%c,%c", &char1, &char2, &char3);
        
        for(int x=0; x<sizeof(password);x++){
            if((char1 == password[x]||char2 == password[x]||char3 == password[x])){
                add++;
                if(add==3){
                    loop3=3;
                    enter=1;
                    break;
                }
            }
        }
        loop3++;
    }

    
    if(enter==1){
        printf("Proceed\n\n");
    }
    else{
        printf("Incorrect ID - Access Denied\n\n");     
    }

    
    
    
    
    
    system("pause");
    return(0);       
}

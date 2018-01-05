//
//  main.c
//  Caesar
//
//  Created by Nathan Preston on 01/02/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

void encryptt();
void de();

char encrypted[250], normal[250];
int shiftKey;

int main(){
    int choice, loop=0;
    
    while(loop==0){
        printf("Encrypt (1) or Decrypt (2) or End (3): ");
        scanf("%d", &choice);
        
        if(choice==1){
            encryptt();
        }
        
        else if(choice==2){
            de();
        }
        
        else if(choice==3){
            loop=1;
        }
        
        else{
            printf("Invalid Statement\n");
        }
    }
    
    
    printf("\n\n");
    system("pause");
    return(0);
}

void encryptt(){
    printf("Input text (replace a space with '-'): ");
    scanf(" %s", &normal[0]);
    printf("Input shift key (1-26): ");
    scanf(" %d", &shiftKey);
    
    for(int x=0; x<=strlen(normal)-1; x++){
        encrypted[x] = normal[x]+shiftKey;
        normal[x] = ' ';
    }
    printf("Encrypted word: %s\n\n\n\n", encrypted);
    
}

void de(){
    for(int x=0; x<=strlen(encrypted)-1; x++){
        normal[x] = encrypted[x]-shiftKey;
        encrypted[x] = ' ';
    }
    printf("Orginal word: %s\n\n", normal);

}

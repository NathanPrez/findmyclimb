//
// main.c
// DinnerTable
//
// Created by Nathan Preston on 12/11/2016.
// Copyright © 2016 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

char bookingID[4][20], boardType[4][1];
int guestsInRoom[4], tables[6][1]={0,0};
//globals

void bookingTable();
//the function


int main(){
        bookingTable();
        //calling fucntion
    system("pause");
    return(0);
}




void bookingTable(){
    char compareID[20];
    int test = 1, bookingCmp = 0, boardCmp1 = 0, boardCmp2 = 0, tableChoice = 0, i = 0, valid[6];
    //locals

    printf("Input bookingID: ");
    scanf("%s", &compareID);

    while(i<5){
        bookingCmp = strcmp(compareID,bookingID[i]);
        if(bookingCmp==0){
            break;
        }
        i++;
    }
    //input booking ID, checks if its real. If real, index for all the others are found
    boardCmp1 = strcmp(boardType[i],"1");
    boardCmp2 = strcmp(boardType[i],"2");
    //checks if board type works

    if((bookingCmp==0) && ((boardCmp1 == 0)||(boardCmp2 == 0))){
    //if board type is okay and so is the name if statement begins
        printf("\n\nThere is space at: ");
        
        if(tables[0][0]<5){
            printf("\n0. Endor at 7pm");
            valid[0] = 1;
        }
        //checks if theres space in required table
        if(tables[1][0]<5){
            printf("\n1. Endor at 9pm");
            valid[1] = 2;
        }
        
        if(tables[2][0]<5){
            printf("\n2. Naboo at 7pm");
            valid[2] = 3;
        }
        
        if(tables[3][0]<5){
            printf("\n3. Naboo at 9pm");
            valid[3] = 4;
        }
        
        if(tables[4][0]<5){
            printf("\n4. Tattoine at 7pm");
            valid[4] = 5;
        }
        
        if(tables[5][0]<5){
            printf("\n5. Tattoine at 9pm");
            valid[5] = 6;
        }
    
        printf("\nPlease input the ID number for the desired table/time: ");
        scanf("%d", &tableChoice);
        
        for(int x = 0; x<6; x++){      
          if(tableChoice==valid[i]){
            tables[tableChoice][0] = tables[tableChoice][0] + guestsInRoom[i];
            printf("Your seats have been reserved");
            test = 0;
            //updates the number of spaces free on the chosen table                        
          }          
        }
        
        if(test == 1){
          printf("The table that you have entered is invalid");        
        }
    }
    else{
        printf("You have either spelt your ID incorrectly or your board type does not allow you to book");
    }
    //if what theyve put in isnt okay this is outputted
    printf("\n\n");
}

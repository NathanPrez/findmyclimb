//
//  main.c
//  Christmas
//
//  Created by Nathan Preston on 02/01/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char present[50];
int price[20][1], i =0, kids = 0, tot = 0;

void input();
void presentTracker();

int main(){
    input();
    presentTracker();
    
    printf("\n\n\n");
    system("pause");
    return(0);
}

void input(){
    int n = 1;
    
    while(n==1){
        
        printf("Input the name and price of the present, must be between 5-15: ");
        scanf("%s %d",&present[0], &price[i][0]);
        
        if((price[i][0]>=5)&&(price[i][0]<=15)){
            i++;
            if(i>10){
                printf("Do you wish to input any more (1=yes, 0=no): ");
                scanf("%d", &n);
            }
        }
        
        else{
            printf("\nInvalid\n");
        }
    }
}

void presentTracker(){
    int max = 0, houseAv = 0, streetAv = 0;
    
    for(int street=0; street<10; street++){
        streetAv = 0;
        printf("\n\nHow many houses are on street %d: ", street+1);
        scanf("%d", &max);
        
        for(int house=0; house<max; house++){
            printf("How many kids live in house %d: ", house+1);
            scanf("%d", &kids);
            printf("\n\n");
            
            int KidsInStreet[house+1][kids+1];
            
            
            if(kids==1){
                int randomN = rand() % i;
                if((price[randomN][0]) == 0){
                    printf("Input the name and price of the present, must be between 5-15: ");
                    scanf("%d", &price[randomN][0]);
                }
                
                houseAv = price[randomN][0];
                price[randomN][0] = 0;
                
            }
            
            else{
                do{
                    houseAv = 0;
                    for(int x = 1; x<=kids; x++){
                        int rando = rand() % i;
                        
                        if((price[rando][0]) == 0){
                            printf("Input the name and price of the present, must be between 5-15: ");
                            scanf("%d", &price[rando][0]);
                        }
                        
                        houseAv = houseAv + price[rando][0];
                        price[rando][0] = 0;
                        
                    }
                    houseAv = houseAv/kids;
                    
                }while(houseAv>9);
            }
            streetAv = streetAv + houseAv;
        }
        printf("Average for street %d: %d", street+1, streetAv);
    }


}

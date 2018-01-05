//
//  main.c
//  savingPlan
//
//  Created by Nathan Preston on 01/10/2016.
//  Copyright © 2016 Nathan Preston. All rights reserved.
//


#include<stdio.h>
#include<stdlib.h>

int main(){
    int year = 0;
    int beginning = 0;
    int paidIn = 0;
    int interest = 0;
    int final = 0;
    int num = 1;
    
    printf("How much you'll save every year: ");
    scanf("%d", &paidIn);
    printf("Number of years you're planning on saving for: ");
    scanf("%d", &year);
    
    
    printf("\n\n\t\tYear\t\tStart\t\tPaid In\t\tInterest\tFinal\n\n");
    while (num <= year){
        beginning = final;
        interest = (beginning + paidIn) * 0.1;
        final = beginning + paidIn + interest;
        printf("\t\t%d\t\t\t%d\t\t\t%d\t\t\t%d\t\t\t%d\n\n\n", num, beginning, paidIn, interest, final);
        num = num + 1;
    }
    
    system("pause");
    return 0;
}

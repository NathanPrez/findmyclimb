//
//  main.c
//  week 6
//
//  Created by Nathan Preston on 22/10/2016.
//  Copyright © 2016 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <time.h>



int main(){
    int num1, num2, num3;
    
    printf("Input 3 numbers (separated by commas): ");
    scanf("%d,%d,%d", &num1, &num2, &num3);
    
    if((num1+num2+num3)%3!=0){
        if((num3-1==num1)||(num1-1==num2)||(num2-1==num3)){
            printf("");
        }
    }
    
    else{
        printf("INVALID SITESWAP\n\n");
    }
  
    
}

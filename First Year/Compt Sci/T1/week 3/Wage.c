//
//  Wage.c
//  
//
//  Created by Nathan Preston on 17/09/2016.
//
//

#include<stdio.h>
#include<stdlib.h>

int main ()
{
    int wagePH = 7.8;
    int Bonus = 0.5;
    int toysMade = 0;
    int hours = 0;
    int tot = 0;
    int numOver = 0;
    
    printf("How many hours have you worked:\nHow many toys have you made");
    scanf("%d%d",&hours,&toysMade);
    
    if toysMade > 50:
        numOver = toysMade - 50
        tot = hours + numOver;
    else:
        tot = hours;
    
    prinf("Your wage is: %d", tot);
    
    
}

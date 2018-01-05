//
//  main.c
//  Shapes
//
//  Created by Nathan Preston on 13/10/2016.
//  Copyright © 2016 Nathan Preston. All rights reserved.
//
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <time.h>


int main()
{
    int side1 = 0, side2 = 0, angle = 0;
    
    printf("Input Angle:");
    scanf("%d", &angle);
    
    printf("Input side:");
    scanf("%d", &side1);
    
    printf("Input adjacent side:");
    scanf("%d", &side2);
    
    
    if (angle == 90)
    {
        if(side1==side2)
        {
            printf("Square");
        }
        else
        {
            printf("Rectangular");
        }
    }
    
    else
    {
        if(angle==60)
        {
            printf("Hexagonal");
        }
        
        else if(angle==120)
        {
            if(side1 == side2)
            {
                printf("Rhombic");
            }
            else
            {
                printf("Parallegram");
            }
       }
    }

 
    printf("\n\n");
    return(0);
}

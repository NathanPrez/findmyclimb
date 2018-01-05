//
//  main.c
//  Fib Sequence
//
//  Created by Nathan Preston on 09/02/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


int main() {
    int num[50], loop = 0, choice =0;
    
    
    num[0] = 0;
    num[1] = 1;
    
    for(int x=0;x<50;x++){
        if(x>1){
            num[x] = num[x-1]+num[x-2];
        }
        printf("%d. %d\n", x, num[x]);

    }
    
    while(loop==0){
        printf("\n\nDo you wish to find a specific number in the sequence (0=yes, 1=no): ");
        scanf("%d", &loop);
        if(loop!=1){
            printf("Which number: ");
            scanf("%d", &choice);
            printf("%d: %d", choice, num[choice-1]);
        }
        else{
            break;
        }
        
        
    }
    system("pause");
    return 0;
}

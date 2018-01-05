//
//  main.c
//  Recursion
//
//  Created by Nathan Preston on 08/02/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>



int main() {
    int num[50], loop = 0, seq = 0;
    printf("Recursive Series to 50:\n");
    for(int x =0; x<=49; x++){
        num[x] = x+1;
        for(int y=1; y<=x; y++){
            num[x] = num[x] + (x+1-y);
        }
        printf("%d, ", num[x]);
    }
    
    while(loop==0){
        printf("\n\nDo you wish to find a position in the sequence (0=yes, 1=no): ");
        scanf("%d", &loop);
        if(loop==0) {
            printf("Which position in the sequence: ");
            scanf("%d", &seq);
            
            printf("Recursive number %d is: %d", seq, num[seq-1]);
            
        }
        
        else{
            break;
        }
        
    }
    
    printf("\n\n");
    return 0;

    
}

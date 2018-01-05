//
//  main.c
//  Insertion
//
//  Created by Nathan Preston on 05/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main() {
    int var = 0, array[10], y=0;
    srand(time(NULL));
    for(int x=0;x<10;x++){
        array[x] = rand() % 21;
        printf("%d, ", array[x]);
    }
    
    printf("\n\n");
    
    for(int i=1; i<10; i++){
        for(y=i; y>0 && array[y]<array[y-1];y--){
            var = array[y];
            array[y] = array[y-1];
            array[y-1] = var;
        }
    }
    for(int x=0;x<10;x++){
        printf("%d, ", array[x]);
    }
    
    
    
    return 0;
}

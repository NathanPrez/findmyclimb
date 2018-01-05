//
//  main.c
//  CodeToName
//
//  Created by Nathan Preston on 07/01/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    const char *airports[][2] = {
        {"BCN", "Barcelona"},
        {"DUB", "Dublin"},
        {"LIS","Lisbon"},
        {"LHR","London"},
        {"CDG","Paris"},
        {"PRG","Prague"},
        {"RKV","Reykjavik"},
        {"FCO","Rome"}
    };
    char code[3];
    
    printf("Input Code: ");
    scanf("%s", &code[0]);
    
    for(int x = 0; x<=8; x++){
        if(strcmp(airports[x][0], code)==0){
            printf("Airport: %s\n\n", airports[x][1]);
        }
    }
    
    system("pause");
    return(0);
}

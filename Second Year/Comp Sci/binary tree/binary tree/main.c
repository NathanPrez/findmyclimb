//
//  main.c
//  binary tree
//
//  Created by Nathan Preston on 10/12/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

void inOrder(int x, int y);
void preOrder(int x, int y);
void postOrder(int x, int y);

int data[6][3]={{1,10,2},{4,4,3},{-1,16,5},{-1,7,-1},{-1,2,-1},{-1,19,-1}};


int main() {
    int input = 0;
    
    printf("1. In-Order\n2. Pre-Order\n3. Post-Order\n ");
    scanf("%d", &input);
    
    if(input == 1){
        inOrder(0,1);
    }
    else if (input == 2){
        preOrder(0,1);
    }
    else if (input == 3){
        postOrder(0,1);
    }
}

void inOrder(int x, int y){
    if(data[x][y-1] != -1){
        inOrder(data[x][y-1], y);
    }
    
    printf("%d\n", data[x][y]);
    
    if(data[x][y+1] != -1){
        inOrder(data[x][y+1], y);
    }
}

void preOrder(int x, int y){
    
    printf("%d\n", data[x][y]);
    
    if(data[x][y-1] != -1){
        preOrder(data[x][y-1], y);
    }
    
    if(data[x][y+1] != -1){
        preOrder(data[x][y+1], y);
    }
}

void postOrder(int x, int y){
    if(data[x][y-1] != -1){
        postOrder(data[x][y-1], y);
    }
    
    if(data[x][y+1] != -1){
        postOrder(data[x][y+1], y);
    }
    
    printf("%d\n", data[x][y]);
}


//
//  main.c
//  Queue
//
//  Created by Nathan Preston on 03/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

void addQ();
void removeQ();
void pushS();
void popS();
void printQ();
void printS();

int queue[10], stack[10], temp = 0, num=0,loop=0;

int main() {
    int ans = 0;
    
    for(int x =0;x<10;x++){
        queue[x] = -1;
        stack[x] = -1;
    }
    
    while(loop==0){
        printf("1. Add to Queue\n2.Remove front of queue\n3. Add to Stack\n4. Pop Sxtack\n5. Quit\n");
        scanf("%d", &ans);
        if(ans==1){
            printf("What number: ");
            scanf("%d", &num);
            addQ();
            printQ();
        }
        else if(ans==2){
            removeQ();
            printQ();
        }
        else if(ans==3){
            printf("What number: ");
            scanf("%d", &num);
            pushS();
            printS();
        }
        else if(ans==4){
            if(stack[9] !=-1){
                stack[9] = -1;
            }
            else{
                popS();
            }
            printS();
        }
        else if(ans==5){
            loop =1;
            
        }
        
        
    }
    
    return 0;
}



void addQ(){
    int i=0;
    for(i=0;i<10;i++){
        if(queue[i] ==-1){
            queue[i] = num;
            break;
        }
    }
}

void removeQ(){
    int i = 0;
    for(i=0;i<8;i++){
        queue[i]= queue[i+1];
    }
    queue[9] = -1;
}

void pushS(){
    int i=0;
    for(i=0;i<10;i++){
        if(stack[i] ==-1){
            stack[i] = num;
            break;
        }
    }
}


void popS(){
    int i = 0;
    for(i=0;i<10;i++){
        if(stack[i] ==-1){
            stack[i-1] = -1;
            break;
        }
    }
}


void printS(){
    for(int x =0;x<10;x++){
        printf("%d. %d\n", (x+1), stack[x]);
    }
}


void printQ(){
    for(int x =0;x<10;x++){
        printf("%d. %d\n", (x+1), queue[x]);
    }
}

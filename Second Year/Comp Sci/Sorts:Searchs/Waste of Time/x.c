//
//  main.c
//  Waste of Time
//
//  Created by Nathan Preston on 19/09/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//void bubbleSort();
//void search();
int Rsearch();

int array[10], loop= 0, mid = 0, x=0, userNum = 1, lowPoint = 0, highPoint  = 10, r=0, count=0;

int main() {
    printf("Enter a number you'd like to find 1-10: ");
    scanf("%d", &userNum);
    
    for(x=0;x<=9;x++){
        //r = rand() % 101;
        //array[x] = r;
        array[x] = x+1;
    }
    
    //bubbleSort();
    //search();
    int ans = Rsearch();
    printf("\nAnswer found at %d\n", ans);
    return 0;
}


int Rsearch(){
    mid = ((highPoint+lowPoint)/2);
    printf("\n%d", array[mid-1]);
    
    if(mid == userNum){
        printf("\nAnswer found at %d\n", mid);
        return mid;
    }
    
    else if(userNum<array[mid-1]){
        highPoint = mid-1;
        return Rsearch(highPoint, lowPoint);
    }
    
    else{
        lowPoint = mid+1;
        return Rsearch(highPoint,lowPoint);
    }
}







/*

void bubbleSort(){
    int flag = 0, temp = 0;
    for (int i=0;i<sizeof(array)-1;i++){
        flag = 0;
        for (int y=0; y<sizeof(array)-1; y++){
            if(array[y]<array[y+1]){
                temp = array[y+1];
                array[y+1] = array[y];
                array[y] = temp;
                flag = 1;
            }
        }
    }
}

void search(){
    while(loop==0){
        mid = ((highPoint+lowPoint)/2);
        printf("\n%d", array[mid-1]);
        
        if(mid == userNum){
            printf("\nnum found at point %d\n", x);
            loop = 1;
        }
        
        else if(userNum<array[mid-1]){
            highPoint = mid-1;
        }
        
        else{
            lowPoint = mid+1;
        }
    }
}
*/



    
    



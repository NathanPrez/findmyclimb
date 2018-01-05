//
//  main.c
//  Task 3
//
//  Created by Nathan Preston on 23/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<ctype.h>


char display[20][4]={}; //they are using this as Columns/ Rows - which is unusual!

//in the exam Q this is passed in but for ease of use we're using it globally!
char words[10][10]={"REMEMBER","TO","TAKE","CHARLIE","TO","THE","DENTIST","THIS","AFTERNOON",""};

void updateDisplay();


int main(){
    
    int i=0, sizeOfWords=0;
    
    //this gets the length of the Words array so it can be used
    sizeOfWords= (sizeof(words)/sizeof(*words));
    
    //displays the words in the array so you can see it works (you can delete this at the end)
    for (i=0; i<sizeOfWords; i++)    {
        printf("%s ", words[i]);
    }
    printf("\n");
    /*
    for(int i=0;i<4;i++){
        for (int y=0; y<20; y++) {
            display[y][i] = '-';
        }
    }
    */
    //calls the procedure
    updateDisplay();
    
    system("pause");
    return 0;
}

void updateDisplay()
{
    char currentWord[10]={};
    int j=0, loop = 0, length = 0; //used as the counter through the words array
    
    strcpy(currentWord,words[j]);
    
    for(int x=0;x<4;x++){
        length = 0;
        
        while((length+strlen(currentWord)<20)&&(j<9)){
            strcpy(currentWord,words[j]);
        
            loop = 0;
            while (loop<strlen(currentWord)) {
                display[length][x] = currentWord[loop];
               
                loop++;
                length++;
            }
            
            display[length][x]=' ';
            length++;
            j++;
    
        }
    }
    
    printf("\n\n\n");
    for(int i=0;i<4;i++){
        printf("\n");
        for (int y=0; y<20; y++) {
            printf("%c", display[y][i]);
        }
    }
    
    //get the first word in the array and stores it as currentWord - this is our version of word.remove()
    //strcpy(currentWord,words[j]);
    //printf("%s \n", currentWord);
    //this is here temporarily so you can see it works
    
    
    //output each of the display characters with a \t between them so we can see the spacing clearly
    
    
    
    
}



#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include<conio.h>
#include<time.h>

char randomLetters[11]={};

int validateAnswer(char *answer); 
 
int main(){
	   
	   srand(time(NULL));
	   
	   int i=0, valid=-1;
	   char guess[11]={};
	   
	   //generates a random set of 10 capital letters
	   for (i=0; i<10; i++)	{
				randomLetters[i]=rand()%26+65;
		}
	   	   
	   //displays the random array 
	   for (i=0; i<10; i++)	{
				 printf("%c \t", randomLetters[i]);
		} 
	   printf("\n"); 
	   
	   //gets the uswer answer 
	   printf("Enter your word using capital letters: ");
	   scanf("%s",guess);
	   
	   //..and passes it by reference to the function
	   valid = validateAnswer(guess);
	   
	   //output the score or 0 here
	   
	
	system("pause");
    return 0;
}

int validateAnswer(char *answer){
	//get string in uppercase characters
		
	//check how many letters in string are in the random array
	
	//don't allow any letter in randomLetters to be used/ counted more than once
	
	//return score of valid letters or 0
	
}


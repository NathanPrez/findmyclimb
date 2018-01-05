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
	   for (i=0; i<sizeOfWords; i++)	{
				 printf("%s ", words[i]);
		} 
	   printf("\n"); 
	   
	   //calls the procedure
	   updateDisplay();
	   	   	
	system("pause");
    return 0;
}

void updateDisplay()
{
	char currentWord[10]={};
	int j=0; //used as the counter through the words array
	
	//get the first word in the array and stores it as currentWord - this is our version of word.remove()
	strcpy(currentWord,words[j]);
	//this is here temporarily so you can see it works
	printf("%s \n", currentWord);  
	
	//output each of the display characters with a \t between them so we can see the spacing clearly

	
}


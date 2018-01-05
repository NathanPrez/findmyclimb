#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include<conio.h>
#include<math.h>

void Add();
void Remove();
void Display();

int queue[10]={};
int front=-1, rear=0;


int main(){
	   
	   int choice=0;
	   
	   while (choice!=4){
	   	
		   printf("Enter 1: Add \t 2:Remove \t 3:Display \t 4:End \n ");
		   scanf("%d", &choice);
		   
		   if (choice==1){
		   	Add();
		   }
		   else if (choice==2){
		   	Remove();
		   }
		   else if (choice==3){
		   	Display();
		   }
		   else if (choice==4){
		   	return 0;
		   	}
	}
	
	system("pause");
    return 0;
}

void Display(){
	
	int i=0;
	
	for (i=0; i<10; i++)	{
				 printf("%d \t", queue[i]);
			}
	printf("\n \n");
	
	
}
			
			
void Add(){
	
}      

void Remove(){

} 

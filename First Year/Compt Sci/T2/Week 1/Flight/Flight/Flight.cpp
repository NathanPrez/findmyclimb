//
//  main.cpp
//  Flight
//
//  Created by Nathan Preston on 07/01/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include<iostream>
using namespace std;

string cities[4] ={"Dublin","London","Paris", "Rome"};
int tripcost(string city1, string city2);
int findcity(string city);
string airports[8][2] = {"BCN", "Barcelona", "DUB", "Dublin", "LIS","Lisbon", "LHR","London", "CDG","Paris", "PRG","Prague", "RKV","Reykjavik", "FCO","Rome"};

int main() {
    int cost = 0;
    
    for(int x = 0;x<=2; x++){
        cost = cost + tripcost(cities[x], cities[x+1]);
    }
    printf("Cost: %d GBP", cost);
    
    printf("\n\n");
    system("pause");
    return(0);
}

int tripcost(string city1, string city2) {
    int prices[11][3] = {6,1,260,6,5,190,1,2,300,1,3,90,3,4,650,4,2,200,4,0,100,4,7,210,4,5,100,5,7,150,2,0,110};
    //find city 1 in airports and return location number
    int place1 = findcity(city1);
    //find city 2 in airports and return location number
    int place2 = findcity(city2);
    /*printf("Found %d and %d", place1, place2);
     
     for(int i=0;i<8;i++) {
     cout<< "Code: " <<airports[i][0] <<" city: " <<airports[i][1]<<endl;
     }
     for (int i=0;i<11;i++) {
     cout<< "From " << airports[prices[i][0]][1]<<" to " <<airports[prices[i][1]][1]<<" costs £"<<prices[i][2]<<endl;
     }
     */
    if (((place1<0) || (place2<0))||(place1 == place2)) {
        cout<<"at least one city not found for this pair of cities"<<endl;
        return 0;
    } else {
        //search for pair of cities
        for (int i=0;i<11;i++) {
            if ((prices[i][0] == place1)||(prices[i][1] == place1)) {
                if ((prices[i][0] == place2)||(prices[i][1] == place2)) {
                    return prices[i][2];
                }
            }
        }
        
        cout<<"No direct route found for this pair of cities"<<endl;
        return 0;
    }
}

int findcity(string city) {
    bool found = false;
    int i = 0;
    while (!found) {
        if (city == airports[i][1]) {
            found = true;
        } else {
            i++;
            if (i>7) found = false;
        }
    }
    if (i<8) return i; else return -1;
}

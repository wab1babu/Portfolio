//
//  main.cpp
//  project6
//
//  Created by xlb on 11/22/21.
//  Copyright © 2021 Shulin Long. All rights reserved.
//

#include <iostream>
using namespace std;

//What does the following program print and why? Be sure to explain why each line of output prints the way it does to get full cred

const char* findTheChar(const char* str, char chr){
    while (*str != chr){
        str++;
        if (*str == '\0'){
            return nullptr;
        }
    }
    return str;
}






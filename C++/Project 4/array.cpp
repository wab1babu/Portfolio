
#include <iostream>
#include <string>
#include <cassert>
using namespace std;

int reduplicate(string a[], int n);
int locate(const string a[], int n, string target);
int locationOfMax(const string a[], int n);
int circleLeft(string a[], int n, int pos);
int enumerateRuns(const string a[], int n);
int flip(string a[], int n);
int locateDifference(const string a1[], int n1, const string a2[], int n2);
int subsequence(const string a1[], int n1, const string a2[], int n2);
int locateAny(const string a1[], int n1, const string a2[], int n2);
int separate(string a[], int n, string separator);

//function1
int reduplicate(string a[], int n){
    if (n>=0){
        for (int i=0;i<n;i++){
            a[i]=a[i]+a[i];//append every elements in array a to that same element
        }
        return n;
    }
    return -1;//if n is negative, return -1
}



//function2
int locate(const string a[], int n, string target){
    if (n>=0){
        //use for loop to check the position of a string in array a that is equal to target
        for (int i=0;i<n;i++){
            if (a[i]==target)
                return i;
        }
    }
    return -1;
}

//function3
int locationOfMax(const string a[], int n){
    if(n>0){//if n=0, return -1, since no string exist
        int maxPosition = 0;
        for(int i=0;i<n;i++){
            if (a[i]>a[maxPosition]){
                maxPosition=i;
            }
        }
        return maxPosition;
    }
    return -1;
}

//function4
int circleLeft(string a[], int n, int pos){
    if(n<0){
        return -1;
    }
    if (n<=pos){
        return -1;
    }
    
        string temp = a[pos];// first use temp to store the elements at orginal position that we need to move to the end
        //use for loop to copy all elements after it one place to the left
        for (int i=pos;i<n-1;i++){
            a[i]=a[i+1];
        }
        a[n-1]=temp;//lastly, assign the last elements to be the elememnt at orginal position pos.
        return pos;

}

//function5
int enumerateRuns(const string a[], int n){
    if (n==0){
        return 0;
    }
    if (n>0){
        int count=1;
        for (int i=0;i<n-1;i++){
            if (a[i]!=a[i+1]){
                count++;// append count if two adjacent elements are not equal
            }
        }
        return count;
    }
    return -1;
}

//function 6
int flip(string a[], int n){
    if (n>=0){
        string temp;
        for (int i=0;i<n/2;i++){//not i<n becasue the reversal is completed halfway through the iterations
            temp = a[i];//add temp to properly swap
            a[i]=a[n-i-1];
            a[n-i-1]=temp;
        }
        return n;
    }
    return -1;
}

//function 7
int locateDifference(const string a1[], int n1, const string a2[], int n2){
    if (n1>=0 && n2>=0){
        //first distinguish the n1 and n2
        if (n2>=n1){
            for (int i=0;i<n1;i++){
                if (a1[i]!=a2[i]){
                    return i;
                }
            }
            return n1;//  If the arrays are equal up to the point where one or both runs out, return whichever value of n1 is less than or equal to the other.
        }
        else{
            for (int j=0;j<n2;j++)
            {
                if (a1[j]!=a2[j]){
                    return j;
                }
            }
            return n2;
        }
    }
    return -1;
}

//function 8
int subsequence(const string a1[], int n1, const string a2[], int n2){
    if (n1<0 || n2<0){
        return -1;
    }
    if (n2==0){
        return 0;
    }
    
    int indicator;//use indicator to help return value
                //if true, return the smallest beginning position; if a1 does not contain a2, return 1
    for (int i=0;i<n1-n2+1;i++){
        indicator=true;//assume indicator to be true
        int temp=i;
        for (int j=0;j<n2;j++,temp++){
            if (a1[temp]!=a2[j]){
                indicator=false;
                break;
            }
        }
        if (indicator==true)
            return i;
    }
    return -1;
}

//function 9
int locateAny(const string a1[], int n1, const string a2[], int n2){
    if (n1<0 || n2<0){
        return -1;
    }
    for (int i=0;i<n1;i++){
        for (int j=0;j<n2;j++){
            if (a1[i]==a2[j]){
                return i;
            }
        }
    }
    return -1;
}


//function10
int separate(string a[], int n, string separator){
    if (n<0){
        return -1;
    }
    // use two for loop to rearrange the string from smallest to largest
    for (int i=n-2;i>=0;i--){
        string temp;
        for (int j=i;j<n-1;j++){
            if (a[j]>a[j+1]){// exchange elements if the right element is less than the left one
                temp = a[j];
                a[j]=a[j+1];
                a[j+1]=temp;
            }
        }
    }
    //use for loop to return the position of the first element that is not < separator
    for (int k=0;k<n;k++){
        if (a[k]>=separator){
            return k;
        }
    }
    // if no such element, return n
    return n;
}


int main(){


}

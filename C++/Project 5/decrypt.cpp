
#include <iostream>
#include <cstring>
#include <cctype>
using namespace std;


bool decrypt(const char ciphertext[], const char crib[]);

bool decrypt(const char ciphertext[], const char crib[]){
    //if crib string has no words, return false
    if (strlen(crib)==0){
        return false;
    }
    //count the length of valid crib
    int validLength=0;
    for (int i=0;crib[i]!='\0';i++){
        if (isalpha(crib[i])){
            validLength++;
        }
        else if ((!isalpha(crib[i]))&&(isalpha(crib[i+1]))){
            validLength++;
        }
    }
    if (!isalpha(crib[0])){
        validLength--;
    }
    // test if valid length is less than 90 character
    if (validLength>90||validLength<=0){
        return false;
    }
    
    
    // dispose crib, eliminate all non-letter character
    //"hush-hush until November 25, 2021"
    //"   hush???hUSh---     --- until    NovemBER !!  "
    //"hush hush until november"

    char newCrib[100]= "";
    int j=0;
    for (int i=0;crib[i]!='\0';i++){
        if (isalpha(crib[i])){
            newCrib[j]=toupper(crib[i]);
            j++;
        }
        else if (!isalpha(crib[i])&&isalpha(crib[i+1])&&(j!=0)){
            newCrib[j]=' ';
            j++;
        }
    }

    
    
    
    //dispose ciphertext
    char newCiphertext[10000]="";
    int k=0;
    for (int i=0;ciphertext[i]!='\0';i++){
        if (isalpha(ciphertext[i])||ciphertext[i]=='\n'){
            newCiphertext[k]=toupper(ciphertext[i]);
            k++;
        }
        else if (!isalpha(ciphertext[i])&&(isalpha(ciphertext[i+1]))){
            newCiphertext[k]=' ';
            k++;
        }
    }
    
    //compare newCrib with newCiphertext
    char finalCipher[100]="";
    bool tfForCheck=false;
    for(int m=0;newCiphertext[m]!='\0';m++){
        int countForCipher=m;
        
        //check if there exist same structure
        bool structureChecker=true;
        for (int n=0;newCrib[n]!='\0';){
            if (((isalpha(newCrib[n]))&&(isalpha(newCiphertext[countForCipher])))||((isspace(newCrib[n]))&&(isspace(newCiphertext[countForCipher])))){
                n++;
                countForCipher++;
            }
            else {
                structureChecker=false;
                break;
            }
        }
        
        //check if the neighboring chars are space
        int newCribLength = int (strlen(newCrib));
        if (m==0){
            if (isalpha(newCiphertext[newCribLength])){
                structureChecker=false;
            }
        }
        else{
            if (isalpha(newCiphertext[m-1])||isalpha(newCiphertext[m+newCribLength])){
                structureChecker=false;
            }
        }
        
        //if structurechecker is true, then check if the alpha is correct
        bool alphaChecker=true;
        if (structureChecker){
            for (int x=0;newCrib[x]!='\0';x++){
                char currentCipher=newCiphertext[m+x];
                char currentCrib=newCrib[x];
                for (int y=x;newCrib[y]!='\0';y++){
                    if ((newCiphertext[m+y]==currentCipher && newCrib[y] != currentCrib) || (newCiphertext[m+y] != currentCipher && newCrib[y] == currentCrib)){
                        alphaChecker=false;
                        break;
                    }
                }
                if (alphaChecker == false){
                    break;
                }
            }
            if (alphaChecker==true){
                tfForCheck=true;
                for (int t=0;t<validLength;t++){
                    finalCipher[t]=newCiphertext[t+m];
                }
                break;
            }
        }
    }
    if (tfForCheck==false){
        return false;
    }
    
    //replace
    for (int i=0;ciphertext[i]!='\0';i++){
        bool indicator=false;
        if (!isalpha(ciphertext[i])){
            cout<<ciphertext[i];
            indicator=true;
        }
        else{
            for (int j = 0;finalCipher[j] != '\0';j++)
                if (finalCipher[j] == toupper(ciphertext[i])) {
                    cout << newCrib[j];
                    indicator = true;
                    break;
                }
        }
        if (!indicator){
            char other =tolower(ciphertext[i]);
            cout <<other;
        }
    }
    return true;

}

int main() {
    
    const char a[1000]="Rswjo qgx Tmeuo sgjsy j555555ds vqgf vo jds vqzf xbby.\nUdbyjo iqcju cg wybgj cg jds esjqiqo zqy\nXbg'j rsj jds jsrrsy jycn jds ucrsgj qrqyt.\nZU 31 cu zdqrrsgecge!";
    const char b[100]="silent alarm";
    cout<<decrypt(a,b);
}




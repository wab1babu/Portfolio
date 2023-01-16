
#include <iostream>
#include <string>
using namespace std;

int main()
{
    //gather input data
    
    cout << "Odometer at start: " ;
    int numberAtStart;
    cin >> numberAtStart ;// input the odometer readings at the start of the rental
    if (numberAtStart < 0)
    {   cout << "---"<<endl;
        cout << "The starting odometer reading must not be negative." <<endl;
        return 1; // non-zero return value means program couldn't do its job, and thus ending my program
    }
    
    cout <<"Odometer at end: ";
    int numberAtEnd;
    cin >> numberAtEnd;// input the odometer readings at the end of the rental
    if (numberAtEnd < numberAtStart)
    {   cout << "---"<<endl;
        cout << "The ending odometer reading must be at least as large as the starting reading." <<endl;
        return 1;
    }
    
    cout <<"Rental days: ";
    int rentalDay;
    cin >>rentalDay;// input the rental day
    if (rentalDay <= 0)
    {   cout << "---"<<endl;
        cout << "The number of rental days must be positive." <<endl;
        return 1;
    }
    cin.ignore(10000, '\n');
    
    
    cout << "Customer name: ";
    string customerName;
    getline(cin,customerName);// input the customer name
    if (customerName == "")
    {   cout << "---"<<endl;
        cout << "You must enter a customer name." <<endl;
        return 1;
    }
    
    cout << "Luxury car? (y/n): ";
    string yN;
    getline(cin,yN);//input if the car is basis or luxury
    if ((yN != "y") && (yN !="n"))
    {   cout << "---"<<endl;
        cout << "You must enter y or n." <<endl;
        return 1;
    }
    
    
    cout <<"Month (1=Jan, 2=Feb, etc.): ";
    int month;
    cin >> month; // input the month
    if (month > 12 || month < 1)
    {   cout << "---"<<endl;
        cout << "The month number must be in the range 1 through 12." <<endl;
        return 1;
    }
    
    
    //compute rental charge
    
    double rentalCharge;
    cout.setf(ios::fixed);
    cout.precision(2); //set digits to be 2
    int baseCharge;
    if (yN == "n")
        baseCharge=43*rentalDay;
    else
        baseCharge=71*rentalDay;
    
    if((numberAtEnd - numberAtStart) <= 100)
        {
            rentalCharge = baseCharge+0.27*(numberAtEnd - numberAtStart);
        }
    else if((numberAtEnd - numberAtStart) >100 && (numberAtEnd - numberAtStart) <=500)
        {
            if (month==12 || month==1 || month==2 || month==3)
                rentalCharge=baseCharge+0.27*(numberAtEnd - numberAtStart);
            else
                rentalCharge=baseCharge+100*0.27+0.21*(numberAtEnd - numberAtStart-100);
        }
    else
        {
            if (month==12 || month==1 || month==2 || month==3)
                rentalCharge=baseCharge+0.27*500+0.17*(numberAtEnd - numberAtStart-500);
            else
                rentalCharge=baseCharge+100*0.27+0.21*400+0.17*(numberAtEnd - numberAtStart-500);
        }
    
    //print rental charge
    cout << "---" <<endl;
    cout << "The rental charge for " <<customerName << " is $" << rentalCharge << endl;
}

#include <iostream>
#include <string>
#include <cctype>
#include <cassert>
#include "grid.h"
using namespace std;


//function1
bool hasCorrectForm(string plan)
{   //check if every character is digit or turn letter
    for(int k=0;k<plan.size();k++)
    {
        if (plan.at(k)!='R' && plan.at(k)!='r' && plan.at(k)!='L' && plan.at(k)!='l' &&(!isdigit(plan.at(k))))
        {
            return false;
        }
    }
    // if 1st check is satified, then check if the last character is turn letter
    if (plan.at(plan.size()-1) !='L' &&plan.at(plan.size()-1) !='l'&&plan.at(plan.size()-1) !='R' &&plan.at(plan.size()-1) !='r' )
    {
        return false;
    }
    //if 1st and 2nd checks are satisifed, then check if it is zero, one, or two digits, followed by a turn letter
    for(int i=0;i<plan.size();)
    {
        if (plan.at(i)=='R'||plan.at(i)=='L'||plan.at(i)=='l'||plan.at(i)=='r')
        {
            i=i+1;
        }
        else
        {
            if(plan.at(i+1)=='R'||plan.at(i+1)=='L'||plan.at(i+1)=='l'||plan.at(i+1)=='r')
            {
                i=i+2;
            }
            else
            {
                if(plan.at(i+2)=='R'||plan.at(i+2)=='L'||plan.at(i+2)=='l'||plan.at(i+2)=='r')
                {
                    i=i+3;
                }
                else
                    return false;
            }
        }
    }
    //if all three checks are satisfied, return true
    return true;
}




//function2

int determineSafeDistance(int r, int c, char dir, int maxSteps)
{
    int steps=0;
    
        if (dir == 'N'||dir=='n')
        {
            for (int k=1;k<=maxSteps;k++)
            {
                if (r-k==0)
                    return steps;
                else if(isWall(r-k,c))
                    return steps;
                else
                    steps=steps+1;
            }
            return steps;
        }
        else if (dir=='S'||dir=='s')
        {
            for (int k=1;k<=maxSteps;k++)
            {
                if (r+k>getRows())
                    return steps;
                else if(isWall(r+k,c))
                    return steps;
                else
                    steps=steps+1;
            }
            return steps;
            
        }
        else if (dir=='E'||dir=='e')
        {
            for (int k=1;k<=maxSteps;k++)
            {
                if (c+k>getCols())
                    return steps;
                else if(isWall(r,c+k))
                    return steps;
                else
                    steps=steps+1;
            }
            return steps;
            
        }
        else if (dir=='W'||dir=='w')
        {
            for (int k=1;k<=maxSteps;k++)
            {
                if (c-k==0)
                    return steps;
                else if(isWall(r,c-k))
                    return steps;
                else
                    steps=steps+1;
            }
            return steps;
            
        }
        else
            return -1;
        
}

//function3


int obeyPlan(int sr, int sc, int er, int ec, char dir, string plan, int& nsteps)
{
    if ((sr<=0)||(sc<=0)||(er<=0)||(ec<=0)||(sr>getRows())||(sc>getCols())||(er>getRows())||(ec>getCols())||isWall(sr,sc)||isWall(er,ec)||(dir!='N' && dir!='n' && dir!='S' && dir!='s'&& dir!='E' && dir!='e' && dir!='W' && dir!='w')||(!hasCorrectForm(plan)))
    {
        return 2;
    }
    
    int newStep=0;
    int cstep=0;
    int rr=sr;
    int cc=sc;
    char dd=dir;
    int keep;
    
    
    for (int k=0;k<plan.size();k++)
    {
        if((k+1)<plan.size() && isdigit(plan.at(k)))
        {
            if(isdigit(plan.at(k+1)))
            {
                newStep =plan.at(k)-'0';
                k++;
            }
            else if(isalpha(plan.at(k+1)))
            {
                newStep=plan.at(k)-'0';
                
            }
            cstep=cstep + determineSafeDistance(rr,cc,dd, newStep);
            if (cstep<newStep)
            {
                nsteps=cstep;
                return 3;
            }
            
            keep=determineSafeDistance(rr,cc,dd, newStep);
            
            
            if (dd=='N'||dd=='n')
            {
                rr=rr-keep;
            }
            else if (dd=='S'||dd=='s')
            {
                rr=rr+keep;
            }
            if (dd=='E'||dd=='e')
            {
                cc=cc-keep;
            }
            else if (dd=='W'||dd=='w')
            {
                cc=cc-keep;
            }
              
        }
        else
        {
            if(dd=='N'||dd=='n')
            {
                if (plan.at(k)=='R'||plan.at(k)=='r')
                {
                    dd='E';
                }
                else
                {
                    dd='W';
                }
            }
            else if(dd=='S'||dd=='s')
            {
                if (plan.at(k)=='R'||plan.at(k)=='r')
                {
                    dd='W';
                }
                else
                {
                    dd='E';
                }
            }
            else if(dd=='E'||dd=='e')
            {
                if (plan.at(k)=='R'||plan.at(k)=='r')
                {
                    dd='S';
                }
                else
                {
                    dd='N';
                }
            }
            else if (dd=='W'||dd=='w')
            {
                if (plan.at(k)=='R'||plan.at(k)=='r')
                {
                    dd='N';
                }
                else
                {
                    dd='S';
                }
            }
                
        }
            
    }
    if (rr==er && cc==ec)
    {
        nsteps=cstep;
        return 0;
        
    }

    else
    {
        nsteps=cstep;
        return 1;
    }
        
    
}





int main()
{
    
}

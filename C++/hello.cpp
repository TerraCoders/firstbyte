#include <iostream> //some sort of default include?
#include <string> //necessary for using strings
#include <map> //necessary for mapping string values for switch function

using namespace std;

int main()
{
    //define a few strings--comma separated
    string myName = "Terra Coders", myJob = "developer", myWife = "Mina";
    //define a few integers--comma separated
    int myAge = 40, wifeAge = 48, twinAge = 11;
    //constant variables cannot be changed
    const int children = 2;
    //cout = echo
    // << looks to function as concatenator...
    cout << "My name is " << myName << ". I am a " << myJob << ". My wife's name is " << myWife << endl;
    cout << "I am learning C++ \n";
    cout << "My wife and I have a combined age of " << myAge + wifeAge << ".\n";
    cout << "We have " << children << " children.\n";
    cout << "Would you like to know how old my children are? \n";
    //undeclared var
    string yn;
    //use cin to declare
    cin >> yn;
    //if logic
    if (yn == "yes")
    {
        //define integer as mathmatecal expression of two other variables
        int twinTotal = twinAge * children;
        cout << "My kids are both 11; they are twins! \n";
        cout << "That means that my family's combined age is " << myAge + wifeAge + twinTotal << endl; 
    }
    //undefined boolean
    bool isCodingFun;
    //undefined string--value determines boolean above
    string fun;
    cout << "Do you think coding is fun? \n";
    cin >> fun;
    if (fun == "yes") 
    {
        isCodingFun = true;
        cout << isCodingFun << endl;
    } else
    {
        isCodingFun = false;
        cout << isCodingFun << endl;
    }
    cout << "What's the weather like today?\n (1)Sunny, (2)rainy, (3)snowy or (4)windy?\n";
    int x;
    string weather;
    cin >> weather;
    //my attempt to map weather to integers without getting crazy...
    if (weather == "sunny")
    {
        x = 1;
    } else if (weather == "rainy")
    {
        x = 2;
    } else if (weather == "snowy") 
    {
        x = 3;
    } else if (weather == "windy")
    {
        x = 4;
    } else {
        x = 0;
    } 
    /* it's redundant to use a switch statement here... the conditional logic above would suffice. I just want to 
    try using a switch statment, and working with integers bores me to death... */
    switch(x) {
        case 1:
            cout << "That sounds wonderful\n";
            break;
        case 2:
            cout << "Water is life!\n";
            break;
        case 3:
            cout << "Maybe you can go skiing!\n";
            break;
        case 4:
            cout << "Time to buy a kite!\n";
            break;
    }

    // while x is less than 5
    while (x < 5) {
        // print i
        cout << "X is equal to " << x << "\n";
        // add 1 to i
        x++;
    }
    return 0;
}

#include <iostream> //some sort of default include?
#include <string> //necessary for using strings
#include <map> //necessary for mapping string values for switch function
#include <unistd.h>//necessary to acces Portable Operating System Interface (POSIX)

// $ g++ -o hello hello.cpp

using namespace std;

int main()
{
    //define a few strings--comma separated
    //use getenv to pull environmental variable from shell
    string myName = getenv("USER"), myOs = "Linux";
    //define a few integers--comma separated
    int myAge = 40, wifeAge = 48, twinAge = 11;
    //constant variables cannot be changed
    const int children = 2;
    //some basic cout statements:
    cout << "My name is " << myName << ". I really like " << myOs << ".\n";
    cout << "My wife and I have a combined age of " << myAge + wifeAge << ".\n";
    cout << "We have " << children << " children.\n";
    cout << "Would you like to know how old my children are? \n";
    //undeclared var
    string yn;
    //use cin to declare
    cin >> yn;
    //if logic
    if (yn == "yes") {
        //define integer as mathmatecal expression of two other variables
        int twinTotal = twinAge * children;
        cout << "My kids are both 11; they are twins! \n";
        cout << "That means that my family's combined age is " << myAge + wifeAge + twinTotal << endl; 
    } else {
        cout << "You're a cold hearted bastard, aren't you?";
    }
    //undefined boolean
    bool isCodingFun;
    //undefined string--value determines boolean above
    string fun;
    cout << "Do you think coding is fun?--yes/no \n";
    cin >> fun;
    if (fun == "yes") {
        isCodingFun = true;
        cout << isCodingFun << endl;
    } else {
        isCodingFun = false;
        cout << isCodingFun << endl;
    }
    cout << "What's the weather like today?\n Is it: sunny, rainy, snowy or windy?\n";
    int x;
    string weather;
    cin >> weather;
    //my attempt to map weather to integers without getting crazy...
    if (weather == "sunny") {
        x = 1;
    } else if (weather == "rainy") {
        x = 2;
    } else if (weather == "snowy") {
        x = 3;
    } else if (weather == "windy") {
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
    // set array of 5 strings
    string foo [5] = {};
    cout << "Let's fill an array with the names of five animals...\n";
    // y equals zero
    int y = 0;
    // while y is less than 5
    while (y < 5) {
        // print prompt
        cout << "Animal number " << y + 1 << ": ";
        // and read input; as the loop increases y, each entry is stored as a string in our array
        cin >> foo[y];
        // add 1 to y
        y++;
    }
    // print the items in the array
    cout << "Your animals were: " << foo[0] << ", " << foo[1] << ", " << foo[2] << ", " << foo[3] << ", " << "and, " << foo[4] << ".\n";
    // new string variable for the last/fifth item in the array
    string animal = foo[4];
    cout << animal[3] << " is the fourth letter in " << animal << ".\n";
    cout << "this computer will explode in 4 seconds: \n";
    for (int i = 0; i < 10; i++) {
        if (i == 4) {
            break;
        }
        //print i and add one
        cout << i + 1 << "\n";
        //sleep for one second
        sleep(1);
    }

    return 0;
}

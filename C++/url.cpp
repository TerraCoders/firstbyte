#include <iostream> //some sort of default include?
#include <string> //necessary for using strings
#include <map> //necessary for mapping string values for switch function
#include <unistd.h>//necessary to acces Portable Operating System Interface (POSIX)

/*  Another script that isn't really meant to do anything useful--just playing with C++
    
    That said--this script parses the protocols (http/https) from urls. Not sure why you
    would want to do that--there aren't that many applications--but I put this together
    mostly so I could get a feel for while and for loops. */

using namespace std;

int main() 
{
    // get $USER from shell
    string myName = getenv("USER");
    // store targets for parsing in string variables
    string secureProtocol = "https://";
    string unsecureProtocol = "http://";
    // x will be counter for however many urls user wants to parse
    int x;
    // n will be counter for loops
    int n = 0;
    cout << "Hello " << myName << ". How many URL's would you like to parse?\n";
    cin >> x;
    // introduce url array with items equal to x
    string url [x] = {};
    // let user add items to the url array
    while (n < x)
    {
        cout << "URL: ";
        cin >> url[n];
        n++;
    }
    // now, loop through the array and parse the urls
    for (n = 0; n < x; n++)
    {
        // find secureProtocol for nth string in url array
        auto targetOne = url[n].find(secureProtocol);
        // find unsecureProtocol for nth string in url array
        auto targetTwo = url[n].find(unsecureProtocol);
        // basically, if targetOne does not not match?
        if (targetOne != string::npos)
        {
            // erase the match according to the size of the secureProtocol string
            url[n].erase(targetOne,secureProtocol.size());
            // and print
            cout << url[n] << "\n";
        // otherwise... if targetTwo does not not match?
        } else if (targetTwo != string::npos)
        {
            // erase the match according to the size of the unsecureProtocol string
            url[n].erase(targetTwo,unsecureProtocol.size());
            // and print
            cout << url[n] << "\n";
        // and, if that fails...
        } else {
            cout << "Didn't find a protocol for " << url[n] << ".\n";
        }
    }
    
    return 0;
}
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
    // store targets for parsing in string variables
    string secureProtocol = "https://";
    string unsecureProtocol = "http://";
    // x will be counter for however many urls user wants to parse
    int x;
    // i will be counter for loops
    int i = 0;
    cout << "How many URL's would you like to parse?\n";
    cin >> x;
    // introduce url array with items equal to x
    string url [x] = {};
    // let user add items to the url array
    while (i < x)
    {
        cout << "URL: ";
        cin >> url[i];
        i++;
    }
    // now, loop through the array and parse the urls
    for (i = 0; i < x; i++)
    {
        // find secureProtocol string
        auto targetOne = url[i].find(secureProtocol);
        // find unsecureProtocol string
        auto targetTwo = url[i].find(unsecureProtocol);
        // basically, if targetOne does not not match?
        if (targetOne != string::npos)
        {
            // erase the match according to the size of the secureProtocol string
            url[i].erase(targetOne,secureProtocol.size());
            // and print
            cout << url[i] << "\n";
        // otherwise... if targetTwo does not not match?
        } else if (targetTwo != string::npos)
        {
            // erase the match according to the size of the unsecureProtocol string
            url[i].erase(targetTwo,unsecureProtocol.size());
            // and print
            cout << url[i] << "\n";
        // and, if that fails...
        } else {
            cout << "Didn't find a protocol for " << url[i] << ".\n";
        }
    }
    
    return 0;
}
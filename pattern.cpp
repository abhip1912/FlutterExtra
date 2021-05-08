#include<iostream>
using namespace std;
int n;

int giveNumber(int i, int j){
    int newI = n-i > 0 ? n-(n-i) : n-(i-n);
    int newJ = n-j > 0 ? n-(n-j) : n-(j-n);

    return newI > newJ ? newJ : newI;
}

int main(){
    cout << "Hey Enter n: ";
    cin >> n;
    int matrixSize = n + (n-1);
    for (int i = 1; i<=matrixSize; i++){
        for(int j = 1; j<=matrixSize; j++){
            cout << giveNumber(i, j) << " ";
        }
        cout << '\n';
    }
    return 1;
}

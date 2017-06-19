#include <iostream>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <ostream>

using namespace std;

#define Size 10

int BinarySearch(int a[],int key){
	int left = 0;
	int right = Size - 1;

	int mid = 0;

	while(left < right){
		mid = (left + right)/ 2;
		if( key == a[mid])
			return mid;

		if(key > a[mid]){
			left = left + 1;
		}
		else{
		right = right - 1;
		}
	}

	return -1;
}

int main(){
	int Sortarray[Size] = {0,1,2,3,4,5,6,7,8,9};

	int flag = BinarySearch(Sortarray,10);

	if(flag != -1){
	cout << "index = " << flag << endl;
	}
	else
		cout << "the key is not exist in this array"<< endl;

    return 0;
}

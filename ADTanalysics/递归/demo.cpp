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

//quick sort for array

void quicksort(int a[],int left,int right){

    if(left < right){
        int i = left,j = right;
        int flag = a[left];

        while(i < j){
            //从后往前找比flag小的树
        if(i < j && a[j] > flag){
            j--;
        }
        //从前往后找比flag大的数
        if(i < j){
            a[i] = a[j];
        }

        if(i < j && a[i] < flag){
            i++;
        }

        if(i < j){
            a[j] = a[i];
        }

        }

        a[i] = flag;
        quicksort(a,left,i-1);
        quicksort(a,i+1,right);
     }
}

int main(){
	int Sortarray[Size] = {0,1,2,3,4,5,6,7,8,9};
	int soting[5] = {3,2,1,0,-1};
	quicksort(soting,0,4);

	for(int i = 0; i < 5;i++){
        cout << soting[i] << "  " ;
	}

	cout << endl;

	int flag = BinarySearch(Sortarray,10);

	if(flag != -1){
	cout << "index = " << flag << endl;
	}
	else
		cout << "the key is not exist in this array"<< endl;

    return 0;
}

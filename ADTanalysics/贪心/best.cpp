#include <iostream>
#include <ostream>
#include <istream>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>

using namespace std;


//贪心算法的活动安排问题实现
int greedySelector(int s[],int f[],bool a[]){

    int s_length = 11;
    int i;
    int count = 1;//活动安排的计数器,当前选择了活动一

    //cout << "the length of s is " << s_length << endl;

    a[0] = true;

    int j = 0;

    for( i = 1; i < s_length; i++)
    {
        if(s[i] >=  f[j]){
            a[i] = true;
            j = i;
            count++;
        }
        else
            a[i] = false;
    }

    return count;
}

int main(){

    int s[] = { 1,3,0,5,3,5,6,8,8,2,12};//开始时间
    int f[] = {4,5,6,7,8,9,10,11,12,13,14};//结束时间,升序
    bool a[11];

    int count = greedySelector(s,f,a);
    cout << "the count of activity is " << count << endl;

    cout << "the followings are activity selected : \n";
    //输出当前选择的活动
    for(int i = 0; i < 11; i++){
        if(a[i] == true){
            cout << "select activity :" << i << " from " << s[i] << " to " << f[i] << endl;
        }
    }
    return 0;
}

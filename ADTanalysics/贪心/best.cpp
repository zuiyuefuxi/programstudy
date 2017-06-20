#include <iostream>
#include <ostream>
#include <istream>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <cstring>

using namespace std;
#define Size = 10

typedef struct node{
    float avervalue;
    float ww;
    float vv;
    float flag;
}Avervalue;

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

//用贪心算法来解决0-1背包和背包问题
float knapsack(float c,float w[],float v[],float x[]){// w：重量 v:价值 x:0 or 1 c:最大允许装的重量

    int n = size;
    float []d = new float[n];//d存放的是物品的单位价值
    float swap;
    for(int i = 0; i < n; i++){
        d[i] = v[i] / w[i];
    }

    //将单位价值按数值从大到小排列，保证贪心选择,冒泡排序
    for(int i = 0; i < n;i++){
        for(int j = i+1; j < n; j++){
            if(d[i] < d[j]){

                    swap = d[i];
                    d[i] = d[j];
                    d[j] = swap;
            }
        }
    }

    int i;
    float opt = 0;
    //这里有个问题，就是排序后怎么知道对应的那个下X和W，所以应该定义一个结构体，
    for(i = 0; i< n; i++)
        x[i] = 0;


    for(i = 0; i< n;i++){
        if()
    }



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

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <ostream>

using namespace std;

#define MAX_N 10 //最大顶点数

//实现最小生成树的结构定义
typedef struct {
    int n;
    int e;
    int arcw[MAX_N][MAX_N];
}Graph;

//closedge结构定义
typedef struct {
    double lowcost;
    int vex;
}CostTp;



void crtGraph(Graph &G){
    int i,j,k;
    int w;

    ifstream fin("input.txt");

    if(!fin ){
        return ;
    }

    fin >> G.n >> G.e;

    //初始化全部为333，表示不连接
    for(i = 0; i < G.n;i++){
        for(j = 0; j < G.n; j++){
            G.arcw[i][j] = 333;
        }
    }

    //存入相应的权值
    for(i = 0; i < G.e; i++){
        fin >> j >> k >> w;
        G.arcw[j][k] = G.arcw[k][j] = w;
    }

    fin.close();
}

void prim(Graph &G,int k){

    CostTp *closedge = new CostTp[G.n];
    int *saveroad = new int[G.n];
    int si = 0;
    int maxload = 0;//总权重

    ofstream fout("output.txt");
    if(!fout)
        return;

    //初始化closedge
    for(int i = 0; i < G.n; i++){
        closedge[i].vex = k;
        closedge[i].lowcost = G.arcw[i][k];
    }

    closedge[k].lowcost = 0;

    cout << "依次遍历的结点如下："<< endl;
    cout <<k;
    saveroad[si++] = k;
    int m;
    int i,j;

    for(m = 0; m < G.n - 1; m++){

        for( i = 0; i< G.n; i++){
            if(closedge[i].lowcost > 0)
                break;
        }

        for(j = i + 1; j < G.n; j++){
            if(closedge[j].lowcost > 0 && closedge[j].lowcost < closedge[i].lowcost)
                i = j;
        }

        cout << "," << i;//输出i号定点
        saveroad[si++] = i;

        closedge[i].lowcost = 0;

        for(j = 0; j< G.n; j++){
            if(closedge[j].lowcost > 0 && closedge[j].lowcost > G.arcw[j][i]){
                closedge[j].lowcost = G.arcw[j][i];
                closedge[j].vex = i;
            }
        }
    }

    //for循环结束
    cout << endl;
    cout << "生成树的五条边以及权重分别是：" << endl;
    fout << "生成树的五条边分别是：" << endl;
    for(i = 0; i< G.n;i++){
        if(i != k){
            cout << "(" << i << ","<< closedge[i].vex << ")";
            maxload +=  G.arcw[i][closedge[i].vex];
            fout << "(" << i << ","<< closedge[i].vex << ")";
            cout << "--" << G.arcw[i][closedge[i].vex] << endl;

        }
    }

    fout << endl;
    cout << "最小生成树权重和为： " << maxload << endl;
    fout << "最小生成树权重和为： " << maxload << endl;
    fout.close();

    delete []closedge;

}

int main(){

    Graph G;
    crtGraph(G);
    prim(G,0);

    return 0;


}

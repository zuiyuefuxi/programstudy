#include <iostream>
#include <cstring>
#include <string>
#include <cstdlib>
#include <ostream>

using namespace std;

class Hash{
    private:
       static const int tableSize = 15;
       static const int MAX_NUM = 30;
       struct node{
          struct node *next;
          string keyname;
      };
      //calculate the number of load elements
      int LoadCounter[tableSize] = {0};
      node* HashTable[tableSize];

    public:
       Hash();
       int Hashindex(string name);                  //获得哈希地址
       void AddRecord(string name);                 //增加关键字记录
       bool SearchRecord(string name);              //按关键字查找记录
       void DeleteRecord(string name);              //删除匹配的关键字记录
       void PritBucketIndex(int index);             //打印哈希链表中的元素
       void menu();                                 //菜单操作
       int GetlengthOfHashBucket(string name);      //返回当前链表中的元素个数
};

int main(){

    Hash hashobj;
    hashobj.menu();

     return 0;
}


Hash::Hash(){
   for(int i = 0; i< tableSize; i++){
     HashTable[i] = new node;
     HashTable[i]->keyname = "empty";
     HashTable[i]->next = NULL;
   }
}

int Hash::Hashindex(string name){

    int hashindex = 0;
    int index;

    for(int i = 0; i < name.length(); i++){
        hashindex += (int)name[i];
        //cout << "hash = " << hashindex << endl;
        }

     index =  hashindex % 15;

    return index;
}


void Hash::AddRecord(string name){
    int index = Hashindex(name);

    if(HashTable[index]->keyname == "empty"){
       HashTable[index]->keyname = name;
       HashTable[index]->next =NULL;
       LoadCounter[index]++;
       cout << "add success"  <<"index is " << index<<endl;
     }
     else{
            if(!SearchRecord(name) && LoadCounter[index] <= MAX_NUM){
                    node* per;
                    per = HashTable[index];

                    node* record = new node;
                    record->keyname = name;
                    record->next = NULL;

                    while(per->next != NULL){
                      per = per->next;
                   }

                    per->next = record;
                    LoadCounter[index]++;
                    cout << "add success"<< endl;

            }
            else
            {
                cout<<"keyname " << name<<" has already existed!!! "<<"Add failed!!!\n"<<endl;
            }

     }
}


bool Hash::SearchRecord(string name){
    int index = Hashindex(name);
    //int flag = 0;    //success flag == 1
    bool flag = false;
    node* pre;
    pre = HashTable[index];

    while(pre){
       if(pre->keyname == name){
            flag = true;
         }
        pre = pre->next;
     }

    if (flag == false){
       cout << "Search Failed " << endl;
       return false;
     }
     else{
       cout << "success searched in HashTable " << index<< endl;
       return true;
     }
}

void Hash::DeleteRecord(string name){
    int index;
    index = Hashindex(name);
    node* pre ;
    node* p1;
    node* p2;
    node* p3,master;
    pre = HashTable[index];

    //case 0 :empty
    if(HashTable[index]->keyname  == "empty")
       {
            cout << "keyname was not found in the hashtable\n";
       }
    //case 1: one node and matched
    else if(HashTable[index]->keyname  == name && pre->next == NULL){
        HashTable[index]->keyname = "empty";
        cout << "Delete success!\n";
    }
    //case 2:first matched but have more node
    else if(HashTable[index]->keyname == name){
        p3 = HashTable[index];
        HashTable[index] = HashTable[index]->next;
        delete p3;
        cout << "keyname " << name << " in HashTable was removed success!\n";

    }
    //case 3:have match node but first was not matched
    else{
        p1 = HashTable[index]->next;
        p2 = HashTable[index];

        while(p1 != NULL && p1->keyname != name){
            p2 = p1;
            p1 = p1->next;
        }
        //case 33.1:don't contains this keyname
        if(p1 == NULL){
            cout << "keyname was not found in the HashTable\n";
        }
        //keyname is found in hashtables
        else{
            p3 = p1;
            p1 = p1->next;
            p2->next = p1;
            delete p3;

            cout << name << "was deleted success\n";
        }
    }
}


void Hash::PritBucketIndex(int index){
    node* ptr = HashTable[index];

    if(ptr->keyname == "empty"){
        cout <<"index " << index << " empty!!!" << endl;
    }
    else{
        cout << "index "<<index << " contains the following nodes\n";

        while(ptr != NULL){
            cout << "---------------------------"<<endl;
            cout << ptr->keyname << endl;
            cout << "---------------------------"<<endl;
            ptr = ptr->next;
        }
    }
}

int Hash::GetlengthOfHashBucket(string name){
    int counter = 0;
    int index = Hashindex(name);
    counter = LoadCounter[index];
    return counter;
}

void Hash::menu(){
    char select;
    string name;

    cout << "\n----------------------------------------\n";
    cout << "A : Add new record in HashTable\n";
    cout << "D : Delete a record from HashTable\n";
    cout << "P : Prit elements of HashTable\n";
    cout << "S : Search a record from HashTable\n";
    cout << "Q : Quit current system\n";
    cout << "Others select means continue\n";
    cout << "----------------------------------------\n";

    cout << "please input your choice:"<<endl;
    cin >> select;

    do{

            switch(select){
                case 'A':cout << "input keyname:"<<endl;
                       cin >> name;
                       AddRecord(name);
                       cout << endl;
                       break;
                case 'D':cout<<"input keyname"<<endl;
                       cin >> name;
                       DeleteRecord(name);
                       cout<<endl;
                       break;
                case 'S':cout<<"input keyname"<<endl;
                       cin >> name;
                       SearchRecord(name);
                       cout << endl;
                       break;
                case 'P':cout<<"input keyname"<<endl;
                       cin >> name;
                       cout << endl;
                       PritBucketIndex(Hashindex(name));
                       cout <<endl;
                       break;
                case 'Q':cout<<"exit system"<<endl;
                       break;
                default:break;

            }
         cout << "please input your choice:"<<endl;
         cin >> select;
    }
    while(select != 'Q');



}


#include <iostream>
#include <malloc.h>
using namespace std;
   
struct Node { 
   int data; 
   struct Node *next; 
   }; 
struct Node* top = NULL; 

void push(int nilai) {
   struct Node* newnode = (struct Node*) malloc(sizeof(struct Node)); 
   newnode->data = nilai; 
   newnode->next = top; 
   top = newnode; 
}

void pop() {
   if(top==NULL)
      cout<<"Stack Kosong"<<endl;
   else {
      cout<<"Elemen Yang di pop Adalah : "<< top->data <<endl;
      top = top->next;
   }
}

void display() {
   struct Node* ptr;
   if(top==NULL)
      cout<<"Stack Kosong";
   else {   
      ptr = top; 
      cout<<"Stack : [ ";
      while (ptr != NULL) { 
         cout<< ptr->data <<","; 
         ptr = ptr->next; 
         
      } 
      cout<<"]";
   }
   
   cout<<endl;
}
int main() {
   int pilih, nilai;
   cout<<"=============================="<<endl;
   cout<<"||~Stack Dengan Linked List~||"<<endl;
   cout<<"||\tRifqi Adiyatma      ||" <<endl;
   cout<<"||\t1817051055          ||"<<endl;
   cout<<"=============================="<<endl;
   cout<<"[1] Push"<<endl;
   cout<<"[2] Pop "<<endl;
   cout<<"[3] Tampilkan"<<endl;
   cout<<"[4] Keluar"<<endl;
   
   do {
      cout<<"Pilih Menu: ";
      cin>>pilih;
      cout<<"~~~~~~~~~~~~~";
      cout<<endl;
      switch(pilih) {
         case 1: {   
            cout<<"Masukan Nilai Push:";
            cin>>nilai;
            push(nilai);
            break;}
         case 2: {
            pop();
            break;}
         case 3: {
            display();
            break;}
         case 4: {
            cout<<"Terima Kasih"<<endl;
            break;}
         default: {
            cout<<"Tidak ada Pilihan"<<endl;}
      }
   }while(pilih!=4); 
      return 0;
}  
https://iteraacid-my.sharepoint.com/personal/ridho_magribi_staff_itera_ac_id/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fridho%5Fmagribi%5Fstaff%5Fitera%5Fac%5Fid%2FDocuments%2Fsoal%20spkwt%2Fdb%5Fdonor%5Fplasma%2Esql&parent=%2Fpersonal%2Fridho%5Fmagribi%5Fstaff%5Fitera%5Fac%5Fid%2FDocuments%2Fsoal%20spkwt&ga=1

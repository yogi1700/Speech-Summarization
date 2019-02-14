
#include<bits/stdc++.h>

using namespace std;

const int N = 100000;

int n;

int tree[2*N];


void build(int arr[])
{
   for(int i = 0; i < n ; i++)
         tree[n + i] = arr[i];

   for(int i = n - 1; i > 0 ; --i)
          tree[i] = tree[i << 1] + tree[i << 1 | 1];

}

void updateTreeNode(int p, int value)
{
     tree[p + n] = value;
     p = p + n;

     for(int i = p; i > 1 ; i>>=1)
          tree[i >> 1]= tree[i] + tree[i^1];

}

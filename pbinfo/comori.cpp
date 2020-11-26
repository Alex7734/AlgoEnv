#include <bits/stdc++.h>
using namespace std;

ifstream cin("comori.in");
ofstream cout("comori.out");

int n , m , a[204][204] , s[204][204];

int main()
{
    cin >> n >> m;
    for(int i = 1 ; i <= n ; i++)
        for(int j = 1 ; j <= m ; j++)
            cin >> a[i][j];

    for(int i = 1 ; i <= n ; i++)
        s[1][i] = a[1][i];

    for(int i = 1 ; i <= n ; i++)
        for(int j = 1 ; j <= m ; ++j)
        {
            s[i][j] = a[i][j] + max(max(s[i - 1][j-1], s[i - 1][j]) , s[i - 1][j + 1]);
            //cout << s[i][j] << " " << i << " " << j << '\n';
        }

    int pmin  = 1;
    for(int j = 2 ; j <= m ; ++j)
        if(s[n][j] > s[n][pmin]) pmin = j;

    cout << s[n][pmin];
    return 0;
}
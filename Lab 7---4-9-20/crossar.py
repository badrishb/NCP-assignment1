# import sys
# sys.setrecursionlimit(1000000)
n=int(input())
a=list(map(int,input().split()))
d=dict()
fin=float('inf')
def rec(pos,val,ar,temp):
    if((pos,val) not in d and pos>=0):
        global fin
        print(pos,val,fin)
        d[(pos,val)]=fin
        if(pos>=n ):
            if(val<fin):
                fin=val
        else:
            try:
                if(temp==0):
                    rec(pos-1,val+ar[pos],ar,1)
                rec(pos+2,val+ar[pos],ar,0)
            except:
                print(pos,len(ar))
rec(0,0,a,0)
print(fin)
# 5
# 1 2 3 4 100


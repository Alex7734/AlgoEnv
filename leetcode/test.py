def criticalConnections(n, connections):
    res = []
    a = [[0 for x in range(n)] for y in range(n)]
    for conn in connections:
        a[conn[0]][conn[1]] = 1
        a[conn[1]][conn[0]] = 1
            
    i = 0
    while i<n:
        if sum(a[i]) == 1:
            j = 0
            while a[i][j] != 1:
                j += 1
            res.append([i,j])
        i+=1
    return a

n = 6
connections = [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]]
print(criticalConnections(n, connections))

                
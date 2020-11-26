def solveNQueens(n):
    sol = [] # For deep copy of results
    def solve():
        # Generate array of dots of size n
        matrix = [['.' for _ in range(n)] for _ in range(n)]
        nQueen(matrix)
    def isPossible(matrix, row , idx):
        rowD, idxD = row, idx
        # Same column above
        for i in range(0,row):
            if matrix[i][idx] == 'Q':
                return False
        # Left diagonal
        while True:
            row -= 1
            idx -= 1
            if row < 0 or idx < 0:
                break
            if matrix[row][idx] == 'Q':
                return False
        # Right Diagonal
        while True:
            rowD -= 1
            idxD += 1
            if rowD < 0 or idxD >= n:
                break
            if matrix[rowD][idxD] == 'Q':
                return False
        return True
    def nQueen(matrix,row = 0):
        if(row > n - 1): 
            sol.append(["".join(matrix[i]) for i in range(n)])
            return
        for i in range(n):
            if isPossible(matrix,row,i):
                matrix[row][i] = 'Q'
                nQueen(matrix,row + 1)
                matrix[row][i] = '.'
        return
        
    solve()
    return sol

solutions = solveNQueens(8)
for solution in solutions:
    for row in solution:
        print(row)
    print('-----------')
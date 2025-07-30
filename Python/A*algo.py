from heapq import heappop, heappush

def astar(grid, start, goal):
    h = lambda a,b: abs(a[0]-b[0]) + abs(a[1]-b[1])
    open, came, g = [(0, start)], {}, {start: 0}
    while open:
        _, cur = heappop(open)
        if cur == goal:
            path = []
            while cur in came:
                path.append(cur)
                cur = came[cur]
            return path[::-1]
        for dx, dy in ((0,1),(1,0),(-1,0),(0,-1)):
            nxt = (cur[0]+dx, cur[1]+dy)
            if 0<=nxt[0]<len(grid) and 0<=nxt[1]<len(grid[0]) and grid[nxt[0]][nxt[1]] == 0:
                new_g = g[cur] + 1
                if nxt not in g or new_g < g[nxt]:
                    g[nxt] = new_g
                    heappush(open, (new_g + h(nxt, goal), nxt))
                    came[nxt] = cur

grid = [[0,0,0],[1,1,0],[0,0,0]]
start = (0,0)
goal = (1,2)
print(astar(grid, start, goal))

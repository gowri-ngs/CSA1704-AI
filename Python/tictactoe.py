def print_board(board):
    for row in board:
        print(" | ".join(row))
        print("-" * 5)

def check_win(board, player):
    for row in board:
        if all(cell == player for cell in row): return True
    for col in zip(*board):
        if all(cell == player for cell in col): return True
    if all(board[i][i] == player for i in range(3)): return True
    if all(board[i][2-i] == player for i in range(3)): return True
    return False

def is_draw(board):
    return all(cell in ['X','O'] for row in board for cell in row)

def tic_tac_toe():
    board = [['1','2','3'], ['4','5','6'], ['7','8','9']]
    current = 'X'
    while True:
        print_board(board)
        move = input(f"Player {current}, choose (1-9): ")
        if move not in '123456789': continue
        for i in range(3):
            for j in range(3):
                if board[i][j] == move:
                    board[i][j] = current
                    if check_win(board, current):
                        print_board(board)
                        print(f"Player {current} wins!")
                        return
                    if is_draw(board):
                        print_board(board)
                        print("It's a draw!")
                        return
                    current = 'O' if current == 'X' else 'X'
                    break
            else: continue
            break

tic_tac_toe()

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	char **board;
	board = (char **)malloc(8 * sizeof(char *));
	for (int i = 0; i < 8; ++i)
	{
		board[i] = (char *)malloc(8 * sizeof(char ));
		for (int j = 0; j < 8; ++j)
		{	
			board[i][j] = ' ';
		}
	}
	for (int i = 0; i < 8; i++)
	{
		board[i][1] = 'P';
		board[i][6] = 'p';
	}
	board[0][0] = 'R';
	board[1][0] = 'N';
	board[2][0] = 'B';
	board[3][0] = 'Q';
	board[4][0] = 'K';
	board[5][0] = 'B';
	board[6][0] = 'N';
	board[7][0] = 'R';
	board[0][7] = 'r';
	board[1][7] = 'n';
	board[2][7] = 'b';
	board[3][7] = 'q';
	board[4][7] = 'k';
	board[5][7] = 'b';
	board[6][7] = 'n';
	board[7][7] = 'r';
	for (int i = 7; i >= -1; i--)
	{
		printf("  ---------------------------------\n");
		for (int j = 8; j > -1; j--)
		{
			if (j > 7 && i < 0)
			{
				printf("   ");
			}
			else  if (j > 7)
			{
				printf("%d |", i + 1);
			}
			else if (i < 0)
			{
				printf(" %c  ", 'H' - j);
			}
			else
			{
				printf(" %c |", board[7 - j][i]);
			}

		}
		printf("\n");
	}
	int x1,x2,y1,y2;
	do{
	scanf("%d%d", &x1,&x2);	
	scanf("%d%d", &y1,&y2);	
	board[y1-1][y2-1] = board[x1-1][x2-1];	
	board[x1-1][x2-1] = ' ';
		for (int i = 7; i >= -1; i--)
	{
		printf("  ---------------------------------\n");
		for (int j = 8; j > -1; j--)
		{
			if (j > 7 && i < 0)
			{
				printf("   ");
			}
			else  if (j > 7)
			{
				printf("%d |", i + 1);
			}
			else if (i < 0)
			{
				printf(" %c  ", 'H' - j);
			}
			else
			{
				printf(" %c |", board[7 - j][i]);
			}

		}
		printf("\n");
	}
	}while(1);
return 0;
}

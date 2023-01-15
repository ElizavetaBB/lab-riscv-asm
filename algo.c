#include <stdio.h>
#include <stdlib.h>

const int N = 4; // amount of collumns
const int M = 3; // amount of rows

void find_max_index(int array[M][N], int *max_x, int *max_y) {
  int max = array[0][0];
  *max_x = 0;
  *max_y = 0;
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      if (max < array[i][j]) {
        max = array[i][j];
        *max_x = j;
        *max_y = i;
      }
    }
  }
}

int main() {
  int max_x, max_y;
	int array[3][4] = {
    8, 105, 1, 10, 
    77, 3, 55, 98,
	  34, 10, 120, 45
  };
  find_max_index(array, &max_x, &max_y);

  printf("Index of max element: (%d, %d)", max_x, max_y);

  return 0;
  
}

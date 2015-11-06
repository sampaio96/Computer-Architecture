// What is the probability that if I look at a digital clock at a random time in some 12 hour span, the hhmm digits sum to 13?
#include <stdio.h>

int main() {

	int totalminutes = 0;
	int unluckytimes = 0;

	int minutes[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1,
				  2, 3, 4, 5, 6, 7, 8, 9, 10, 2,
				  3, 4, 5, 6, 7, 8, 9, 10, 11, 3,
				  4, 5, 6, 7, 8, 9, 10, 11, 12, 4,
				  5, 6, 7, 8, 9, 10, 11, 12, 13, 5, 
				  6, 7, 8, 9, 10, 11, 12, 13, 14};

	int hours[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3};

	for (int i = 0; i < 60; i ++) {
		for (int j = 0; j < 12; j ++) {
			if (minutes[i]+hours[j] == 13) {unluckytimes ++;}
			totalminutes ++;
		}
	}

	int prob = (100 * unluckytimes)/totalminutes;
	
	printf("unlucky percentage = %d percent\n", prob);
	
	return prob;

}
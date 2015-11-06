// What is the probability that if I look at a digital clock at a random time in some 12 hour span, the hhmm digits sum to 13?
#include <stdio.h>

int main() {

	int totaldays = 0;
	int unluckydays = 0;

	int days[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1,
				  2, 3, 4, 5, 6, 7, 8, 9, 10, 2,
				  3, 4, 5, 6, 7, 8, 9, 10, 11, 3, 4};

	int months[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3};

	for (int i = 0; i < 12; i ++) {

		if (i == 1) {
				for (int j = 0; j < 28; j ++) {
					if (months[i]+days[j] == 13) {unluckydays ++;}
					totaldays ++;
			}
		}

		if (i == 3 || i == 5 || i == 8 || i == 10) {
				for (int j = 0; j < 30; j ++) {
					if (months[i]+days[j] == 13) {unluckydays ++;}
					totaldays ++;
			}
		}

		else {
				for (int j = 0; j < 31; j ++) {
					if (months[i]+days[j] == 13) {unluckydays ++;}
					totaldays ++;
			}
		}
		
	}

	int prob = (100 * unluckydays)/totaldays;
	
	printf("unlucky percentage = %d percent\n", prob);
	
	return prob;

}
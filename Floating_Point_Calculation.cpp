/*
Do calculation A = (B^3) + sqrt(C)
A = answer
B = 4.0, C = 9.0

A = (4^3) + sqrt(9) = 64 + 3 = 67.
*/

#include "stdafx.h"
#include <stdio.h>
using namespace System;

void test(void); // Function prototype

int main(array<System::String ^> ^args)
{
	test();
	return 0;
}

void test()
{

	float A = 0.0, B = 4.0, C = 9.0; // Variables

	unsigned short cntrl=0x3FF,stat;

	// Assembly
	// Do calculation A = (B^3) + sqrt(C)
	__asm {
		FINIT ;set FPU to default state
		FLDCW cntrl ;round even, Mask interrupts

		FLD C ;push c into FP stack
		FSQRT ;square root number on stack

		FLD B ;push B into FP stack
		FMUL ST,ST(0) ;multiply ST*ST result on ST

		FLD B ;push B into FP stack
		FMUL ST,ST(1) ;multiply ST*ST(1) result on ST

		FADD ST,ST(2) ;add B^3 with C

		FSTSW stat ;load FPU status into [stat]

		FSTP A ;copy result from stack to A
	}


	printf("Decimal: %f\n",A);
	printf("HEX: %4X\n",*((unsigned long *)&A));

	printf("Binary:");

	unsigned char byt;
	for(int x = 3; x >= 0; x--)
	{
		byt=*((unsigned char *)&A+x);
		for(int y = 128; y > 0; y /= 2)
		{
			if((y&byt)==0) printf("0"); else printf("1");
		}
	}
	printf("\n");

	//  Wait for enter to be pressed before terminating
	while(getchar()!=10); // Clear buffer of previous <ret>
	while(getchar()!=10); // Wait for a new <ret>
}

package calculator;

import java.util.Scanner;

public class CalculatorMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		CalculatorFunctions obj = new CalculatorFunctions();
		
		System.out.println("Enter the value for A");
		int a = sc.nextInt();
		System.out.println("Enter the value for B");
		int b = sc.nextInt();
		
		sc.close();
		
		obj.add(a,b);
		obj.sub(a,b);
		obj.div(a,b);
		obj.mult(a,b);
		
		Calculatormo modulusCalc = new Calculatormo();
		modulusCalc.modulus(a, b);
	}
}

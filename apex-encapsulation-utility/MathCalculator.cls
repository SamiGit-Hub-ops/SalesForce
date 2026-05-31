/**
 * @description Performs basic math operations dynamically based on passed arguments.
 */
public class MathCalculator {

    /**
     * @description Public instance method to execute and log math operations dynamically.
     * @param num1 First integer
     * @param num2 Second integer
     */
    public void doMath(Integer num1, Integer num2) {
        // Pass the dynamic inputs down to the private method
        printOutput('add', num1, num2);
        printOutput('multiply', num1, num2);
    }

    private static Integer add(Integer a, Integer b) { 
        return a + b; 
    } 

    private static Integer multiply(Integer a, Integer b) { 
        return a * b; 
    } 

    private static void printOutput(String op, Integer a, Integer b) { 
        if (op == 'add') { 
            Integer ans = add(a, b); 
            System.debug('Addition: ' + ans); 
        } 
        
        if (op == 'multiply') { 
            Integer ans = multiply(a, b); 
            System.debug('Multiplication: ' + ans); 
        } 
    } 
}

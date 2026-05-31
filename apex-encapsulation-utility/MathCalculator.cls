public class MathCalculator {
    
    public void doMath() {
        printOutput('add', 4, 5);
        printOutput('multiply', 4, 5);
    }
      
    private static void printOutput(String op, Integer a, Integer b)  {
        if(op == 'add') {
            Integer ans = add(a, b);
            System.debug('Addition: '+ans);
        }
        
        if(op == 'multiply') {
            Integer ans = multiply(a, b);
            System.debug('multiplication: '+ans);
        }
    }
    
    private static Integer add(Integer a, Integer b) {
        return a+b;
    }

    private static Integer multiply(Integer a, Integer b) {
        return a*b;
    }
}

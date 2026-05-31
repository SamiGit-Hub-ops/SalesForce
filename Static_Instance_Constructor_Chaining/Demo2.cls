/**
 * @description Demonstrates Core Object-Oriented Programming (OOP) concepts 
 *              including variable scoping, initialization blocks, and constructor chaining.
 * @category    Documentation Examples
 */
public class Demo2 { 
    
    // 1. INSTANCE VARIABLE: Unique to each object instance created from this class.
    public String str; 

    // 2. STATIC CONSTANT: Shared across all instances; 'final' means it cannot be reassigned after initialization.
    private static final String DEFSTR; 

    /**
     * 3. STATIC INITIALIZER BLOCK: Executes exactly once when the class is first loaded into memory.
     *    Used here to initialize the static final variable 'DEFSTR'.
     */
    static { 
        DEFSTR = 'Default Greetings'; 
    } 

    /**
     * 4. NO-ARGUMENT CONSTRUCTOR: Invoked when an object is instantiated without parameters (e.g., new Demo2()).
     *    Uses 'this()' to delegate execution to the overloaded constructor below.
     */
    public Demo2() { 
        // CONSTRUCTOR CHAINING: Passes the default constant value to the parameterized constructor.
        this(DEFSTR); 
    } 

    /**
     * 5. OVERLOADED (PARAMETERIZED) CONSTRUCTOR: Accepts a custom string to initialize the object.
     *    @param stringDisplay The text value to assign to the instance variable.
     */
    public Demo2(String stringDisplay) { 
        // 'this.str' explicitly refers to the instance variable, resolving ambiguity with the parameter name.
        this.str = stringDisplay; 
    } 

    /**
     * 6. INSTANCE METHOD: Requires an object instance to be called (e.g., myDemo.printString()).
     *    Operates on the specific instance's data.
     */
    public void printString() { 
        System.debug('Display text : ' + this.str); 
    } 

    /**
     * 7. STATIC METHOD: Belongs to the class itself, not any single instance.
     *    Called directly using the class name (e.g., Demo2.printStringStatic()).
     */
    public static void printStringStatic() { 
        System.debug('Display from static method'); 
    } 
}

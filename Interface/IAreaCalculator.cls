public interface IAreaCalculator {
    // Interface methods specify a contract of behaviors that must be implemented.
    // They are implicitly public and abstract; access modifiers are not required.
    void computeArea(); 
    
    // Interfaces fully support method overloading by changing the parameter signatures.
    void computeArea(Integer a, Integer b);
}

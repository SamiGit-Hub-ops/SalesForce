public class ClassForAreaCal implements IAreaCalculator {
    
    // All methods implementing an interface must explicitly be declared as 'public'.
    public void computeArea(Integer h, Integer w) { 
        System.debug('Area is ' + (h * w)); 
    } 
    
    public void computeArea() { 
        System.debug('if no inputs provided this method is executed'); 
    }
}

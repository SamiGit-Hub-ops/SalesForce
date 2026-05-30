// MyClass.cls
public with sharing class MyClass { 
    
    public static void func() { 
        Integer sum = 0, i = 1; 
        List<Integer> intList = new List<Integer>(); 
        
        while(i <= 20) { 
            if(Math.mod(i, 2) == 0) { 
                sum += i; 
            } else { 
                intList.add(i); 
            } 
            i++; 
        } 
        System.debug('Sum ' + sum); 
    } 
    
}

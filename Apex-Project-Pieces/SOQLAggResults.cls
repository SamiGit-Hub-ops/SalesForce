// FILE: SOQLAggResults.cls
//
// This class demonstrates how to capture, unpack, and process grouped database 
// aggregates using the specialized AggregateResult object. 
//
// Running this via the Execute Anonymous Console (SOQLAggResults.HeatScore();) 
// bypasses standard sObject loops, minimizing CPU time and heap allocation.

public class SOQLAggResults {
    
    public static void HeatScore() {
        
        // PRINCIPLE 1: SPECIALIZED DATA TYPE
        // Aggregate queries do not return standard sObjects (like List<Case>). 
        // They return a read-only collection of 'AggregateResult' records.
        //
        // PRINCIPLE 2: SOQL ALIASING
        // We append a space and an alias name ('total') to the aggregate function.
        // This explicitly names the map key, avoiding the generic 'expr0' naming convention.
        List<AggregateResult> results = [
            SELECT AccountId, COUNT(Id) total 
            FROM Case 
            WHERE IsClosed = false 
            GROUP BY AccountId
        ];
        
        for (AggregateResult ar : results) {
            
            // PRINCIPLE 3: DECONSTRUCTION & TYPE CASTING
            // Because AggregateResult acts like a Map<String, Object>, we extract values 
            // using .get() with the string name of the column or alias. 
            // We must explicitly cast the generic 'Object' output to the target primitive type.
            Id acId = (Id)ar.get('AccountId');
            Integer total = (Integer)ar.get('total');
            
            // Output the extracted and strongly-typed primitives to the debug logs
            System.debug('Id: ' + acId + ' | Total Open Cases: ' + total);
        }
    }
}

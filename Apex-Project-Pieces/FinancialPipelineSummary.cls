// FILE: FinancialPipelineSummary.cls
//
// BUSINESS CONTEXT:
// Provides the CFO and Revenue Operations teams with a real-time risk assessment 
// of high-exposure pipeline segments. It identifies specific account-stage 
// combinations that represent significant concentrated financial value.
// 
// ARCHITECTURAL VALUE:
// 1. Multi-Dimensional Aggregation: Groups data across two distinct fields simultaneously 
//    (AccountId and StageName) entirely within the database layer.
// 2. Memory Optimization: Rather than pulling hundreds of rows per account into Apex 
//    memory and sorting them into maps of maps, the database hands back exactly one row 
//    per unique segment.
// 3. Compound Post-Filtering: Leverages the HAVING clause to evaluate multiple aggregate 
//    conditions (deal count volume and cumulative pipeline value) simultaneously.

public class FinancialPipelineSummary {
    
    public static void aggregateHighValueSegments() {
        
        // Execute the multi-dimensional financial aggregate query.
        // NOTE: SUM(Amount) must be used in the HAVING clause instead of the 'totalValue' alias.
        List<AggregateResult> results = [
            SELECT AccountId, StageName, SUM(Amount) totalValue, AVG(Amount) avgValue
            FROM Opportunity
            WHERE IsClosed = false
            GROUP BY AccountId, StageName
            HAVING COUNT(Id) > 5 AND SUM(Amount) > 100000
        ];
        
        for (AggregateResult ar : results) {
            
            // Extract categorical grouping fields (IDs and Strings)
            Id accId         = (Id)ar.get('AccountId');
            String stage     = (String)ar.get('StageName');
            
            // Extract financial summaries. Note that SUM and AVG on currency fields 
            // must always be cast to the Decimal primitive type in Apex.
            Decimal totalAmt = (Decimal)ar.get('totalValue');
            Decimal avgAmt   = (Decimal)ar.get('avgValue');
            
            // Stream the targeted segment metrics out to the console
            System.debug('Account Segment: ' + accId + 
                         ' | Stage: ' + stage + 
                         ' | Cumulative Value: $' + totalAmt + 
                         ' | Average Deal Size: $' + avgAmt);
        }
    }
}



// caller code (from Execute Anonymous is FinancialPipelineSummary.aggregateHighValueSegments()

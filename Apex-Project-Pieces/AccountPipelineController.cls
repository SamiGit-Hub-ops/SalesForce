// ====================================================================================
// MODULE: Enterprise Apex Automation & Bulkified Data Relationships
// FILE: AccountPipelineController.cls
//
// PROBLEM STATEMENT & BUSINESS VALUE:
// Sales operations leaders need real-time data transparency into open active deal pipelines 
// associated with specific targeted strategic corporate accounts. Running separate queries 
// within an iterating dataset risks crashing critical transactions via 'SOQL 101' errors.
//
// This controller cleanly extracts unique parent record identifiers into an in-memory 
// set collection, executing exactly one optimized multi-relationship parent-to-child 
// query transaction. Output logs are then cleanly enumerated via nested iteration, 
// ensuring maximum memory performance and absolute limit compliance.
// ====================================================================================


/**
 * @description Controller to pull and log open opportunities for a specific set of accounts.
 *              Bulkified to avoid hitting the 101 SOQL limit.
 */

public class AccountPipelineController {
    
    public static void AccountPipelineMethod(List<Account> accountList) {
        // Collect unique account IDs to prevent duplicate query filters
        Set<Id> idSet = new Set<Id>();
        for (Account acc : accountList) {
            if (acc.Id != null) {
                idSet.add(acc.Id);
            }
        }
        
        // Base query to pull parent info along with open child opportunities
        List<Account> accList = [
            SELECT Id, Name, Owner.Name, 
                   (SELECT Id, Name, StageName, Amount 
                    FROM Opportunities 
                    WHERE IsClosed = false) 
            FROM Account
            WHERE Id IN :idSet
            ORDER BY CreatedDate DESC
        ];
        
        // Loop through and log the results for testing/auditing
        for (Account acc : accList) {
            System.debug('Account ID: ' + acc.Id + ' | Name: ' + acc.Name + ' | Owner: ' + acc.Owner.Name);
            
            for (Opportunity opp : acc.Opportunities) {
                System.debug('  └─ Opportunity ID: ' + opp.Id + ' | Name: ' + opp.Name + ' | Amount: $' + opp.Amount);   
            }
        }
    }
}

/**
 * @description Links incoming Opportunity records to their parent Accounts 
 * using the Account Number provided in the Opportunity Description.
 * @time-complexity O(n) Linear Time
 */
public with sharing class OpportunityAccountIDLinker {
    
    /**
     * @description Matches and associates Opportunities to Accounts via AccountNumber.
     * @param opps Incoming list of Opportunity records from external ERP integration.
     */
    public static void linkOpportunitiesToAccounts(List<Opportunity> oppList) {
        // Step 1: Guard the Gate
        if (oppList == null || oppList.isEmpty()) {
            return;
        }
        
        // Step 2: Extract the Unique Search Keys
        Set<String> accountNumbers = new Set<String>();
        for (Opportunity op : oppList) { 
            if (op != null && op.Description != null && op.Description != '') {
                accountNumbers.add(op.Description);
            }
        }
        
        // Safety check: If no valid keys were collected, prevent unnecessary database query
        if (accountNumbers.isEmpty()) {
            return;
        }
        
        // Step 3: Fetch Target Records Securely from Database
        List<Account> matchingAccounts = [
            SELECT Id, AccountNumber 
            FROM Account 
            WHERE AccountNumber IN :accountNumbers 
            WITH USER_MODE
        ];
        
        // Step 4: Map the Records in Memory (Build Search Index)
        Map<String, Id> accountNumberToIdMap = new Map<String, Id>();
        for (Account acc : matchingAccounts) {
            if (acc != null && acc.AccountNumber != null) {
                accountNumberToIdMap.put(acc.AccountNumber, acc.Id);
            }
        }
        
        // Step 5: Execute the Final Linear Assignment Lookup
        for (Opportunity op : oppList) { 
            if (op != null && accountNumberToIdMap.containsKey(op.Description)) {
                op.AccountId = accountNumberToIdMap.get(op.Description);
            }
        }
    }
}

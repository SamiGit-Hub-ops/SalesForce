/**
 * @description Links incoming Contact records to their matching Parent Accounts 
 *              based on the text value in the Contact's Department field.
 */
public with sharing class ContactAccountLinker {

    /**
     * @description Automatically finds and assigns AccountIds to Contacts based on Department text.
     * @param conList The list of new or updated Contact records from the backend system.
     */
    public void linkContacts(List<Contact> conList) {
        // 1. Guard Clause: Exit early if there are no contacts to process
        if (conList == null || conList.isEmpty()) {
            return;
        }

        // 2. Gather all unique Department names from the incoming Contacts
        Set<String> depts = new Set<String>();
        for (Contact c : conList) {
            // Only add to the search list if the department is not blank
            if (c != null && c.Department != null && c.Department != '') {
                depts.add(c.Department);
            }
        }

        // 3. Guard Clause: If all contacts had blank departments, stop here
        if (depts.isEmpty()) {
            return;
        }

        // 4. Query the database for Accounts matching these department names securely
        List<Account> accs = [
            SELECT Id, Name 
            FROM Account 
            WHERE Name IN :depts 
            WITH USER_MODE
        ];

        // 5. Map the Account Names to their unique Salesforce IDs for quick lookups
        Map<String, Id> accMap = new Map<String, Id>();
        for (Account a : accs) {
            accMap.put(a.Name, a.Id);
        }

        // 6. Match each Contact to its parent Account using the map
        for (Contact c : conList) {
            // Check if the contact's department matches an account we found
            if (c != null && accMap.containsKey(c.Department)) {
                Id targetId = accMap.get(c.Department);
                c.AccountId = targetId;
            }
            // Contacts with blank or unmatched departments are skipped safely
        }
    }
}

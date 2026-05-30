@RestResource(urlMapping='/MarTechLeadAPI/*')
global with sharing class LeadRoutingAPI {
    
    @HttpPost
    global static String createLeads() {
        RestRequest req = RestContext.request;
        
        if (req.requestBody == null) {
            return 'Error: Empty request body payload.';
        }
        
        String jsonBody = req.requestBody.toString();
        List<Object> rawLeads = (List<Object>) JSON.deserializeUntyped(jsonBody);
        List<Lead> leadsToInsert = new List<Lead>();
        
        for (Object obj : rawLeads) {
            Map<String, Object> leadData = (Map<String, Object>) obj;
            Lead newLead = new Lead();
            
            newLead.FirstName = leadData.containsKey('firstName') ? String.valueOf(leadData.get('firstName')) : '';
            newLead.Email = leadData.containsKey('email') ? String.valueOf(leadData.get('email')) : '';
            
            newLead.LastName = leadData.containsKey('lastName') && leadData.get('lastName') != null ? 
                               String.valueOf(leadData.get('lastName')) : 'Unknown';
                               
            newLead.Company = leadData.containsKey('company') && leadData.get('company') != null ? 
                              String.valueOf(leadData.get('company')) : 'Individual';
            
            newLead.LeadSource = 'Web Ad API';
            leadsToInsert.add(newLead);
        }
        
        if (!leadsToInsert.isEmpty()) {
            try {
                insert leadsToInsert;
                return 'Success: ' + leadsToInsert.size() + ' leads routed to Salesforce.';
            } catch (DmlException e) {
                return 'Database Error: ' + e.getDmlMessage(0);
            } catch (Exception e) {
                return 'System Error: ' + e.getMessage();
            }
        }
        
        return 'Error: No valid leads found in payload.';
    }
}

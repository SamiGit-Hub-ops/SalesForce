public class Demo3 {

    // Pass by Value (Primitive Types)
    public void methodVal() {
        String webs = 'abc.com';
        System.debug('Before pass by value: ' + webs); // Value: 'abc.com'
        
        valCal(webs); 
        System.debug('After pass by value: ' + webs);  // Value remains 'abc.com'
    }

    private void valCal(String str) {
        // Modifying a primitive variable reassigns the local reference copy only.
        // The original primitive variable outside this execution context remains unchanged.
        str = 'xyz.com';
    }


    // Pass by Reference / Pointer Copies (Complex Types)
    public void methodRef() {
        Account a = new Account();
        a.Name = 'Test account';
        a.Website = 'abc.com';
        System.debug('Before pass by ref: ' + a.Website); // Value: 'abc.com'
        
        refCall(a);
        System.debug('After pass by ref: ' + a.Website);  // Value updates to 'xyz.com'
    }

    private void refCall(Account x) {
        // Apex passes a COPY of the memory pointer. Both variables point to the same memory slot.
        // Changing an internal object property modifies the shared underlying record wrapper.
        x.Website = 'xyz.com';
        
        // CRITICAL NOTE FOR INTERVIEWS: Writing 'x = new Account()' here would break 
        // the pointer link and stop further changes from reaching the outside variable.
    }
}

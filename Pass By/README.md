### 3. Pass-by-Value vs. Pass-by-Reference (`Demo3.cls`)
This class demonstrates how different data types behave when passed into methods, and how it impacts their values after the method finishes.

* **Pass by Value (Primitive Types)**:
  * The method `methodVal()` initializes a String variable `webs` to `'abc.com'`.
  * It passes `webs` into the `valCal()` method, which sends a copy of the data.
  * Inside `valCal()`, changing the variable to `'xyz.com'` only affects the local copy.
  * Result: The original variable outside the method remains completely unchanged as `'abc.com'`.

* **Pass by Reference (Complex Types)**:
  * The method `methodRef()` creates a new Account object `a` and sets its Website to `'abc.com'`.
  * It passes the account into the `refCall()` method, which sends the memory reference link.
  * Inside `refCall()`, changing `x.Website` to `'xyz.com'` modifies the actual object in memory.
  * Result: The original account `a` outside the method is updated directly to `'xyz.com'`.

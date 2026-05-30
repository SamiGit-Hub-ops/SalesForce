###  Object-Oriented Inheritance & Polymorphism (`StringWriter.cls` & `HTMLStringWriter.cls`)
This module demonstrates classic Object-Oriented Programming (OOP) concepts using class inheritance and method overriding.

* **Parent-Child Inheritance**: 
  * `StringWriter` serves as the base parent class, explicitly marked as `virtual` to allow other classes to extend it.
  * `HTMLStringWriter` uses the `extends` keyword to inherit properties and methods from the parent.

* **Runtime Polymorphism (Method Overriding)**:
  * The parent class defines a standard `printString()` execution method.
  * The child class uses the `override` keyword to intercept and rewrite the method's behavior to output HTML-formatted strings instead.
  * Result: A single method name (`printString()`) changes its output dynamically depending on the specific class object invoking it at runtime.

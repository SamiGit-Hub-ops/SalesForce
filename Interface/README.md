### Loose Coupling via Interfaces (`IAreaCalculator.cls` & `ClassForAreaCal.cls`)
This code demonstrates the concept of abstraction and contract-based programming using Apex Interfaces.

* **The Interface Contract**: 
  * `IAreaCalculator` acts as a blueprint, defining signatures for `computeArea()` without providing any actual execution logic.
  * Methods are implicitly public and abstract, allowing other components to share a uniform code contract.

* **Class Implementation**:
  * `ClassForAreaCal` uses the `implements` keyword to fulfill the interface contract.
  * It provides the concrete execution logic for both overloaded method structures, demonstrating how interfaces drive decoupled application architectures.

# Salesforce Apex Practice Labs

A collection of deployable Salesforce Apex classes demonstrating REST API integration and foundational loop logic.

## 📂 Project Contents

### 1. Custom REST Lead API (`LeadRoutingAPI.cls`)
A custom Apex REST endpoint (`/MarTechLeadAPI/*`) that handles incoming HTTP `POST` requests to bulk-create Lead records from an ad platform.
* **Key Logic**: Uses `JSON.deserializeUntyped` to parse dynamic payloads safely using `String.valueOf()` to prevent runtime type exceptions.
* **Safety**: Includes database guard clauses, required field fallbacks (`LastName`, `Company`), and try-catch DML error handling.

### 2. Math & Collection Engine (`MyClass.cls`)
A basic utility class containing a static method (`func`) that processes numbers from 1 to 20 using a conditional execution loop.
* **Key Logic**: Evaluates numbers using a `while` loop and a modulo check (`Math.mod`). 
* **Collections**: Adds even numbers to a tracking sum total and routes odd numbers into a `List<Integer>` collection.

---

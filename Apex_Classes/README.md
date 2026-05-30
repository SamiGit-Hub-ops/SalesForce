# Salesforce Lead Routing API

A custom REST API endpoint built with Apex to capture external ad data (e.g., Facebook, LinkedIn) and create Lead records directly in Salesforce.

## Overview
This class acts as a webhook listener. It catches raw JSON payloads sent from marketing platforms, structures the data using Apex Collections, and bulk-inserts the records into the Salesforce database.

## Features
- **JSON Parsing:** Converts unstructured web payloads into Apex Maps.
- **Bulk-Safe:** Uses Lists and bulk DML to handle multiple leads in a single transaction, respecting Salesforce governor limits.
- **Attribution:** Automatically tags incoming records with a default Lead Source.

## How to Use
Send a `POST` request to the endpoint with a JSON array of lead objects.

**Endpoint:**
`/services/apexrest/MarTechLeadAPI/`

**Sample JSON Payload:**
```json
[
  {
    "firstName": "Jane",
    "lastName": "Smith",
    "company": "Global Corp",
    "email": "jane.smith@example.com"
  }
]

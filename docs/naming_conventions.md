# General Principles

- **Naming Conventions**: Use `snake_case`, with lowercase letters and underscores (`_`) to separate words.  
- **Language**: Use English for all names.  
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.  

---

## Table Naming Conventions

### Bronze Rules

- All names must start with the source system name, and table names must match their original names without renaming.  
- Pattern:  

  `\<sourcesystem>_\<entity>`

  - `\<sourcesystem>`: Name of the source system (for example: `crm`, `erp`).  
  - `\<entity>`: Exact table name from the source system.  
  - **Example**:  

    `crm_customer_info`  →  Customer information from the CRM system.  

---

### Silver Rules

- All names must start with the source system name, and table names must match their original names without renaming.  
- Pattern:  

  `\<sourcesystem>_\<entity>`

  - `\<sourcesystem>`: Name of the source system (for example: `crm`, `erp`).  
  - `\<entity>`: Exact table name from the source system.  
  - **Example**:  

    `crm_customer_info`  →  Customer information from the CRM system.  

---

### Gold Rules

- All names must use meaningful, business aligned names for tables, starting with the category prefix.  
- Pattern:  

  `\<category>_\<entity>`

  - `\<category>`: Describes the role of the table, such as `dim` (dimension) or `

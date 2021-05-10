# Prolog Study Notes

### Statements and procedures
- Prolog programs consist of collections of **statements** (also called assertions, or clauses)
- Statements are grouped into **procedures**. 
- Each procedure defines a certain relationship between its **arguments**.


### Facts and rules
- **Facts** are propositions declared to be True


### Questions and queries
- The collection of statements constitutes a **declarative database**
- A **query** is the codification of a **question**.
- There are only 2 types of queries:
  1. **Ground query** Is it indeed the case that a given statement is true?
  2. **Non-ground query** Under what conditions, if any, is a given statement true?

### Ground queries
- Result in a True/False response
- "Is it indeed the case that Peter is the parent of Daphne?"
- ?-parent(peter, daphne)

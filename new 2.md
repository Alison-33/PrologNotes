# Prolog Study Notes

### Statements and procedures
- Prolog programs consist of collections of **statements** (also called assertions, or clauses)
- Statements are grouped into **procedures**. 
- Each procedure defines a certain relationship between its **arguments**.


### Facts and rules
- **Facts** are propositions declared to be True
- A **rule statement** gives rules of implication between propositions.

### Questions and queries
- The collection of statements constitutes a **declarative database**
- A **query** is the codification of a **question**.
- There are only 2 types of queries:
  1. **Ground query:** Is it indeed the case that a given statement is true?
  2. **Non-ground query:** Under what conditions, if any, is a given statement true?


### Ground queries
- Result in a True/False response
- "Is it indeed the case that Peter is the parent of Daphne?"
- ?-parent(peter, daphne)
- Prolog will take the query and start searching the database from top to bottom, one statement at a time trying to **match / unify** it with a statement.


### Non-ground queries
- Involves one or more variables.
- "Who is a parent of Daphne?"
- ?-parent(X, daphne)
- Where X **(notice the capitalization)** is a variable.
- Prolog will seek **instantiation(s)** for variable X, provided any exist, that could make the query succeed.


### Unification
- A ground query can unify with a statement
- A non-ground query can unify with a statement only if substitution can be made for any variables so that the two terms can be made equal.


### Rules
- The general form is **head :- body**
- "The head is true, if the body is true."
- grandparent(X, Z) :- parent(X,Y), parent(Y,Z).


### Disjunction or conjunction rules
- ancestor(X, Y) :- parent(X, Y).
- ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
- There is a **disjunction** between the 2 lines, and a **conjunction** between the two goals of the body of the second rule.



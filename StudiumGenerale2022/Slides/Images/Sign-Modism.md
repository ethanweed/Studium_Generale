```mermaid
  graph LR;
      A((Word)) --> B((Concept));
	  B((Concept)) <-- A((Word));
	  A(Word) <--> C(Thing);
	  B(Concept) <--> C(Thing);
      
      
```
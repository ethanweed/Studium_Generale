```mermaid
  graph LR;
      A((Word)) --> B((Concept));
	  B((Concept)) --> A((Thing));
	  A(Word) <-->C (Thing);
	  B(Concept) <--> C(Thing);
      
      
```
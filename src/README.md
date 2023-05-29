**Nume:** Carauleanu Valentin Gabriel
**Grupă:** 311Cab

## THE RACE IS ON - TEMA 2 - PCLP2

### Descriere:

* Pe parcursul temei, pot spune ca am inteles fundamentele limbajului de asamblare
* Mai mult, am invatat functii noi precum imul, shl si div, dar si lucrul cu adrese si vectori
* 

### Componente:

## Exercitiul 1
* Rezolvarea se bazeaza pe parcurgerea vectorului plain
* La fiecare litera adun step, iar ulterior verific daca litera obtinuta este mai mare decat Z
* In acest caz, revin in intervalul [A, Z] prin scaderea nr 26
* Ulterior, salvez literele noi obtinute in vectroul ecrypt

## Exercitiul 2
* Rezolvarea sort_procs se bazeaza pe o dubla parcurgere, mai precis selection sort
* Pentru a avea la fiecare pas o noua structura, voi aduna la fiecare pas 5 
* Din acest motiv, am inmultit lungimea vectorului cu 5
* Astfel, la fiecare pas, voi compara elementul curent cu toate elementele din dreapta sa, ordonandu-le
* Operatia de swap se realizeaza pentru fiecare field din structura, deoarece intreaga struct nu incape intr un registru

* Rezolvarea run_procs se bazeaza pe simularea unui 'switch statement' pentru a determina poztiile din vectorii declarati global
* La final, folosesc operatorul div pentru a afla catul si restul impartirilor

## Exercitiul 3
* Pentru simplitate, in loc de a shifta un vector cu x pozitii, am luat decizia de a shifta vectorul cu o pozitie de x ori
* Shiftarea la stanga se bazeaza pe o parcurgere spre dreapta, iar shiftarea la dreapta pe o parcurgere spre stanga
* La finalul acestor parcurgeri, completez ultimul element cu valoarea fostului prim element salvat intr-o var auxiliara


## Exercitiul 4 + Bonus
* Inreaga problema a acestui ex a fost determinarea pozitiilor posibile ale piesei de joc, in raport cu matricea / bitmap ul
* Pentru rezolvare, am decurs la 4 pasi : linia superioara, diagonala spre stanga + dreapta si linia inferioara , diagonala spre stanga + dreapta
* In acest sens, am contruit o serie de jmp -uri conditionate
* Pentru a afla setul de biti pe care se afla o linie, am folosit o simulare de 'switch' in cadrul bonusului, urmata de shiftari pentru a marca punctele de interes

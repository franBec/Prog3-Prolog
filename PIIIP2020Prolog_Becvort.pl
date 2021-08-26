% ------------------------
%Operaciones con listas
% ------------------------

%Ejercicio 1.1
primero([X|_], X).
/* Preguntas
?- primero([X,b,c],a).	-> X = a.
?- primero([X,Y],a).	-> X = a.
?- primero(X,a).		-> X = [a|_9930].
*/

%Ejercicio 1.2
cola([_|L], L).
/* Preguntas
?- cola([a|L],[b,c]).	-> L = [b, c].
?- cola(L,[b,c]).		-> L = [_7888, b, c].
*/

%Ejercicio 1.3
cons(X,L1,L2) :- append([X],L1,L2).
/*Preguntas
?- cons(X,[b,c],[a,b,c]).	-> X = a.
?- cons(a,L,[a,b,c]).		-> L = [b, c].
?- cons(b,L,[a,b,c]).		-> false.
?- cons(X,L,[a,b,c]).		-> X = a, L = [b, c].
*/

%Ejercicio 1.4
pertenece(X,[X|_]).
pertenece(X,[_|L]) :- pertenece(X,L).
/*Preguntas
1.?- pertenece(c,[a,c,b,c]).						-> true ;true ;false.
2.?- pertenece(X,[a,b,a]).							-> X = a ; X = b ; X = a ; false.
3.?- pertenece(X,[a,b,c]), pertenece(X,[d,c,b]).	-> X = b ; X = c ; false.
*/

%Ejercicio 1.5 - Concatenar sin acumulador
conc([],L2,L2).
conc([X|Xs],L2,[X|Res]) :- conc(Xs,L2,Res).
/*Preguntas
1.?- conc([a,b], X, [a,b,c,d]).									-> X = [c, d].
2.?- conc(X,Y,[a,b]).											-> X = [], Y = [a, b] ; X = [a], Y = [b] ; X = [a, b], Y = [] ; false.
3.?- conc([a,X,c],[],[a,b,c]),X=b.								-> X = b.
4.?- conc(_,[b,c|_],[a,b,c,d]).									->true .
5.conc(_,[b,d|_],[a,b,c,d]).									->false.
6.?- conc([b,a,c],X,[b,a,c,d]).									-> X = [d].
*/

%Ejercicio 1.5 - Concatenar con acumulador
conc1(L1,L2,L3) :- concA(L1,L2,L3,L1).
concA(X,[],Res,Res) :- !.
concA(X,[Y|Ys],Y1,Res) :- append(Res,[Y],Acc), concA(X,Ys,Y1,Acc).

%Ejercicio 1.6 - Palindromo
palindromo(X) :- reverse(X,X).

%Ejercicio 1.6 - Palindromo sin acumulador
palindromoR([],[]) :- !.
palindromoR([X|Xs],Res):- palindromoR(Xs,Aux), append(Aux,[X],Res).

%Ejercicio 1.6 - Palindromo con acumulador
palindromo1(X,Y) :- palindromoA(X,Y,[]).
palindromoA([],Y,Y) :- !.
palindromoA([X|Xs],Y,Res) :- append([X],Res,Acc), palindromoA(Xs,Y,Acc).

%Ejercicio 1.7 - Duplica sin acumulador
duplica([],[]) :- !.
duplica([X|Xs],[X,X|Y]) :- duplica(Xs,Y).
/*Preguntas
1.?- duplica([1,2|X],[1,1,2,2,3,3]).	-> X = [3].
2.?- duplica([1,X,3],[1,1,2,2,3,3]).	-> X = 2.
*/

%Ejercicio 1.7 - Duplica con acumulador
duplica1(X,Y) :- duplicaA(X,Y,[]).
duplicaA([],Y,Y) :- !.
duplicaA([X|Xs],Y,Res) :- append(Res,[X,X],Acc), duplicaA(Xs,Y,Acc).
/*Preguntas
1.?- duplica1([1,2|X],[1,1,2,2,3,3]).	-> X = [3].
2.?- duplica1([1,X,3],[1,1,2,2,3,3]).	-> X = 2.
*/

%Ejercicio 1.8 - Longitud sin acumulador
long([],0) :- !.
long([_|Xs],Res) :- long(Xs,A), Res is A+1.

%Ejercicio 1.8 - Longitud con acumulador
long1(L,R) :- longA(L,R,0).
longA([],A,A) :- !.
longA([X|Xs],R,A) :- A1 is A+1, longA(Xs,R,A1).

% ------------------------
%Aritmetrica
% ------------------------

%Ejercicio 2.1 - Maximo
maximo(X,Y,X) :- X > Y, !.
maximo(X,Y,Y) :- Y >= X.

%Ejercicio 2.1 - Maximo sin acumulador
maximoR(X,0,X) :- !.	%X es mayor
maximoR(0,Y,Y) :- !.	%Y es mayor
maximoR(0,0,0) :- !.	%X es igual a Y
maximoR(X,Y,Res) :- X1 is X-1, Y1 is Y-1, maximoR(X1,Y1,Z), Res is Z+1.

%Ejercicio 2.2 - Factorial sin acumulador
factorial(1, 1) :- !.
factorial(X,Res):- Y is X-1, factorial(Y, ResA), Res is ResA*X.

%Ejercicio 2.2 - Factorial con acumulador
factorial1(X,Y) :- factorialA(X,Y,1).
factorialA(1,A,A) :- !.
factorialA(X,Y,A) :- X1 is X-1, A1 is A*X, factorialA(X1,Y,A1).

%Ejercicio 2.3 idem Ejercicio 1.8

%Ejercicio 2.4 - Sumar elementos de una lista sin acumulador
suma_lista([],0) :- !.
suma_lista([X|Xs],N) :- suma_lista(Xs,Naux), N is Naux + X.

%Ejercicio 2.4 - Sumar elementos de una lista con acumulador
suma_lista1(L,X) :- suma_listaA(L,X,0).
suma_listaA([],X,X) :- !.
suma_listaA([X|Xs],N,Acc) :- AccA is Acc+X, suma_listaA(Xs,N,AccA).

% ------------------------
%Estructuras
% ------------------------

%Ejercicio 3.1
familia(
    persona([tomas, garcia, perez],fecha(7, mayo, 1960),trabajo(profesor,60)),
	persona([ana, lopez, ruiz], fecha(10,marzo,1962), trabajo(medica,90)),
    [
		persona([juan, garcia, lopez],fecha(5,enero,1990),estudiante),
		persona([maria, garcia, lopez],fecha(12,abril,1992),estudiante)
	]
).	

familia( 
    persona([jose, perez, ruiz],fecha(6,marzo,1963),trabajo(pintor,120)),
	persona([luisa, galvez, perez],fecha(12,mayo,1964),trabajo(medica,90)),
    [
		persona([juan_luis,perez, perez],fecha(5,febrero,1990),estudiante),
		persona([maria_jose,perez, perez],fecha(12,junio,1992),estudiante),
		persona([jose_maria,perez, perez],fecha(12,julio,1994),estudiante) 
    ]
).

/*
Ejercicio 3.2

familia(_,_,[]). 		-> false.
familia(_,_,[_]).		-> false.
familia(_,_,[_,_]).		-> true.
familia(_,_,[_,_,_]).	-> true.
familia(_,_,[_,_,_,_]). -> false.

Ejercicio 3.3
familia(persona(X,_,_),_,[_,_,_]).	-> X = [jose, perez, ruiz].
*/

%Ejercicio 3.4
casada(X) :- familia(_,X,_).
casado(X) :- familia(X,_,_).

/*
Ejercicio 3.5
casada(X).	-> X = persona([ana, lopez, ruiz], fecha(10, marzo, 1962), trabajo(medica, 90)) ; X = persona([luisa, galvez, perez], fecha(12, mayo, 1964), trabajo(medica, 90)).


Ejercicio 3.6
familia(_,persona(X,_,trabajo(_,_)),_).	-> X = [ana, lopez, ruiz] ; X = [luisa, galvez, perez].
*/

%Ejercicio 3.7
hijo(X) :- familia(_,_,L), member(X,L).
persona(X) :- familia(X,_,_) ; familia(_,X,_) ; hijo(X).

%usando casada(x) y casado(x)
persona1(X) :- casado(X); casada(X) ; hijo(X).

/*
Ejercicio 3.8

?- persona(persona(X,_,_)).
X = [tomas, garcia, perez] ;
X = [jose, perez, ruiz] ;
X = [ana, lopez, ruiz] ;
X = [luisa, galvez, perez] ;
X = [juan, garcia, lopez] ;
X = [maria, garcia, lopez] ;
X = [juan_luis, perez, perez] ;
X = [maria_jose, perez, perez] ;
X = [jose_maria, perez, perez].
*/

%Ejercicio 3.9
sueldo(X,Y) :- persona(persona(X,_,trabajo(_,Y))).

%Ejercicio 3.10
total([],0) :- !.
total([X|Xs],Res) :- total(Xs,Aux), sueldo(X,Y), Res is Aux + Y.

% ------------------------
%Retroceso, corte y negación
% ------------------------

%Ejercicio 4.1

f(X,0) :- X<3.
f(X,2) :- 3=<X,X<6.
f(X,4) :- 6=<X.

f_1(X,0) :- X<3, !.
f_1(X,2) :- 3=<X,X<6, !.
f_1(X,4) :- 6=<X.

f_2(X,0) :- X<3, !.
f_2(X,2) :- X<6, !.
f_2(X,4) :- 6=<X.

f_3(X,0) :- X<3.
f_3(X,2) :- X<6.
f_3(X,4) :- 6=<X.

%Ejercicio 4.2

diferencia_1([],_,[]) :- !.
diferencia_1([X|Xs],L,[X|Res]) :- not(member(X,L)), diferencia_1(Xs,L,Res), !.
diferencia_1([_|Xs],L,Res) :- diferencia_1(Xs,L,Res), !.

diferencia_2([],_,[]) :- !.
diferencia_2([X|Xs],L,[X|Res]) :- not(member(X,L)), diferencia_2(Xs,L,Res), !.
diferencia_2([_|Xs],L,Res) :- diferencia_2(Xs,L,Res), !.

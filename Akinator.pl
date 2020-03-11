/* To run type go*/

go :- hypothesis(Character), 
       write('I guess the character is: '), 
       write(Character), nl, undo.

 /* hypotheses to be tested */ 
hypothesis(rachel)  :- rachel, !.
hypothesis(monica)  :- monica, !.
hypothesis(phebe)  :- phebe, !.
hypothesis(carol)  :- carol, !.
hypothesis(ross)  :- ross, !.
hypothesis(joey)  :- joey, !.
hypothesis(chandler)  :- chandler, !.
hypothesis(emma)  :- emma, !.
hypothesis(ben)  :- ben, !.

hypothesis(not_found).

/* Character identification rules */ 

rachel :- woman,
          parent,
          blond.

monica :- woman,
          married,
          brunet.

phebe :- woman,
         singer,
         parent,
         blond.

carol :- woman,
         parent,
         lesbian,
         blond.

suzan :- woman,
         parent,
         lesbian.

ross :- man,
       parent,
       professor,
       brunet.

joey :- man,
       actor,
       brunet.

chandler :- man,
       married,
       brunet.

ben :- kid,
      man,
      blond.

emma :- kid,
      woman,
      blond.


/* classification rules */ 

woman :- verify('a woman'), !.
man :- verify('a man'), !.
blond :- verify('blond').
brunet :- verify('brunet').
parent :- verify('parent').
married :- verify('married').
singer :- verify('a singer').
professor :- verify('a professor').
actor :- verify('an actor').
lesbian :- verify('a lesbian').
kid :- verify('a kid').

/* questions */ 
ask(Question) :-
  write('Is the character '),
  write(Question),
  write('? '),
  read(Answer),
  nl,
  ( (Answer == yes ; Answer == y)
    ->
    assert(yes(Question)) ;
    assert(no(Question)), fail).

:- dynamic yes/1, no/1.

/* verify */
verify(X) :-
  (yes(X) ->  true ;  (no(X)   ->  fail ;  ask(X))).

/* clean assertions */
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
/* To run type go*/

go :- hypothesis(Character), 
       write('I guess the character is: '), 
       write(Character), nl, undo.

 /* hypotheses to be tested */ 
hypothesis(rachel)  :- rachel, !.
hypothesis(monica)  :- monica, !.
hypothesis(phoebe)  :- phoebe, !.
hypothesis(carol)  :- carol, !.
hypothesis(suzan)  :- suzan, !.
hypothesis(ross)  :- ross, !.
hypothesis(joey)  :- joey, !.
hypothesis(chandler)  :- chandler, !.
hypothesis(emma)  :- emma, !.
hypothesis(ben)  :- ben, !.
hypothesis(janice) :- janice, !.

hypothesis(not_found).

/* Character identification rules */ 

rachel :- woman,
          parent,
          main,
          emmas_parent.

monica :- woman,
          married,
          main,
          brunet.

phoebe :- woman,
         singer,
         triplets,
         main,
         blond.

carol :- woman,
         parent,
         lesbian,
         blond.

suzan :- woman,
         lesbian,
         step_parent,
         carol_wife.

ross :- man,
       parent,
       professor,
       main,
       emmas_parent,
       brunet.

joey :- man,
       actor,
       main,
       brunet.

chandler :- man,
       married,
       main,
       brunet.

ben :- kid,
      boy,
      blond.

emma :- kid,
      girl,
      blond.

janice :- woman,
          dated,
          parent,
          married,
          brunet.


/* classification rules */ 

woman :- verify('a woman'), !.
man :- verify('a man'), !.
boy :- verify('a boy'), !.
girl :- verify('a girl'), !.
blond :- verify('blond').
brunet :- verify('brunet').
parent :- verify('parent').
married :- verify('married').
singer :- verify('a singer').
professor :- verify('a professor').
actor :- verify('an actor').
lesbian :- verify('a lesbian').
kid :- verify('a kid'), !.
dated :- verify('a person that dated someone of the 6 main characters at some point').
main :- verify('one of the 6 main characters').
emmas_parent :- verify('emmas parent').
triplets :- verify('a person that had triplets').
carol_wife :- verify('carols wife').
step_parent:- verify('step parent').

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
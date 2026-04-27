
%head formats: 
%cell(X,Y).         the cell (X,Y) belongs to the grid
%area(X,Y,A).       the cell (X,Y) belongs to area A
%number(X,Y,N).     the cell (X,Y) initially contains number N
%goal(A,G).         the goal number of area A is number G
%target(X,Y,XX,YY).  % the number in the cell (X,Y) is moved to the cell (XX,YY)

{target(X,Y,XX,YY) : area(XX,YY,A)} = 1 :- number(X,Y,N). 
%achieved: every number will get moved to an area
:-target(X,Y,XX,YY),number(X,Y,N),XX!=X,YY!=Y.
%achieved targets either must be in the the same 
%column as the number or the same row
#show target/4.
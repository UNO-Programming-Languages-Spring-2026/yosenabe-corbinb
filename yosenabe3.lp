
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
has_number(A) :- target(X,Y,XX,YY), area(XX,YY,A).
:- not has_number(A), area(XX,YY,A).
%achieved: every area must have at least one number
:-target(X1,Y1,XX,YY),target(X2,Y2,XX,YY),X1!=X2,Y1!=Y2.
%Two targets cannot end in the same cell
path(X,Y,NX,Y) :- target(X,Y,XX,Y), number(X,Y,N), cell(NX,Y), X <= NX, NX <= XX.
path(X,Y,NX,Y) :- target(X,Y,XX,Y), number(X,Y,N), cell(NX,Y), XX <= NX, NX <= X.
path(X,Y,X,NY) :- target(X,Y,X,YY), number(X,Y,N), cell(X,NY), Y <= NY, NY <= YY.
path(X,Y,X,NY) :- target(X,Y,X,YY), number(X,Y,N), cell(X,NY), YY <= NY, NY <= Y.
%generate all paths
%two numbers cannot cross when moving
#show target/4.
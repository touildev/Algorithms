Fonction calcul récursif d'un déterminant à l'aide de la formule de Laplace , TD1 
%A = [[1,2,3],[4,5,6],[7,8,9]]
A = [[1,-1,2],[0,2,4],[0,0,3]]
%tic()
function d = determinant(A)
  
  n = size(A,1)
  if (n==1)
    d=A;
  else
    d=0;
    for i = 1:n
     B = A; 
     B(i,:)= [];
     B(:,1) = [];
     d = d + A(i,1)*(-1)^(i+1) *determinant(B);
   end
 end
endfunction

tic
for n = 1:10
  A = rand(n,n)
  tic()
  d = det(A);
  toc()
end

On remarque que la fonction det de octave est plus rapide que notre fonction determinant qui est naïve, ils doivent utiliser une méthode encore plus rapide car ils ont dû bien optimiser leur programme.

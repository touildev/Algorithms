function [L,U] = mon_lu(A)
  n = size(A,1);
  L = eye(n);
  U = zeros(n);
  for i = 1:n-1
    L(i+1:n,i) = A(i+1:n,i)./A(i,i);
    U(i,i:n) = A(i,i:n);
    A(i+1:n,i+1:n) = A( i+1:n, i+1:n)  - L(i+1:n,i) * U(i,i+1:n) ;

endfor
  U(n,n) = A(n,n);

end
%comparison with octave function 
function  d = mon_det(A)
  [L,U] = mon_lu(A);
  d = prod(diag(U));
endfunction

for n=5:9
  A = rand(n,n)
  tic(); d = mon_det(A); toc();
  tic(); d = determinant(A); toc();
 endfor

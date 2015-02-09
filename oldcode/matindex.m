function [A]=matindex(N,M)
for n=1:N
      for m=1:N
         A(n,m)=(m-1)*N + n;
     end
end
%vectorized matrix index
% A = zeros(N);
% for j=1:N
%   A(:,j) = (1:N)+(j-1)*N;
% end

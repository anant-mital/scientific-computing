function A = normalize_cols(A,p)

narginchk(1, 2);

if nargin < 2
    p = 2;
end

sizeOfA = size(A);

if (isinf(p))
 
        
for i = 1:sizeOfA(2)
    x = A(:,i);
    pNorm = max(abs(x));
    A(:,i) = A(:,i)./pNorm;
end
    
    
else
    
for i = 1:sizeOfA(2)
    x = A(:,i);
    pNorm = power(sum(abs(x).^p),1/p);
    A(:,i) = A(:,i)./pNorm;
end

end

end
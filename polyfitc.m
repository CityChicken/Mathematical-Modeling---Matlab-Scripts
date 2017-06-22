function p=polyfitc(x,y,nvec)
%Simple 1D polynomial fitting with particular coefficients constrained to
%zero
%
%    p=polyfitc(x,y,nvec)
%
%in: 
%
%  nvec: A vector of integer exponents present in the polynomial.
%    x: x data
%    y: y data
%
%out:
%
%   p: vector of polynomial coefficients. Order of polynomial is max(nvec).
           A=bsxfun(@power,x(:),nvec(:).');
           [QQ,RR]=qr(A,0);
           coeffs = RR\( QQ'*y(:) );
            p=zeros(1,max(nvec)+1);
           p(nvec+1)=coeffs;
           p=p(end:-1:1);
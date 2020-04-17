function ind = getQuadTable(nclp, ndim)
% function: getQuadTable
% purpose:  returns a lookup table for integration nodes
%           in a fully tensorized Gauss quadrature grid. 
%
% usage: ind = getQuadTable(nclp, ndim)
%
% input:
%    nclp: number of samples per dimension
%    ndim: number of stochastic dimensions
%
% output:
%    ind: lookup table for integration nodes 
%            ind(m, i) is the ith-coordinate of the m-th realization.
%

nquad = nclp^ndim;

ind = zeros(nquad, ndim);

for i = 1 : ndim
   ind(1,i) = 1;
end

for m = 2 : nquad

   for i = 1 : ndim
      ind(m,i) = ind(m-1,i);
   end

   nflag = 0;

   ind(m,1) = ind(m,1) + 1;

   if(ind(m,1) > nclp) 
      nflag = 1;
      ind(m,1) = 1;

      for i = 2 : ndim
         if nflag > 0
            nflag = 0;
            ind(m,i) = ind(m,i)+1;

            if ind(m,i) > nclp
               ind(m,i) = 1;
               nflag = 1;
            end

         end
      end
   end
end

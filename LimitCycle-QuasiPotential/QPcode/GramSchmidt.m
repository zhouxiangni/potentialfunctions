function [v, flag] = GramSchmidt(v)
%% Stabilized Gram Schmidt method for orthonormalization
% Input is a matrix including k column vector k = 2,3,...
% Output is the same matrix but the vectors are replaced with orthonormal
% vectors
%
% Example: 
%
% consider two vectors v1=[3;1] , v2=[2;2]
% we first put them in a matrix as the vectors are set column-wise
% v = [3 2;1 2]
%
% A = GramSchmidt(v)
%
% A =
%     0.9487   -0.3162
%     0.3162    0.9487
%
% test to make sure it is correct
%
% dot(A(:,1),A(:,2))
%
% ans =
%     0
%
% -------------------------------------------------
% code by: Reza Ahmadzadeh (reza.ahmadzadeh@iit.it
% -------------------------------------------------

k = size(v,2);
assert(k>=2,'The input matrix must include more than one vector.');

tmp = 0;
for ii = 1:1:k
    tmp = norm(v(:,ii));
    if ( tmp < 1e-16) 
        disp('Error in GramSchmidt:  The input columns may be linear dependent.');
        ii
        flag = -1;
        return;
    end 
    v(:,ii) = v(:,ii) / tmp;
    for jj = ii+1:1:k
        v(:,jj) = v(:,jj) - proj(v(:,ii),v(:,jj));
    end
end

flag =1;

    function w = proj(u,v)
        % This function projects vector v on vector u
        w = (dot(v,u) / dot(u,u)) * u;
    end

end
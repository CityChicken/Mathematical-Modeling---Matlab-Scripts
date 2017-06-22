function [Lane1, Lane2, Lane3, Lane4] = CarSort(A)
[vals index] = sort(A(3,:), 'descend');
A = A(:,index);
Lane1 = A(1,find(A(2,:)==1));
Lane2 = A(1,find(A(2,:)==2));
Lane3 = A(1,find(A(2,:)==3));
Lane4 = A(1,find(A(2,:)==4));
end

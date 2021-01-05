
% Objective function is to minimize the sum of the norms 
%of all intermediate points

function f= objective_function(A,B,x)
x= [A;x;B];
F= zeros();
for i = 1: length(x)-1
    
    F(i)= norm(x(i+1,:) - x(i,:));
    
end

f= sum(F);

end
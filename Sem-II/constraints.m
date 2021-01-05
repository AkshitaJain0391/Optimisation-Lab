%% Include the constraint of problem - intermediate point should
%% either lie outside or on the tangent of circle 
%%(must not be inside the circle) - implies distance between point and
%%center of circle should be greater than or equal to zero

function [g h] = constraints(A,B,x,C,r,num_c)

x= [A;x;B];
g= zeros();
num_c=num_c(1); 

%% loop for checking minimum distance between circles and intermediate points
for k=1:num_c %loop for number of circles
    for i=1:(length(x)-1) %loop for number of intermediate points

    m=mindis(x(i,:),x(i+1,:),C(k,:)); % Calculation of minimum distance between a circle and a point
    g(k,i) = r - m;    
    end 
end

h=[];
end




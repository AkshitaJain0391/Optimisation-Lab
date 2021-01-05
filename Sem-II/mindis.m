%% Calculation of minimum distance 
%% M is the 
function m=mindis(a,b,C)
l=200;
for k=0:l
 %Discretisation method fundamental: 
 %To sample n equidistant points between final and initial point.
 M=a+(k/l)*(b-a);
 d(k+1)=norm(M-C);
end
 m=min(d);
end
  
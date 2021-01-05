clear all
clc
close all
%% Initialisation of variables
C=[2,8; 3,6; 7,4.5; 7.5,2.5]; %Coordinates of circles
r=0.6;        %radii of the circles
A=[1,9];    %Initial point A
B= [9,1];   %Final point B

%% Randomly generation within specific range : intermediate points
sprev = rng(0,'twister');
start_p=1.1;
end_p=8.9;
x=(end_p-start_p).*rand(7,2)+start_p

%% bounds with walls
lb=[0,0;0,0;0,0;4,4;6,4;6,0;6,0];  %lower band for each intermeadite point
ub=[4,10;4,10;4,10;4,6;6,6;10,10;10,10]; %upper band for each intermeadite point

n=length(x); % Number of segments
num_c=size(C); %number of circles;

%% Plotting Non-optimal value
C_old=C; %Coordinates of circles
x_old=x;  %Intermediate points

options=optimset('Display','iter',...
    'TolX',1.E-6,...
    'Tolfun', 1.E-6,...
    'MaxIter', 200,...
    'MaxFunEvals',2000);
x=fmincon(@(x)objective_function(A,B,x),x,[],[],[],[],lb,ub,@(x)constraints(A,B,x,C,r,num_c), options);

x= [A;x;B];
x_old=[A;x_old;B];

%% plotting the enviroment, previous and actual path
rec_1=rectangle('Position',[4 6 2 4])
rec_2=rectangle('Position',[4 0 2 4])
rec_1.FaceColor = [1 0 1];
rec_2.FaceColor = [1 0 1];
hold on
viscircles(C,[r r r r])
hold on;
xlim([0,10]);
ylim([0,10]);
grid on
plot(x(:,1)',x(:,2)','LineWidth',2)
for i=1:length(x)
    text(x(i,1)',x(i,2)',num2str(i),'FontSize',12)
end
hold on 
plot(x_old(:,1)',x_old(:,2)',':','LineWidth',1.5) 
for i=1:length(x)
    text(x_old(i,1)',x_old(i,2)',num2str(i),'FontSize',12)
end
legend ({'Optimal path', 'Non-optimal path'},'FontSize',10)


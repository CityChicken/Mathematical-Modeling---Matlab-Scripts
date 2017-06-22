%% Initialize everything
clear all
%% Initialize Values
numLanes = 4;  
N = 80; 
%% Initialize freeway lanes
Freeway = zeros(numLanes,N);
Freeway(1,:) = 1;
Freeway(2,:) = 2;
Freeway(3,:) = 3;
Freeway(4,:) = 4;

%% Initialize Cars
CarGrid = zeros(numLanes,N);

numCar=1;
car=[];
for i=1:N
    for j=1:numLanes
        if(rand<.15) % increase for more initial cars
            car=[car, carClass];
            car(numCar)=car(numCar).init(numCar,i,j,j,1,10,1,1);
           CarGrid(car(numCar).y,car(numCar).x) = 1;
           numCar=numCar+1;
        end
    end
end
%%
numCar = length(car);
X=1:N;
maxIter=100;

LocArray = [car(:).idx; car(:).y;  car(:).x]
[Lane1 Lane2 Lane3 Lane4] = CarSort(LocArray);
L(1) = length(Lane1 ~=0);
L(2) = length(Lane2 ~=0);
L(3) = length(Lane3 ~=0);
L(4) = length(Lane4 ~=0);
A{1} = Lane1(1:end)
A{2} = Lane2(1:end)
A{3} = Lane3(1:end)
A{4} = Lane4(1:end)


for i = 1:4
    if L(i)~=0;
        Space{i}(1)= 0;
        Space{i}(2:length(A{i})) = LocArray(3,A{i}(1:end-1))-  LocArray(3,A{i}(2:end));
    end
end
disp(Space{1})

for i = 1:4
    if L(i) ~= 0;
        for j = 1:L(i)
            [lp, rp] = PerimeterCheck(LocArray,A,i,j);
            car(A{i}(j)).updateP(lp,rp);
            car(A{i}(j)).updateLane;
        end
    end
end


[val index] = sort([car(:).x] , 'descend')

for i = 1:length(index)
    car(A(1,index(i))).setIdx(index(i))
end
 
% for T=2:maxIter
%     for k = 1:numCar
%         CarGrid(car(k).y,car(k).x,T) = CarGrid(car(k).y,car(k).x,T-1)-1;
%         % need to include a neighbor check. If there's a neighbor, modify
%         % the random variable accordingly.
%         rand_val = rand;
%         car(k)=car(k).updateLoc(rand_val );
%         CarGrid(car(k).y,car(k).x,T) = 1;        
%     end
%     gscatter([car(:).x],[car(:).y],[car(:).group])
%     pause(1)
%     shg
%     % plot stuff (move this to a function to speed up the simulation)
% end
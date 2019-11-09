function f = Vote(n, c)
if nargin == 0;
    voters = 100;
    candidates = 5;
else
    voters = n;
    candidates = c ;
end

rank = zeros(candidates,voters);
votes = zeros(candidates,voters);
list = 1:candidates;
for i = 1:voters
    pref = rand(1,candidates);
    for j = 1:candidates
        pref(j) = pref(j)+ (1-pref(j))*(0.4*j/candidates);
    end
    [s index] = sort(pref);
    rank(:,i) = list(index)';
    [d index] = max(rank(:,i));
    votes(index,i) = 1;
end
rank;
votes;
dist = zeros(1,candidates);
for i = 1:candidates
    dist(i) = sum(votes(i,:))/voters;
    happ(i) = sum(rank(i,:));
end


dist
happ

%include bandwaggoning 
%if next best option has twice the number of votes, change vote to this
%option
for i = 1:voters
    runnerup = find(rank(:,i)== candidates-1);
    selected = find(rank(:,i)== candidates);
   if dist(runnerup) > 1.1* dist(selected)
        votes(:,i) = zeros(candidates,1);
        votes(runnerup,i) = 1;
   else
   end
end

for i = 1:candidates
    dist(i) = sum(votes(i,:))/voters;
end
dist

%include vote against (lesser of two evils)
%if digust for current winner is > than runner up, and runner up is within
%striking distance (and preferential candidate is not) change vote.

[s index] = sort(dist, 'descend');
mlist = list(index);
M = [mlist' s']

gap = M(1,2) - M(2,2);
for i = 1:voters
    least = find(rank(:,i) == 1);
    least2 = find(rank(:,i) == 2);
    cwinner = M(1,1);
    crunner = M(2,1);
    if cwinner == least || cwinner == least2
        if crunner ~= least
            votes(:,i) = zeros(candidates,1);
            votes(crunner,i) = 1;
        end
    elseif crunner == least || crunner == least2
        if cwinner ~= least
            votes(:,i) = zeros(candidates,1);
            votes(cwinner,i) = 1;
        end
    else
    end
end

for i = 1:candidates
    dist(i) = sum(votes(i,:))/voters;
end
dist




    
    

rand(1,5);

function [lp, rp, lv, rv] = PerimeterCheck(Array,A,i,j)
d = 1;  
if i == 1
    rp = 1;
    if isempty(find(Array(3,A{i+1}) < Array(3,A{i}(j))+ d & Array(3,A{i+1}) > Array(3,A{i}(j)) - d))== 1
        lp = 0;
    else
        lp = 1;
    end
        
    %%
    if mean(Array(4, find(Array(3,A{i+1}) >= Array(3,A{i}(j))))) > mean(Array(4, find(Array(3,A{i}) >= Array(3,A{i}(j))))) 
        lv = 0;
    else
        lv = 1;
    end   
elseif i == 4
    lp = 1;  
     if isempty(find(Array(3,A{i-1}) < Array(3,A{i}(j))+ d & Array(3,A{i-1}) > Array(3,A{i}(j))- d))== 1
        rp = 0;
     else
        rp = 1;
        
     end
     %%
     if mean(Array(4, find(Array(3,A{i-1}) >= Array(3,A{i}(j))))) > mean(Array(4, find(Array(3,A{i}) >= Array(3,A{i}(j))))) 
        rv = 0;
    else
        rv = 1;
     end   
else
       if isempty(find(Array(3,A{i+1}) < Array(3,A{i}(j))+ d & Array(3,A{i+1}) >  Array(3,A{i}(j)) - d))== 1
        rp = 0;
       else
        rp = 1;
       end
       
       if isempty(find(Array(3,A{i-1}) < Array(3,A{i}(j))+ d & Array(3,A{i-1}) > Array(3,A{i}(j)) -d))== 1
            lp = 0;
       else
            lp = 1;
       end  
       
       
        if mean(Array(4, find(Array(3,A{i-1}) >= Array(3,A{i}(j))))) > mean(Array(4, find(Array(3,A{i}) >= Array(3,A{i}(j))))) 
            rv = 0;
        else
            rv = 1;
        end
        
        if mean(Array(4, find(Array(3,A{i+1}) >= Array(3,A{i}(j))))) > mean(Array(4, find(Array(3,A{i}) >= Array(3,A{i}(j))))) 
            lv = 0;
        else
            lv = 1;
        end 
end
end


classdef carClass
    properties
        idx;
        x;
        y;
        lane;
        group;
        Sd;
        Va;
        lp;
        rp;
    end
    methods
        function obj=init(obj,idx,x,y,lane,Sd,Va,lp,rp)
            obj.idx = idx;
            obj.x= x;
            obj.y= y;
            obj.lane = lane;
            obj.group = lane;
            obj.Sd = Sd;
            obj.Va = Va;
            obj.lp = lp;
            obj.rp = rp;
        end
        function obj = setLane(obj,newLane)
           obj.lane = newLane;
        end
        function obj = setIdx(obj,I)
            obj.idx = I;
        end
        function obj = laneRight(obj)
            obj.y = obj.y-1;
        end
        function obj = laneLeft(obj)
            obj.y = obj.y+1;
        end
        function obj = travel(obj,v)
            obj.x = mod(obj.x + v, 10000) ;
        end
        
        function obj = updateP(obj,lp,rp)
            obj.lp = lp;
            obj.rp = rp;   
        end
        
        function obj = updateLane(obj)
            rand_val = rand;
            if rand_val < .10 && obj.lp == 0
                if obj.y < 4
                    obj.laneLeft
                end 
            elseif rand_val > 0.95 && obj.rp == 0
                if obj.y >1
                    obj.laneRight
                end                
            else
            end
        end
        
    end
end
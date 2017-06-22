
AW = 0; T = 0; ltot = 0;
while(T<10000)
    x = 0; d = 1; l = 0; k = 1; i = 1;
    while( x == 0)
        l = l + 1;
        y = rand(1);
        if(y< 1/6)
            if(d==1)
                AW = AW + 1;
            end    
            x = 1; T = T + 1;
        else
            if(i==k)
                d = mod(d+1,2); k = k+1; i = 1;
            else
                 i = i+1;
            end
        end
    end
    ltot = ltot + l;
end
lavg = ltot / T
PA = AW / T
                    
    
    
    

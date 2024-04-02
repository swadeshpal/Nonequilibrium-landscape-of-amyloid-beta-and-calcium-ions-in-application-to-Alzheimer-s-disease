function X = sol_deterministic(X0,a1,a2,alpha,k1,epsilon,b1,b2,k2,dt,NI)
    
    x = X0(1);
    y = X0(2);

    EQ1 = @(xs,ys) a1+a2*ys^2/(ys^2+alpha^2)-k1*xs; 
    EQ2 = @(xs,ys) (b1+b2*xs-k2*ys)/epsilon;
   
    iter = 1;
    X(1,iter) = x;
    X(2,iter) = y;
%     
    for iter=1:NI
        iter = iter+1;
        h11=dt*EQ1(x,y);
        h21=dt*EQ2(x,y);
        
        h12=dt*EQ1(x+h11/2,y+h21/2);
        h22=dt*EQ2(x+h11/2,y+h21/2);
        
        h13=dt*EQ1(x+h12/2,y+h22/2);
        h23=dt*EQ2(x+h12/2,y+h22/2);
        
        h14=dt*EQ1(x+h13,y+h23);
        h24=dt*EQ2(x+h13,y+h23);
        
        tx=x+(h11+2*h12+2*h13+h14)/6;
        ty=y+(h21+2*h22+2*h23+h24)/6;
         
        x=tx;
        y=ty;
        
        X(1,iter) = x;
        X(2,iter) = y;
    end

%     while(lc>Lc)
%         iter = iter+1;
%         h11=dt*EQ1(x,y);
%         h21=dt*EQ2(x,y);
%         
%         h12=dt*EQ1(x+h11/2,y+h21/2);
%         h22=dt*EQ2(x+h11/2,y+h21/2);
%         
%         h13=dt*EQ1(x+h12/2,y+h22/2);
%         h23=dt*EQ2(x+h12/2,y+h22/2);
%         
%         h14=dt*EQ1(x+h13,y+h23);
%         h24=dt*EQ2(x+h13,y+h23);
%         
%         tx=x+(h11+2*h12+2*h13+h14)/6;
%         ty=y+(h21+2*h22+2*h23+h24)/6;
%         
%         lc = tz;  
%         x=tx;
%         y=ty;
%         X(1,iter) = x;
%         X(2,iter) = y;
%         if lc<Lc
%             break
%         end
%     end

%     

end


function X = sol_stochastic(X0,a1,a2,alpha,k1,epsilon,b1,b2,k2,dt,NI,sigma1,sigma2)
    
    x = X0(1);
    y = X0(2);

    EQ1 = @(xs,ys) a1+a2*ys^2/(ys^2+alpha^2)-k1*xs; 
    EQ2 = @(xs,ys) (b1+b2*xs-k2*ys)/epsilon;
   
    pd = makedist('Normal',0,sqrt(dt));
    
    iter = 1;
    X(1,iter) = x;
    X(2,iter) = y;
%     
    for n=1:NI
        dw1 = random(pd);
        dw2 = random(pd);
        
        tx = x + dt*EQ1(x,y) + sigma1*dw1;
        ty = y + dt*EQ2(x,y) + sigma2*dw2/sqrt(epsilon);
        
        x=tx;
        y=ty;
        if mod(n,2000) == 0
            iter = iter+1;
            X(1,iter) = x;
            X(2,iter) = y;
        end
    end


end


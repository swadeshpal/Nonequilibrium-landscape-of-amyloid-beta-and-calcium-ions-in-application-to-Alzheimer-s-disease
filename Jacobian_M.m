function Jac = Jacobian_M(a2,alpha,k1,epsilon,b2,k2,rhou,rhov,ADJ,uv_s)
    N_node = length(uv_s)/2;
    Jac = zeros(2*N_node,2*N_node);
    for j=1:N_node
        us(j) = uv_s(j);
        vs(j) = uv_s(j+N_node);
    end
    
    for j=1:N_node
        for k=1:N_node
            if j==k
                Jac(j,k) = -rhou*ADJ(j,k)-k1;
            else
                Jac(j,k) = -rhou*ADJ(j,k);
            end
        end
        Jac(j,N_node+j) = 2*a2*alpha^2*vs(j)/(vs(j)^2+alpha^2)^2;
    end
    for j=N_node+1:2*N_node
        for k=N_node+1:2*N_node
            if j==k
                Jac(j,k) = (-rhov*ADJ(j-N_node,k-N_node)-k2)/epsilon;
            else
                Jac(j,k) = (-rhov*ADJ(j-N_node,k-N_node))/epsilon;
            end
        end
        Jac(j,j-N_node) = b2/epsilon;
    end
end
function [FNT]=findnodetree(nodej,W,x_position,y_position,z_position)
    no_nodes=length(x_position);
    FNT=[];
    NodeT1=[];
    for nodet1=1:no_nodes
        if W(nodej,nodet1)~=0 && nodej~=nodet1
            NodeT1=[NodeT1 nodet1];
        end
    end
    Ch1=isempty(NodeT1);
    if Ch1~=1
        for nt=1:length(NodeT1)
            Dis(nt)=(x_position(nodej)-x_position(NodeT1(nt)))^2+(y_position(nodej)-y_position(NodeT1(nt)))^2+ ...
             (z_position(nodej)-z_position(NodeT1(nt)))^2;
        end
        [out1,idx1] = sort(Dis);
        for nt1=1:length(idx1)
            NodeS1(nt1)=NodeT1(idx1(nt1));
        end
        nout=out1;
        FNT=NodeS1;
    end
    if isempty(FNT)==1
        FNT=[0];
    end
    
end
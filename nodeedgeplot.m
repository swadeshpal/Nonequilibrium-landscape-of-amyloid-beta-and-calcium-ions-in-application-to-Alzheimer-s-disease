function []=nodeedgeplot(Connections,Centers,Property,MX,MN,NO)

x=Connections(:,1); y=Connections(:,2); 
C=Centers;
axis tight; hold on; axis equal ; %view(-92,-2); grid; %light
X(1,:)=C(x(:),1); X(2,:)=C(y(:),1); Y(1,:)=C(x(:),2); Y(2,:)=C(y(:),2); Z(1,:)=C(x(:),3); Z(2,:)=C(y(:),3);
plot3(X,Y,Z,'LineWidth',0.05,'Color',[0 0 0 0.2]);

NODC=length(Property);
MCN=flipud(cool(NODC+30));
MC=MCN(1:NODC,:);
CB=linspace(MN,MX,NODC);
for mm=2:NODC
    for nnn=1:NODC
        if Property(nnn)<=CB(mm) && Property(nnn)>=CB(mm-1)
            PoreColor(nnn,1)=MC(mm,1);
            PoreColor(nnn,2)=MC(mm,2);
            PoreColor(nnn,3)=MC(mm,3);
        end
    end
end
for nnn=1:size(Property)
    [xx,yy,zz]=sphere;
    rr=1+3*Property(nnn)/(MX-MN);
    hSurface=surf(rr*xx+C(nnn,1),rr*yy+C(nnn,2),rr*zz+C(nnn,3));   
    hold on
    set(hSurface,'FaceColor',PoreColor(nnn,:),'EdgeColor','none','FaceLighting','gouraud','facealpha',0.3);
    if NO == 1
        view(88,90);
    end
    if NO == 2
        view(87,2);
    end
    text(C(nnn,1),C(nnn,2),C(nnn,3), ['' num2str(nnn)],'HorizontalAlignment','center','FontSize', 3.5)
    axis off
end
camlight
hold off
end
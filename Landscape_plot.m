function [] = Landscape_plot(U,xp,yp,node)
    pcolor(xp,yp,U); colormap("jet"); 
    % colorbar; 
    shading interp; axis tight
    hold on
    plot(1.428168395, 0.3076336791, '-o', 'Color', 'm', 'MarkerSize', 3, 'MarkerFaceColor', 'm')
    plot(2.751686177, 0.5723372353, '-o', 'Color', 'r', 'MarkerSize' ,3, 'MarkerFaceColor', 'r')
    plot(4.571573999, 0.9363147999, '-o', 'Color', 'm', 'MarkerSize' ,3, 'MarkerFaceColor', 'm')
    xlabel('$A\beta$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 10)
    ylabel('$Ca^{2+}$', 'Interpreter', 'latex', 'fontweight', 'Bold', 'FontSize', 10)
    axis([min(xp(1,:)) max(xp(1,:)) min(yp(:,1)) max(yp(:,1))])
    % savetitle = ['node ', num2str(node)];
    % title(savetitle, 'FontSize', 10)
    % % view(40, 80)
    % hold on
    caxis([0 100]);
    % pause(0.0001)
end
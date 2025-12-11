function pendulo=plotPendulo(x_vet,fig)
l=20;
x=x_vet(1);
theta=-x_vet(3);
clf(fig)
pendulo.rect1=rectangle('Position',[-6+x 0 2 2],'Curvature',[1 1],'FaceColor',[0 0 0]);
pendulo.rect2=rectangle('Position',[4+x 0 2 2],'Curvature',[1 1],'FaceColor',[0 0 0]);
pendulo.rect3=rectangle('Position',[-6+x 2 12 5],'FaceColor',[0.1 0.5 1]);
pendulo.l1=line([x x+l*sin(theta)],[7 7+l*cos(theta)],'LineWidth',5,'Color',[1 0 0]);
r=1;
xc=x+l*sin(theta);
yc=7+l*cos(theta);
d = r*2;
px = xc-r;
py = yc-r;
pendulo.ball=rectangle('Position',[px py d d],'Curvature',[1,1],'FaceColor',[1 0 0]);
axis equal
axis([-50 50 -1 30])
drawnow
end
clc, clear all, close all;
m = 0.429;
Ix = 0.002237568;
Iy = 0.002985236;
Iz = 0.00480374;
g = 9.81;

in.time = [0,0.2,10];
in.signals(1).values = [m*g, 0.1, 0, 0;m*g, -0.1, 0, 0; 0,0,0,0];
in.signals(1).dimensions = 4;

x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

[t,x,y] = sim('honors_drone',10,[], in); 
figure(1),clf;
time = 1:size(t,1);
ax = axes('XLim',[-6 6],'YLim',[-6 6],'ZLim',[-100 100]);
ang = 0:0.01:2*pi;
r = 0.25;
h(1) = line([0 1/2],[0 1/2],[0 0]);
h(2) = line([0 -1/2],[0 1/2], [0 0]);
h(3) = line([0 1/2], [0 -1/2], [0 0]);
h(4) = line([0 -1/2], [0 -1/2], [0 0]);
h(5) = line('xData', 1/2 + r*cos(ang), 'yData', 1/2 + r*sin(ang), 'zData', ang*0);
h(6) = line('xData', -1/2 + r*cos(ang), 'yData', 1/2 + r*sin(ang), 'zData', ang*0);
h(7) = line('xData', 1/2 + r*cos(ang), 'yData', -1/2 + r*sin(ang), 'zData', ang*0);
h(8) = line('xData', -1/2 + r*cos(ang), 'yData', -1/2 + r*sin(ang), 'zData', ang*0);
p = hgtransform('Parent', ax);
set(h, 'Parent', p);
view(3);
%drawquad(y(1,1),y(1,2),y(1,3), y(1,7), y(1,8), y(1,9), p);
%drawquad(0,0,0,1,0,0,p);
drawquad(y(1,1), y(1,2), -y(1,3), y(1,7), y(1,8), y(1,9), p);
pause(t(2));
for i = 2:size(t,1)
    drawquad(y(i,1), y(i,2), -y(i,3), y(i,7), y(i,8), y(i,9), p);
    pause(t(i)-t(i-1))
end
xlabel('x');
ylabel('y');
zlabel('z');

function drawquad(x,y,z,phi,theta,psi, p)
Mov = makehgtform('translate', x,y,z);
rx = makehgtform('xrotate', phi);
ry = makehgtform('yrotate', theta);
rz = makehgtform('zrotate', psi);
set(p, 'Matrix', Mov*rx*ry*rz);
drawnow
end


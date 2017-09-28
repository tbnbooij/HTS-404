%%%%%%%%%%%%%%%%%%%%%%%%%
% Homework assignment 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%

% Close all opened windows
clc, close all;

% Predefined constants
m = 0.429;
Ix = 0.002237568;
Iy = 0.002985236;
Iz = 0.00480374;
g = 9.81;

% The time the model has run
running_time = 10;

% The model is NOT time dependent
in.time = [0];
% These are the input values; u = [T, tau_x, tau_y, tau_z]
in.signals(1).values = [m*g, 0, 0, 0];
% There are FOUR input values = # dimensions
in.signals(1).dimensions = 4;

x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

% Initialization of the simulation 
[t,x,y] = sim('honors_drone',running_time,[], in); 

% Create a figure window and clear its current contents
figure('Name', 'Drone Simulation', 'NumberTitle', 'off'),clf;
time = 1:size(t,1);
% Set axis limits
ax = axes('XLim',[-6 6],'YLim',[-6 6],'ZLim',[-100 100]);
% Set viewpoint to default 3D viewpoint
view(3);
% Set axis labels
xlabel('x');
ylabel('y');
zlabel('z');

% Description of the quadcopter in the plot
% Radius of circles
r = 0.25;  
% Vector with angles between 0 and 2pi
ang = 0:0.01:2*pi;
% Length of axes
len = 0.5;
% Description of axes
h(1) = line([0 len],[0 len],[0 0]);
h(2) = line([0 -len],[0 len], [0 0]);
h(3) = line([0 len], [0 -len], [0 0]);
h(4) = line([0 -len], [0 -len], [0 0]);
% Description of circles
h(5) = line('xData', len + r*cos(ang), 'yData', len + r*sin(ang), 'zData', ang*0);
h(6) = line('xData', -len + r*cos(ang), 'yData', len + r*sin(ang), 'zData', ang*0);
h(7) = line('xData', len + r*cos(ang), 'yData', -len + r*sin(ang), 'zData', ang*0);
h(8) = line('xData', -len + r*cos(ang), 'yData', -len + r*sin(ang), 'zData', ang*0);
% Create front line
h(9) = line([len -len],[-len -len],[0 0]);
% Store this quadcopter in the object 'p'
% 'p' can be transformed with respect to the defined axes
p = hgtransform('Parent', ax);
set(h, 'Parent', p);

% Main loop
for i = 1:size(t,1)
    % Draw the current state of the quadcopter
    drawquad(y(i,1), y(i,2), -y(i,3), y(i,7), y(i,8), y(i,9), p);
    % Wait a timestep
    refreshdata
end

% Show the plots
showData(x,t);

% Draw the quadcopter in the figure according to the current state.
function drawquad(x,y,z,phi,theta,psi, p)
    Mov = makehgtform('translate', x, y, z);
    rx = makehgtform('xrotate', phi);
    ry = makehgtform('yrotate', theta);
    rz = makehgtform('zrotate', psi);
    set(p, 'Matrix', Mov*rx*ry*rz);
    drawnow
end




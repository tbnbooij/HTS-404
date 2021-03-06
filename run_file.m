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

% The timespan the model has to run
running_time = 10;

% At t = 0; we add the following inputs
in.time = [0];
% These are the input values; u = [T, tau_x, tau_y, tau_z]
in.signals(1).values = [m*g,0,0,0];
% There are FOUR input values = # dimensions
in.signals(1).dimensions = 4;

x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

% Initialization of the simulation
% NOTE: In order to run one of the other simulations,
% uncomment one of the lines below and comment out the initial
% simulation (the line beneath this comment)
[t,x,y] = sim('honors_drone',running_time,[],in);

% [t,x,y] = sim('honors_drone_4a',running_time,[]);
% [t,x,y] = sim('honors_drone_4b',running_time,[]);
% [t,x,y] = sim('honors_drone_4c',running_time,[]);
% [t,x,y] = sim('honors_drone_4d',running_time,[]);


% Create a figure window and clear its current contents
figure('Name', 'Drone Simulation', 'NumberTitle', 'off', 'units','normalized','outerposition',[0 0 1 1]),clf;
time = 1:size(t,1);
% Set axis limits
ax = axes('XLim',[-6 6],'YLim',[-6 6],'ZLim',[-6 6]);
% Set viewpoint to convention
view(52.5, 30+180);
ax.CameraUpVector = [0 0 -1];
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
h(1) = line([-len len],[-len len],[0 0]);
h(2) = line([-len len],[len -len], [0 0]);
% Description of circles
h(3) = line('xData', len + r*cos(ang), 'yData', len + r*sin(ang), 'zData', ang*0);
h(4) = line('xData', -len + r*cos(ang), 'yData', len + r*sin(ang), 'zData', ang*0);
h(5) = line('xData', len + r*cos(ang), 'yData', -len + r*sin(ang), 'zData', ang*0);
h(6) = line('xData', -len + r*cos(ang), 'yData', -len + r*sin(ang), 'zData', ang*0);
% Create front line
h(7) = line([len len],[-len len],[0 0]);
% Store this quadcopter in the object 'p'
% 'p' can be transformed with respect to the defined axes
p = hgtransform('Parent', ax);
set(h, 'Parent', p);
grid on

% Video Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Please keep these lines commented out   %
% They generate a video of the simulation %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% myVideo = VideoWriter('4d.avi');
% myVideo.Quality = 100;
% myVideo.FrameRate = 25;
% open(myVideo);


% Main loop
for i = 1:size(t,1)
    % Draw the current state of the quadcopter
    drawquad(y(i,1), y(i,2), y(i,3), y(i,7), y(i,8), y(i,9), p);
    % Wait a timestep
    refreshdata
    % Update title of plot
    title(strcat(strcat('Quadcopter Simulation (', num2str(t(i))),' sec)'));
    % Add frame to video
    % writeVideo(myVideo, getframe);
end

% close(myVideo);

% Show the plots
showData(x,t);
showInput(input);

% Draw the quadcopter in the figure according to the current state.
function drawquad(x,y,z,phi,theta,psi, p)
Mov = makehgtform('translate', x, y, z);
rx = makehgtform('xrotate', phi);
ry = makehgtform('yrotate', theta);
rz = makehgtform('zrotate', psi);
set(p, 'Matrix', Mov*rx*ry*rz);
drawnow
end



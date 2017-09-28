function showData(x,t)
    x_pos = x(:,1);
    y_pos = x(:,2);
    z_pos = x(:,3);
    Vx = x(:,4);
    Vy = x(:,5);
    Vz = x(:,6);
    phi = x(:,7);
    theta = x(:,8);
    psi = x(:,9);
    p_rot = x(:,10);
    q_rot = x(:,11);
    r_rot = x(:,12);
    % Create a figure window
    figure('Name', 'State over Time', 'NumberTitle', 'off')

    
    % X, Y, Z
    subplot(3,4,1);
    plot(t,x_pos);
    xlabel('t (s)');
    ylabel('X (m)');
    title('X');
    
    subplot(3,4,5);
    plot(t,y_pos);
    xlabel('t (s)');
    ylabel('Y (m)');
    title('Y');

    subplot(3,4,9);
    plot(t,z_pos);
    xlabel('t (s)');
    ylabel('Z (m)');
    title('Z');
    
    % Vx, Vy, Vz
    subplot(3,4,2);
    plot(t,Vx);
    xlabel('t (s)');
    ylabel('V_x (m/s)');
    title('V_x');
    
    
    subplot(3,4,6);
    plot(t,Vy);
    xlabel('t (s)');
    ylabel('V_y (m/s)');
    title('V_y');
    
    subplot(3,4,10);
    plot(t,Vz);
    xlabel('t (s)');
    ylabel('V_z (m/s)');
    title('V_z');
    
    % Phi, Theta, Psi
    subplot(3,4,3);
    plot(t,phi);
    xlabel('t (s)');
    ylabel('\phi (rad)');
    title('Roll');
    
    subplot(3,4,7);
    plot(t,theta);
    xlabel('t (s)');
    ylabel('\theta (rad)');
    title('Pitch');
    
    subplot(3,4,11);
    plot(t,psi);
    xlabel('t (s)');
    ylabel('\psi (rad)');
    title('Yaw');
    
    % P, Q, R
    subplot(3,4,4);
    plot(t,p_rot);
    xlabel('t (s)');
    ylabel('P (rad/s)');
    title('P');
    
    subplot(3,4,8);
    plot(t,q_rot);
    xlabel('t (s)');
    ylabel('Q (rad/s)');
    title('Q');
    
    subplot(3,4,12);
    plot(t,r_rot);
    xlabel('t (s)');
    ylabel('R (rad/s)');
    title('R');

end


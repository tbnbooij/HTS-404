function showData(x,t)
    x_pos = x(:,1);
    y_pos = x(:,2);
<<<<<<< HEAD
    z_pos = x(:,3);
    Vx = x(:,4);
    Vy = x(:,5);
    Vz = x(:,6);
=======
    z_pos = -x(:,3);
    Vx = x(:,4);
    Vy = x(:,5);
    Vz = -x(:,6);
>>>>>>> af40115ed9981ac54e47acd55d4d616faf580010
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
    xlabel('t');
    ylabel('X');
    title('X');
    
    subplot(3,4,5);
    plot(t,y_pos);
    xlabel('t');
    ylabel('Y');
    title('Y');

    subplot(3,4,9);
    plot(t,z_pos);
    xlabel('t');
    ylabel('Z');
    title('Z');
    
    % Vx, Vy, Vz
    subplot(3,4,2);
    plot(t,Vx);
    xlabel('t');
    ylabel('V_x');
    title('V_x');
    
    
    subplot(3,4,6);
    plot(t,Vy);
    xlabel('t');
    ylabel('V_y');
    title('V_y');
    
    subplot(3,4,10);
    plot(t,Vz);
    xlabel('t');
    ylabel('V_z');
    title('V_z');
    
    % Phi, Theta, Psi
    subplot(3,4,3);
    plot(t,phi);
    xlabel('t');
    ylabel('\phi');
    title('\phi');
    
    subplot(3,4,7);
    plot(t,theta);
    xlabel('t');
    ylabel('\theta');
    title('\theta');
    
    subplot(3,4,11);
    plot(t,psi);
    xlabel('t');
    ylabel('\psi');
    title('\psi');
    
    % P, Q, R
    subplot(3,4,4);
    plot(t,p_rot);
    xlabel('t');
    ylabel('P');
    title('P');
    
    subplot(3,4,8);
    plot(t,q_rot);
    xlabel('t');
    ylabel('Q');
    title('Q');
    
    subplot(3,4,12);
    plot(t,r_rot);
    xlabel('t');
    ylabel('R');
    title('R');

end


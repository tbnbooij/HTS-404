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
    figure('Name', 'State over time', 'NumberTitle', 'off')
    
    % X, Y, Z
    subplot(3,4,1);
    plot(t,x_pos);
    xlabel('Time');
    ylabel('X');
    title('X');
    
    subplot(3,4,5);
    plot(t,y_pos);
    xlabel('Time');
    ylabel('Y');
    title('Y');

    subplot(3,4,9);
    plot(t,z_pos);
    xlabel('Time');
    ylabel('Z');
    title('Z');
    
    % Vx, Vy, Vz
    subplot(3,4,2);
    plot(t,Vx);
    xlabel('Time');
    ylabel('V_x');
    title('V_x');
    
    
    subplot(3,4,6);
    plot(t,Vy);
    xlabel('Time');
    ylabel('V_y');
    title('V_y');
    
    subplot(3,4,10);
    plot(t,Vz);
    xlabel('Time');
    ylabel('V_z');
    title('V_z');
    
    % Phi, Theta, Psi
    subplot(3,4,3);
    plot(t,phi);
    xlabel('Time');
    ylabel('\phi');
    title('\phi');
    
    subplot(3,4,7);
    plot(t,theta);
    xlabel('Time');
    ylabel('\theta');
    title('\theta');
    
    subplot(3,4,11);
    plot(t,psi);
    xlabel('Time');
    ylabel('\psi');
    title('\psi');
    
    % P, Q, R
    subplot(3,4,4);
    plot(t,p_rot);
    xlabel('Time');
    ylabel('P');
    title('P');
    
    subplot(3,4,8);
    plot(t,q_rot);
    xlabel('Time');
    ylabel('Q');
    title('Q');
    
    subplot(3,4,12);
    plot(t,r_rot);
    xlabel('Time');
    ylabel('R');
    title('R');

end


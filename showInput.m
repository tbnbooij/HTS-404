function showInput(in)
    data = in.Data;
    time = in.Time;
    T = data(:,1);
    tau_x = data(:,2);
    tau_y = data(:,3);
    tau_z = data(:,4);
    % Create a figure window
    figure('Name', 'Input over Time', 'NumberTitle', 'off')
    
    subplot(2,2,1);
    plot(time, T);
    title('Thrust');
    xlabel('t (sec)');
    ylabel('T');
    
    subplot(2,2,2);
    plot(time, tau_x);
    title('Torque X-axis');
    xlabel('t (sec)');
    ylabel('\tau_x (N \cdot m)');
    
    subplot(2,2,3);
    plot(time, tau_y);
    title('Torque Y-axis');
    xlabel('t (sec)');
    ylabel('\tau_y (N \cdot m)');
    
    
    subplot(2,2,4);
    plot(time, tau_z);
    title('Torque Z-axis');
    xlabel('t (sec)');
    ylabel('\tau_z (N \cdot m)');


end


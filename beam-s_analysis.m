clear; clc; close all;

filename = 'farfield_data.txt'; 
if exist(filename, 'file')
    raw_data = importdata(filename);
    
    if isstruct(raw_data)
        data_matrix = raw_data.data;
    else
        data_matrix = raw_data;
    end
    
    theta_range = data_matrix(:,1); 
    gain_db = data_matrix(:,3);
    gain_linear = 10.^(gain_db/20); 

    f = 2.4e9; c = 3e8; lambda = c/f; d = 0.0625; N = 4;
    k = 2*pi/lambda;
    theta_rad_pattern = deg2rad(theta_range);
    
    s11 = 10^(-20/20); s12 = 10^(-15/20); s13 = 10^(-25/20);

    scan_angles = -70:2:70;
    active_gamma = zeros(size(scan_angles));
    gain_drop = zeros(size(scan_angles));

    for i = 1:length(scan_angles)
        phase_shift = -k * d * sin(deg2rad(scan_angles(i)));
        gamma_m = s12*exp(-1j*phase_shift) + s11 + s12*exp(1j*phase_shift) + s13*exp(2j*phase_shift);
        active_gamma(i) = abs(gamma_m);
        gain_drop(i) = 10*log10(1 - active_gamma(i)^2);
    end

    hFig = figure('Name', 'Phased Array Live Performance Dashboard', 'Color', 'w', 'Position', [100, 100, 1200, 550]);
    
    ax1 = subplot(1, 2, 1, polaraxes); 
    ax2 = subplot(2, 2, 2);
    ax3 = subplot(2, 2, 4);

    while ishandle(hFig) % Infinite loop until the window is closed
        for i = 1:length(scan_angles)
            if ~ishandle(hFig), break; end
            
            ts = scan_angles(i);
            delta_phi = -k * d * sin(deg2rad(ts));
            
            AF = zeros(size(theta_rad_pattern));
            for n = 1:N
                w_n = exp(1j * (n-1) * delta_phi);
                AF = AF + w_n * exp(1j * (n-1) * k * d * sin(theta_rad_pattern));
            end
            total_p = 20*log10(gain_linear .* abs(AF));
            total_p = total_p - max(total_p);

            
            polarplot(ax1, theta_rad_pattern, total_p, 'LineWidth', 2, 'Color', [0 0.45 0.74]);
            title(ax1, ['Scanning Angle: ' num2str(ts) '°']);
            ax1.ThetaLim = [-90 90]; ax1.RLim = [-40 0]; grid(ax1, 'on');

            
            plot(ax2, scan_angles, active_gamma, 'r', 'LineWidth', 1.5); hold(ax2, 'on');
            plot(ax2, ts, active_gamma(i), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8); hold(ax2, 'off');
            title(ax2, 'Active Reflection Coefficient'); grid(ax2, 'on'); 
            xlabel(ax2, 'Scan Angle (deg)'); ylabel(ax2, '|Gamma|'); axis(ax2, [-70 70 0 1]);

            
            plot(ax3, scan_angles, gain_drop, 'b', 'LineWidth', 1.5); hold(ax3, 'on');
            plot(ax3, ts, gain_drop(i), 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8); hold(ax3, 'off');
            title(ax3, 'Gain Reduction (Loss)'); grid(ax3, 'on'); 
            xlabel(ax3, 'Scan Angle (deg)'); ylabel(ax3, 'Loss (dB)'); axis(ax3, [-70 70 -10 0]);
            
            drawnow;
        end
    end
else
    msgbox('ERROR: farfield_data.txt not found!', 'File Error');
end
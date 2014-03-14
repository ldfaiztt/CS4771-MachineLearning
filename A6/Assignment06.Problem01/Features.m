function phi_i_of_x = Features(x, i)
%features of family
if i == 1
    %x_1^2
    phi_i_of_x = x(1) .^ 2;
elseif i == 2
    % sqrt(2) * x_1 * x_2
    phi_i_of_x = sqrt(2) .* x(1) .* x(2);
elseif i == 3
    % x_2^2
    phi_i_of_x = x(2) .^ 2;
else
    % constant
    phi_i_of_x = 1;
end


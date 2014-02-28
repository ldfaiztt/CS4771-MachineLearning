function ThetaStar = GradDescentLogistic(x, y, eta, epsilon, StartingTheta, StopTime)
% implement logistic-regression gradient descent

% start timer
start = clock;

% first step
last_theta = StartingTheta;

% z = 1 ./ (1 + exp(-last_theta' .* x));
% grad = (1/size(x,1)) * sum((z - y) .* x);
% cur_theta = StartingTheta - eta * grad;

x = [ones(size(x,1),1) x];

z = 1 ./ (1 + exp(-last_theta' * x'));
grad = (1/size(x,1)) * sum((z' - y)' * x);
cur_theta = last_theta - eta * grad';

% until difference within tolerance
while sum(abs(cur_theta - last_theta)) >= epsilon
    
    % step
     last_theta = cur_theta;
%     z = 1 ./ (1 + exp(-last_theta .* x));
%     grad = (1/size(x,1)) * sum((z - y) .* x);
%     cur_theta = last_theta - eta * grad;

    z = 1 ./ (1 + exp(-last_theta' * x'));
    grad = (1/size(x,1)) * sum((z' - y)' * x);
    cur_theta = last_theta - eta * grad'
    
    % check if timeout
    if etime(clock, start) > StopTime
        disp('TIME OUT - did not converge');
        return;
    end;

end;
ThetaStar = cur_theta;
end
function x = SimPolyHedra(N, Bounds, Polyhedra)
% simulate N uniformly-drawn points with bounds of polyhedra

% output N points (N x D array)
out_points = [];

while(size(out_points, 1) < N)
    % 1st stage: generate a random point
    cur_point = rand(1, size(Bounds, 1));
    % transform point to within Bounds
    for i = 1 : size(Bounds, 1)
        max = Bounds(i, 2);
        min = Bounds(i, 1);
        cur_point(:, i) = (max - min) * cur_point(:, i) + min;
    end;

    % 2nd stage: test to see if point is inside at least one M
    for p = 1 : size(Polyhedra, 1)
        cur_M = Polyhedra{p};
        x = [1; cur_point(:)];
        
        % check if good, then add and break;
        if cur_M * x >= 0
            out_points = [out_points; cur_point];
            break;
        end;
    end;
end;

x = out_points;
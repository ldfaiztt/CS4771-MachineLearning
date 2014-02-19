function x = SimPolyHedra(N, Bounds, Polyhedra)
% simulate N uniformly-drawn points with bounds of polyhedra
% 1st stage of uniformly drawing > N points within box of Bounds

% generate N uniformly random vectors of dim D
points = rand(N, size(Bounds, 1));

% transform random numbers to within values determined by Bounds
for i = 1:size(Bounds,1)
    max = Bounds(i, 2);
    min = Bounds(i, 1);
    points(:, i) = (max - min) * points(:, i) + min;
end;

% 2nd stage of filtering (only the first N within the polyhedra)



x = points;
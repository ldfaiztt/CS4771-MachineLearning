function SimPolyHedraTest
    Bounds = [-1 1;-1 1];
    a = [1 0 0];
    b = [0 1 0];
    c = [0 0 1];
    M = {[a;b;c]};
    x = SimPolyHedra(10, Bounds, M);
    disp(x);
end
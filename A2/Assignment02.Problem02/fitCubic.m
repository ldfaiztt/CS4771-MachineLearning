function fitCubic()
% Givens
% UNI: ess2183
% Polynomial: [2;1;8;3] = 2x^3 + x^2 + 8x + 3
uni_poly = [2;1;8;3];
sigma = 0.1;


SimPoly(uni_poly, sigma, [1;2;3;4])
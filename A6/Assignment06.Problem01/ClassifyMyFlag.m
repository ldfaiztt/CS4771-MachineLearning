function y = ClassifyMyFlag(x)
%x 2D input in the rectangle [0,1.5]x[0,1]
%y output in {-1,1}

b = x(2) - (2/3)*x(1);
if b < .16 && b > -.16
    y = -1;
else
    y = 1;
end;
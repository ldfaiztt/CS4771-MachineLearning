% just some observations about the data

x_neg_indices = find(X(:,1) < 0);
[X(x_neg_indices) y_int(x_neg_indices)]
y_int_2 = find(y_int(x_neg_indices) == 2);

denom = size(x_neg_indices, 1);
num = size(y_int_2, 1);
% percentage of negative x_1 that are labeled 2:
percent_neg_2 = (num/denom) * 100

y_2_indices = find(y_int == 2);
y_real_2 = y_real(y_2_indices);
% max/min of y_real that are labeled 2:
max_y_real = max(y_real)
max_y_real_2 = max(y_real_2)
min_y_real = min(y_real)
min_y_real_2 = min(y_real_2)
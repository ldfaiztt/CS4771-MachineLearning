%A11:Problem 4
% prints the matlab conditional probabilities you need 

disp('P(a1=1|a4,e1,h5)');
% indep of 57 64 8 32
% given    33 61 4
a1 = GetMarginalsGivenSeveral([4,33,61]);
a1 = a1(1,:,:,:)


disp('P(e1=2|a1,h1,h5,h8)');
% indep of 4 8 32
% given 1 57 61 64 
e1 = GetMarginalsGivenSeveral([1,57,61,64]);
e1 = e1(2,:,:,:,:)

disp('P(h1=2|e1,h5,h8)');
% indep of 1 4 8 32
% given    61 33 64
h1 = GetMarginalsGivenSeveral([33,61,64]);
h1 = h1(3,:,:,:)

disp('P(a4=2|a1)');
% indep of 32 8 33 61 64 57
% given         1
a4 = GetMarginalsGiven1(1);
a4 = a4(4,:)

disp('P(h5=2|a1,e1,h1,d8,h8)');
% indep of 4 8 
% given 1,33,57,64,32
h5 = GetMarginalsGivenSeveral([1,33,57,32,64]);
h5 = h5(5,:,:,:,:,:)

disp('P(a8=2|d8)');
% indep of 1 33 57 4 61 64
% given                 32
a8 = GetMarginalsGiven1(32);
a8 = a8(6,:)

disp('P(d8=2|h5,a8,h8)');
% indep of 1 33 57 4 
% given 8 64 61
d8 = GetMarginalsGivenSeveral([61,8,64]);
d8 = d8(7,:,:,:)

disp('P(h8=2|a1,e1,h1,h5,d8)');
% indep of 8 4 
% given    32 61 33 57 1
h8 = GetMarginalsGivenSeveral([1,33,57,61,32]);
h8 = h8(8,:,:,:,:,:)


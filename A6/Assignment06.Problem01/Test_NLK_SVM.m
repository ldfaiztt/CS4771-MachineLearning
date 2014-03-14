function [SupportVs, Theta, x0, x1] = Test_NLK_SVM(N)

% simulate N points
[x0, x1] = SimMyFlag(N);

[Theta, SupportVs] = NLK_SVM(x0, x1);

% output text files
dlmwrite(strcat('Output_[', int2str(N), ']_x0'), x0);
dlmwrite(strcat('Output_[', int2str(N), ']_x1'), x1);
dlmwrite(strcat('Output_[', int2str(N), ']_Theta'), Theta);
dlmwrite(strcat('Output_[', int2str(N), ']_SupportVs'), SupportVs);

end
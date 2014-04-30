function [ ChessboardCity ] = MakeChessboardCity()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

l=8;
N=l*l;
dag = zeros(N,N);
[idiag,jdiag] = meshgrid(0:(l-2),0:(l-2));    
from_diag = idiag(:)*l+jdiag(:)+1;
to_diag = idiag(:)*l+jdiag(:)+l+2;
[iadj,jadj] = meshgrid(0:(l-1),0:(l-2));
from_horz = iadj(:)*l+jadj(:)+1;
to_horz = iadj(:)*l+jadj(:)+2;
from_vert = jadj(:)*l+iadj(:)+1;
to_vert = jadj(:)*l+iadj(:)+l+1;
froms = [from_diag;from_horz;from_vert];
tos = [to_diag;to_horz;to_vert];
dag = full(sparse(froms, tos, ones((l-1)*(3*l-1),1), N,N));

node_sizes = 2*ones(1,N);

NonredundantCPT_0 = [0.05];
NonredundantCPT_1 = [0.05 ; 0.35];
NonredundantCPT_3 = 0.05*ones(2,2,2);
NonredundantCPT_3(2,:,:) = NonredundantCPT_3 (2,:,:)+.3;
NonredundantCPT_3(:,2,:) = NonredundantCPT_3 (:,2,:)+.3;
NonredundantCPT_3(:,:,2) = NonredundantCPT_3 (:,:,2)+.3;

CPT_0 = [1-NonredundantCPT_0 ,  NonredundantCPT_0];
CPT_1 = [1-NonredundantCPT_1 ,  NonredundantCPT_1];
CPT_3(:,:,:,1) = 1-NonredundantCPT_3;
CPT_3(:,:,:,2) = NonredundantCPT_3;

col_chars = 'abcdefgh';
row_chars = '12345678';
[col_c,row_c] = meshgrid(col_chars,row_chars);
names = cellstr([col_c(:) row_c(:)]);
ChessboardCity = mk_bnet(dag, node_sizes, 'names', names);
corner = ChessboardCity.names('a1');
ChessboardCity.CPD{corner} = tabular_CPD(ChessboardCity,corner,CPT_0);
for i=2:8
    bottom = ChessboardCity.names([col_chars(i) '1']);
    ChessboardCity.CPD{bottom} = tabular_CPD(ChessboardCity,bottom,CPT_1);
    left = ChessboardCity.names(['a' row_chars(i)]);
    ChessboardCity.CPD{left} = tabular_CPD(ChessboardCity,left,CPT_1);
    for j=2:8
        middle = ChessboardCity.names([col_chars(i) row_chars(j)]);
        ChessboardCity.CPD{middle} = tabular_CPD(ChessboardCity,middle,CPT_3);
    end
end



end


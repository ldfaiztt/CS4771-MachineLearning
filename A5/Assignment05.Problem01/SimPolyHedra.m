function  x=SimPolyHedra(N,Bounds,Polyhedra)

i=1;
D=size(Bounds,1);
len=Bounds(:,2)-Bounds(:,1);
x=zeros([N D]);
while i <=N
    point = rand(D,1).*len+Bounds(:,1);
    valid=0;
    for j=1:size(Polyhedra)
        if sum(Polyhedra{j} *[1 point']' >= 0) == size(Polyhedra{j},1)
            valid=1;
            break;
        end
    end
    if valid ==1
        x(i,:)=point;
        i=i+1;
    end
    
end
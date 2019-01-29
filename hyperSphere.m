function [curpoint,r,NNpoint,id] = hyperSphere(data,curIndex,phi,dim)
curpoint = data(curIndex,:);
r = inf;
NNpoint = [];
id = 0;
for i = 1 : size(data,1)
    if i == curIndex
        continue
    else
        dis = Dist(curpoint,data(i,:));
        if dis < r
            r = dis;
            NNpoint = data(i,:);
            r2 = Dist(curpoint,data(i,:));
            id = i;
        end
    end
end
end
           
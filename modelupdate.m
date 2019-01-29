function Model = modelupdate(Model,data,buffer_label)
t = Model.t;
phi = Model.phi;
dim = Model.dim;
label = buffer_label;
Size = size(Model.set,1) + 1;
for i = 1 : t
    subIndex = randperm(size(data,1),phi);
    subData = data(subIndex,:);
    B = cell(phi,3);
    for j = 1 : phi
        [curpoint,r,NNpoint,id] = hyperSphere(subData,j,phi,dim);
        B{j,1} = curpoint;
        B{j,2} = r;
        B{j,3} = label;
        B{j,5} = id;
    end
    for j = 1 : phi
%             fprintf('Bj = %d\n',B{j,5});
        B{j,4} = B{B{j,5},2};
    end
%         fprintf('i = %d %d\n',i,i + t * (k - 1));
    Model.set{Size} = B;
    Size = Size + 1;
end
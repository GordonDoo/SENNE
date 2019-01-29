function Model = model_SENNE(traindata,t,phi,dim,rseed)
Model.t = t;
Model.phi = phi;
Model.dim = dim;
Model.set = cell(t * size(traindata,1),1);
rand('state', rseed);
for k = 1 : size(traindata,1)
    data = traindata{k,1};
    label = traindata{k,2};
    for i = 1 : t
        subIndex = randperm(size(data,1),phi);
        subData = data(subIndex,:);
        B = cell(phi,5);
        for j = 1 : phi
            [curpoint,r,NNpoint,id] = hyperSphere(subData,j,phi,dim);
            B{j,1} = curpoint;
            B{j,2} = r;
            B{j,3} = label;
            B{j,5} = id;
        end
        for j = 1 : phi
            B{j,4} = B{B{j,5},2};
        end
        Model.set{i + t * (k - 1)} = B;
    end
end
end

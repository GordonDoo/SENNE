load Datasets/Synthetic.mat
% temp = art4{1,1};
% art4{1,1} = art4{3,1};
% art4{3,1} = temp;
% for i = 1 : size(art4,1)
%     temp = art4{i,1};
%     for j = 1 : size(temp,2)
%         cur = temp(:,j);
%         cur = cur';
%         cur = mapminmax(cur,-1,1);
%         temp(:,j) = cur';
%     end
%     art4{i,1} = temp;
% end
newevaluation=[];
Input_dataset=art4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Parametres%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
train_num=2;  %Known Classes
newclass_num=1;
num_per_class=2000;
alltraindata=[];
alltraindatalabel=[];
streamdata=[];
streamdatalabel=[];
% ALLindex=[1 2 3];
% ALLindex = 1 : size(Input_dataset(:,1),1);
ALLindex = randperm(size(Input_dataset(:,1),1)); %class index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Random Instaces%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:size(Input_dataset(:,1),1)
    dataindex=randperm(size(Input_dataset{i,1},1));
    datatemp=Input_dataset{i,1};
    datatemp=datatemp(dataindex',:);
    datatemp=full(datatemp(dataindex,:));
    Input_dataset{i,1}=datatemp;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Train Instaces%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:train_num
    datatemp=Input_dataset{ALLindex(i),1};
    traindata{i,1}=datatemp(1:num_per_class,:);
    traindata{i,2}=i;
    alltraindata=[alltraindata;traindata{i,1}] ;
    alltraindatalabel=[alltraindatalabel;ones(size(traindata{i,1},1),1)*traindata{i,2}];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Test Instaces%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
testdata1={};
for i=1:train_num+newclass_num
    datatemp=Input_dataset{ALLindex(i),1};
        testdata{i,1}=datatemp(num_per_class+1:num_per_class+500,:);
    if i<=train_num
        testdata{i,2}=i;
    else
        testdata{i,2}=999; %new class
    end
    streamdata=[streamdata;testdata{i,1}];
    streamdatalabel=[streamdatalabel;ones(size(testdata{i,1},1),1)*testdata{i,2}];
end
randindex=randperm(size(streamdata,1));
streamdata=streamdata(randindex,:);
streamdatalabel=streamdatalabel(randindex,:);

clear all;
clc;
getData
buffer1 = [];
num_samples = 100; % number of set
sample_size = 20 % subsample size for each set
CurtNumDim=size(alltraindata, 2);
rseed = sum(100 * clock);
buffsize = 300;
d1 = cputime;
Model = model_SENNE(traindata,num_samples,sample_size,CurtNumDim,rseed);
fprintf('SENNE model complete\n');
d2 = cputime;
fprintf('Build model uses time %f s\n',d2 - d1);
score_threshold = 0.88
[result_label,after_model,axis_point] = Predict(train_num,streamdata,streamdatalabel,buffsize,Model,score_threshold);
fprintf('SENNE predict complete\n');
d3 = cputime;
fprintf('Predicting uses time %f s\n',d3 - d2);
label_com = zeros(size(result_label,1),2);
label_com(:,1) = result_label(:,1);
label_com(:,2) = streamdatalabel(:,1);
myevaluation = zeros(size(label_com,1),1);
acc = sum(result_label == streamdatalabel) / size(streamdatalabel,1);
acc = acc * 100;
for j=1:size(label_com,1)
    myevaluation(j)=sum(label_com(1:j,1)==label_com(1:j,2))/j;
end
fprintf('Accuracy = %f%%\n',acc);
plot_error
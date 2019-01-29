function [result,Model,axispoint] = Predict(curnum,data,truelabel,buffersize,Model,score_threshold)
result = zeros(size(data,1),1);
result_score = zeros(size(data,1),1);
buffer = [];
buffer_label = 0;
buffer_num = 1;
axispoint = [];
axisnum = 1;
flag = 0;
for i = 1 : size(data,1)
    testpoint = data(i,:);
    num = 0;
    predictlabel = 0;
    newclass = 0;
    templabel = zeros(curnum,1);
    scores = zeros(curnum,1);
    classnum = zeros(curnum,1);
    for j = 1 : size(Model.set,1)
        [idx,score] = calc_score(Model.set{j},testpoint,score_threshold);
        if idx ~= 0
            scores(idx) = scores(idx) + score;
            classnum(idx) = classnum(idx) + 1;
            templabel(idx,1) = templabel(idx,1) + 1;
        else
            newclass = newclass + 1;
            for k = 1 : curnum
                scores(k) = scores(k) + 1;
                classnum(k) = classnum(k) + 1;
            end
        end
    end
    minscore = 1;
    minid = 0;
    for j = 1 : curnum
        scores(j) = scores(j) / classnum(j);
        if scores(j) < score_threshold && minscore > scores(j)
            minscore = scores(j);
            minid = j;
        end
    end
%     scores
%     truelabel(i)
%     pause;
    if minid == 0
        predictlabel = curnum + 1;
        if size(buffer,1) < buffersize
            buffer = [buffer;testpoint];
            buffer_num = buffer_num + 1;
            buffer_label = curnum + 1;
            if size(buffer,1) == buffersize
                flag = 1;
                fprintf('Update model at i = %d\n',i);
                axispoint(axisnum) = i;
                axisnum = axisnum + 1;
                Model = modelupdate(Model,buffer,buffer_label);
                buffer = [];
                buffer_num = 1;
                curnum = curnum + 1;
            end
        end
    else
        maxnum = 0;
        for j = 1 : curnum
            if templabel(j,1) > maxnum
                predictlabel = j;
                maxnum = templabel(j,1);
            end
        end
    end
    if predictlabel ~= 1 && predictlabel ~= 2
        predictlabel = 999;
    end
    result(i) = predictlabel;
end
end
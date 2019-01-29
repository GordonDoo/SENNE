function [label,score] = calc_score(B,testpoint,threshold)
score = 1;
r = inf;
label = 0;
iscore = 1;
% fprintf('!!!!!!!!!!!!!!!!!!!!!');
for i = 1 : size(B,1)
    dis = Dist(testpoint,B{i,1});
%     B{i,2}
%     pause;
    if dis <= B{i,2} && r > dis
%     if dis <= B{i,2} && r > B{i,2}
%         fprintf('hahahah');
        r = dis;
%         r = B{i,2};
        score = 1 - B{i,4} / dis;
%         score = 1 - B{i,4} / B{i,2};
%         score
%         pause;
%         if score < iscore && score <= threshold(B{i,3})
        if score < iscore && score <= threshold
            iscore = score;
            label = B{i,3};
        end
    end
%     if dis <= B{i,2} && r > B{i,2}
% %         fprintf('hahahah');
%         r = B{i,2};
%         score = 1 - B{i,4} / B{i,2};
%         if score < iscore && score <= threshold(B{i,3})
%             iscore = score;
%             label = B{i,3};
%         end
%     end
end
end
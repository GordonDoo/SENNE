% error_index = find(result_label ~= streamdatalabel);
error_index1 = find(result_label ~= streamdatalabel & result_label == 1);
error_index2 = find(result_label ~= streamdatalabel & result_label == 2);
error_index3 = find(result_label ~= streamdatalabel & result_label == 999);
i1 = find(result_label == 1);
ii1 = find(streamdata == 2);
i2 = find(result_label == 2);
ii2 = find(streamdata == 1);
num = 1;
error_index12 = [];
for i = 1 : size(i1,1)
    for j = 1 : size(ii1,1)
        if i1(i) == ii1(j)
            error_index12(num) = i1(i);
            num = num + 1;
            break;
        end
    end
end
for i = 1 : size(i2,1)
    for j = 1 : size(ii2,1)
        if i2(i) == ii2(j)
            error_index12(num) = i2(i);
            num = num + 1;
            break;
        end
    end
end
error_point1 = streamdata(error_index1,:);
error_point2 = streamdata(error_index2,:);
error_point3 = streamdata(error_index3,:);
index1 = find(streamdatalabel == 1);
index2 = find(streamdatalabel == 2);
index3 = find(streamdatalabel == 999);
data1 = streamdata(index1,:);
data2 = streamdata(index2,:);
data3 = streamdata(index3,:);
Index1 = find(alltraindatalabel == 1);
Index2 = find(alltraindatalabel == 2);
Data1 = alltraindata(Index1,:);
Data2 = alltraindata(Index2,:);
t1 = d2 - d1;
t2 = d3 - d2;
% subplot(1,2,1);
if size(data1,2) == 2
    plot(data1(:,1),data1(:,2),'ro','MarkerSize',10,'markerfacecolor', [ 0, 0, 1 ]);
    hold on
    plot(data2(:,1),data2(:,2),'bo','MarkerSize',10,'markerfacecolor', [ 0, 1, 0 ]);
    plot(data3(:,1),data3(:,2),'go','MarkerSize',10,'markerfacecolor', [ 1, 0, 0 ]);
    plot(error_point1(:,1),error_point1(:,2),'o','MarkerSize',10,'markerfacecolor', [ 1, 1, 0 ]);
    plot(error_point2(:,1),error_point2(:,2),'o','MarkerSize',10,'markerfacecolor', [ 0, 1, 1 ]);
    plot(error_point3(:,1),error_point3(:,2),'o','MarkerSize',10,'markerfacecolor', [ 0, 0, 0 ]);
    title({['cur acc = ',num2str(acc),' %'];['Build model ',num2str(t1),' s'];['Predicting ',num2str(t2),' s']});
else
    if size(data1,2) == 3
        plot3(data1(:,1),data1(:,2),data1(:,3),'ro','MarkerSize',10,'markerfacecolor', [ 0, 0, 1 ]);
        hold on
        plot3(data2(:,1),data2(:,2),data2(:,3),'bo','MarkerSize',10,'markerfacecolor', [ 0, 1, 0 ]);
        plot3(data3(:,1),data3(:,2),data3(:,3),'go','MarkerSize',10,'markerfacecolor', [ 1, 0, 0 ]);
        hold on
        plot3(error_point1(:,1),error_point1(:,2),error_point1(:,3),'o','MarkerSize',10,'markerfacecolor', [ 1, 1, 0 ]);
        plot3(error_point2(:,1),error_point2(:,2),error_point2(:,3),'o','MarkerSize',10,'markerfacecolor', [ 0, 1, 1 ]);
        plot3(error_point3(:,1),error_point3(:,2),error_point3(:,3),'o','MarkerSize',10,'markerfacecolor', [ 0, 0, 0 ]);
        title({['cur acc = ',num2str(acc),' %'];['Build model ',num2str(t1),' s'];['Predicting ',num2str(t2),' s']});

    end
end
% hold on
% plot(error_index12(:,1),error_index12(:,2),'o','MarkerSize',10,'markerfacecolor', [ 1, 1, 1 ]);
% axis([-20,50,-5,25]);
% axis on  
% subplot(1,2,2);
% plot(Data1(:,1),Data1(:,2),'ro','MarkerSize',10,'markerfacecolor', [ 0, 0, 1 ]);
% hold on
% plot(Data2(:,1),Data2(:,2),'bo','MarkerSize',10,'markerfacecolor', [ 0, 1, 0 ]);
% hold on
% plot(data3(:,1),data3(:,2),'go','MarkerSize',10,'markerfacecolor', [ 1, 0, 0 ]);
% axis([-20,50,-5,25]);
% axis on  
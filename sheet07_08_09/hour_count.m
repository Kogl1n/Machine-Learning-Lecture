% you have to remove the header by hand!

fid = fopen('train.csv');
out = textscan(fid,'%s%f%f%f%f%f%f%f%f%f%f%f','delimiter',',');
fclose(fid);


workingday = out{4};
count = out{12};
date = datevec(out{1}); %datetime is already in natural order 
% fourth column is hour
hour = date(:,4); % there is not a line for every hour!

for i=0:23
    spec_hour_wd = find(hour==i&workingday==1);
    spec_hour_nwd = find(hour==i&workingday==0);
    count_hour_workingday(i+1) = sum(count(spec_hour_wd));
    count_hour_nonworkingday(i+1) = sum(count(spec_hour_nwd));
end

bar([0:23],[count_hour_workingday],'g');
hold on
bar([0:23],[count_hour_nonworkingday],'b');
set(gca,'YTickLabel','');
xlim([0 23])
xlabel('hours');
ylabel('count');
legend('workingday','nonworkingday');

%--------------------------
% hour-count-humidity
figure
hold on;
humidity = out{8};
workingday = find(workingday==1);
count_wd = count(workingday);
humidity_wd = humidity(workingday);

c = humidity_wd;
scatter3(hour(workingday),count_wd,humidity_wd, 2.5, c, 'filled')
colorbar
xlabel('hours');
ylabel('count');

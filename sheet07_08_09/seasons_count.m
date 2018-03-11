% you have to remove the header by hand!

fid = fopen('train.csv');
out = textscan(fid,'%s%f%f%f%f%f%f%f%f%f%f%f','delimiter',',');
fclose(fid);

seasons = out{2};
count = out{12};

% have both same length: check!
spring_ind = find(seasons==1);
spring_numbers = length(spring_ind);
summer_ind = find(seasons==2);
summer_numbers = length(summer_ind);
fall_ind = find(seasons==3);
fall_numbers = length(fall_ind);
winter_ind = find(seasons==4);
winter_numbers = length(winter_ind);
% numbers are not equal; especially spring has less!

spring_count = count(spring_ind);
summer_count = count(summer_ind);
fall_count = count(fall_ind);
winter_count = count(winter_ind);

spring_count = sum(spring_count)/spring_numbers;
summer_count = sum(summer_count)/summer_numbers;
fall_count = sum(fall_count)/fall_numbers;
winter_count = sum(winter_count)/winter_numbers;

bar([spring_count; summer_count; fall_count; winter_count]);
title('Count of rentals per season');
xlabel('seasons');
ylabel('count/number of days of each season');
    



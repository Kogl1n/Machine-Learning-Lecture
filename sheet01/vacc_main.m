%% Sheet 1, Exercise 1
clear all
M = dlmread('vaccination.csv',',',1,0);
% gender,age,height,weight,residence,olderSiblings,
% knowsToRideABike,vacX,diseaseX,diseaseY,diseaseZ
%% a) numbers of boys/girls, age groups and olderSiblings -> bar plots.
gender=M(:,1);
hist(gender,2); title('number of girls (left) and boys (right)'); % 1 = boys; 0 = girls

figure;
age=M(:,2);
hist(age,5); title('age groups');
xlabel({'age groups','1:  0- 2 years','2:  3- 6 years','3:  7-10 years','4: 11-13 years','5: 14-17 years'});

figure;
siblings=M(:,6);
no=length(find(siblings==0)); one=length(find(siblings==1));
two=length(find(siblings==2)); three=length(find(siblings==3));
four=length(find(siblings==4));
y = [no one two three four];
bar(y); title('older siblings'); labels = 0:4;
set(gca, 'XTick', 1:length(labels)); % Change x-axis ticks
set(gca, 'XTickLabel', labels); % Change x-axis ticks labels.

%% b) emp. probabilities: vacc against X, countryside, min. one old.sibling
disp('b)');
vacc=M(:,8);
vaccinated=length(find(vacc==1));
disp('The emp. prob. of vaccinated against X is:')
disp(vaccinated/length(vacc));

residence=M(:,5);
countryside=length(find(residence==1));
disp('The emp. prob. of living at the countryside is:')
disp(countryside/length(residence));

disp('The emp. prob. of having min. one older sibling is:')
disp(1-no/length(siblings));

%% c) emp. probabilities: taller than 1m; heavier than 40kg; Y and/or Z
disp('c)');
height=M(:,3);
disp('The emp. prob. being taller than 1m is:')
disp(length(find((height > 100)==1))/length(height));

weight=M(:,4);
disp('The emp. prob. being heavier than 40kg is:')
disp(length(find((weight > 40)==1))/length(weight));

disY=M(:,10);
disZ=M(:,11);
disp('The emp. prob. of Y and/or Z is:')
disp((length(disY)-length(find(disY+disZ==0)))/length(disY));

%% d) cond. emp. probabilities: 
% disX|vacX=0,1; vacX|disX=0,1; disY|age=1,2,3,4; vacX|age=1,2,3,4;
% bike|vacX=0,1; 
% visualize 3. and 4. as line plots with age on x-axis; conclusion
% P(a|b)=rows with a and b/ rows with b
disp('d)');
%1.)
disX=M(:,9);
disX1andvacX0=length(find(disX+~vacc==2));
disX1andvacX1=length(find(disX+vacc==2));
disp('The cond. emp. prob. disX|vacX=0,1 are:')
disp(disX1andvacX0/length(find(vacc==0)));
disp('and');
disp(disX1andvacX1/length(find(vacc==1)));
disp('Conclusion: Vaccination helps; 30 times less poss.');
disp(' ');
%2.)
vacX1anddisX0=length(find(~disX+vacc==2));
disp('The cond. emp. prob. vacX|disX=0,1 are:')
disp(vacX1anddisX0/length(find(disX==0)));
disp('and');
disp(disX1andvacX1/length(find(disX==1)));
disp('Conclusion: Most non-ill are vacc,but 1/3 of ill people are too.');
disp(' ');
%3.)
disY1andage1=length(find(disY+age==2));
disY1andage2=length(find(disY+age==3));
disY1andage3=length(find(disY+age==4));
disY1andage4=length(find(disY+age==5));
page1=disY1andage1/length(find(age==1));
page2=disY1andage2/length(find(age==2));
page3=disY1andage3/length(find(age==3));
page4=disY1andage4/length(find(age==4));
disp('The cond. emp. prob. disY|age=1,2,3,4 are:')
disp(page1); disp(page2); disp(page3); disp(page4);
figure; plot([1,2,3,4],[page1, page2, page3, page4]);
title('Plot Age against cond. prob. of disY at this age');
xlabel('age class'); ylabel('cond. probability');
disp('Conclusion: Disease hits basically young children.');
disp(' ');
%4.)
vacX1andage1=length(find(vacc+age==2));
vacX1andage2=length(find(vacc+age==3));
vacX1andage3=length(find(vacc+age==4));
vacX1andage4=length(find(vacc+age==5));
vage1=vacX1andage1/length(find(age==1));
vage2=vacX1andage2/length(find(age==2));
vage3=vacX1andage3/length(find(age==3));
vage4=vacX1andage4/length(find(age==4));
disp('The cond. emp. prob. vacX|age=1,2,3,4 are:')
disp(vage1); disp(vage2); disp(vage3); disp(vage4);
figure; plot([1,2,3,4],[vage1, vage2, vage3, vage4]);
title('Plot Age against cond. prob. of vacX at this age');
xlabel('age class'); ylabel('cond. probability');
disp('Conclusion: Basically one is already vaccinated in young age.');
disp(' ');
%5.)
bike=M(:,7);
vacX0andbike=length(find(~vacc+bike==2));
vacX1andbike=length(find(vacc+bike==2));
disp('The cond. emp. prob. bike|vacX=0,1 are:')
disp(vacX0andbike/length(find(vacc==0)));
disp(vacX1andbike/length(find(vacc==1)));

%% e) effects of vaccination
% cond. emp. prob.: 
% 1.)
% disYZ|vacX=0,1
% disX|vacX=0,1
% -> conclusion?
disp('e)');
disp('The emp. prob. of Y and/or Z|vacX=0,1 are:')
disYZandvacX0=length(find(vacc==0))-length(find(vacc+disY+disZ==0));
disYZandvacX1=length(find(vacc==1))-length(find(~vacc+disY+disZ==0));
disp(disYZandvacX0/length(find(vacc==0)));
disp(disYZandvacX1/length(find(vacc==1)));

disp('The emp. prob. of disX|vacX=0,1 are:')
vacX0anddisX1=length(find(disX+~vacc==2));
disp(vacX0anddisX1/length(find(vacc==0)));
disp(disX1andvacX1/length(find(vacc==1)));
disp('Conclusion:to get disY/Z seems more prob. for X-vacc. people,');
disp('but then it is far less probable to fall ill to X');
disp(' ');

% 2.)
% add. cond. on age: disYZ|vacX=0,1, age=1,2,3,4
% How sure that accurate? What does it depend on? -> certain number of b&c!
% P(A|B,C)=P(A and B and C)/P(B and C)
%a)
Matrixa1=[~~(disY+disZ) vacc age];
[~,index]=ismember(Matrixa1,[1 0 1],'rows');
disYZandvacX0andage1=length(find(index==1));
[~,index]=ismember(Matrixa1,[1 0 2],'rows');
disYZandvacX0andage2=length(find(index==1));
[~,index]=ismember(Matrixa1,[1 0 3],'rows');
disYZandvacX0andage3=length(find(index==1));
[~,index]=ismember(Matrixa1,[1 0 4],'rows');
disYZandvacX0andage4=length(find(index==1));

Matrixa2=[vacc age];
[~,index]=ismember(Matrixa2,[0 1],'rows');
vacX0andage1=length(find(index==1));
[~,index]=ismember(Matrixa2,[0 2],'rows');
vacX0andage2=length(find(index==1));
[~,index]=ismember(Matrixa2,[0 3],'rows');
vacX0andage3=length(find(index==1));
[~,index]=ismember(Matrixa2,[0 4],'rows');
vacX0andage4=length(find(index==1));
disp('The emp. prob. of disYZ|vacX=0, age=1,2,3,4 are:')
pk1=disYZandvacX0andage1/vacX0andage1;
pk2=disYZandvacX0andage2/vacX0andage2;
pk3=disYZandvacX0andage3/vacX0andage3;
pk4=disYZandvacX0andage4/vacX0andage4;
disp(pk1);
disp(pk2);
disp(pk3);
disp(pk4);

%b)
Matrixb1=[~~(disY+disZ) vacc age];
[~,index]=ismember(Matrixb1,[1 1 1],'rows');
disYZandvacX1andage1=length(find(index==1));
[~,index]=ismember(Matrixb1,[1 1 2],'rows');
disYZandvacX1andage2=length(find(index==1));
[~,index]=ismember(Matrixb1,[1 1 3],'rows');
disYZandvacX1andage3=length(find(index==1));
[~,index]=ismember(Matrixb1,[1 1 4],'rows');
disYZandvacX1andage4=length(find(index==1));

Matrixb2=[vacc age];
[~,index]=ismember(Matrixb2,[1 1],'rows');
vacX1andage1=length(find(index==1));
[~,index]=ismember(Matrixb2,[1 2],'rows');
vacX1andage2=length(find(index==1));
[~,index]=ismember(Matrixb2,[1 3],'rows');
vacX1andage3=length(find(index==1));
[~,index]=ismember(Matrixb2,[1 4],'rows');
vacX1andage4=length(find(index==1));
disp('The emp. prob. of disYZ|vacX=1, age=1,2,3,4 are:')
pl1=disYZandvacX1andage1/vacX1andage1;
pl2=disYZandvacX1andage2/vacX1andage2;
pl3=disYZandvacX1andage3/vacX1andage3;
pl4=disYZandvacX1andage4/vacX1andage4;
disp(pl1);
disp(pl2);
disp(pl3);
disp(pl4);

% 3.)
% plot disYZ|vacX=0, age=1,2,3,4
% plot disYZ|vacX=1, age=1,2,3,4 => 2 lines with age on x-axis
% -> conclusion?
figure;
plot([1 2 3 4],[pk1 pk2 pk3 pk4],'r'); hold on;
plot([1 2 3 4],[pl1 pl2 pl3 pl4],'b');
xlabel('age class');
title('disYZ|vacX=0 (red) and disYZ|vacX=1 (blue) for spec. age classes');
disp('Conclusion: to get ill with Y/Z indep of vacX.');

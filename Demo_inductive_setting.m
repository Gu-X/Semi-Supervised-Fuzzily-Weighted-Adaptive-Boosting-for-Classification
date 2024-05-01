clear all
clc
close all
load ExampleData
% DTra1: labelled training data
% LTra1: labels of DTra1
% DTes1: unlabelled training data/testing data
% LTes1: group truth of DTes1

k=5; % choose the EFS classifier as the base learner. k can be 1~6
NN=20; % number of base learners;
%% EFS classifiers
name{1}='SOFBIS';
name{2}='ALMMo0';
name{3}='ALMMo1';
name{4}='SOFIS';
name{5}='SAFL';
name{6}='eClass0';

%% The level of granularity of the classifiers; nan means do not need this parameter; for this with a valid value, it can be replaced by any nonnegative integer
GL{1}=9;
GL{2}=nan;
GL{3}=nan;
GL{4}=12;
GL{5}=nan;
GL{6}=nan;

input0.NumBaseLearner=NN;
input0.GranLevel=GL{k};
input0.TrainData=DTra1;
input0.TrainLabel=LTra1;
input0.ULTrainData=DTes1(1:1:2000,:); % unlabelled training data
input0.TestData=DTes1(2001:1:end,:);  % out-of-sample testing data
input0.classf=name{k};
[output]=inductiveSSFWADABoosting(input0);
Ptes=output.Pred;
[BACC(1),ACC(1),CM(:,:,1)]=performancemeasure(LTes1(2001:1:end),Ptes); % classification performance on unlabelled training data (testing performance)






clear all
clc
close all
load ExampleData

k=5;
NN=20;

name{1}='SOFBIS';
name{2}='ALMMo0';
name{3}='ALMMo1';
name{4}='SOFIS';
name{5}='SAFL';
name{6}='eClass0';

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
input0.TestData=DTes1;
input0.classf=name{k};
[output]=SSFWADABoosting(input0);
Ptes=output.Pred;
Ptra=output.TraPred;
[BACC(1),ACC(1),CM(:,:,1)]=performancemeasure(LTes1,Ptes);
[BACC(2),ACC(2),CM(:,:,2)]=performancemeasure(LTra1,Ptra);






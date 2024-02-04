function [BACC,ACC,CM]=performancemeasure(label,predlabel)
UL=unique(label);
CL=length(UL);
CM=confusionmat(label,predlabel);
ACC=sum(CM.*eye(size(CM,1)),'all')./sum(CM,'all');
BACC=0;
for ii=1:1:CL
    BACC=BACC+CM(ii,ii)/length(find(label==UL(ii)));
end
BACC=BACC/CL;
end
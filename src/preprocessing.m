function [label,BW_data] = preprocessing(tr_te,per)
% Input arguments:(1) tr_te: train or test, per: random percentage of data

% Outputs: (1) data: M * N matrix where M is number of samples and N is 
% dimensionality of image 
%(2) label: M*1 vector where ith entry shows class label for ith sample

load mnist_all.mat
data=zeros(70000,784,'uint8');
label=zeros(70000,1,'uint8');
st=1;
for digitId=0:9
    fileName=eval(sprintf('%s%d',tr_te,digitId));
    pick=find((rand(size(fileName,1),1)<=per/100)==1);
    en=st+length(pick)-1;
    data(st:en,:)=fileName(pick,:);
    label(st:en)=digitId;
    st=st+length(pick);      
end
label=label(1:en);
data=data(1:en,:);

size_data=size(data,1);

%Binarization and Noise Cleaning
BW_data=zeros(size_data,28,28);
for i=1:size_data
I=data(i,:);
level = graythresh(I); %find threshold value
BW = im2bw(I,level);
BW2 = bwmorph(BW,'clean',1);clc %clean noise
BW_data(i,:,:)=reshape(BW2,28,28);
end

%This function computes the number of ones in eac column and each row of the image and appends the horizontal
%histogram with vertical histogram

function [feature] = feature_histogram(BW_data)
 
size_data=size(BW_data,1);
feature=zeros(size_data,56);
 
for k=1:size_data
    a=reshape(BW_data(k,:),28,28);
    for i=1:28
        feature(k,i)=nnz(a(i,:));		%horizontal projection
        feature(k,i+28)=nnz(a(:,i));	%vertical projection
    end
end
end

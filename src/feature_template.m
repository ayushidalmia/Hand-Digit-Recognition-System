%Template matching, the feature vector is same as that of the data

function [feature] = feature_template(BW_data)

size_data = size(BW_data,1);
feature=zeros(size_data,28,28);
for i=1:size_data
    feature(i,:,:)=BW_data(i,:,:);
end

end

%Finding no. of corners for all the 4*4 subimages

function [feature] = feature_endPoint(BW_data)
size_data=size(BW_data,1);
feature=zeros(size_data,16);
A=zeros(1,7,7);

for k=1:size_data
    disp(k)
    l=1;
    for i=1:7:27
        for j=1:7:27
            A=BW_data(k,(i:i+6),(j:j+6));
            reshapeInputImage = reshape(A,7,7);%reshaping
            thinImage = bwmorph(reshapeInputImage,'thin','inf');%thinning
            cornerCoordinates = corner(thinImage);%find corners
            [a b]=size(cornerCoordinates);
            feature(k,l)=a;
            l=l+1;

        end
    end
end

end
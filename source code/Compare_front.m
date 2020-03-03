
for i = 1:size(data_DCT,1)
    data_DCT(i,2:41)=data_DCT(i,2:41)/norm(data_DCT(i,2:41));
end

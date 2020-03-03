miR_Sequence=zeros(64452,64); 
for i=1:32226
    i
   miR= disease_miRNA_P{i,2};
   for j=1:1057
      if  strcmp(miRNA{j,1},miR)
         miR_Sequence(i,:)=miRNA_Feature(j,:);  
         break;
      end
   end
end

for i=32227:64452
    i
   miR= disease_miRNA_N{i-32226,2};
   for j=1:1057
      if  strcmp(miRNA{j,1},miR)
         miR_Sequence(i,:)=miRNA_Feature(j,:);  
         break;
      end
   end
end

data_DCT=[data_DCT,miR_Sequence];


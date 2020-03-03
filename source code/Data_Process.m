
for i=1:739
    i
    Temp_Name=circRNA_orig{i,2};
    SStr = regexp(Temp_Name, '/', 'split');
    [r,c]=size(SStr);
    if c>1
       for j=1:c
           circRNA_orig{i,j+2}=SStr{1,j};
       end
    end
end

for i=1:739
    i
    circRNA_orig{i,1}=0;
   for j=2:5 
       if ~strcmp(circRNA_orig{i,j},'')
           for k=1:661
               if strcmp(circRNA_orig{i,j},circRNA_name{k,1})
                  circRNA_orig{i,1}=j;
                  break;
               end
           end
       end       
   end
end


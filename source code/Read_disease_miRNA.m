
DirStr=['./data/disease-miRNA_P.txt'];
fidin=fopen(DirStr);             % 打开txt文件             

 miRNA=cell(2012,1);  %预设miRNA数量
 disease=cell(1637,1);  %预设disease数量

i=1;
j=1;
while ~feof(fidin)                                                       % 判断是否为文件末尾               
    tline=fgetl(fidin); 
    if tline 
        SStr = regexp(tline, 'hsa-', 'split');
        
        %%%%%处理miRNA
        Temp_miRNA = SStr(2); %取第二列
        Temp_miRNA = strcat('hsa-',Temp_miRNA);%再连接起来
        flag_miR = 1;
        for ii=1:i
            i
            flag_miR=strcmp(miRNA(ii,1),Temp_miRNA(1,1)); %判断是否相同=1,不相同=0加入
            if flag_miR == 1
                break;
            end
        end
        if flag_miR == 0
            miRNA(i)= Temp_miRNA;
            i=i+1;
        end
        
         %%%%%处理disease
        Temp_disease = SStr(1); %取第一列
        flag_disease = 1;
        for jj=1:j
            
            flag_disease=strcmp(disease(jj,1),Temp_disease(1,1)); %判断是否相同=1,不相同=0加入
            if flag_disease == 1
                break;
            end
        end
        if flag_disease == 0
            disease(j)= Temp_disease;
            j=j+1;
        end
    end
end
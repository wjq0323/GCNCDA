DirStr=['./data/miRNA similarity matrix.txt'];
fidin=fopen(DirStr);             % 打开txt文件    

miRNA_similarity_matrix=[];
i=1;
while ~feof(fidin)                                                       % 判断是否为文件末尾               
    tline=fgetl(fidin); 
    if tline 
        SStr = regexp(tline, '\s+', 'split');
        for j=1:271
            miRNA_similarity_matrix(i,j)=str2num(char(SStr(1,j)));
        end
        i=i+1;
    end
end
fclose(fidin);

%%%%%%  读miRNA名字 %%%%%
DirStr=['./data/microRNA name.txt'];
fidin=fopen(DirStr);             % 打开txt文件    

microRNA_name=cell(271,1);
i=1;
while ~feof(fidin)                                                       % 判断是否为文件末尾               
    tline=fgetl(fidin); 
    if tline 
        SStr = regexp(tline, '\s+', 'split');
       
        microRNA_name(i,1)=SStr(1,1);

        i=i+1;
    end
end
 fclose(fidin);   
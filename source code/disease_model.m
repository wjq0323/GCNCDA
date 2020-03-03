
DirStr=['./data/MeshID.txt'];
fidin=fopen(DirStr);             

MeshID=cell(11241,2);  
i=1;
while ~feof(fidin)                                                      
    tline=fgetl(fidin); 
    if tline 
        SStr = regexp(tline, ';', 'split');
        MeshID(i,1)=SStr(1);
        MeshID(i,2)=SStr(2);
        i=i+1;
    end
end
fclose(fidin);



load('./data/CircR2Disease.mat');
load('./data/Mesh_disease.mat');
load('./data/MeshID_DV_all.mat');


disease_Str=cell(4594,2); 
for i=1:4594
    i
   disease_Str(i,1)=strtrim(cellstr(Mesh_Disease(i)));
   for j=1:11241
       if strcmpi(disease_Str(i),MeshID(j,1))
           disease_Str(i,2)=strcat(disease_Str(i,2),MeshID(j,2),'-');
       end
   end
end

 Dise_Num=100;

 DV=cell(Dise_Num,10); 

for i=1:Dise_Num
    i    
    j=3; 
    DV=add_node(i,j,DV,disease{i,1},disease_Str,MeshID);
    DV(i,2)=strcat(disease(i,1),'*');
end


for i=1:Dise_Num
    i
    for j=3:10
        if isempty(DV{i,j})
            break;
        else
            Temp3=regexp(DV{i,j}, '*', 'split');
            [h3,l3] = size(Temp3);
            for k=1:l3  
                for p=j:10  
                    if ~isempty(DV{i,p})
                        Temp5=regexp(DV{i,p}, '*', 'split');
                        [h5,l5]=size(Temp5);
                        for q=1:l5 
                            if strcmpi(Temp3(1,k),Temp5(1,q))
                                Temp5{1,q}=[]; 
                            end
                        end
                        if p==j 
                            Temp5=[Temp5,Temp3(1,k)];
                        end
                        

                        DV{i,p} = [];
                        [h6,l6]=size(Temp5);
                        for q=1:l6
                            if ~isempty(Temp5{1,q})
                                DV(i,p) = strcat(Temp5(1,q),'*',DV(i,p));
                            end
                        end
                    end
                    
                end
            end
        end
    end
end


for i=1:Dise_Num
     if isempty(DV{i,3}) 
        DV(i,1)=num2cell(1);
     else
        j=3;
        value=1;
        aa=0.5  
        while  j<=10 && ~isempty(DV{i,j})
            Temp3 = regexp(DV{i,j}, '*', 'split'); 
            [h3,l3] = size(Temp3);
            value = value + aa*(l3-1); 
            aa=aa*0.5;  
            j=j+1;
        end
        DV(i,1)=num2cell(value);
     end
end



for i=1:4594
     if isempty(DV_all{i,3}) 
        DV_all(i,1)=num2cell(1);  
     else
        j=3;
        value=1;
        aa=0.5  
        while ~isempty(DV_all{i,j})
            Temp3 = regexp(DV_all{i,j}, '*', 'split'); 
            [h3,l3] = size(Temp3);
            value = value + aa*(l3-1); 
            aa=aa*0.5;  
            j=j+1;
        end
        DV_all(i,1)=num2cell(value);
     end
end





S=zeros(Dise_Num,Dise_Num); 
for i=1:Dise_Num
    i
    for j=1:Dise_Num
        if i==14 && j==12
           aaa=[]; 
        end

        if isempty(DV{i,3})|| isempty(DV{j,3})
            S(i,j)=0;
        else

            dis1_str='';
            dis2_str='';
            for k=2:10
                if ~isempty(DV{i,k})
                    dis1_str=strcat(dis1_str,DV{i,k});
                end
            end
            for k=2:10
                if ~isempty(DV{j,k})
                    dis2_str=strcat(dis2_str,DV{j,k});
                end
            end
            
            

            dis1=regexp(dis1_str,'*','split');  
            dis2=regexp(dis2_str,'*','split');  

            [h5,l5] = size(dis1);
            [h6,l6] = size(dis2);
            for p=1:l5-1
                for q=1:l6-1  
                    if strcmpi(dis1(1,p),dis2(1,q))
                        value_Same=0;  
                        value_Same1=0;  
                        value_Same2=0;  
                        for k=1:4594  
                            if strcmpi(dis1(1,p),disease_Str(k,1))
                                  value_Same=0.5*DV_all{k,1}; 
                                  break;
                            end
                        end

                        [bool,inx1]=ismember(disease{i,1},disease_Str(:,1));
                        if inx1 > 0
                            C_num=2; 
                            for r=2:10
                                if ~isempty(DV_all{inx1,r})
                                    Temp6 = regexp(DV_all{inx1,r},'*','split');
                                    [h8,l8]=size(Temp6);
                                    for rr=1:l8
                                        if strcmpi(dis1(1,p),Temp6(1,rr))
                                            C_num=r;
                                            break;
                                        end
                                    end 
                                end
                            end
                           value_Same1=0.5^(C_num-3)*value_Same; 
                        end
             

                        [bool,inx2]=ismember(disease{j,1},disease_Str(:,1));
                        if inx2 > 0
                            C_num2=2; 
                            for r2=2:10
                                if ~isempty(DV_all{inx2,r2}) && inx2~=0
                                    Temp7 = regexp(DV_all{inx2,r2},'*','split');
                                    [h9,l9]=size(Temp7);
                                    for rr=1:l9
                                        if strcmpi(dis2(1,q),Temp7(1,rr))
                                            C_num2=r2;
                                            break;
                                        end
                                    end 
                                end
                            end
                           value_Same2=0.5^(C_num2-3)*value_Same;
                        end
                        
                        value_s=(value_Same1+value_Same2)/(DV{i,1}+DV{j,1});
                        if S(i,j)<value_s  
                            S(i,j)=value_s;
                            break;    
                        end
                       break;
                    end
                end
            end
        end
        

        if i==j
            S(i,j)=1;
        end
    end
end


    



SD=zeros(100,100); 
for i=1:100
   for j=1:100
       SD(i,j)=(S(i,j)+SS(i,j))/2;
   end
end

for i=1:100
   for j=1:100
       if SD(i,j)==0
            SD(i,j)=Gaussian_Dis(i,j);
       end
   end
end

SD=[SD,JD];


SC=[Gaussian_cricR,JC];


[aa,bb]=pca(SC);
cc=SC*aa(:,1:200);  
SC=cc;


i=1; 
CircR2Disease_N=cell(739,2);
while i<=739
    h=randperm(100,1); 
    l=randperm(661,1); 
    Test=A(h,l);
    if Test==0
        CircR2Disease_N(i,2)=disease(h,1);
        CircR2Disease_N(i,1)=circRNA(l,1);
        i=i+1;
    end
end

data_DCT=zeros(739*2,401);
for i=1:739 
    i
    data_DCT(i,1)=1;
    node_Dis=CircR2Disease_P{i,2};
    node_RNA=CircR2Disease_P{i,1};
    Dis_Num=Search_Node(node_Dis,'Dis',disease,circRNA);
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    
    data_DCT(i,2:401)=[SD(Dis_Num,:),SC(RNA_Num,:)];
end

for i=740:1478  
    i
    data_DCT(i,1)=-1;
    node_Dis=CircR2Disease_N{i-739,2};
    node_RNA=CircR2Disease_N{i-739,1};
    Dis_Num=Search_Node(node_Dis,'Dis',disease,circRNA);
    RNA_Num=Search_Node(node_RNA,'RNA',disease,circRNA);
    
    data_DCT(i,2:401)=[SD(Dis_Num,:),SC(RNA_Num,:)];
end




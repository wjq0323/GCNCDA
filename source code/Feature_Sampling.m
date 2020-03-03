 % clear;clc 
ratio = 0.9;

AllData = data_DCT;
[row,col] = size(AllData);

Value_All = zeros(2,col-1);  

for i=2:col   
    i
    Temp_V = AllData(: , i);  
    Temp_V3 = [AllData(: ,1) Temp_V];  
    Value_All(1,i-1) = i-1;    
   
    HuiZong = tabulate(Temp_V);          
    Temp_V2 = [];
    Temp_V2 = sortrows(HuiZong,-1);       
    
    [m,nnn] = size(Temp_V2);     
    Temp_a = zeros(m,1);    
    Temp_V2 = [Temp_V2 Temp_a];
    
   
    for j=1:m            
        for k =1:row
            if Temp_V2(j,1) == Temp_V3(k,2)
                if Temp_V3(k,1) == 1
                    Temp_V2(j,4) = Temp_V2(j,4)+1;
                end
            end
        end       
    end

    O = zeros(m,2);
    E = zeros(m,2);
    c1 = 0;  
    for j=1:m
            O(j,1) = Temp_V2(j,4);
            O(j,2) = Temp_V2(j,2) - Temp_V2(j,4);
            c1 = c1+Temp_V2(j,4);
    end
    for j=1:m
        E(j,1) = (Temp_V2(j,2) * c1)/row;   
        E(j,2) = (Temp_V2(j,2) * (m - c1))/row;
    end
    

    Weight = 0;
    for j=1:m
        for k =1:2
            Weight = Weight + (O(j,k) - E(j,k))^2/E(j,k);
        end
    end
    
    Value_All(2,i-1) = Weight;
end

Value_All2 = Value_All';
Value_All2 = sortrows(Value_All2,-2);
Value_All2 = Value_All2';


newfeature2 = Value_All2(1,:);
L =floor( ratio * (col-1));   
newfeature3 = newfeature2(:, 1:L);

AllData2 = AllData(:,2:end);
data_DCT=AllData2(:,newfeature3); 


for m=1:5
data1=data_DCT';
p=randperm(size(data1,1));
data2=data1(p(1:size(data1,1)),:);
data_DCT=data2';
end
 

data_DCT =  [AllData(: ,1) data_DCT];


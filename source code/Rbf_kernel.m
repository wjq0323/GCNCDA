
Gaussian_Dis = zeros(100,100);
pare_a=0; 
sum=0; 
temp=0;

for i=1:100   
    temp=norm(A(i,:));
    sum=sum+temp^2;
end
pare_a=1/(sum/100);

for i=1:100
    i
    for j=1:100
        Gaussian_Dis(i,j)=exp(-pare_a*(norm(A(i,:)-A(j,:))^2));
    end
end


Gaussian_cricR = zeros(661,661);
pare_b=0; 
sum=0; 
temp=0;

for i=1:661   
    temp=norm(A(:,i));
    sum=sum+temp^2;
end
pare_b=1/(sum/661);

for i=1:661
    i
    for j=1:661
        Gaussian_cricR(i,j)=exp(-pare_b*(norm(A(:,i)-A(:,j))^2));
    end
end

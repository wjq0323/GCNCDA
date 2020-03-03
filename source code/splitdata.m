
Yeast_data=data_DCT;
% Yeast_data=Feature;
p=randperm(size(Yeast_data,1));
% for i = 1:size(Yeast_data,1)
%     i
%     Yeast_data(i,2:81)=Yeast_data(i,2:81)/norm(Yeast_data(i,2:81));
% %     Yeast_data(i,2:81)=mapminmax(Yeast_data(i,2:81),0,1);
% end

dataall=Yeast_data;
dataall=dataall(p(1:size(Yeast_data,1)),:);
flod_num=5; 
step =floor(size(dataall,1)/flod_num);
j=1
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Yeast_f1_test_feature = dataall(cv_p,2:81);
     Yeast_f1_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Yeast_f1_train_feature= A(:,2:81);
     Yeast_f1_train_label=A(:,1);
     
j=2
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Yeast_f2_test_feature = dataall(cv_p,2:81);
     Yeast_f2_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Yeast_f2_train_feature= A(:,2:81);
     Yeast_f2_train_label=A(:,1);

j=3
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Yeast_f3_test_feature = dataall(cv_p,2:81);
     Yeast_f3_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Yeast_f3_train_feature= A(:,2:81);
     Yeast_f3_train_label=A(:,1);
     
j=4
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Yeast_f4_test_feature = dataall(cv_p,2:81);
     Yeast_f4_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Yeast_f4_train_feature= A(:,2:81);
     Yeast_f4_train_label=A(:,1);

j=5
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Yeast_f5_test_feature = dataall(cv_p,2:81);
     Yeast_f5_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Yeast_f5_train_feature= A(:,2:81);
     Yeast_f5_train_label=A(:,1);
     
     
     
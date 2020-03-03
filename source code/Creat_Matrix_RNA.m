
Mat={'AAA','AAC','AAG','AAU','ACA','ACC','ACG','ACU','AGA','AGC','AGG','AGU','AUA','AUC','AUG','AUU',    'CAA','CAC','CAG','CAU','CCA','CCC','CCG','CCU','CGA','CGC','CGG','CGU','CUA','CUC','CUG','CUU',    'GAA','GAC','GAG','GAU','GCA','GCC','GCG','GCU','GGA','GGC','GGG','GGU','GUA','GUC','GUG','GUU',    'UAA','UAC','UAG','UAU','UCA','UCC','UCG','UCU','UGA','UGC','UGG','UGU','UUA','UUC','UUG','UUU'};


for k=1:1057     
    Sequence=miRNA(k,2);   
    Sequence=cell2mat(Sequence);
    len=length(Sequence);    
    
    k
    Seq_Mat=zeros(64,len-2);  
    for i=1:len-2
        TmpmStr=Sequence(i:i+2);
        for j=1:64
            if strcmp(TmpmStr,Mat(j))
                Seq_Mat(j,i)=1;
                break;
            end
        end      
    end
    miRNA_Mat(k)=mat2cell(Seq_Mat,64,len-2);
end
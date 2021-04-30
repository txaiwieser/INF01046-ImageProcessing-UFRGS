function[I_re]=Kmeans_Pre_Post(I1,L,K)
    %% cria os vetores de dimensionalidade sqrt(L)*2 da imagem de entrada
    % L deve ser quadrado (L=4=>2x2,16=>4x4,64...)
    % K ? o tamanho do dicionario, aumentando K maior o tempo de processamento
    % re-arranja os pixels da imagem em um array
    % armazenado na celula"s" do array de celulas
    
    s=cell(1,floor(numel(I1)/L));
    I1_rows=size(I1,1);
    for j=1:length(s)
        for i=1:sqrt(L)
            s{j}=[s{j},I1((i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+1+rem(j-1,I1_rows/sqrt(L))*sqrt(L):(i+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+(rem(j-1,I1_rows/sqrt(L))+1)*sqrt(L))];
        end
    end
    
    % chama o algoritmo do ?kmeans_clustering? com os parametros fornecidos
    [codebook,ClusterNum]=kmeans_algoritmo(s,L,K);
    % reconstroi a imagem com os vetores do dicionario (centroides dos K clusters)
    s_re=cell(1,length(s));
    for i=1:length(s_re)
        s_re{i}=codebook{ClusterNum(i)};
    end
    I_re=zeros(size(I1));
    for j=1:length(s_re)
        for I=1:sqrt(L)
            I_re((I+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+1+rem(j-1,I1_rows/sqrt(L))*sqrt(L):(I+floor((j-1)*sqrt(L)/I1_rows)*sqrt(L)-1)*I1_rows+(rem(j-1,I1_rows/sqrt(L))+1)*sqrt(L)) = s_re{j}(1+(I-1)*sqrt(L):I*sqrt(L));
        end
    end
end
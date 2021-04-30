function new_image = quantizacao_c_kmeans(Img, L, K)
    % L?? a imagem de entrada
    Img2D_rows = size(Img, 1);
    Img2D_cols = size(Img, 2);
    %% computa o kmeans para achar o dicionario
    r1=floor(rem(Img2D_rows,sqrt(L))); % resto da divisao das linhas pelo tam do bloco
    r2=floor(rem(Img2D_cols,sqrt(L))); % resto da divisao das colunas pelo tam do bloco
    Img1=zeros(Img2D_rows+r1,Img2D_cols+r2); % imagem com tamanho adequado para reconstruir

    %% monta a imagem
    Img1(1:Img2D_rows,1:Img2D_cols)=Img;
    if r1~=0
        Pad_rows=Img(end,:);
        for j=1:r1
            Pad_rows(j,:)=Pad_rows(1,:); % 1 linha a mais
        end
        Img1(1:Img2D_rows,1:Img2D_cols)=Img;
        Img1(Img2D_rows+1:end,1:Img2D_cols)=Pad_rows;
    end
    if r1~=0 && r2~=0
        Pad_cols=Img1(:,Img2D_cols);
        for j=1:r2
            Pad_cols(:,j)=Pad_cols(:,1); % 1 coluna a mais (1 linha ja foi adicionada)
        end
        Img1(1:end,Img2D_cols+1:end)=Pad_cols;
        
    elseif r2~=0
        Pad_cols=Img(:,Img2D_cols);
        for j=1:sqrt(L)-r2
            Pad_cols(:,j)=Pad_cols(:,1); % 1 coluna a mais
        end
        Img1(1:Img2D_rows,1:Img2D_cols)=Img;
        Img1(1:Img2D_rows,Img2D_cols+1:end)=Pad_cols;
    end
    % prepara os dados e chama o algoritmo do kmeans

    new_image = Kmeans_Pre_Post(Img1,L,K);
    new_image = uint8(new_image);
end
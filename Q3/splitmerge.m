function [] = splitmerge( I )

figure,imshow(I),title('imagem original');

f=rgb2gray(I);
Q = 2^nextpow2(max(size(f)));
[M,N] = size(f);
%realiza padding para garantir funcionamento da qtdecomp
f = padarray(f,[Q-M,Q-N],'post');

%split quadratico
S = qtdecomp(f,@split_test,2,@predicate);

%pega o maior tamanho de bloco
Lmax = full(max(S(:)));

%inicializa imagem final com zeros para preencher durante o laço
g = zeros(size(f));
MARKER = zeros(size(f));

%realiza o merge baseado no treshold estabelecido pela funcao predicate
for K = 1:Lmax
    [vals,r,c] = qtgetblk(f,S,K);
    if ~isempty(vals)
        for I = 1:length(r)
            xlow = r(I);
            ylow = c(I);
            xhigh = xlow + K - 1;
            yhigh = ylow + K - 1;
            region = f(xlow:xhigh,ylow:yhigh);
            flag = feval(@predicate, region);
            if flag
                g(xlow:xhigh,ylow:yhigh) = 1;
                MARKER(xlow,ylow) = 1;
            end
        end
    end
end
% reconstrói a imagem e usa bwlabel para definir as bordas
g = bwlabel(imreconstruct(MARKER,g));
g = g(1:M,1:N);
figure,imshow(g),title('bordas definidas');
end

function v = split_test( B,mindim,fun )
%funçao auxiliar que retorna booleana para decidir se blocos devem ser
%splitados ou já são homogeneos
k = size(B,3);
v(1:k) = false;
for I = 1:k
    quadregion = B(:, :, I);
    if size(quadregion,1) <= mindim
        v(I) = false;
        continue
    end
    flag = feval(fun,quadregion);
    if flag
        v(I) = true;
    end
end
end

function flag = predicate( region )
%função auxiliar que realiza a média da região para determinar sua
%homogêniedade
sd = std2(region);
m = mean2(region);
flag = (sd > 10) & (m > 0) & (m < 255);
end
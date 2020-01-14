%Algoritmo TLBO simples
clear all
clc

%As variáveis a e b são utilizadas para estabelecer o intervalo -100 a 100,
%nas variáveis x1 e x2.
a = -100;
b = 100;
popsize = 10;
criterio = 1000;
cont = 0;

x1 = a + (b-a)*rand(1,popsize/2); 
x2 = a + (b-a)*rand(1,popsize/2);
%forma um vetor com 5 numeros aleatorios

while cont < criterio
    %Inicio da teacher phase

    %primeira tabela auxiliar 

    for i=1:popsize/2
      X(i) = x1(i).^2 + x2(i).^2;
    end

    menorValor=min(X); %Função que acha o menor valor da função

    for j=1:popsize/2  %Laço que acha o indice do menor valor da função
        if(X(j)==menorValor)
            indiceMenor = j;
        end
    end

    mediax1 = mean(x1); %Funções que calculam a media de X1 e X2
    mediax2 = mean(x2);

    Ri1 = rand; %Valores aleatórios entre 0 e 1 para Ri
    Ri2 = rand;

    %Calculo da diferença média entre os menores valores de X1, X2 e suas médias 
    diff_meanx1 = Ri1*(x1(indiceMenor) - mediax1); 
    diff_meanx2 = Ri2*(x2(indiceMenor) - mediax2);

    %Segunda tabela auxiliar, ou X' 
    f1 = x1 + diff_meanx1;
    f2 = x2 + diff_meanx2;
    for i=1:popsize/2  
        F(i) = f1(i).^2 + f2(i).^2;
    end

    %final da Teacher Phase

    %Compara��o entre a primeira tabela e a segunda tabela para criar uma
    %terceira tabela com os melhores valores de cada uma

    for i=1:popsize/2
        if(F(i)> X(i))
            H(i) = X(i);
            h1(i) = x1(i);
            h2(i) = x2(i);
        elseif(F(i)<X(i))
            H(i) = F(i);
            h1(i) = f1(i);
            h2(i) = f2(i);
        end
    end

    %Esses novos valores, f1 e f2 e F, se tornam entradas do Learner Phase
    %Aqui inicia-se o Learner Phase

    %Aqui o H � X' e G � o X''
    for i=1:popsize/2
        %indice aleat�rio para fazer as compara��es
        indiceA = randi(popsize/2);
        if(i~=indiceA)
            if(H(i)<H(indiceA)) %Compara��o realizada para obter o X''
                g1(i) = h1(i) + Ri1*(h1(i) - h1(indiceA));
                g2(i) = h2(i) + Ri2*(h2(i) - h2(indiceA));
                G(i) = g1(i).^2 + g2(i).^2;
            elseif(H(i)>H(indiceA))
                g1(i) = h1(i) + Ri1*(h1(indiceA) - h1(i));
                g2(i) = h2(i) + Ri2*(h2(indiceA) - h2(i));
                G(i) = g1(i).^2 + g2(i).^2;
            end
        else %Condi��o para caso os indices sejam iguais 
            g1(i) = h1(i);
            g2(i) = h2(i);
            G(i) = H(i);
        end
    end

    %Ultima tabela X''' para compara��o entre X' e X'', ou H, G e K 
    %Armazenando os menores valores nas novas letras K
    for i=1:popsize/2
        if(H(i)<G(i))
            k1(i) = h1(i);
            k2(i) = h2(i);
            K(i) = H(i);
        elseif(H(i)>G(i))
            k1(i) = g1(i);
            k2(i) = g2(i);
            K(i) = G(i);
        end
    end
    %Aqui termina a Learner Phase
    
    %Valores da tabela para serem reutilizados como entrada da Teacher
    %Phase
    for l=1:popsize/2
        x1(l)=k1(l);
        x2(l)=k2(l);
        X(l) = K(l);
    end
    cont = cont + 1; 
    %Contador para contar o n�mero de itera��es e sair do loop
end

%Reportando a melhor solu��o

melhorSolucao=min(K);
for d=1:popsize/2
    if(melhorSolucao==K(d))
        minIndice = d;
    end
end

disp(k1(minIndice));
disp(k2(minIndice));
disp(K(minIndice));

%Testando o git
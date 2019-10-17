%Algoritmo TLBO simples
clear all
clc

%As variáveis a e b são utilizadas para estabelecer o intervalo -100 a 100,
%nas variáveis x1 e x2.

a = -100;
b = 100;
popsize = 10;
%criterio = 1000;

%forma um vetor com 5 numeros aleatorios

x1 = a + (b-a)*rand(1,popsize/2) 
x2 = a + (b-a)*rand(1,popsize/2)

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

disp(X);

disp(indiceMenor);

Ri1 = rand; %Valores aleatórios entre 0 e 1 para Ri
Ri2 = rand;

%Calculo da diferença média entre os menores valores de X1, X2 e suas médias 
diff_meanx1 = Ri1*(x1(indiceMenor) - mediax1); 
diff_meanx2 = Ri2*(x2(indiceMenor) - mediax2);

%Segunda tabela auxiliar 
f1 = x1 + diff_meanx1
f2 = x2 + diff_meanx2
for i=1:popsize/2  
    F(i) = f1(i).^2 + f2(i).^2;
end

disp(F);

%final da Teacher Phase

%Comparação entre a primeira tabela e a segunda tabela para criar uma
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
        
disp(H);

disp(h1);
disp(h2);

%Esses novos valores, f1 e f2 e F, se tornam entradas do Learner Phase

%Aqui inicia-se o Learner Phase


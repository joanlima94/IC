%Algoritmo TLBO simples
clear all
clc

a = -100;
b = 100;
popsize = 10;
criterio = 1000;

%forma um vetor com 5 numeros aleatorios

x1 = a + (b-a)*rand(1,popsize/2) 
x2 = a + (b-a)*rand(1,popsize/2)

%teacher phase

%primeira tabela

for i=1:popsize/2
  X(i) = x1(i).^2 + x2(i).^2;
  aux(i) = abs(X(i) - criterio);
  menorDiferenca = min(aux);  
end

%guarda o indice do menor valor da funcao
for j=1:popsize/2
    if(aux(j)==menorDiferenca)
      ind = j;
    end
end  

difmeanx1 = rand(1,1)*(x1(j) - mean(x1))
difmeanx2 = rand(1,1)*(x2(j) - mean(x2))

y1 = x1 + difmeanx1
y2 = x2 + difmeanx2

%aqui termina a Teacher Phase 

%Começa a Learning Phase

%preenchendo uma nova tabela
for k=1:popsize/2  
  Y(k) = (y1(k)).^2 + (y2(k)).^2;
end

for k=1:popsize/2
  if(Y(k)>X(k))
    Z(k) = X(k);
    z1(k) = x1(k);
    z2(k) = x2(k);
  elseif(Y(k)<X(k))
    Z(k) = Y(k);
    z1(k) = y1(k);
    z2(k) = y2(k);
  end
end  
 
for k=1:popsize/2
    if()
        
 
 
disp('Vetor x');
disp(X);
disp('Vetor Y');
disp(Y);
disp('Vetor Z');
disp(Z);
disp('Vetor Z1');
disp(z1);
disp('Vetor Z2');
disp(z2);

%TF= round(rand(1,1));


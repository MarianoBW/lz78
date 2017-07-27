% 
% LZ78
%
% Mariano Berwanger Wille
%

clear all; %
close all;

%importando texto
tex = fopen('teste.txt');
texto= fscanf(tex, '%c');
%verifica tamanho do texto
[ini,fim]=size(texto);

%declaraçao de variaveis internas

x=1;         % tamanho inicial de linhas do codigo 
dictam=2;    % tamanho inicial de colunas do dicionario
dicionario(4,dictam)=zeros; % tamanho inicial do dicionario
jatem=0;     % flag de repetiçao zerada  
y=2;         % contador de colunas necessarias no dicionario no momento
code=zeros;  % codigo zerado 
h=1;         % nova linha necessaria 

for i=1:fim  % realiza varedura no texto
  if jatem==1 % verifica se uma nova coluna e necessaria
    y++;
  end  
  jatem=0; 
  x=h;       % verifica se uma nova linha e necessaria
  for j=1:x  % realiza varedura no dicionario
    dicionario(x,1)=x; % adiciona linha se necessario
    
      if (((dicionario(j,(2:y))) == (texto(1,((i-y+2):i))))&&(jatem==0)) % copara texto com dicionario
        
        code(x,1)=j; % coloca a lina de repetiçao na primeira coluna do codigo 
        
        if (dictam<=y) % adiciona nova coluna se necessario
          dictam++;
          dicionario(1,dictam)=zeros;
        end
        jatem=1;  % flag indicando repetiçao 
        dicionario(x,(2:(y)))=dicionario(j,(2:(y))); % copia valores repetidos do dicionario
        
      elseif((j==x)&&(jatem==0)) %verifica se a varedura esta completa 
        dicionario(x,1)=x;    % adiciona linha se necessario
        dicionario(x,y)=(texto(1,i)); % adiciona caracter novo ao dicionario
        y=2;                  % "zera" contador de colunas 
        code(x,2)=(texto(1,i)); % adiciona caracter novo ao codigo
        h++;                  % flag de nova linha
        
      end
  end
  if i==fim  %verifica se a varedura esta completa 
    x--;     % nova linha nao mais necessaria
  end
  
end 

% escrita do codigo em txt (nao consegui realizar a leitura para descompactar)
montcode = fopen('code.txt','wt');
for p=1:x
  fprintf(montcode,'%i',code(p,1));
  fprintf(montcode,'%c',code(p,2));
end
fclose(montcode);

% escrita do dicionario (nao necessario mas usada para debugar o codigo)
montdicionario = fopen('dicionario.txt','wt');
for p=1:x+1
  for g=1:dictam
    if g==1
      fprintf(montdicionario,'%i ',dicionario(p,g));
    elseif (dicionario(p,g)~=0)
      fprintf(montdicionario,'%c',dicionario(p,g));
    end
  end  
  fprintf(montdicionario,'\n');
end
fclose(montdicionario);



fclose(tex);













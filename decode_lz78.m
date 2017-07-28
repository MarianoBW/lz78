%declaracao de variaveis internas
[h,j]=size(code); % verifica tamanho do codigo 
x=0; % linha inicial do dicionario
y=2; % colunas do dicionario (usado para verificar se e necessario aumentar)
dictam=2; % colunas do dicionario
dic2=0; % dicionario zerado

%Reconstrucao do dicionario
for i=1:h         %realiza varredura no codigo 
      y=1;
  if ((code(i,1)==0)) % verifica se e necessario voltar no dicionario
    x++;              % aumenta uma linha
    dic2(x,1)=x;      % grava posicao do dicionario 
    dic2(x,2)=code(i,2); % grava novo valor no dicionario
    y=2;              % "zera" contador de colunas
  else
    x++;             % aumenta uma linha
    dic2(x,1)=x;     % grava posicao do dicionario
    for j=2:(dictam)   % realiza varredura dos dados na linha desejada do dicionario  
      if (dic2(code(i,1),j)~=0) % remove valores nao desejados 
        y++;           % adiciona 1 no contador de colunas do dicionario
        if y>=dictam   % verifica se e necessario aumentar o numero de colunas 
          dictam++;
          dic2(1,dictam)=zeros;
        end        
        dic2(x,j)=dic2((code(i,1)),j); % copia a linha equivalente 
        dic2(x,(j+1))=code(i,2); % adiciona o caractere novo 
      end
    end  
  end
  
end

P=1;  % posicao do inicio da gravacao 

%Decodificacao

for l=1:x            
  if (code(l,1)==0)    % verifica se e necessario voltar no dicionario
    decode(1,P)=code(l,2); % se nao necessario escreve valor imediato 
    P++;               % altera posicao da gravacao 
  else                 % se necessario voltar no dicionario
    for k=2:(dictam)   % leitura da quantidade de posicoes na linha do dicionario
      if ((dic2((code(l,1)),k))~=0)  % remove valores indesejados 
        decode(1,P)=dic2((code(l,1)),k); % copia valores do dicionario 
        P++;           % altera posicao da gravacao 
      end 
    end
    decode(1,P)=code(l,2); % copia valor imediato 
    P++;               % altera posicao da gravacao 
  end
end 


montdecode = fopen('decode.txt','wt');
fprintf(montdecode,'%c',decode);
fclose(montdecode);

% escrita do dicionario (nao necessario mas usada para debugar o codigo)
montdicionario = fopen('dic2.txt','wt');
for p=1:(x)
  for g=1:(dictam)
    if g==1
      fprintf(montdicionario,'%i ',dic2(p,g));
    elseif (dicionario(p,g)~=0)
      fprintf(montdicionario,'%c',dic2(p,g));
    end
  end  
  fprintf(montdicionario,'\n');
end
fclose(montdicionario);

% verifica se a saida descompactada e igual au arquivo de texto 
if isequal(decode(:,1:dictam-1),texto(:,1:dictam-1))
  disp("tudo OK");
else 
  disp("deu merda");
end

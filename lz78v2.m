% 
% LZ78
%
% Mariano Berwanger Wille
%

%function 


clear all;
close all;

tex = fopen('teste.txt');
texto= fscanf(tex, '%c');

[ini,fim]=size(texto);

x=1;
dictam=2;
dicionario(fim,dictam)=zeros;
jatem=0;
espera=0;
y=2;
code=zeros;
for i=1:fim
  
  jatem=0;
  
  for j=1:x
  
    if ((dicionario(j,(2:y))) == (texto(1,((i-y+2):i)))) 
      
      jatem=1;
      if (dictam==y)
        dictam++;
        dicionario(1,dictam)=zeros;
      end

      if i==fim
        dicionario(x,:)=[];
      else
        dicionario(x,1)=x;
        dicionario(x,y)=(texto(1,i));
      end
      code(x,1)=j;
      
      y++;
      
    end
    
    if ((j==x)&&(jatem==0))
      
      dicionario(x,1)=x;
      dicionario(x,y)=(texto(1,i));
      if (y==2)
        code(x,1)=0;
      end
      code(x,2)=(texto(1,i));
      x++; 
      y=2;
      
      if i==fim
        x--;
      end
      
    end
  
  end
  
  
end  

montcode = fopen('code.txt','wt');
for p=1:x
  fprintf(montcode,'%i%c ',code(p,:));
  %fprintf(montcode,'%i %c \n',code(p,:));
end
fclose(montcode);

montdicionario = fopen('dicionario.txt','wt');
for p=1:x
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


dicionario((1:x),:);
code;
P=1;


%decodificaçao 

%code2=fopen('code.txt');
%tex = fopen('teste.txt');
%%%code3= fscanf(code2, '%i %c');
%fclose(code2);
%[h,j]=size(code3);
%for i=1:(h+h-1)
%  if (mod(i,2)==1)
%    code4(((i+1)/2),1)=code3(i,1);
%  else
%    code4(((i)/2),1)=code3(i,1);
%  end
%end
%code4




for l=1:x
  if (code(l,1)==0)
    decode(1,P)=code(l,2);
    P++;
  else
    for k=2:(dictam)
      if ((dicionario((code(l,1)),k))~=0)
        decode(1,P)=dicionario((code(l,1)),k);
        P++;
      end 
    end
    decode(1,P)=code(l,2);
    P++;
  end
end 


  montdecode = fopen('decode.txt','wt');
  fprintf(montdecode,'%c',decode);
  fclose(montdecode);


fclose(tex);













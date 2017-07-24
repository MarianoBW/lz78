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
dictam=3;
dic1(fim,dictam)=zeros;
jatem=0;
espera=0;
y=3;
for i=1:fim
  
  jatem=0;
  
  for j=1:x
  
    if ((dic1(j,(3:y))) == (texto(1,((i-y+3):i)))) 
      
      jatem=1;
      if (dictam==y)
        dictam++;
        dic1(1,dictam)=zeros;
      end
        
      dic1(x,1)=x;
      dic1(x,2)=j;
      dic1(x,y)=(texto(1,i));
      y++;
      
    end
    
    if ((j==x)&&(jatem==0))
      dic1(x,1)=x;
      dic1(x,y)=(texto(1,i));
      x++; 
      y=3;
      
    end
  
  end
  
  
end  

dicionario = [dic1((1:x),1),dic1((1:x),(3:dictam))] % monta o dicionario
code = [dic1((1:x),2),dic1((1:x),3)];


for h=1:x  %organiza o codigo de saida 
  for (cod=1:(dictam-3))
    if (dic1(h,(cod+3)) ~= 0)
      code(h,2) = dic1(h,(3+cod));
    end
  end
end



%l1(1:fim)=1;
%l2(1:fim)=1;
%l3=fim
%for g=1:dictam
%  for p=1:fim
%  y=code(p,1);
%  z=code(p,2);
%    for l=1:x
%      if (texto(1:,(p:(p+(dictam-2-g))))==dicionario(l,(2:(dictam-2-g))))
%        code(l,1)=dicionario(l,1);



%    if (y~=0)
%      codefim(1,l)=y;
%      l++;
%    end
%    if (z~=0)
%      for q=1:x
%        if (z==dic)
%          codefim(1,l)=x;
%          l++;
%        end
%      end
%    end
%  end
%end


code


%decode

%for 





%fprintf('%c ',dic1(:,2) ,' %c ',dic1(:,(3:dictam))); %c %c \n',dic1(:,:))
%fprintf('%c \n',code)
%fprintf(dic);

fclose(tex);













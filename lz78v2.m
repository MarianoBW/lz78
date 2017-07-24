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
        %dicionario(x,y)=0;
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
      
    end
  
  end
  
  
end  

%dicionario = [dic1((1:x),1),dic1((1:x),(3:dictam))] % monta o dicionario
%code = [dic1((1:x),2),dic1((1:x),3)];


%for h=1:x  %organiza o codigo de saida 
%  for (cod=1:(dictam-3))
%    if (dic1(h,(cod+3)) ~= 0)
%      code(h,2) = dic1(h,(3+cod));
%    end
%  end
%end



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

dicionario((1:x),:)
code


%decode

%for 





%fprintf('%c ',dic1(:,2) ,' %c ',dic1(:,(3:dictam))); %c %c \n',dic1(:,:))
%fprintf('%c \n',code)
%fprintf(dic);

fclose(tex);













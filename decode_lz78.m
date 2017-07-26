%clear all;
%close all;

%impcode=fopen('code.txt');

%code3= fscanf(impcode, '%i');

%[h,j]=size(code3);

%fclose(impcode);

%for i=1:j
%  if (mod(i,2)==1)
%    code(((i+1)/2),1) = code3(1,i);
%  else
%    code(((i)/2),2) = code3(1,i);
%  end
%end
%code;

[h,j]=size(code);
x=0;
y=1;
dictam=2;
dic2=0;
for i=1:h     %reconstruçao do dicionario 
  if ((code(i,1)==0))
    x++;
    dic2(x,1)=x;
    dic2(x,2)=code(i,2);
    y=1;
  else
    x++;    
    y++;   
    if (y==dictam)
      dictam++;
      dic2(1,dictam)=zeros;
    end
    dic2(x,1)=x;
      for j=2:dictam
        if (dic2(code(i,1),j)~=0)
          dic2(x,j)=dic2((code(i,1)),j);
          dic2(x,(j+1))=code(i,2);
        end
      end  
  end
  
end
P=1;
for l=1:x %decodificaçao
  if (code(l,1)==0)
    decode(1,P)=code(l,2);
    P++;
  else
    for k=2:(dictam)
      if ((dic2((code(l,1)),k))~=0)
        decode(1,P)=dic2((code(l,1)),k);
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
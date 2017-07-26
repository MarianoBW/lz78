clear all;
close all;

impcode=fopen('code.txt');

code3= fscanf(impcode, '%c');

[h,j]=size(code3);

fclose(impcode);
for i=1:j
  if (mod(i,2)==1)
    code(((i+1)/2),1) = code3(1,i);
  else
    code(((i)/2),2) = code3(1,i);
  end
end
code;
[h,j]=size(code);

%for i=1:j
 % texto(1,i)=code(((i+1)/2),2)
%end

pkg load communications



clc;
 
clear all;
 
close all;
 
a=input('Mariano Berwanger Wille');
 
[m n] = size(a);%size of matrix
 
symbols=1:8;%define the symbols
 
c = zeros(8,1);%initialize the probabilities
 
for y=1:8
 
  for i=1:m
 
    for j=1:n
 
      if(a(i,j)==y)
 
         c(y) = c(y)+1;%total occurances of a symbol
      end;
 
    end;
 
  end;
 
end;
 
c = c./(m*n);%probabilities of each symbol
 
dict = huffmandict(symbols,c);%huffman coding
 
x=0;
 
for y=0:7
 
  for i=1:m
 
    for j=1:n
 
       if(a(i,j)==y)

          x=x+length(dict{y,2});%no of bits of symbols
 
        %after compression
       end
 
     end
 
   end
 
 end 
  
  abc=m*n*3;%no of bits before compression
 
  compression=abc/x;%compression ratio
 
  disp(sprintf('bits before compression = %d', abc))
 
  disp(sprintf('bits after compression = %d', x))
 
  disp(sprintf('compression = %f', compression))
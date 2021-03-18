function [result] = decimaltobase3(i)
  symbol='';
  if i<0
    symbol='-';
  end %The symbol will be add as prefix of the final base 3 number. A negative symbol will be there if the number is negative and no symbol will be there if the number if positive.
  i=abs(i);
  point1=uint32(floor(i));
  point2=double(i-double(point1));

    %The base 3 value of integral part is computing in this section
  first='';
  while(point1~=0)
    r=mod(point1,3);
    first=strcat(first,num2str(r));
    point1=floor(double(point1)/3.0);
  end
  f_reverse=reverse(first);
  point1F=strcat(symbol, f_reverse); %point1F will hold the base 3 value of integral part of the number

  %The base 3 value of fractional part computing in this section
  count=0;
  second='';
  while count<15
    r=point2*3;
    j=floor(r);
    second=strcat(second,num2str(j));
    point2=abs(r-double(j));
    count=count+1;
  end
  result=strcat(point1F, '.',second); %Concatenating the base 3 value of integral part and fractional part.
end

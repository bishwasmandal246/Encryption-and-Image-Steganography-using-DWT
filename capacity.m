function y = capacity(inputimgsrc,handles)

try
    a=imread(inputimgsrc);
catch
    disp('Unable to access input image file');
    %disp('Execution Unsuccessful...Exiting');
   % fclose('all');
    %exit;
end


[r,c]=size(a);
cap=0;
for x=0:2:r-1
    for y=0:2:c-1
        
        g=a(1+x:2+x,1+y:2+y);
        g=double(g);
        d0=g(1,2)-g(1,1);
        d1=g(2,1)-g(1,1);
        d2=g(2,2)-g(1,1);
        lk=[0 8 16 32 64 128];
        uk=[7 15 31 63 127 255 ];
        d=[d0 d1 d2];
        d=abs(d);
        emb=zeros(1,3);
        for z=1:3
            for i=1:1:6
                if (d(z)>=lk(i) && d(z)<=uk(i))
                    w=uk(i)-lk(i)+1;
                    t=log2(w);
                    emb(z)=t;
                    
                end
            end
        end
        if((emb(1)>=5 && emb(2)>=4) || (emb(1)<5 && emb(3)>=6))
            d00=g(1,2)-g(1,1);
            d01=g(2,2)-g(2,1);
            d0=[d00 d01];
            d0=abs(d0);
            for z=1:2
                for i=1:1:6
                    if (d(z)>=lk(i) && d(z)<=uk(i))
                        w=uk(i)-lk(i)+1;
                        t=log2(w);
                        cap=cap+t;
                    end
                end
            end
        else
            cap=cap+emb(1)+emb(2)+emb(3);
        end
    end
end
cap=cap-32;  %subtract 32 bit length
cap=floor(cap/8); %in bytes
%disp('Embedding Capacity of image(in bytes)=');
disp(cap);
%disp('Length of text file(in bytes)=');
%disp(len);

%if(cap<len)
    %disp('Size of Text to be hidden is greater than Embedding Capacity of the image');
 %   disp('Choose a larger image');
%end


end
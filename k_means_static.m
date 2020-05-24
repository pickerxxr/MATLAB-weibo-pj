close all;
clc;

mu1=[0 0 ];  
S1=[.1 0 ;0 .1]; 
data1=mvnrnd(mu1,S1,100);  

mu2=[1.25 1.25 ];
S2=[.1 0 ;0 .1];
data2=mvnrnd(mu2,S2,100);

mu3=[-1.25 1.25 ];
S3=[.1 0 ;0 .1];
data3=mvnrnd(mu3,S3,100);

plot(data1(:,1),data1(:,2),'b+');
hold on;
plot(data2(:,1),data2(:,2),'r+');
plot(data3(:,1),data3(:,2),'g+');
grid on;  
data=[data1;data2;data3];
N=3;
[m,n]=size(data);
pattern=zeros(m,n+1);
center=zeros(N,n);
pattern(:,1:n)=data(:,:);
for x=1:N
    center(x,:)=data( randi(300,1),:);
end
while 1 
    distence=zeros(1,N);
    num=zeros(1,N);
    new_center=zeros(N,n);

    for x=1:m
        for y=1:N
            distence(y)=norm(data(x,:)-center(y,:));
        end
        [~, temp]=min(distence);
        pattern(x,n+1)=temp;
    end
    k=0;
    for y=1:N
        for x=1:m
            if pattern(x,n+1)==y
                new_center(y,:)=new_center(y,:)+pattern(x,1:n);
                num(y)=num(y)+1;
            end
        end
        new_center(y,:)=new_center(y,:)/num(y);
        if norm(new_center(y,:)-center(y,:))<0.1 
            k=k+1;
        end
    end
    if k==N
        break;
    else
        center=new_center;
    end
end
[m, n]=size(pattern);


figure;
hold on;
for i=1:m
    if pattern(i,n)==1
        plot(pattern(i,1),pattern(i,2),'r*');
        plot(center(1,1),center(1,2),'ko'); 
    elseif pattern(i,n)==2
        plot(pattern(i,1),pattern(i,2),'g*');
        plot(center(2,1),center(2,2),'ko');
    elseif pattern(i,n)==3
        plot(pattern(i,1),pattern(i,2),'b*');
        plot(center(3,1),center(3,2),'ko');
    elseif pattern(i,n)==4
        plot(pattern(i,1),pattern(i,2),'y*');
        plot(center(4,1),center(4,2),'ko');
    else
        plot(pattern(i,1),pattern(i,2),'m*');
        plot(center(4,1),center(4,2),'ko');
    end
end
grid on;

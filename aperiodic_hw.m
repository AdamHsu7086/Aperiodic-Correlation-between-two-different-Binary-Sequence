%aperiodic correlation
clc;
clear all;
close all;

x1 = [-1 -1 -1 1 -1 -1 1 -1 -1 -1 -1 1 1 1 -1 1];
x2 = [-1 1 -1 -1 -1 1 1 1 -1 1 -1 -1 1 -1 -1 -1];

length = 16;
u = 0 : 1 : (length - 1);


for t = 1 : length %autocorrelation %delay t
    ans1(t) = 0;
    if t == length
        ans1(t) = length;
    end    
    for i = 1 : (length - t)
        ans1(t) = ans1(t) + x1(i) * x1(i + t);
    end
end

for t = 1 : length %autocorrelation %delay t
    ans2(t) = 0;
    if t == length
        ans2(t) = length;
    end    
    for i = 1 : (length - t)
        ans2(t) = ans2(t) + x2(i) * x2(i + t);
    end
end

for t = 1 : length %autocorrelation %delay t
    ans(t) = 0;
    ans1(t) = 0;
    ans2(t) = 0;
    if t == length
        ans1(t) = length;
        ans2(t) = length;
        ans(t) = ans1(t) + ans2(t);
    end    
    for i = 1 : (length - t)
        ans1(t) = ans1(t) + x1(i) * x1(i + t);
        ans2(t) = ans2(t) + x2(i) * x2(i + t);
        ans(t) = ans1(t) + ans2(t);
    end
end


ans1 = circshift(ans1 , 1);
ans2 = circshift(ans2 , 1);
ans = circshift(ans , 1);

subplot(3,1,1);
stem(u , ans1 , '-ob' , 'filled');
txt = 'ACF(f;u)';
text(1 , 15 , txt); 
yticks([-5 : 5 : 20]);
axis([0 15 -5 20]);
xlabel('u');

subplot(3,1,2);
stem(u , ans2 , '-ob' , 'filled');
txt = 'ACF(f^，;u)';
text(1 , 15 , txt); 
yticks([-5 : 5 : 20]);
axis([0 15 -5 20]);
xlabel('u');

subplot(3,1,3);
stem(u , ans , '-ob' , 'filled');
txt = 'ACF(f;u)+ACF(f^，;u)';
text(1 , 30 , txt); 
yticks([0 : 10 : 40]);
axis([0 15 0 40]);
xlabel('u');
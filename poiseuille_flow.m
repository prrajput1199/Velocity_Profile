clear all;
clc;
n = input('Enter n'); % No. of gridpoints 
c = 1/(n-1); %spacings
Y1=linspace(0,1,n);
U_analytical=((-(Y1.^2))./2)+(Y1./2); %Analytical solution
plot(U_analytical,Y1,'g','LineWidth',3);
hold on;
A = zeros(n-2);
for i = 1:n-2
    for j = 1:n-2
        if(i == j)
            A(i,j) = -2;
        elseif(i+1 == j || i == j+1)
            A(i,j) = 1;
        else
            A(i,j) = 0;
        end
    end
end
b = ones(n-2,1)*(-(1/(n-1))^2);
U_numerical = GaussElimination(A,b); % Numerical_solution
r = [0; U_numerical; 0];
c = 1/(n-1);
plot(r, 0:c:1,'--','LineWidth',1.5)
xlabel("U")
ylabel("y")
sgtitle("velocity profile in poiseuille flow (n=11)")
legend('Analytical','Numerical');
hold off;
grid on

res = 10^(-13);
A = [[1, 2, 0];
    [2, 1, 1];
    [0, 1, 0];]
[V, D] =eig(A)
eigen_value = diag(D);
norm(A*V(:,3)-eigen_value(3)*V(:,3))
x = [1; 0; 0]

ite = 0;
lambda = 0;

while res < abs(norm(A*x-lambda*x))
    y = A*x;
    ite = ite +1
    lambda = dot(y,y)/dot(y,x);
    x = y;
    x = x/norm(x);
    figure
    fig = quiver3(0,0,0,x(1),x(2),x(3));
    title(strcat(num2str(x),num2str(lambda)))
    saveas(fig,strcat('eigenvector',num2str(ite),'.png'))
end

disp('residual norm')
norm(norm(A*x-lambda*x))

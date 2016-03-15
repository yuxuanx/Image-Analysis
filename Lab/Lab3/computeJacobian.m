function jacobian = computeJacobian(X, Ps)
%computes the Jacobian given a 3 * 1- vector X and a cell array of camera matrices.
N = length(Ps);
jacobian = zeros(2*N,3); % initialization
X = [X;1];
% for i = 1:N
%     P = Ps{i};
%     lambdax = Ps{i}*[X;1];
%     lambda = lambdax(end); 
%     % calculate the Jacobian matrix
%     jacobian(2*i-1,:) = [P(1,1)/lambda - P(3,1)*lambdax(1) P(1,2)/lambda ...
%         - P(3,2)*lambdax(1) P(1,3)/lambda - P(3,3)*lambdax(1)];
%     jacobian(2*i,:) = [P(2,1)/lambda - P(3,1)*lambdax(2) P(2,2)/lambda - ...
%         P(3,2)*lambdax(2) P(2,3)/lambda - P(3,3)*lambdax(2)];
% end
for k =1:N
a = Ps{k}(1,:);
b = Ps{k}(2,:);
c = Ps{k}(3,:);
% X = [X;1];
J_11 = (a(1)*c*X-c(1)*a*X)/((c*X)^2);
J_12 = (a(2)*c*X-c(2)*a*X)/((c*X)^2);
J_13 = (a(3)*c*X-c(3)*a*X)/((c*X)^2);
J_21 = (b(1)*c*X-c(1)*b*X)/((c*X)^2);
J_22 = (b(2)*c*X-c(2)*b*X)/((c*X)^2);
J_23 = (b(3)*c*X-c(3)*b*X)/((c*X)^2);
jacobian(2*k-1:2*k,:) =[J_11 J_12 J_13;J_21 J_22 J_23];
end


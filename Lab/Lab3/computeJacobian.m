function jacobian = computeJacobian(X, Ps)
%computes the Jacobian given a 3 * 1- vector X and a cell array of camera matrices.
N = length(Ps);
jacobian = zeros(2*N,3); % initialization
for i = 1:N
    P = Ps{i};
    lambdax = Ps{i}*[X;1];
    lambda = lambdax(end); 
    % calculate the Jacobian matrix
    jacobian(2*i-1,:) = [P(1,1)/lambda - P(3,1)*lambdax(1) P(1,2)/lambda ...
        - P(3,2)*lambdax(1) P(1,3)/lambda - P(3,3)*lambdax(1)];
    jacobian(2*i,:) = [P(2,1)/lambda - P(3,1)*lambdax(2) P(2,2)/lambda - ...
        P(3,2)*lambdax(2) P(2,3)/lambda - P(3,3)*lambdax(2)];
end
end


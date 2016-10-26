function [Q, Q_inv, x_0, v, lambda_min, z, dz_dc, normal] = get_gradient(A_, b_, c)
    n = size(A_, 1);
    m = size(A_, 3);
    
    % c * A
    Ac = get_Ac(A_, c);

    % calculating Q and x_0
    [q1, q2] = eig(Ac);
    [q2, q3] = sort(diag(q2));
    q1 = q1(:, q3);
    q2 = diag(q2);
    lambda_min = q2(1, 1);
    x_0 = q1(:, 1);
    Q = Ac - lambda_min * eye(n);

    % calculating v
    b_c = b_ * c;
    Q_inv = pinv(Q, 1e-5);
    v = Q_inv * b_c;

    % z(c)
    z = norm(v) ^ 2;

    % calculating normal and gradient
    dz_dc = zeros(m, 1);
    normal = zeros(m, 1);

    for i = 1:m
        R = A_(:, :, i) - eye(n) * (x_0' * A_(:, :, i) * x_0);
        dz_dc(i) = 2 * v' * Q_inv * (b_(:, i) - R * v);
        normal(i) = (b_(:, i)' - v' * R) * x_0;
    end
    
    normal = normal / norm(normal);
end


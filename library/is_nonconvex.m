function r = is_nonconvex(A, b, c, check_f1_f2)
%% r = is_nonconvex(A, b, c, check_f1_f2)
% check if c is a normal vector for a hyperplane
% touching image F at nonconvex set
% see Theorem 3.4
% if check_f1_f2 == 1,
% then check if f_1\nparallel f_2

%% initialization
    
    if nargin == 3
        check_f1_f2 = 0;
    end

    % tolerance for lambda_min = 0
    eps0 = 1e-7;

    n = size(A, 1);
    m = size(A, 3);

    is_real = isreal(A) && isreal(b);
    if is_real
        assert(n >= 3);
        assert(m >= 3);
    else
        assert(n >= 2);
        assert(m >= 3);
    end
    
    % result
    r = 0;
    
    % c * b
    bc = b * c;
    
    % c * A
    Ac = get_Ac(A, c);
    
    % eigens of c * A
    [q1, q2] = eig(Ac);
    [~, q3] = sort(diag(q2));
    q1 = q1(:, q3);

    % require: c * A >= 0
    if sum(diag(q2) < 0) > 0
        return
    end
    
    % indexes: lambda < eps0
    inde = find(abs(eig(Ac)) < eps0);

    % simple zero eigenvalue check
    if size(inde, 1) == 1
        % zero eigenvector
        e = q1(:, inde);
        
        % check if b_c \bot e
        if abs(e' * bc + bc' * e) < eps0
            
            if check_f1_f2
                % e_0 from the article
                e0 = -pinv(Ac) * bc;

                % fill f_1 and f_2
                f1 = zeros(m, 1);
                f2 = zeros(m, 1);
                for j = 1:m
                    f1(j) = e' * A(:, :, j) * e0 + b(:, j)' * e;
                    f2(j) = e' * A(:, :, j) * e;
                end

                % check if f_1 parallel f_2
                cos_theta = abs(dot(f1, f2) / (norm(f1) * norm(f2)));
                r = (cos_theta < 1 - eps0);
            else
                r = 1;
            end
        end
    end
end
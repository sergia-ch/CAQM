clear all;

% changing cwd to directory of .m file
cd(fileparts(which(mfilename)));

% loading map
load('./maps/article_example04_C2_R4.mat');

disp('1. The map C2->R4');
for i = 1:n
    fprintf('A_%d = %s\n', i, mat2str(A(:, :, i)));
end

for i = 1:n
    fprintf('b_%d = %s\n', i, mat2str(b(:, i)));
end

%%
rand_seed = 60;
rng(rand_seed);
fprintf('3. Random seed set to %d\n', rand_seed);

%%
c_plus = get_c_plus(A, 10, 1);

fprintf('2. c_+ = %s\n', mat2str(c_plus));

%%
fprintf('4. Finding convex cut\n');
z_max = get_z_max(A, b, c_plus, 20, 500, 1);

fprintf('Result: convex cut of size %f\n', z_max);

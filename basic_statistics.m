%% Import the data and select the id
len_gz = length(length(Guangzhou(:, 1)));
len_hz = length(length(data_hz(:, 1)));
len_km = length(length(data_km(:, 1))); 
% Select the rows whose author is NOT NULL
rows_gz = Guangzhou.author ~= "NULL";
rows_hz = Hangzhou.author ~= "NULL";
rows_km = Kunming.author ~= "NULL";
% Put the id(author) column into a string vec
user_id_guangzhou = Guangzhou{rows_gz, "author"};
user_id_hangzhou= Hangzhou{rows_hz, "author"};
user_id_kunming = Kunming{rows_km, "author"};
%% Show users who posted most in the period selected(Guangzhou)
% set the ditribution array for graphing
tb_gz = tabulate(user_id_guangzhou);
guangzhou_post_distribution = zeros(length(tb_gz(:, 2)),1);
for i = 1: length(tb_gz(:, 2))
      guangzhou_post_distribution(i) = tb_gz{i, 2};
end
guangzhou_post_distribution_except1 = [];
for i = 1: length(tb_gz(:, 2))
    if tb_gz{i,2} > 30
        guangzhou_post_distribution_except1 = [guangzhou_post_distribution_except1, tb_gz{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(guangzhou_post_distribution, 'Normalization','pdf');
% plot the distribution posted more than 30
figure;
histogram(guangzhou_post_distribution_except1);

%% Show users who posted most in the period selected(Hangzhou)
tb_hz = tabulate(user_id_hangzhou);
hangzhou_post_distribution = zeros(length(tb_hz(:, 2)),1);
for i = 1: length(tb_hz(:, 2))
      hangzhou_post_distribution(i) = tb_hz{i, 2};
end
hangzhou_post_distribution_except1 = [];
for i = 1: length(tb_hz(:, 2))
    if tb_hz{i,2} > 30
        hangzhou_post_distribution_except1 = [hangzhou_post_distribution_except1, tb_hz{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(hangzhou_post_distribution, 'Normalization','pdf');
% plot the distribution posted more than 30
figure;
histogram(hangzhou_post_distribution_except1);

%% Show users who posted most in the period selected(Kunming)
tb_km = tabulate(user_id_kunming);
kunming_post_distribution = zeros(length(tb_km(:, 2)),1);
for i = 1: length(tb_km(:, 2))
      kunming_post_distribution(i) = tb_km{i, 2};
end
kunming_post_distribution_except1 = [];
for i = 1: length(tb_km(:, 2))
    if tb_km{i,2} > 30
        kunming_post_distribution_except1 = [kunming_post_distribution_except1, tb_km{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(kunming_post_distribution, 'Normalization','pdf');
% plot the distribution posted more than 30
figure;
histogram(kunming_post_distribution_except1);

%% tb_gz = tabulate(user_id_guangzhou);
id_gz_most_num = [];
for i = 1: length(tb_gz(:, 2))
   if tb_gz{i, 2} > 50
       id_gz_most_num = [id_gz_most_num, tb_gz{i, 2}];
   end
end

















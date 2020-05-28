% all about id import and statistics
% @author Alan Liu
% @version 1.0

%% Import the data and select the id
 
% Select the rows whose author is NOT NULL

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
guangzhou_post_distribution_except2 = [];
for i = 1: length(tb_gz(:, 2))
    if tb_gz{i,2} < 30
        guangzhou_post_distribution_except2 = [guangzhou_post_distribution_except2, tb_gz{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(guangzhou_post_distribution, 'Normalization','pdf');
title("Guangzhou post num distribution(all)")
% plot the distribution posted more than 30
figure;
histogram(guangzhou_post_distribution_except1);
title("Guangzhou post num distribution(>30)")
% plot the distribution posted more than 30
figure;
histogram(guangzhou_post_distribution_except2);
title("Guangzhou post num distribution(<30)")

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
hangzhou_post_distribution_except2 = [];
for i = 1: length(tb_hz(:, 2))
    if tb_hz{i,2} < 30
        hangzhou_post_distribution_except2 = [hangzhou_post_distribution_except2, tb_hz{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(hangzhou_post_distribution, 'Normalization','pdf');
title("Hangzhou post num distribution(all)")
% plot the distribution posted less than 30
figure;
histogram(hangzhou_post_distribution_except2);
title("Hangzhou post num distribution(<30)")
% plot the distribution posted less than 30
figure;
histogram(hangzhou_post_distribution_except1);
title("Hangzhou post num distribution(>30)")
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
kunming_post_distribution_except2 = [];
for i = 1: length(tb_km(:, 2))
    if tb_km{i,2} < 30
        kunming_post_distribution_except2 = [kunming_post_distribution_except2, tb_km{i, 2}];
    end
end
% plot the distribution 
figure;
histogram(kunming_post_distribution, 'Normalization','pdf');
title("Kunming post num distribution(all)")
figure;
histogram(kunming_post_distribution_except2, 'Normalization','pdf');
title("Kunming post num distribution(<30)")
% plot the distribution posted more than 30
figure;
histogram(kunming_post_distribution_except1);
title("Kunming post num distribution(>30)")
%% Most-post user in three cities
% guangzhou
id_gz_most_num = [];
gz_post_max = 0;
gz_post_max_id = tb_gz{1,1};
for i = 1: length(tb_gz(:, 2))
   if tb_gz{i, 2} > gz_post_max
       gz_post_max = tb_gz{i,2};
       gz_post_max_id = tb_gz{i, 1};
   end
end
% hangzhou
id_hz_most_num = [];
hz_post_max = 0;
hz_post_max_id = tb_hz{1,1};
for i = 1: length(tb_hz(:, 2))
   if tb_hz{i, 2} > hz_post_max
       hz_post_max = tb_hz{i,2};
       hz_post_max_id = tb_hz{i, 1};
   end
end
% Kunming
id_km_most_num = [];
km_post_max = 0;
km_post_max_id = tb_km{1,1};
for i = 1: length(tb_km(:, 2))
   if tb_km{i, 2} > km_post_max
       km_post_max = tb_km{i,2};
       km_post_max_id = tb_km{i, 1};
   end
end


















% By Alan Liu
% 2020/5/24
% Draw some pdf distribution of random variables of the dataset.

%% sentiment

% Put the device(source) column into a string vec
user_source_guangzhou = Guangzhou{rows_gz, "sentiment"};
figure;
h = histogram(user_source_guangzhou);
hold on;
h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
h_y = h.Values;
plot(h_x, h_y, 'LineWidth', 1.7);
xlabel('Sentiment');
ylabel('Count');
title('the Distribution sentiment of users', 'Fontsize', 10);

hold off;

%% whether original and whether have location
user_source_guangzhou = Guangzhou{rows_gz, "is_located"};
is_located_gz = sum(user_source_guangzhou);
is_not_located_gz = length(user_source_guangzhou) - is_located_gz;
compare_ifLocated = [is_located_gz, is_not_located_gz];
subplot(1, 2, 1); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether located");
% whether original
user_source_kunming_orig = Guangzhou{rows_gz, "is_original"};
is_located_gz = sum(user_source_kunming_orig);
is_not_located_gz = length(user_source_kunming_orig) - is_located_gz;
compare_ifLocated = [is_located_gz, is_not_located_gz];
subplot(1, 2, 2); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether original");

user_source_hangzhou = Hangzhou{rows_hz, "is_located"};
is_located_hz = sum(user_source_hangzhou);
is_not_located_hz = length(user_source_hangzhou) - is_located_hz;
compare_ifLocated = [is_located_hz, is_not_located_hz];
subplot(1, 2, 1); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether located(hz)");
% whether original
user_source_guangzhou_orig = Guangzhou{rows_hz, "is_original"};
is_located_hz = sum(user_source_guangzhou_orig);
is_not_located_hz = length(user_source_guangzhou_orig) - is_located_hz;
compare_ifLocated = [is_located_hz, is_not_located_hz];
subplot(1, 2, 2); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether original(hz)");

user_source_kunming = Kunming{rows_km, "is_located"};
is_located_km = sum(user_source_kunming);
is_not_located_km = length(user_source_kunming) - is_located_km;
compare_ifLocated = [is_located_km, is_not_located_km];
subplot(1, 2, 1); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether located(km)");
% whether original
user_source_kunming_orig = Guangzhou{rows_km, "is_original"};
is_located_km = sum(user_source_kunming_orig);
is_not_located_km = length(user_source_kunming_orig) - is_located_km;
compare_ifLocated = [is_located_km, is_not_located_km];
subplot(1, 2, 2); pie3(compare_ifLocated);
legend("Is located", "Is not located")
title("Whether original(km)");

%% likes, comments and forward
rows_gz_l = Guangzhou.likes_num > 1000 & Guangzhou.likes_num < 5000;
rows_gz_c = Guangzhou.comment_num > 1000 & Guangzhou.comment_num < 5000;
rows_gz_f = Guangzhou.forward_num > 1000 & Guangzhou.forward_num < 5000;

user_guangzhou_like = Guangzhou{rows_gz_l, "likes_num"};
user_guangzhou_comment = Guangzhou{rows_gz_c, "comment_num"};
user_guangzhou_forward = Guangzhou{rows_gz_f, "forward_num"};


figure;
subplot(1,3,1);
h = histogram(user_guangzhou_like);
hold on;
h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
h_y = h.Values;
plot(h_x, h_y, 'LineWidth', 1.7);
xlabel('like number');
ylabel('count');
title('the Distribution like number of users', 'Fontsize', 10);


subplot(1,3,2);
h = histogram(user_guangzhou_comment);
hold on;
h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
h_y = h.Values;
plot(h_x, h_y, 'LineWidth', 1.7);
xlabel('comment number');
ylabel('count');
title('the Distribution comment number of users', 'Fontsize', 10);


subplot(1,3,3);
h = histogram(user_guangzhou_forward);
hold on;
h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
h_y = h.Values;
plot(h_x, h_y, 'LineWidth', 1.7);
xlabel('forward number');
ylabel('count');
title('the Distribution forward numebr of users', 'Fontsize', 10);

hold off;

%% 3-d map for like, comment and forward numbers
rows_gz = Guangzhou.author ~= "NULL";


user_guangzhou_like = Guangzhou{rows_gz, "likes_num"};
user_guangzhou_comment = Guangzhou{rows_gz, "comment_num"};
user_guangzhou_forward = Guangzhou{rows_gz, "forward_num"};


% because there are three points are a little special, try to delete them

[like_most, like_most_pos] = maxk(user_guangzhou_like, 2);
[forw_most, for_most_pos] = maxk(user_guangzhou_forward, 1);
user_guangzhou_comment(for_most_pos) = [];
user_guangzhou_like(for_most_pos) = [];
user_guangzhou_forward(for_most_pos) = [];
for i = 1: 2
    user_guangzhou_comment(i) = [];
    user_guangzhou_like(i) = [];
    user_guangzhou_forward(i) = [];
end

% stem3([user_guangzhou_like, user_guangzhou_comment, user_guangzhou_forward]);





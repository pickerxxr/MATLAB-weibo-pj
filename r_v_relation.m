%% Calculate the centrality of users
rows_gz = Guangzhou.author ~= "NULL";
% Put the three column into a string vec
user_like_guangzhou = Guangzhou{rows_gz, "likes_num"};
user_comment_guangzhou= Guangzhou{rows_gz, "comment_num"};
user_forward_guangzhou = Guangzhou{rows_gz, "forward_num"};
user_senti_guangzhou = Guangzhou{rows_gz, "sentiment"};
user_senti_guangzhou(1) = [];
user_or_word_num_guangzhou = Guangzhou{rows_gz, "original_word_num"};
user_or_word_num_guangzhou(1) = [];
user_mention_num_guangzhou = Guangzhou{rows_gz, "mention_num"};
user_mention_num_guangzhou(1) = [];
user_topic_num_guangzhou = Guangzhou{rows_gz, "topic_num"};
user_topic_num_guangzhou(1) = [];
user_forward_num_guangzhou = Guangzhou{rows_gz, "forward_word_num"};
user_forward_num_guangzhou(1) = [];
user_forward_link_guangzhou = Guangzhou{rows_gz, "forward_link_length"};
user_forward_link_guangzhou(1) = [];


[lar_cen, lar_cen_pos] = maxk(centrality_gz, 1);
centrality_gz(lar_cen_pos) = [];

centrality_gz = 0.1 * user_like_guangzhou + 0.2 * user_comment_guangzhou + ...
    0.7 * user_forward_guangzhou;

centrality_gz = centrality_gz / max(abs(centrality_gz));


%% All the relation corrcoef with the centrality

% sentiment
senti_co = corrcoef(centrality_gz, user_senti_guangzhou);

%original_word_num
orig_word_num_co = corrcoef(centrality_gz, user_or_word_num_guangzhou);

% mention_num
mention_num_co = corrcoef(centrality_gz, user_mention_num_guangzhou);

% topic_num
topic_num_co = corrcoef(centrality_gz, user_topic_num_guangzhou);

% forward_word_num

forward_num_co = corrcoef(centrality_gz, user_forward_num_guangzhou);

% forward_link_num
forward_link_num = corrcoef(centrality_gz, user_forward_link_guangzhou);

% like and comment

like_comment = corrcoef(user_like_guangzhou, user_comment_guangzhou);
like_forward = corrcoef(user_like_guangzhou, user_forward_guangzhou);


%% cvs fitting of like and commment

% cvx package installed
% linear optimization


% Select the rows 
% clean the data: clean the too-large and too-small
rows_gz = Guangzhou.likes_num > 10 & Guangzhou.likes_num < 1000;

% Put the id(author) column into a string vec
user_like_guangzhou = Guangzhou{rows_gz, "likes_num"};
user_comment_guangzhou = Guangzhou{rows_gz, "comment_num"};

% y = a1 + a2 * x
% A =  ons(), user_like
A = [ones(length(user_like_guangzhou), 1), user_like_guangzhou]; 
b = user_comment_guangzhou;

% user cvx tool to optimize the least squares method 
cvx_begin
variables x(2)
minimize  norm(A*x - b)  % minimize the sum of distance 
cvx_end

% x =   
%     9.2712
%     0.2058

% ploy all the points of like and comment
% plot the regression line

plot(user_like_guangzhou, user_comment_guangzhou, ".r");
hold on;
m = 10: 0.1: 1000;
n = 9.2712 + 0.2058 * m;
plot(m, n, '-b', "LineWidth", 2.0);
legend("like-comment", "linear regression");
title("cvx method")
hold off;

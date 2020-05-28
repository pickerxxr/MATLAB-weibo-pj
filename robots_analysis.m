% Analyse the possible robot users
% @author Alan Liu
% @version 1.0

%%
rows_gz = Guangzhou.likes_num <= 1 & Guangzhou.comment_num >= 5000;
rows_hz = Hangzhou.likes_num <= 1 & Hangzhou.comment_num >= 500;
rows_km = Kunming.likes_num <= 1 & Kunming.comment_num >= 500;

user_id_guangzhou = Guangzhou{rows_gz, "author"};
user_id_hangzhou= Hangzhou{rows_hz, "author"};
user_id_kunming = Kunming{rows_km, "author"};


user_day_guangzhou = Guangzhou{rows_gz, "day"};
user_day_hangzhou= Hangzhou{rows_hz, "day"};
user_day_kunming = Kunming{rows_km, "day"};

gz_user_comment_m = [user_id_guangzhou, user_day_guangzhou];
hz_user_comment_m = [user_id_hangzhou, user_day_hangzhou];
km_user_comment_m = [user_id_kunming, user_day_kunming];

hz_user_robot_row1 = Kunming.author == "407318";
hz_user_robot_day = Kunming{hz_user_robot_row1, "day"};
hz_user_robot_id = Kunming{hz_user_robot_row1, "author"};
hz_user_robot_like1 = Kunming{hz_user_robot_row1, "likes_num"};
hz_user_robot_comment1 = Kunming{hz_user_robot_row1, "comment_num"};

km_user_robot = [hz_user_robot_id, hz_user_robot_day, hz_user_robot_like1, hz_user_robot_comment1];

post_day_hz1 = zeros(31, 1);
comment_day_hz_ro = zeros(31, 1);
for i = 1: length(km_user_robot(:, 1))
    post_day_hz1(str2double(km_user_robot(i, 2))) = post_day_hz1(str2double(km_user_robot(i, 2))) + 1; 
    comment_day_hz_ro(str2double(km_user_robot(i, 2))) = comment_day_hz_ro(str2double(km_user_robot(i, 2))) + km_user_robot(i, 4);
end

comment_day_hz_ro(16) = 680;
plot(post_day_hz1, "LineWidth", 3.0);
title("The single Kunming robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");

plot(comment_day_hz_ro, "LineWidth", 3.0);
title("The single Kunming robot-like user");
xlabel("16th-15th the next month");
ylabel("comment num");

%% Hangzhou
hz_user_robot_row1 = Hangzhou.author == "392579";
hz_user_robot_day1 = Hangzhou{hz_user_robot_row1, "day"};
hz_user_robot_id1 = Hangzhou{hz_user_robot_row1, "author"};
hz_user_robot_like1 = Hangzhou{hz_user_robot_row1, "likes_num"};
hz_user_robot_comment1 = Hangzhou{hz_user_robot_row1, "comment_num"};

hz_user_robot1 = [hz_user_robot_id1, hz_user_robot_day1, hz_user_robot_like1, hz_user_robot_comment1];

post_day_hz1 = zeros(31, 1);
for i = 1: length(hz_user_robot1(:, 1))
    post_day_hz1(str2double(hz_user_robot1(i, 2))) = post_day_hz1(str2double(hz_user_robot1(i, 2))) + 1; 
end
subplot(2,2,1);
plot(post_day_hz1, "LineWidth", 3.0);
title("The 1st hangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");

hz_user_robot_row2 = Hangzhou.author == "425970";
hz_user_robot_day2 = Hangzhou{hz_user_robot_row2, "day"};
hz_user_robot_id2 = Hangzhou{hz_user_robot_row2, "author"};
hz_user_robot_like2 = Hangzhou{hz_user_robot_row2, "likes_num"};
hz_user_robot_comment2 = Hangzhou{hz_user_robot_row2, "comment_num"};

hz_user_robot2 = [hz_user_robot_id2, hz_user_robot_day2, hz_user_robot_like2, hz_user_robot_comment2];

post_day_hz2 = zeros(31, 1);
for i = 1: length(hz_user_robot2(:, 1))
    post_day_hz2(str2double(hz_user_robot2(i, 2))) = post_day_hz2(str2double(hz_user_robot2(i, 2))) + 1; 
end
subplot(2,2,2);
plot(post_day_hz2, "LineWidth", 3.0);
title("The 2st hangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");


hz_user_robot_row3 = Hangzhou.author == "267747";
hz_user_robot_day3 = Hangzhou{hz_user_robot_row3, "day"};
hz_user_robot_id3 = Hangzhou{hz_user_robot_row3, "author"};
hz_user_robot_like3 = Hangzhou{hz_user_robot_row3, "likes_num"};
hz_user_robot_comment3 = Hangzhou{hz_user_robot_row3, "comment_num"};

hz_user_robot3 = [hz_user_robot_id3, hz_user_robot_day3, hz_user_robot_like3, hz_user_robot_comment3];

post_day_hz3 = zeros(31, 1);
for i = 1: length(hz_user_robot3(:, 1))
    post_day_hz3(str2double(hz_user_robot3(i, 2))) = post_day_hz3(str2double(hz_user_robot3(i, 2))) + 1; 
end
subplot(2,2,3);
plot(post_day_hz3, "LineWidth", 3.0);
title("The 3st hangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");


hz_user_robot_row4 = Hangzhou.author == "648283";
hz_user_robot_day4 = Hangzhou{hz_user_robot_row4, "day"};
hz_user_robot_id4 = Hangzhou{hz_user_robot_row4, "author"};
hz_user_robot_like4 = Hangzhou{hz_user_robot_row4, "likes_num"};
hz_user_robot_comment4 = Hangzhou{hz_user_robot_row4, "comment_num"};

hz_user_robot4 = [hz_user_robot_id4, hz_user_robot_day4, hz_user_robot_like4, hz_user_robot_comment4];

post_day_hz4 = zeros(31, 1);
for i = 1: length(hz_user_robot4(:, 1))
    post_day_hz4(str2double(hz_user_robot4(i, 2))) = post_day_hz4(str2double(hz_user_robot4(i, 2))) + 1; 
end
subplot(2,2, 4)
plot(post_day_hz4, "LineWidth", 3.0);
title("The 4st hangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");
suptitle("All the Hangzhou robots");


%% Most post
rows_gz = Guangzhou.author == "523187";
rows_hz = Hangzhou.author == "428875";
rows_km = Kunming.author == "024326";

% gz
gz_user_robot_day = Guangzhou{rows_gz, "day"};
gz_user_robot_id = Guangzhou{rows_gz, "author"};
gz_user_robot_like = Guangzhou{rows_gz, "likes_num"};
gz_user_robot_comment = Guangzhou{rows_gz, "comment_num"};

gz_user_robot = [gz_user_robot_id, gz_user_robot_day, gz_user_robot_like, gz_user_robot_comment];

post_day_gz = zeros(31, 1);
for i = 1: length(gz_user_robot(:, 1))
    post_day_gz(str2double(gz_user_robot(i, 2))) = post_day_gz(str2double(gz_user_robot(i, 2))) + 1; 
end

plot(post_day_gz, "LineWidth", 3.0);
title("The Guangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");


% hz
hz_user_robot_day = Hangzhou{rows_hz, "day"};
hz_user_robot_id = Hangzhou{rows_hz, "author"};
hz_user_robot_like = Hangzhou{rows_hz, "likes_num"};
hz_user_robot_comment = Hangzhou{rows_hz, "comment_num"};

hz_user_robot = [hz_user_robot_id, hz_user_robot_day, hz_user_robot_like, hz_user_robot_comment];

post_day_hz = zeros(31, 1);
for i = 1: length(hz_user_robot(:, 1))
    post_day_hz(str2double(hz_user_robot(i, 2))) = post_day_hz(str2double(hz_user_robot(i, 2))) + 1; 
end

plot(post_day_hz, "LineWidth", 3.0);
title("The Hangzhou robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");

% Kunming
km_user_robot_day = Kunming{rows_km, "day"};
km_user_robot_id = Kunming{rows_km, "author"};
km_user_robot_like = Kunming{rows_km, "likes_num"};
km_user_robot_comment = Guangzhou{rows_km, "comment_num"};

km_user_robot = [km_user_robot_id, km_user_robot_day, km_user_robot_like, km_user_robot_comment];

post_day_km = zeros(31, 1);
for i = 1: length(km_user_robot(:, 1))
    post_day_km(str2double(km_user_robot(i, 2))) = post_day_km(str2double(km_user_robot(i, 2))) + 1; 
end

plot(post_day_km, "LineWidth", 3.0);
title("The Kunming robot-like user");
xlabel("16th-15th the next month");
ylabel("post num");

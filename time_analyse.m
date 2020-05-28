% Time-series analysis (with influence of COVID-19)
% @author Alan Liu
% @version 1.0

%% 
rows_gz_time = Guangzhou.month == 1;
rows_hz_time = Hangzhou.month == 1;
rows_km_time = Kunming.month == 1;

user_time_guangzhou = Guangzhou{rows_gz_time, "day"};
user_time_hangzhou= Hangzhou{rows_hz_time, "day"};
user_time_kunming = Kunming{rows_km_time, "day"};

user_sentiment_guangzhou = Guangzhou{rows_gz_time, "sentiment"};
user_sentiment_hangzhou= Hangzhou{rows_hz_time, "sentiment"};
user_sentiment_kunming = Kunming{rows_km_time, "sentiment"};
%% Guangzhou
gz_time_senti_count = zeros(17, 1);
gz_time_senti = zeros(17, 1);
for i = 1: length(user_sentiment_guangzhou)
   tmp = user_time_guangzhou(i) - 14;
   gz_time_senti(tmp) = gz_time_senti(tmp) + user_sentiment_guangzhou(i);
   gz_time_senti_count(tmp) = gz_time_senti_count(tmp) + 1;
end
ave_gz_time_senti = zeros(17, 1);
for j = 1: 17
    ave_gz_time_senti(j) = gz_time_senti(j) / gz_time_senti_count(j);
end

January_days = 15: 31;
subplot(1,3,1);
plot(January_days, ave_gz_time_senti,'-r');
xlabel("Date(January)"); ylabel("Sentiment");
legend("Guangzhou");
%% Hangzhou
hz_time_senti_count = zeros(17, 1);
hz_time_senti = zeros(17, 1);
for i = 1: length(user_sentiment_hangzhou)
   tmp = user_time_hangzhou(i) - 14;
   hz_time_senti(tmp) = hz_time_senti(tmp) + user_sentiment_hangzhou(i);
   hz_time_senti_count(tmp) = hz_time_senti_count(tmp) + 1;
end
ave_hz_time_senti = zeros(17, 1);
for j = 1: 17
    ave_hz_time_senti(j) = hz_time_senti(j) / hz_time_senti_count(j);
end

January_days = 15: 31;
subplot(1,3,2);
plot(January_days, ave_hz_time_senti,'-g');
xlabel("Date(January)"); ylabel("Sentiment");
legend("Hangzhou");

%% Kunming
km_time_senti_count = zeros(17, 1);
km_time_senti = zeros(17, 1);
for i = 1: length(user_sentiment_kunming)
   tmp = user_time_kunming(i) - 14;
   km_time_senti(tmp) = km_time_senti(tmp) + user_sentiment_kunming(i);
   km_time_senti_count(tmp) = km_time_senti_count(tmp) + 1;
end
ave_km_time_senti = zeros(17, 1);
for j = 1: 17
    ave_km_time_senti(j) = km_time_senti(j) / km_time_senti_count(j);
end

January_days = 15: 31;
subplot(1,3,3);
plot(January_days, ave_km_time_senti,'-b');
xlabel("Date(January)"); ylabel("Sentiment");
legend("Kunming");

suptitle("Time-Sentiment curve");



%% graph in one figure
figure;
plot(January_days, ave_gz_time_senti,'-r');
xlabel("Date(January)"); ylabel("Sentiment");
hold on;
plot(January_days, ave_hz_time_senti,'-g');
hold on;
plot(January_days, ave_km_time_senti,'-b');
hold off;
legend("Guangzhou", "Hangzhou", "Kunming");
suptitle("Three curves in one figure");


%% tags
rows_gz_time = Guangzhou.month == 1;
rows_hz_time = Hangzhou.month == 1;
rows_km_time = Kunming.month == 1;

user_time_guangzhou = Guangzhou{rows_gz_time, "day"};
user_time_hangzhou= Hangzhou{rows_hz_time, "day"};
user_time_kunming = Kunming{rows_km_time, "day"};

user_tags_guangzhou = Guangzhou{rows_gz_time, "tag_num"};

%% Guangzhou_tags
gz_time_tags_count = zeros(17, 1);
gz_time_tags = zeros(17, 1);
for i = 1: length(user_tags_guangzhou)
   tmp = user_time_guangzhou(i) - 14;
   gz_time_tags(tmp) = gz_time_tags(tmp) + user_tags_guangzhou(i);
   gz_time_tags_count(tmp) = gz_time_tags_count(tmp) + 1;
end
ave_gz_time_tags = zeros(17, 1);
for j = 1: 17
    ave_gz_time_tags(j) = gz_time_tags(j) / gz_time_tags_count(j);
end

January_days = 15: 31;
plot(January_days, ave_gz_time_tags,'-r');
xlabel("Date(January)"); ylabel("tags");
legend("Guangzhou(tags)");
title("Time-TagsNum");
hold on;

%% plot in one graph
user_sentiment_guangzhou = Guangzhou{rows_gz_time, "sentiment"};
user_sentiment_hangzhou= Hangzhou{rows_hz_time, "sentiment"};
user_sentiment_kunming = Kunming{rows_km_time, "sentiment"};

gz_time_senti_count = zeros(17, 1);
gz_time_senti = zeros(17, 1);
for i = 1: length(user_sentiment_guangzhou)
   tmp = user_time_guangzhou(i) - 14;
   gz_time_senti(tmp) = gz_time_senti(tmp) + user_sentiment_guangzhou(i);
   gz_time_senti_count(tmp) = gz_time_senti_count(tmp) + 1;
end
ave_gz_time_senti = zeros(17, 1);
for j = 1: 17
    ave_gz_time_senti(j) = gz_time_senti(j) / gz_time_senti_count(j);
end

January_days = 15: 31;
plot(January_days, ave_gz_time_tags,'-r');
hold on;
plot(January_days, ave_gz_time_senti,'-b');
ylabel("tags / sentiment")
legend("Guangzhou(tags)", "Guangzhou(sentiment)");
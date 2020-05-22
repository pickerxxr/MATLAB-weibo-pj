%% Guangzhou
filename = '.\Guangzhou.csv';
delimiter = ',';
startRow = 2;
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
Guangzhou = table(dataArray{1:end-1}, 'VariableNames', {'author','source','forward_num','comment_num','likes_num','month','day','hour','is_original','forward_link_length','original_word_num','content_word_num','forward_word_num','sentiment','emoji_num','tag_num','mention_num','is_located','link_num','topic_num'});
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% Hangzhou
filename = '.\Hangzhou.csv';
delimiter = ',';
startRow = 2;
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
Hangzhou = table(dataArray{1:end-1}, 'VariableNames', {'author','source','forward_num','comment_num','likes_num','month','day','hour','is_original','forward_link_length','original_word_num','content_word_num','forward_word_num','sentiment','emoji_num','tag_num','mention_num','is_located','link_num','topic_num'});
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% Kunming
filename = '.\Kunming.csv';
delimiter = ',';
startRow = 2;
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename, 'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
Kunming = table(dataArray{1:end-1}, 'VariableNames', {'author','source','forward_num','comment_num','likes_num','month','day','hour','is_original','forward_link_length','original_word_num','content_word_num','forward_word_num','sentiment','emoji_num','tag_num','mention_num','is_located','link_num','topic_num'});
clearvars filename delimiter startRow formatSpec fileID dataArray ans;





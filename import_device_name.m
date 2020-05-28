function result = import_device_name()
% fucntion to import the source csv file
% @author Alan Liu
% @version 1.0

filename = '.\source.csv';
delimiter = ',';
formatSpec = '%*s%s%[^\n\r]';

fileID = fopen(filename,'r','n','UTF-8');

fseek(fileID, 3, 'bof');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);

result = table(dataArray{1:end-1}, 'VariableNames', {'device_name'});

clearvars filename delimiter formatSpec fileID dataArray ans;
end


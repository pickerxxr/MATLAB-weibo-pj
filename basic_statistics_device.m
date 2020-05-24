%% Import the data and select the device column(Guangzhou)

% Select the rows whose id is NOT NULL
rows_gz = Guangzhou.author ~= "NULL";
rows_hz = Hangzhou.author ~= "NULL";
rows_km = Kunming.author ~= "NULL";

% Put the device(source) column into a string vec
user_source_guangzhou = Guangzhou{rows_gz, "source"};
user_source_hangzhou= Hangzhou{rows_hz, "source"};
user_source_kunming = Kunming{rows_km, "source"};

%% deal with source of Guangzhou

device_times = zeros(201, 1);
for i = 1: length(user_source_guangzhou)
    tmp = user_source_guangzhou(i);
   device_times(tmp + 1) = device_times(tmp + 1) + 1;
end

[B_gz, I_gz] = maxk(device_times, 10);

other_device_gz = sum(device_times) - sum(B_gz);
B_gz(2) = B_gz(2) + other_device_gz;

% Impoert source.csv by the function in the path.
% The imported array name is device_name
device_name = import_device_name();

% give the diffenrent part a legend
device_name_array = table2array(device_name);
legend_name_tmp = strings(1, 10);
for i = 1: 10
    name_tmp = I_gz(i);
    legend_name_tmp(i) = device_name_array(name_tmp);
end

% draw the graph to show devices parts
figure
explode = [0 1 0 0 0 0 0 0 0 0];
pie3(B_gz, explode);
p = pie3(B_gz, explode);
legend(legend_name_tmp, 'Location','southoutside','Orientation','horizontal')
title("post devices(Guangzhou)")
% Set the property of the pie graph
for i = 1: 10
    t = p(i);
    t.FontSize = 8;
end

%% deal with source of Hangzhou

device_times = zeros(201, 1);
for i = 1: length(user_source_hangzhou)
    tmp = user_source_hangzhou(i);
   device_times(tmp + 1) = device_times(tmp + 1) + 1;
end

[B_hz, I_hz] = maxk(device_times, 10);

other_device_hz = sum(device_times) - sum(B_hz);
B_hz(2) = B_hz(2) + other_device_hz;

% Impoert source.csv by the function in the path.
% The imported array name is device_name
device_name = import_device_name();

% give the diffenrent part a legend
device_name_array = table2array(device_name);
legend_name_tmp = strings(1, 10);
for i = 1: 10
    name_tmp = I_hz(i);
    legend_name_tmp(i) = device_name_array(name_tmp);
end

% draw the graph to show devices parts
figure
explode = [0 1 0 0 0 0 0 0 0 0];
pie3(B_hz, explode);
p = pie3(B_hz, explode);
legend(legend_name_tmp, 'Location','southoutside','Orientation','horizontal')
title("post devices(Hangzhou)")
% Set the property of the pie graph
for i = 1: 10
    t = p(i);
    t.FontSize = 8;
end

%% deal with source of Kunming

device_times = zeros(201, 1);
for i = 1: length(user_source_kunming)
    tmp = user_source_kunming(i);
   device_times(tmp + 1) = device_times(tmp + 1) + 1;
end

[B_km, I_km] = maxk(device_times, 10);

other_device_gz = sum(device_times) - sum(B_km);
B_km(2) = B_km(2) + other_device_gz;

% Impoert source.csv by the function in the path.
% The imported array name is device_name
device_name = import_device_name();

% give the diffenrent part a legend
device_name_array = table2array(device_name);
legend_name_tmp = strings(1, 10);
for i = 1: 10
    name_tmp = I_km(i);
    legend_name_tmp(i) = device_name_array(name_tmp);
end

% draw the graph to show devices parts
figure
explode = [0 1 0 0 0 0 0 0 0 0];
pie3(B_km, explode);
p = pie3(B_km, explode);
legend(legend_name_tmp, 'Location','southoutside','Orientation','horizontal')
title("post devices")
% Set the property of the pie graph
for i = 1: 10
    t = p(i);
    t.FontSize = 8;
end

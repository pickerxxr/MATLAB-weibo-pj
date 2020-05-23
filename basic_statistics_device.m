%% Import the data and select the device column

% Select the rows whose id is NOT NULL
rows_gz = Guangzhou.author ~= "NULL";
rows_hz = Hangzhou.author ~= "NULL";
rows_km = Kunming.author ~= "NULL";

% Put the device(source) column into a string vec
user_source_guangzhou = Guangzhou{rows_gz, "source"};
user_source_hangzhou= Hangzhou{rows_hz, "source"};
user_source_kunming = Kunming{rows_km, "source"};

figure
rose(user_source_guangzhou);
%% This program utilizes thingspeak.com's MATLAB analysis channel along with the API on https://developer.todoist.com/.



url = '(url from the previous step goes here)';

writeChannelID = (your write Channel ID);

writeKey = '(your write key)';

tempF = urlread(url); %% Read JSON from Todoist.com API

expression = 'due_date_utc":"[a-zA-Z_0-9_ ]*:\w*'; %% Definie expressions to search for. Looking for "due_date_utc:" + valid date

x = regexp(tempF,expression,'match'); %% Search JSON for matching instances of strings defined in teh 'expression' variable;

replace = {'due_date_utc":"'; 'Mon '; 'Tue '; 'Wed '; 'Thu '; 'Fri '; 'Sat '; 'Sun '}; %% Define strings to be replaced

newexpression = ''; %% Define replacement string

DateStrings = regexprep(x,replace,newexpression); %% Define new variable from x and replace 'replace' strings w/ 'newexpression'

t = datetime(DateStrings,'InputFormat','dd MMM yyyy HH:mm','TimeZone','UTC'); %% Define format of 'DateStrings'

now = datetime('now','TimeZone','UTC'); %% Get current date/time

dt = between(now,t); 

tf = isbetween(t,now,'1-Jan-3000'); %% See if any duedates have happened already. Return 0 for yes and 1 for no.

taskoverdue = any(tf == 0); %% See if any 0s from previous line were returned;

thingSpeakWrite(writeChannelID,[taskoverdue],'Fields',[1],'Writekey',writeKey); %% Write results to thingspeak channel;

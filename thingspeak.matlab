url = '(url from the previous step goes here)';

writeChannelID = (your write Channel ID);

writeKey = '(your write key)';

tempF = urlread(url);

expression = 'due_date_utc":"[a-zA-Z_0-9_ ]*:\w*';

x = regexp(tempF,expression,'match');

replace = {'due_date_utc":"'; 'Mon '; 'Tue '; 'Wed '; 'Thu '; 'Fri '; 'Sat '; 'Sun '};

newexpression = '';

DateStrings = regexprep(x,replace,newexpression);

t = datetime(DateStrings,'InputFormat','dd MMM yyyy HH:mm','TimeZone','UTC');

now = datetime('now','TimeZone','UTC');

dt = between(now,t);

tf = isbetween(t,now,'1-Jan-3000');

taskoverdue = any(tf == 0);

thingSpeakWrite(writeChannelID,[taskoverdue],'Fields',[1],'Writekey',writeKey);

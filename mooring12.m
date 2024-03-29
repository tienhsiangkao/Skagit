clear;

% load mooring data
load('moor1.mat'); load('moor2.mat');

% load longer data
moorings.mtime(:,1) = moor1.mtime;
moorings.hour (:,1) = moor1.hour;
moorings.s    (:,1) = moor1.s;
moorings.t    (:,1) = moor1.t;
moorings.z    (:,1) = moor1.z;
moorings.obs  (:,1) = moor1.obs;

% interp and synchronization
moorings.mtime(:,2) = interp1(moor2.mtime, moor2.mtime, moor1.mtime);
moorings.hour (:,2) = interp1(moor2.mtime, moor2.hour, moor1.mtime);
moorings.s    (:,2) = interp1(moor2.mtime, moor2.s, moor1.mtime);
moorings.t    (:,2) = interp1(moor2.mtime, moor2.t, moor1.mtime);
moorings.z    (:,2) = interp1(moor2.mtime, moor2.z, moor1.mtime);
moorings.obs  (:,2) = interp1(moor2.mtime, moor2.obs, moor1.mtime);

% from datenumber to datetime
formatOut = 'yyyy-mm-dd HH:MM:SS';

T (:,1)= datetime(datestr(moorings.mtime(:,1), formatOut, 'local'))
T (:,2)= datetime(datestr(moorings.mtime(:,2), formatOut, 'local'))
moorings.mtime = T;
%T(:,2) = convertCharsToStrings(datestr(moorings.mtime(:,2), formatOut, 'local'));
%T(isnan(T)) = NaT(377,1);

% README
moorings.readme = {'VARIABLE','UNIT','DESCRIPTION';...
    'mtime',' ','MATLAB datetime';...
    'hour',' ','hours of the day';...
    's','psu','salinity';...
    't','deg C','temperature';...
    'z','m','depth';...
    'obs','ntu','turbidity';...
};

save moorings.mat moorings
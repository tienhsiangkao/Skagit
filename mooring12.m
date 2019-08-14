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
moorings.p    (:,2) = interp1(moor2.mtime, moor2.p, moor1.mtime);
moorings.obs  (:,2) = interp1(moor2.mtime, moor2.obs, moor1.mtime);

% README
moorings.readme = {'VARIABLE','UNIT','DESCRIPTION';...
    'mtime',' ','MATLAB time frame';...
    'hour',' ','hours of the day';...
    's','psu','salinity';...
    't','deg C','temperature';...
    'z','m','depth';...
    'obs','ntu','turbidity';...
};

save moorings.mat moorings
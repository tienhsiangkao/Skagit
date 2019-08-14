% load mooring data respectively

RSK = RSKopen('mooring2deep.rsk');
RSK = RSKreaddata(RSK);

% Remove atmospheric pressure from measured total pressure
RSK = RSKderiveseapressure(RSK);

% Derive practical salinity
RSK = RSKderivesalinity(RSK);

% Derive depth
RSK = RSKderivedepth(RSK);

% Alignment of conductivity to temperature and pressure
lag = RSKcalculateCTlag(RSK);
RSK = RSKalignchannel(RSK, 'Conductivity', lag);

% low-pass filtering
RSK = RSKsmooth(RSK,{'temperature','conductivity','turbidity'}, 'windowLength',5);
RSKplotdata(RSK);

moor2.mtime = RSK.data.tstamp;
moor2.hour = rem(moor2.mtime,1)*24;
moor2.s    = RSK.data.values(:,6);
moor2.t    = RSK.data.values(:,2);
moor2.z    = RSK.data.values(:,7);
moor2.obs  = RSK.data.values(:,4);
moor2.lat  = [];
moor2.lon  = [];

save moor2.mat moor2


use airline_ontime;

set hive.tez.container.size=1024;

ANALYZE TABLE flights COMPUTE STATISTICS FOR COLUMNS;
ANALYZE TABLE airports COMPUTE STATISTICS FOR COLUMNS;
ANALYZE TABLE airlines COMPUTE STATISTICS FOR COLUMNS;
ANALYZE TABLE planes COMPUTE STATISTICS FOR COLUMNS;

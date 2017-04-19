module monitor.persistence {
	requires transitive monitor.statistics;
	requires hibernate;
	exports monitor.persistence;
}

module monitor {
	requires monitor.observer;
	requires static monitor.observer.alpha;
	requires static monitor.observer.beta;
	requires monitor.statistics;
	requires monitor.persistence;
	requires monitor.rest;
}

module monitor {
	requires monitor.observer;
	requires monitor.statistics;
	requires monitor.persistence;
	requires monitor.rest;

	uses monitor.observer.ServiceObserverFactory;
}

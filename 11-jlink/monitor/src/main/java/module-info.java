module monitor {
	requires monitor.observer;
	requires monitor.statistics;
	requires monitor.persistence;

	uses monitor.observer.ServiceObserverFactory;
}

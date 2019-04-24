package monitor;

import monitor.observer.ServiceObserver;
import monitor.observer.ServiceObserverFactory;
import monitor.persistence.StatisticsRepository;
import monitor.rest.MonitorServer;
import monitor.statistics.Statistician;
import monitor.statistics.Statistics;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.ServiceLoader;
import java.util.ServiceLoader.Provider;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

public class Main {

	public static void main(String[] args) {
		System.out.printf("Launching Monitor on Java %s.%n%n", Runtime.version().toString());

		Monitor monitor = createMonitor();
		MonitorServer server = MonitorServer
				.create(monitor::currentStatistics)
				.start();

		ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
		scheduler.scheduleAtFixedRate(monitor::updateStatistics, 1, 1, TimeUnit.SECONDS);
		scheduler.schedule(() -> {
					scheduler.shutdown();
					server.shutdown();
				},
				10,
				TimeUnit.SECONDS);
	}

	private static Monitor createMonitor() {
		Function<String, Optional<ServiceObserver>> observeService = createServiceObserverFactory();
		List<ServiceObserver> observers = Stream.of("alpha-1", "alpha-2", "alpha-3", "beta-1")
				.map(observeService)
				.flatMap(Optional::stream)
				.collect(toList());
		Statistician statistician = new Statistician();
		StatisticsRepository repository = new StatisticsRepository();
		Statistics initialStatistics = repository.load().orElseGet(statistician::emptyStatistics);

		return new Monitor(observers, statistician, repository, initialStatistics);
	}

	private static Function<String, Optional<ServiceObserver>> createServiceObserverFactory() {
		List<ServiceObserverFactory> factories = ServiceLoader
				.load(ServiceObserverFactory.class).stream()
				.map(Provider::get)
				.collect(toList());
		return serviceName -> factories.stream()
				.map(factory -> factory.createIfMatchingService(serviceName))
				.flatMap(Optional::stream)
				.findFirst()
				.or(printfIfEmpty("No observer for %s found.%n", serviceName));
	}

	private static <T> Supplier<Optional<T>> printfIfEmpty(String message, String... args) {
		return () -> {
			System.out.printf(message, (Object[]) args);
			return Optional.empty();
		};
	}

}

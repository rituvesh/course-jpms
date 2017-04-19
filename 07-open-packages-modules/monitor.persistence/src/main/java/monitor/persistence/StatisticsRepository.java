package monitor.persistence;

import hibernate.Hibernate;
import hibernate.HibernateException;
import monitor.persistence.dtos.StatisticsEntity;
import monitor.statistics.Statistics;

import java.util.Comparator;
import java.util.Map.Entry;
import java.util.Optional;

public class StatisticsRepository {

	public Optional<Statistics> load() {
		try {
			StatisticsEntity statisticsEntity = Hibernate.load(StatisticsEntity.class, 1);
			return Optional.ofNullable(statisticsEntity.toStatistics());
		} catch (HibernateException ex) {
			System.out.println(ex);
			return Optional.empty();
		}
	}

	public void store(Statistics statistics) {
		System.out.printf("Total liveness: %s (from %d data points)%n",
				statistics.totalLivenessQuota().livenessQuota(),
				statistics.totalLivenessQuota().dataPointCount());
		statistics.livenessQuotaByService()
				.sorted(Comparator.comparing(Entry::getKey))
				.forEach(serviceLiveness ->
				System.out.printf(" * %s liveness: %s (from %d data points)%n",
						serviceLiveness.getKey(),
						serviceLiveness.getValue().livenessQuota(),
						serviceLiveness.getValue().dataPointCount()));
		System.out.println();
	}

}

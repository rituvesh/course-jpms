package monitor.persistence.dtos;

import monitor.statistics.Statistics;

//@Entity
//@Table(name = "stats")
public class StatisticsEntity {

//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

//	@ManyToOne
//	@JoinColumn(name = "quota_id", updatable = false)
	private LivenessQuotaEntity totalLivenessQuota;

	private StatisticsEntity() {
		totalLivenessQuota = new LivenessQuotaEntity();
	}

	public static StatisticsEntity from(Statistics statistics) {
		StatisticsEntity entity = new StatisticsEntity();
		entity.totalLivenessQuota = LivenessQuotaEntity.from(statistics.totalLivenessQuota());
		return entity;
	}

	public Statistics toStatistics() {
		return Statistics.with(totalLivenessQuota.toLivenessQuota());
	}

}

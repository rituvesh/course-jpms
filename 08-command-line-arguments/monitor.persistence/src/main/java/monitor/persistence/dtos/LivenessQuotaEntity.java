package monitor.persistence.dtos;

import monitor.statistics.Statistics.LivenessQuota;

//@Entity
//@Table(name = "quotas")
final class LivenessQuotaEntity {

//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private long dataPointCount;
	private long aliveCount;

	LivenessQuotaEntity() {
		// "loaded" values
		dataPointCount = 10;
		aliveCount = 8;
	}

	static LivenessQuotaEntity from(LivenessQuota quota) {
		LivenessQuotaEntity entity = new LivenessQuotaEntity();
		entity.dataPointCount = quota.dataPointCount();
		entity.aliveCount = quota.aliveCount();
		return entity;
	}

	LivenessQuota toLivenessQuota() {
		return LivenessQuota.with(dataPointCount, aliveCount);
	}

}

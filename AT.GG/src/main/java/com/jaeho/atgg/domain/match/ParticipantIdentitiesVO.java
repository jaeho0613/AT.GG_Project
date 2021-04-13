package com.jaeho.atgg.domain.match;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

// 게임에 참여한 소환사명단
@Data
public class ParticipantIdentitiesVO {
	int participantId;
	Player player;

	public static class Player {
		@Getter
		@Setter
		String summonerName;
	}
}

package com.jaeho.atgg.domain.match;

import lombok.Data;

// 매칭 소환사 라인
@Data
public class TimelineVO {
	String gameId;
	int participantId; // 순서
	String role; // 매칭 룰 (duo_support, SOLO, noen, DUO_CARRY)
	String lane; // 라인 (top, mid, buttom, jungle)
}

Return-Path: <SRS0=yNVQ=ID=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8E5C46CD3
	for <soc@archiver.kernel.org>; Sun, 24 Dec 2023 22:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A745C433C8; Sun, 24 Dec 2023 22:24:48 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C179C433CB
	for <soc@kernel.org>; Sun, 24 Dec 2023 22:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C179C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e68e93be1so2094778e87.0
        for <soc@kernel.org>; Sun, 24 Dec 2023 14:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703456684; x=1704061484; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ecPslPIskkocjAl6EQrmLEwfUip9JzvjMANp6F2xjg=;
        b=G69HUGRmJVnoK1DNRGBGADdZGF4RYsNnbwo8veIp7YqKMq9LXTCwnajTiAbY8CyJpe
         tF9FkaFkylq8+86OHt3lb0WaclDGXKUr4sN8f8NNFX2Fr9wUykRQ6bLcIAsvvrxGKQo+
         mEERlruPysHnbB9kF5RP5+FwgsmV/lKZ5UL89FxnT7LQ7+BT2I8trulRC8L8dcWycQlf
         9qJ6va2oIt5L8JrK0vRO93vzxwzfzX6PRTD9n5YIZwFFp6fLSGiN6e58FKu8UgCb0h88
         XobWO/OcBPDQXku3Sa7BQRV5Xkc/zjwdS+etSWATvEgKDoIAaV5wNM5vlxhdeWFuJzzc
         HN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703456684; x=1704061484;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ecPslPIskkocjAl6EQrmLEwfUip9JzvjMANp6F2xjg=;
        b=WXLWIoRKQsYqVEdxvycchmzcfcX4bECDwgmYTSV3N0QtvhNAN+MR+p0nhOPd7AYj6k
         8PgcnmeonSdsVOIa4kPnOgwoxgiNObGI5g1AG3WVn2OBe3rzxZzdPac0+WBCyIT+2Abn
         4sp1qlAArmjRxwAvWEKlBmB+nUyTiygKbWkacF+DNDd62EayJ4nHb2Rl1YchScv8oBvB
         yph+EGQ2Ad/OHWojRvvc9QGzUcM5qD7nKuZXYwxgUWzSRZpBlOqnD7En5MQS+bNPKIO+
         uRZV8eiOF26mq9gCVSUZLy7Y/BGnIJbJ01Uov9h2yNfT+9AHofC2lh/1xynkDo+XRQXA
         6Mig==
X-Gm-Message-State: AOJu0YzwKRKOQrgjR9HZe30m0MH9LKbmIh+swOaMdWW6VLrtiAIje11G
	AWWYxEjZnznuDrYH9GaJTBRs4tlZam0ZaQ==
X-Google-Smtp-Source: AGHT+IERgLw2YPRxcwPW8zWTgCLyErLHVvh2sg6Um1F4q/EELeHHp+64c7Vp2+8La8fmE/Nm1YDcsw==
X-Received: by 2002:a05:6512:787:b0:50e:7bf0:3cda with SMTP id x7-20020a056512078700b0050e7bf03cdamr86018lfr.104.1703456684079;
        Sun, 24 Dec 2023 14:24:44 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b0050e7af5b827sm189663lfk.160.2023.12.24.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 14:24:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 24 Dec 2023 23:24:38 +0100
Subject: [PATCH] ARM: Delete ARM11MPCore perf leftovers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-drop-11mpcore-fix-v1-1-d8b16d1c1fae@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKWviGUC/x2MQQqDQAwAvyI5N2Biu2C/UnrQbKo56C5ZKIL49
 4YeZ2DmhKZu2uDZneD6tWZlD6BbB7JO+6JoORi454GY75i9VCTaqhRX/NiBkmR+cMrEY4Loqmv
 o//P1vq4fiox4JGMAAAA=
List-Id: <soc.lore.kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

My commit deleting the PB11MPCore apparently left a few dangling
structs in the perf event code. Fix it up.

Fixes: 2560cffd2134 ("ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This fixes a warning reported in the SoC tree, it's not even
in next yet. Now that I turned on ARMv6 in my builds it is
also tested.
---
 arch/arm/kernel/perf_event_v6.c | 94 -----------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/arch/arm/kernel/perf_event_v6.c b/arch/arm/kernel/perf_event_v6.c
index 3115077f6abc..0cbf46233d6b 100644
--- a/arch/arm/kernel/perf_event_v6.c
+++ b/arch/arm/kernel/perf_event_v6.c
@@ -113,69 +113,6 @@ static const unsigned armv6_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 	[C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6_PERFCTR_ITLB_MISS,
 };
 
-enum armv6mpcore_perf_types {
-	ARMV6MPCORE_PERFCTR_ICACHE_MISS	    = 0x0,
-	ARMV6MPCORE_PERFCTR_IBUF_STALL	    = 0x1,
-	ARMV6MPCORE_PERFCTR_DDEP_STALL	    = 0x2,
-	ARMV6MPCORE_PERFCTR_ITLB_MISS	    = 0x3,
-	ARMV6MPCORE_PERFCTR_DTLB_MISS	    = 0x4,
-	ARMV6MPCORE_PERFCTR_BR_EXEC	    = 0x5,
-	ARMV6MPCORE_PERFCTR_BR_NOTPREDICT   = 0x6,
-	ARMV6MPCORE_PERFCTR_BR_MISPREDICT   = 0x7,
-	ARMV6MPCORE_PERFCTR_INSTR_EXEC	    = 0x8,
-	ARMV6MPCORE_PERFCTR_DCACHE_RDACCESS = 0xA,
-	ARMV6MPCORE_PERFCTR_DCACHE_RDMISS   = 0xB,
-	ARMV6MPCORE_PERFCTR_DCACHE_WRACCESS = 0xC,
-	ARMV6MPCORE_PERFCTR_DCACHE_WRMISS   = 0xD,
-	ARMV6MPCORE_PERFCTR_DCACHE_EVICTION = 0xE,
-	ARMV6MPCORE_PERFCTR_SW_PC_CHANGE    = 0xF,
-	ARMV6MPCORE_PERFCTR_MAIN_TLB_MISS   = 0x10,
-	ARMV6MPCORE_PERFCTR_EXPL_MEM_ACCESS = 0x11,
-	ARMV6MPCORE_PERFCTR_LSU_FULL_STALL  = 0x12,
-	ARMV6MPCORE_PERFCTR_WBUF_DRAINED    = 0x13,
-	ARMV6MPCORE_PERFCTR_CPU_CYCLES	    = 0xFF,
-};
-
-/*
- * The hardware events that we support. We do support cache operations but
- * we have harvard caches and no way to combine instruction and data
- * accesses/misses in hardware.
- */
-static const unsigned armv6mpcore_perf_map[PERF_COUNT_HW_MAX] = {
-	PERF_MAP_ALL_UNSUPPORTED,
-	[PERF_COUNT_HW_CPU_CYCLES]		= ARMV6MPCORE_PERFCTR_CPU_CYCLES,
-	[PERF_COUNT_HW_INSTRUCTIONS]		= ARMV6MPCORE_PERFCTR_INSTR_EXEC,
-	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= ARMV6MPCORE_PERFCTR_BR_EXEC,
-	[PERF_COUNT_HW_BRANCH_MISSES]		= ARMV6MPCORE_PERFCTR_BR_MISPREDICT,
-	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= ARMV6MPCORE_PERFCTR_IBUF_STALL,
-	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= ARMV6MPCORE_PERFCTR_LSU_FULL_STALL,
-};
-
-static const unsigned armv6mpcore_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
-					[PERF_COUNT_HW_CACHE_OP_MAX]
-					[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
-	PERF_CACHE_MAP_ALL_UNSUPPORTED,
-
-	[C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV6MPCORE_PERFCTR_DCACHE_RDACCESS,
-	[C(L1D)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DCACHE_RDMISS,
-	[C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)]	= ARMV6MPCORE_PERFCTR_DCACHE_WRACCESS,
-	[C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DCACHE_WRMISS,
-
-	[C(L1I)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ICACHE_MISS,
-
-	/*
-	 * The ARM performance counters can count micro DTLB misses, micro ITLB
-	 * misses and main TLB misses. There isn't an event for TLB misses, so
-	 * use the micro misses here and if users want the main TLB misses they
-	 * can use a raw counter.
-	 */
-	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DTLB_MISS,
-	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_DTLB_MISS,
-
-	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ITLB_MISS,
-	[C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV6MPCORE_PERFCTR_ITLB_MISS,
-};
-
 static inline unsigned long
 armv6_pmcr_read(void)
 {
@@ -452,37 +389,6 @@ static void armv6pmu_disable_event(struct perf_event *event)
 	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
 }
 
-static void armv6mpcore_pmu_disable_event(struct perf_event *event)
-{
-	unsigned long val, mask, flags, evt = 0;
-	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
-	struct hw_perf_event *hwc = &event->hw;
-	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
-	int idx = hwc->idx;
-
-	if (ARMV6_CYCLE_COUNTER == idx) {
-		mask	= ARMV6_PMCR_CCOUNT_IEN;
-	} else if (ARMV6_COUNTER0 == idx) {
-		mask	= ARMV6_PMCR_COUNT0_IEN;
-	} else if (ARMV6_COUNTER1 == idx) {
-		mask	= ARMV6_PMCR_COUNT1_IEN;
-	} else {
-		WARN_ONCE(1, "invalid counter number (%d)\n", idx);
-		return;
-	}
-
-	/*
-	 * Unlike UP ARMv6, we don't have a way of stopping the counters. We
-	 * simply disable the interrupt reporting.
-	 */
-	raw_spin_lock_irqsave(&events->pmu_lock, flags);
-	val = armv6_pmcr_read();
-	val &= ~mask;
-	val |= evt;
-	armv6_pmcr_write(val);
-	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
-}
-
 static int armv6_map_event(struct perf_event *event)
 {
 	return armpmu_map_event(event, &armv6_perf_map,

---
base-commit: b057e7afb79ec2edddc940b82af6e3571d1f0ffe
change-id: 20231224-drop-11mpcore-fix-c6cb526d1296

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


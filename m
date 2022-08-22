Return-Path: <SRS0=4ljW=Y2=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFB3C28D13
	for <soc@archiver.kernel.org>; Mon, 22 Aug 2022 12:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D10CC433D7; Mon, 22 Aug 2022 12:16:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 71B9FC433D6;
	Mon, 22 Aug 2022 12:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71B9FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5E5012FC;
	Mon, 22 Aug 2022 05:16:18 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE4E03F718;
	Mon, 22 Aug 2022 05:16:14 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	arm@kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver) config
Date: Mon, 22 Aug 2022 13:16:04 +0100
Message-Id: <20220822121604.2213778-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 788961462f34 ("ARM: psci: cpuidle: Enable PSCI CPUidle
driver") the generic ARM cpuidle driver probe no longer worked on
ARM64. It was however left enabled with the driver failing to probe
successfully. However the commit 51280acad855 ("cpuidle: cpuidle-arm:
remove arm64 support") removed the Kconfig option so that it is no
longer enabled for arm64 platforms.

Drop the disabled/unavailable ARM_CPUIDLE from the defconfig.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd4904..c189187b70d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -80,7 +80,6 @@ CONFIG_RANDOMIZE_BASE=y
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_ENERGY_MODEL=y
-CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
-- 
2.37.2


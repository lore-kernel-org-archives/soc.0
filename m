Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAC2C12002
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 15:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AC16606A5; Wed, 21 Jul 2021 15:15:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F9B761221;
	Wed, 21 Jul 2021 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626880502;
	bh=NrwxCLoURd1LdJnNYb7I+1LjEmcgSb+64PHqxxsUM4I=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=PsIuE0tugvMb8BqIZccrWTe0VdlyvcsFlyMt8BnTMcEZRLJ5FZDLE5kL/YOW5Pe9s
	 JLpbpjNNZhOrvkOznQJ4+F4+yN3kxqLM/OBCOOQkdvQFllthLe2ATdOJZsB5qfwqkj
	 DH9Wd654W78R234xY3RT+Nz0cCLasa6O+GayqoyZB6WVsCTvXxzQ5Wqn5jkdhNxb67
	 1db46lrD+U9NcvpbwGSc9ICnFqUSJtuGmPjsQeL0W4KZYGdch7gdTsmXUwRaC7vq23
	 kbPlLsdlATy9BGRrNeKd8Fnuhm6+mPsB147QCYZJDEdy95wpxxuHKKWoPbN7kTx8zO
	 9GhQLw3O69aUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: tegra: add regulator dependency
Date: Wed, 21 Jul 2021 17:14:50 +0200
Message-Id: <20210721151457.2285669-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The two regulator drivers in the drivers/soc/ directory fail to build
when regulator support is disabled:

aarch64-linux-ld: drivers/soc/tegra/regulators-tegra20.o: in function `tegra20_regulator_reboot':
regulators-tegra20.c:(.text.tegra20_regulator_reboot+0x4c): undefined reference to `regulator_sync_voltage_rdev'
aarch64-linux-ld: regulators-tegra20.c:(.text.tegra20_regulator_reboot+0x58): undefined reference to `regulator_sync_voltage_rdev'
aarch64-linux-ld: drivers/soc/tegra/regulators-tegra30.o: in function `tegra30_regulator_reboot':
regulators-tegra30.c:(.text.tegra30_regulator_reboot+0x44): undefined reference to `regulator_sync_voltage_rdev'
aarch64-linux-ld: regulators-tegra30.c:(.text.tegra30_regulator_reboot+0x50): undefined reference to `regulator_sync_voltage_rdev'

Add a Kconfig dependency to avoid this configuration.

Fixes: 496747e7d907 ("soc/tegra: regulators: Add regulators coupler for Tegra20")
Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for Tegra30")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/tegra/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index db49075b1946..c56122be27a9 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -153,8 +153,10 @@ config SOC_TEGRA_POWERGATE_BPMP
 
 config SOC_TEGRA20_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra20 SoCs"
+	depends on REGULATOR
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 
 config SOC_TEGRA30_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra30 SoCs"
+	depends on REGULATOR
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
-- 
2.29.2


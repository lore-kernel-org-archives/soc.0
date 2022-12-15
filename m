Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C0AC4332F
	for <soc@archiver.kernel.org>; Thu, 15 Dec 2022 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46FB6C433EF; Thu, 15 Dec 2022 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE81C433F0;
	Thu, 15 Dec 2022 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671123221;
	bh=D1GjU0p4bwu+8f71IAo+dOlw390A5j1Et3KtRDH2uj0=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=e7na1AG35niO/0KGQ+T7GXXVUOzvHyXQhRp19EA2Qmkf6m07c2tqfPkHjO2jwbpaY
	 fa0bxjeEz3hbjfJYh/u+BRu2LdfUyvJtWjYqp6LDkhJSWw7jgZ/1ghiWiGBhC1lHVw
	 dJ6mXPtABaeaA5OEa4yeDdPDkahU8UjDNGVIaB24FLeYfBeI6kZ0DIA86+Xb1GUTi4
	 CG/Bs+iJ76I1x9sjHf0L3UBfnbRCLKIhEYzr4AFjZ6KephKI4OcKYNtZ7dqEXprHJh
	 d9u/O8MdOa4d4VUMK66Aaojorw7zS10+LARwnKWLvP9RfTZZ8tLDasI+QR564QeiC9
	 pvEQlhR04SwWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Sumit Gupta <sumitg@nvidia.com>,
	Petlozu Pravareshwar <petlozup@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: tegra: fix CPU_BIG_ENDIAN dependencies
Date: Thu, 15 Dec 2022 17:53:21 +0100
Message-Id: <20221215165336.1781080-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

My previous patch to prevent BPMP from being enabled on big
endian kernels caused a build regression:

WARNING: unmet direct dependencies detected for TEGRA_BPMP
  Depends on [n]: ARCH_TEGRA [=y] && TEGRA_HSP_MBOX [=y] && TEGRA_IVC [=y] && !CPU_BIG_ENDIAN [=y]
  Selected by [y]:
  - ARCH_TEGRA_186_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]
  - ARCH_TEGRA_194_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]
  - ARCH_TEGRA_234_SOC [=y] && ARCH_TEGRA [=y] && ARM64 [=y]

Add even more such dependencies for the SoC types that use
the BPMP driver.

Fixes: 4ddb1bf1a837 ("tegra: mark BPMP driver as little-endian only")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/tegra/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 5f5324294636..3658fb0f0c5b 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -95,6 +95,7 @@ config ARCH_TEGRA_210_SOC
 
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
+	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
@@ -110,6 +111,7 @@ config ARCH_TEGRA_186_SOC
 
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
+	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
 	select TEGRA_BPMP
@@ -121,6 +123,7 @@ config ARCH_TEGRA_194_SOC
 
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
+	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
-- 
2.35.1


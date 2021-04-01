Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2CCC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:36:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 969896105A; Thu,  1 Apr 2021 10:36:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECA2C61056;
	Thu,  1 Apr 2021 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617273397;
	bh=WDW63YezYw5yHa+C19nI4CxKQ4BR33uzdV1BAfusmvU=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=mbOvDEtVfpndYeMn/uoLK2lVUlkRJbkqhib0ZZD1kWnfAUQp7sWztDmMVCwfjcU4M
	 EOy9O5/6wNsAKR/JIehMp3OzwKtPkh33MCMqFkb4SUid4EuMWqcSZhSBAUFBXqJL/+
	 vDr8cHZ8pdb2bjjQdwrDQM4vOPF5Qr71Ej+MsGUeLtT02X21E84DFPBWcLJpjfNgcA
	 igz6TIjbtgyEIXG8ar/9r/46PpbO0e7niNdD2WynzowbxZcrKgJqI95tIhoGRSl6W1
	 4w5dl09xqdbzN1nn7b9shXsgi9i0xhjAkaxNL9KNJbkgkN6XhWtTuS7qVgFT/if2RU
	 Uxw1s4u5gjqAQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
Date: Thu,  1 Apr 2021 11:28:58 +0100
Message-Id: <20210401102858.4095-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=+RbiIogrLT+K6jXTcLOETVTqp/e3MFeHurCtKlDVtnU=; m=SeDjL1Nm5xTh5K56o6KAegi9gkKz+jy4AWsqzKXb3mU=; p=8jyG402PKWoUB3KvWrU+GujYAu0FJGkyNOEkXGWm8J4=; g=42a7430ae9c7fb87483eb501d3ecb516185d9dd8
X-Patch-Sig: m=pgp; i=broonie@kernel.org; s=0xC3F436CA30F5D8EB; b=iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBln8wACgkQJNaLcl1Uh9DBVwf/VXV uJAcxkPWuT2jSRSofV7h4ryyqp9FYX8KPc/ADqLa0llsZDod0uUaLfmnT2jDmcGOnOIFkZr2DNCSk qi1/bcoOVBS2lSl8quyPz8YU3CxzyFJlnZbKShSdCSPPnbbAjWEL+W9X8nR5r5qEdMwKYs86oNqYC LpJDztRtIHe6bLZzj0z8u4QTjti6QzgTkfE9rCtPemeBEwcz4ZVdLhWCvzt3qClrBXny1g3Jv2Ax6 ZSuuwwsJiEpmePRENCkUeKzhPRunJhao7hCihKr3XcX64cggLB4BFsJnJgGNbYqMHv5Y61betYBaW dPloL9BNUe2eNOshANIVKmRhb6dEpzA==
Content-Transfer-Encoding: 8bit

The userspace consumer is a development tool, not intended for producton
systems and so should not be present in defconfigs especially not those
for specific machines so is not a good fit for defconfig, remove it from
those defconfigs where it is enabled. No system in mainline actually
instantiates one.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/ezx_defconfig    | 1 -
 arch/arm/configs/imote2_defconfig | 1 -
 arch/arm/configs/pxa_defconfig    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 81665b7abf83..a49e699e52de 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -213,7 +213,6 @@ CONFIG_POWER_SUPPLY=y
 CONFIG_EZX_PCAP=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
-CONFIG_REGULATOR_USERSPACE_CONSUMER=y
 CONFIG_REGULATOR_PCAP=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_VIDEO_DEV=y
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index ae15a2a33802..118c4c927f26 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -194,7 +194,6 @@ CONFIG_POWER_SUPPLY=y
 CONFIG_PMIC_DA903X=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
-CONFIG_REGULATOR_USERSPACE_CONSUMER=y
 CONFIG_REGULATOR_DA903X=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_VIDEO_DEV=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index bd7dd81c9c54..875a3c28a267 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -415,7 +415,6 @@ CONFIG_MFD_TC6393XB=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=m
-CONFIG_REGULATOR_USERSPACE_CONSUMER=m
 CONFIG_REGULATOR_ACT8865=m
 CONFIG_REGULATOR_AS3711=m
 CONFIG_REGULATOR_AXP20X=m
-- 
2.20.1


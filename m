Return-Path: <SRS0=dI0m=R4=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F8EC433F5
	for <soc@archiver.kernel.org>; Wed, 12 Jan 2022 14:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 076BEC36AEB; Wed, 12 Jan 2022 14:07:55 +0000 (UTC)
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE9F1C36AEA
	for <soc@kernel.org>; Wed, 12 Jan 2022 14:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE9F1C36AEA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4JYqC65JsjzMqtfY
	for <soc@kernel.org>; Wed, 12 Jan 2022 15:07:46 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id hq7e2600i0kcUhD01q7e1G; Wed, 12 Jan 2022 15:07:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1n7eHq-009GYB-DS; Wed, 12 Jan 2022 15:07:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1n7eHp-000W08-Uk; Wed, 12 Jan 2022 15:07:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: Remove ARCH_VULCAN
Date: Wed, 12 Jan 2022 15:07:37 +0100
Message-Id: <9e8fef2cf4f2d5648e87076bc96601cff945ce40.1641996361.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a314520d82317650 ("arm64: disable Broadcom Vulcan platform")
did not remove the ARCH_VULCAN configuration symbol, as there were still
references to this symbol.

As of commits 240d3d5b2a7a3263 ("gpio: xlp: update GPIO_XLP dependency") and
f85a543e5373eeba ("arm64: defconfig: drop ARCH_VULCAN"), the last users
of ARCH_VULCAN have been removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 7d5d588001708856..21697449d762fa99 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -309,9 +309,6 @@ config ARCH_VISCONTI
 	help
 	  This enables support for Toshiba Visconti SoCs Family.
 
-config ARCH_VULCAN
-	def_bool n
-
 config ARCH_XGENE
 	bool "AppliedMicro X-Gene SOC Family"
 	help
-- 
2.25.1


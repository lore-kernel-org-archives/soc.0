Return-Path: <SRS0=tmn7=LI=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B89CD128A
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B49FC43394; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86D16C433A6
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86D16C433A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id CE2AD37949D
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15jl2Ug6j5ti for <soc@kernel.org>;
	Wed,  3 Apr 2024 15:37:40 +0200 (CEST)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 2BC6437947E;
	Wed,  3 Apr 2024 15:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1712151454; bh=r1SkfVNj9bPZQxz4eJiuARml22W5WexeFCEA4WoTAhE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CosIn5k/pC1BTczzT1M+4joQcZbp4n7ILWW8+2LUwn+17UFB9/XFtruCrIC/knOkp
	 cz6ov+aZUrGlc2TpXaN9CvqURx13tabctFSqaKWIDf/xwo5vlUI97XZTPBHqpZvVQs
	 bmxf5CeBaVeJN8oXUrN8s/Cgm1tCmivWkrit1rJo=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: renze@rnplus.nl,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v2 3/3] ARM: dts: Modify I2C bus configuration
Date: Wed,  3 Apr 2024 15:28:53 +0200
Message-ID: <20240403133037.37782-4-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403133037.37782-1-renze@rnplus.nl>
References: <20240403133037.37782-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable I2C bus 8 which is exposed on the IPMB_1 connector
on the X570D4U mainboard.

Additionally adds a descriptive comment to I2C busses 1 and 5.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 66318ef8caae..8dee4faa9e07 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -162,6 +162,7 @@ &i2c0 {
 };
 
 &i2c1 {
+	/* Hardware monitoring SMBus */
 	status = "okay";
 
 	w83773g@4c {
@@ -219,6 +220,7 @@ i2c4mux0ch3: i2c@3 {
 };
 
 &i2c5 {
+	/* SMBus on BMC connector (BMC_SMB_1) */
 	status = "okay";
 };
 
@@ -243,6 +245,11 @@ eth1_macaddress: macaddress@3f88 {
 	};
 };
 
+&i2c8 {
+	/* SMBus on intelligent platform management bus header (IPMB_1) */
+	status = "okay";
+};
+
 &gfx {
 	status = "okay";
 };
-- 
2.44.0


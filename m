Return-Path: <SRS0=6ohN=LD=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39CBCD128A
	for <soc@archiver.kernel.org>; Fri, 29 Mar 2024 13:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDEF0C43394; Fri, 29 Mar 2024 13:02:31 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E435C433C7
	for <soc@kernel.org>; Fri, 29 Mar 2024 13:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E435C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 9C4BD379499
	for <soc@kernel.org>; Fri, 29 Mar 2024 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrMAxan0SjKV for <soc@kernel.org>;
	Fri, 29 Mar 2024 14:05:48 +0100 (CET)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id F015C37947B;
	Fri, 29 Mar 2024 14:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1711717527; bh=fAvAnvABUo7HyKuMjevhf/jv5qC2EXV4aai6G+pLpAA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zujQAt4VCctGPhyNc7BqplQeCWC4PHXqkNF1G8Bp1BgJrkLCm78UrJpy3qm7nXQ6q
	 ytsDDNWm9eQolzBUvRxMfFbd1CzWPMwEJj26tzsegM3jbO0JGB6/0p0ZWh7ycoixvC
	 21bFBmKbEFVoFxZZpz8WMrWmyf7GuIAOteC3T6vA=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	renze@rnplus.nl
Subject: [PATCH 3/3] ARM: dts: Modify I2C bus configuration
Date: Fri, 29 Mar 2024 14:01:41 +0100
Message-ID: <20240329130152.878944-4-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329130152.878944-1-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit enables I2C bus 8 which is exposed on the IPMB_1 connector on the X570D4U mainboard.
Additionally it adds a descriptive comment to I2C busses 1 and 5.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index e93c2f0b8414..3b1c77a12605 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -183,6 +183,7 @@ &i2c0 {
 };
 
 &i2c1 {
+	/* Hardware monitoring SMBus */
 	status = "okay";
 
 	w83773g@4c {
@@ -240,6 +241,7 @@ i2c4mux0ch3: i2c@3 {
 };
 
 &i2c5 {
+	/* SMBus on BMC connector (BMC_SMB_1) */
 	status = "okay";
 };
 
@@ -264,6 +266,11 @@ eth1_macaddress: macaddress@3f88 {
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


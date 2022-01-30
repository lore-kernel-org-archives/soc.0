Return-Path: <SRS0=FQl8=SO=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE47EC35270
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 14:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93BFFC340E4; Sun, 30 Jan 2022 14:51:40 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A076C340EB;
	Sun, 30 Jan 2022 14:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A076C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SV4r8zfyzAWYlpoI7Y1Q8wKuVWvcxHwic0J49gpohiM=; b=FkKAvFaO8WHU3wozFtFucW9hpT
	yR0+JBeoAugNGDStkr5+ktpLG2KSvdyQ2/o+qReQSn3nZgS9nrJzzuIhE+wWRKoFNm91wbFBTIaaI
	XoJ+RpdkBvlIQfLXNKCQOkahK12yv8alTTL2J16f+7VGM1XX/PdRn9mKk/rDd+ijzGbg=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nEBY9-0002if-Pt; Sun, 30 Jan 2022 15:51:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/13] ARM: dts: add clock support for Airoha EN7523
Date: Sun, 30 Jan 2022 15:51:10 +0100
Message-Id: <20220130145116.88406-8-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver only registers fixed rate clocks, since the clocks are fully
initialized by the boot loader and should not be changed later, according
to Airoha.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/boot/dts/en7523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index f1d4c03aad89..1e5280be02ba 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -82,6 +83,13 @@ L2_0: l2-cache0 {
 		};
 	};
 
+	scu: system-controller@1fa20000 {
+		compatible = "airoha,en7523-scu";
+		reg = <0x1fa20000 0x400>,
+		      <0x1fb00000 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@9000000 {
 		compatible = "arm,gic-v3";
 		interrupt-controller;
-- 
2.32.0 (Apple Git-132)


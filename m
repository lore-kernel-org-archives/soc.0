Return-Path: <SRS0=kJ9B=TZ=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73847C43217
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 08:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D488C340FB; Mon, 14 Mar 2022 08:44:31 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 423A9C340E9;
	Mon, 14 Mar 2022 08:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 423A9C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6ED+3y9Uo8YjAaZ+tT2E38tEctlcxth+81kzQfm7swk=; b=GIqtL+kgsQqRFZ1iZkPypCPzzG
	73L7LIKXLcVGXze3I3K8hQiv0Q5QheguZ2mxFp1TeXGYA9IE0Bd6Q9KOZaSXoslpVH3O0pDiGTplT
	QQd1mGyu5tHv60m1FNrTLCFMmHfOB6EjFhsdOZrlJNv7aeqwQ++976mgQaHdgRucih/g=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nTgJQ-0002UN-SX; Mon, 14 Mar 2022 09:44:20 +0100
From: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/6] ARM: dts: add clock support for Airoha EN7523
Date: Mon, 14 Mar 2022 09:44:05 +0100
Message-Id: <20220314084409.84394-4-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
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
index 36597f587f46..2e705b87b6c1 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -83,6 +84,13 @@ L2_0: l2-cache0 {
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
2.35.1


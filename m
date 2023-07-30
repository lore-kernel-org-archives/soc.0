Return-Path: <SRS0=+jNW=DQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB1EC001DE
	for <soc@archiver.kernel.org>; Sun, 30 Jul 2023 11:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A722C433C8; Sun, 30 Jul 2023 11:15:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7929C433CA
	for <soc@kernel.org>; Sun, 30 Jul 2023 11:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7929C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdf08860dso630804566b.0
        for <soc@kernel.org>; Sun, 30 Jul 2023 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690715739; x=1691320539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60SWNJaNV4tC0O+dHQ6OkEZk+glu++Ik9FCyrUU58Lk=;
        b=HxX+d5RYKg8L7BfQAP0Pc+GsXgpgr86jB0DPj3Qcm8yE2+C0EVQ/grUOnjNs5/aq6d
         qHTCkA2R1Uu83AepVmP+KmENuCJbZtsht34v64gqp7iY79DnkhhQObC1AcTjAdYHbtlK
         iClklxqLxMmDQ2K37xrh9lePd9oF+7g8mkiSUlkZYOxlq5LWGQGASWabODHOgzynLeLk
         kwafgBdQSicgdGiJcbEftWsgUr+mlWr5gy8NLSfeki7I8HsdFbaQXzQxHyIrBM2nakxA
         N7EjPqEuE0W1trYflhK5uXvEJE04aJMrCJXhaJoehiVgQJoX5AKx2FUuePzZQzA5Z6n5
         iqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690715739; x=1691320539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60SWNJaNV4tC0O+dHQ6OkEZk+glu++Ik9FCyrUU58Lk=;
        b=clrvjhjtglTwkAY/074Tt8CCOWfRVdfm+1IWvhQSBYqE59pNlfYAUe9z10fEstewqW
         N7dfdL3p5MsuumnwIsx6Rz5nW1zRYri/ZJdb8KOLc/rM5pZnX7RyjWHnzquvoVkd3EGq
         6pJf7ylCwi4m3q8C0eFmPq4eoPsl5c5tx+6pGKFx5U2gEAO6yZzxMCFWAN7Pr21YIMNz
         7fZbYzhPZIfD2OwYpWfQsOE0dnsA1ftIIoLN6Re5Q6fUNWZWU1R8M5Pa/HnGB1Y7Shys
         qhj3p7CpMpZkm9H+N9eLfzObq/XbZou5D56ZHvm5eT31hneeZjBziUTxttUvaWUb/GuF
         cpUw==
X-Gm-Message-State: ABy/qLaJe/SNJS/sY8rkFy5xX79InVbxYSdm3rAeKiyvB3W4cTxc+teM
	SM+9YZpx16Ac5LwR0K8aFITMjQ==
X-Google-Smtp-Source: APBJJlFXBaGmENNJpHK3sP89cHAxgA5CghPTpwI7R9ank1cMWDM137kN2j6bPnnYiX0+7W0CQpFaqw==
X-Received: by 2002:a17:906:8a54:b0:99b:ce6d:fc90 with SMTP id gx20-20020a1709068a5400b0099bce6dfc90mr4598020ejc.2.1690715738867;
        Sun, 30 Jul 2023 04:15:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00985bdb7dd5fsm4471018ejj.201.2023.07.30.04.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 04:15:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: st: spear: split interrupts per cells
Date: Sun, 30 Jul 2023 13:15:36 +0200
Message-Id: <20230730111536.98164-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each interrupt should be in its own cell.  This is much more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/spear1340.dtsi |  8 ++++----
 arch/arm/boot/dts/st/spear13xx.dtsi | 24 ++++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1340.dtsi b/arch/arm/boot/dts/st/spear1340.dtsi
index d54e10629a7d..51f6ffd08b42 100644
--- a/arch/arm/boot/dts/st/spear1340.dtsi
+++ b/arch/arm/boot/dts/st/spear1340.dtsi
@@ -63,8 +63,8 @@ i2s-play@b2400000 {
 			compatible = "snps,designware-i2s";
 			reg = <0xb2400000 0x10000>;
 			interrupt-names = "play_irq";
-			interrupts = <0 98 0x4
-				      0 99 0x4>;
+			interrupts = <0 98 0x4>,
+				     <0 99 0x4>;
 			play;
 			channel = <8>;
 			status = "disabled";
@@ -74,8 +74,8 @@ i2s-rec@b2000000 {
 			compatible = "snps,designware-i2s";
 			reg = <0xb2000000 0x10000>;
 			interrupt-names = "record_irq";
-			interrupts = <0 100  0x4
-				      0 101 0x4>;
+			interrupts = <0 100 0x4>,
+				     <0 101 0x4>;
 			record;
 			channel = <8>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 913553367687..3b6897084e26 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -39,8 +39,8 @@ gic: interrupt-controller@ec801000 {
 
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
-		interrupts = <0 6 0x04
-			      0 7 0x04>;
+		interrupts = <0 6 0x04>,
+			     <0 7 0x04>;
 	};
 
 	L2: cache-controller {
@@ -141,10 +141,10 @@ fsmc: flash@b0000000 {
 			       0xb0820000 0x0010	/* NAND Base ADDR */
 			       0xb0810000 0x0010>;	/* NAND Base CMD */
 			reg-names = "fsmc_regs", "nand_data", "nand_addr", "nand_cmd";
-			interrupts = <0 20 0x4
-				      0 21 0x4
-				      0 22 0x4
-				      0 23 0x4>;
+			interrupts = <0 20 0x4>,
+				     <0 21 0x4>,
+				     <0 22 0x4>,
+				     <0 23 0x4>;
 			st,mode = <2>;
 			status = "disabled";
 		};
@@ -152,8 +152,8 @@ fsmc: flash@b0000000 {
 		gmac0: eth@e2000000 {
 			compatible = "st,spear600-gmac";
 			reg = <0xe2000000 0x8000>;
-			interrupts = <0 33 0x4
-				      0 34 0x4>;
+			interrupts = <0 33 0x4>,
+				     <0 34 0x4>;
 			interrupt-names = "macirq", "eth_wake_irq";
 			status = "disabled";
 		};
@@ -263,8 +263,8 @@ i2s@e0180000 {
 				compatible = "st,designware-i2s";
 				reg = <0xe0180000 0x1000>;
 				interrupt-names = "play_irq", "record_irq";
-				interrupts = <0 10 0x4
-					      0 11 0x4 >;
+				interrupts = <0 10 0x4>,
+					     <0 11 0x4>;
 				status = "disabled";
 			};
 
@@ -272,8 +272,8 @@ i2s@e0200000 {
 				compatible = "st,designware-i2s";
 				reg = <0xe0200000 0x1000>;
 				interrupt-names = "play_irq", "record_irq";
-				interrupts = <0 26 0x4
-					      0 53 0x4>;
+				interrupts = <0 26 0x4>,
+					     <0 53 0x4>;
 				status = "disabled";
 			};
 
-- 
2.34.1


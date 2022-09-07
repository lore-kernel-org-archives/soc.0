Return-Path: <SRS0=kTxA=ZK=gmail.com=saproj@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F99C38145
	for <soc@archiver.kernel.org>; Wed,  7 Sep 2022 17:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CD38C433D7; Wed,  7 Sep 2022 17:54:05 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76B69C433D6
	for <soc@kernel.org>; Wed,  7 Sep 2022 17:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76B69C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id b19so16866840ljf.8
        for <soc@kernel.org>; Wed, 07 Sep 2022 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=zYU9e6+rW3YlNt9/cxNc1/gsizy2sZMh8xlX3YWM9ak=;
        b=Exl1ow4AX3EGWJT5QnfxeA2RKjRmlP4BTPhr3C/gX+JBSQ7uotqrFWkfi82RwyaKBi
         ibL18Q+YfB/DJVsepARdyLUq8/9j7qOGvrnTZJzthp9kZ2A2FvkcrLm7ejnQT5O+B53g
         a/9cQmlY9gMUfwEyOMvhjJsfWzC0a+4tW2MkAxcg2sT52ZGqopaNKAth3+2oNQQnxikS
         aL1qwaIS6oVsQ+SAY25etTDdjZ/c7V2nZ6qXRHWJmSCtHKNlGqItyEUDjkoBtV7ts/eh
         ScZ+3MZjreqEwTfz7N90XkD/+Uodqt35O7VDeRXl9lNfytiwIwb8U04zbWYBCU8D8/1B
         rcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=zYU9e6+rW3YlNt9/cxNc1/gsizy2sZMh8xlX3YWM9ak=;
        b=ylDWHSaS8Z8et7uBAVzBn1SowP4JtN4Zqf5GsFOsy/TKkfw2ArMPq2GidpPuFfMjxF
         1Dgg3Krj1jOfMwyW4ZruvuWKMejBpjhtJNUP4nLnQr5npyFmq9DS02b0zAxT0tebqood
         XJquyN/Kiesw2bpeX02R557tycH6qLafwGSQlpSYr0BFRlB+XeN8ikeS36abKEy5HEpZ
         AsO8HUaqTcZPBkOjPMSQv1/JmNDWXl/S+1mV3G7TCz5AG6BtMlXLzleZ63A6Y91t5pIh
         xFWp+Jb5ohxM2RNpsPog/tOSfn+utnpURCaM2fekDSSJUWKANaagrYLojwykxbkOFkx6
         /Zhg==
X-Gm-Message-State: ACgBeo1UPEv4VQ9UKsVUNOeTvj5jQVLp42AU4aCUcXo37XpUkhP5J1Z9
	Dv3TfZI0Ddd0YuyfzGe8GG3hcMCUwfmcBA==
X-Google-Smtp-Source: AA6agR6wbbL8TVZJPHS1JEv5zkQdgRR0ARJ0qBSVdTnzAl2pVWQ59/N5C6UzxaWIF8YrPtVwjca01Q==
X-Received: by 2002:a05:651c:549:b0:268:e0b3:4795 with SMTP id q9-20020a05651c054900b00268e0b34795mr1405884ljp.313.1662573242605;
        Wed, 07 Sep 2022 10:54:02 -0700 (PDT)
Received: from saproj-Latitude-5501.yandex.net ([2a02:6b8:0:40c:b01c:9ff4:8f8e:3acd])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24c4a000000b0048cf43c3a85sm555529lfk.238.2022.09.07.10.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 10:54:01 -0700 (PDT)
From: Sergei Antonov <saproj@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Sergei Antonov <saproj@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonas Jensen <jonas.jensen@gmail.com>
Subject: [PATCH v2] ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
Date: Wed,  7 Sep 2022 20:53:41 +0300
Message-Id: <20220907175341.1477383-1-saproj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver moxart-mmc.c has .compatible = "moxa,moxart-mmc".

But moxart .dts/.dtsi and the documentation file moxa,moxart-dma.txt
contain compatible = "moxa,moxart-sdhci".

Change moxart .dts/.dtsi files and moxa,moxart-dma.txt to match the driver.

Replace 'sdhci' with 'mmc' in names too, since SDHCI is a different
controller from FTSDC010.

Signed-off-by: Sergei Antonov <saproj@gmail.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
---
v1 -> v2:
Per Arnd Bergmann's suggestion, replaced sdhci with mmc in names too.

 Documentation/devicetree/bindings/dma/moxa,moxart-dma.txt | 4 ++--
 arch/arm/boot/dts/moxart-uc7112lx.dts                     | 2 +-
 arch/arm/boot/dts/moxart.dtsi                             | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/moxa,moxart-dma.txt b/Documentation/devicetree/bindings/dma/moxa,moxart-dma.txt
index 8a9f3559335b..7e14e26676ec 100644
--- a/Documentation/devicetree/bindings/dma/moxa,moxart-dma.txt
+++ b/Documentation/devicetree/bindings/dma/moxa,moxart-dma.txt
@@ -34,8 +34,8 @@ Example:
 Use specific request line passing from dma
 For example, MMC request line is 5
 
-	sdhci: sdhci@98e00000 {
-		compatible = "moxa,moxart-sdhci";
+	mmc: mmc@98e00000 {
+		compatible = "moxa,moxart-mmc";
 		reg = <0x98e00000 0x5C>;
 		interrupts = <5 0>;
 		clocks = <&clk_apb>;
diff --git a/arch/arm/boot/dts/moxart-uc7112lx.dts b/arch/arm/boot/dts/moxart-uc7112lx.dts
index eb5291b0ee3a..e07b807b4cec 100644
--- a/arch/arm/boot/dts/moxart-uc7112lx.dts
+++ b/arch/arm/boot/dts/moxart-uc7112lx.dts
@@ -79,7 +79,7 @@ &clk_pll {
 	clocks = <&ref12>;
 };
 
-&sdhci {
+&mmc {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/moxart.dtsi b/arch/arm/boot/dts/moxart.dtsi
index f5f070a87482..764832ddfa78 100644
--- a/arch/arm/boot/dts/moxart.dtsi
+++ b/arch/arm/boot/dts/moxart.dtsi
@@ -93,8 +93,8 @@ watchdog: watchdog@98500000 {
 			clock-names = "PCLK";
 		};
 
-		sdhci: sdhci@98e00000 {
-			compatible = "moxa,moxart-sdhci";
+		mmc: mmc@98e00000 {
+			compatible = "moxa,moxart-mmc";
 			reg = <0x98e00000 0x5C>;
 			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_apb>;
-- 
2.34.1


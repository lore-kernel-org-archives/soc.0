Return-Path: <SRS0=YS8J=4I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ECBC25B04
	for <soc@archiver.kernel.org>; Sat, 10 Dec 2022 11:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A05EFC4331F; Sat, 10 Dec 2022 11:33:51 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8AA5C433D2
	for <soc@kernel.org>; Sat, 10 Dec 2022 11:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8AA5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id s8so10993357lfc.8
        for <soc@kernel.org>; Sat, 10 Dec 2022 03:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQb/YxDmg3WRV5VwyOoHcCZWorD7UL47Mk4PA4a4FQc=;
        b=OXATOLg9JYiPcxWSD6cU9ST5jmTx4pL0IeHcP8/15/6bkbVpwDzKpRzmt+pyS834AW
         iHLna+Y4Y1RURsuohQddgiDFW42KPnyLYyvxgCOKzTRx18xqloVYRU28cCHkijwG9/vh
         vlTnRUSR1jtZ97lDxvJKJcb2+IhFllmsZca0eMOZRdoxss01jhIqeoU7OayPL/xUm48Z
         qwPlzOmT6HddRrbMpcAIHYLtTQ+lWFTmqXa9wPvyGnoxUtbjTfF/Bhl2GaT3EHMKv8mN
         9XDV+BRvbup3p4gab0wKRexSM2fBwCDAmWwGroeYfhQ+qVavVLPNJoswp0CT0PcL6fQ0
         8cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQb/YxDmg3WRV5VwyOoHcCZWorD7UL47Mk4PA4a4FQc=;
        b=IpKHQldQiV5yCXw6OEBudOUfXObPK2sFtPAsDdGcD3wZaVbySVYNx6rqj53lssRnVg
         rKewDk2vpfXy4aEZpMEKp/ZHM9UZVKK3AexlagEMI5Egnk5CX0xiaoIZI384Y0p7q3Rm
         wP5jbQYgvRk/uDQG51NCu+eQXDahW7UsgTUVh7RXqDSLBBENWfzXNtm9PB2Bj6YaMRHt
         FI4CGykA0bLQVJYO8ByA0dhsfNSbWoBfUmoPcxbzlAAahPeF9+bQ5uYSNjy1nVNnyc+9
         4n1dURH2zFOvtzYPQelBEeWd+AnTIMUZ19uhTOsUBplEeHpdHwTcVJaatLHJXODv0mGq
         HhmQ==
X-Gm-Message-State: ANoB5pkOl9t6YILbGGTNBnhfbmx3/H/N9q9SYZMv0H9AEpxWqWGFYLaw
	OveGggISLYBJKi/eWnmgKKh3TA==
X-Google-Smtp-Source: AA0mqf7IVjYG4W4DNo+gzrSYxWA7ZCl5Mvajox9s4euvPH1Z/9LN1C2ZpcnKKzYqNF1IvrtLWQILhQ==
X-Received: by 2002:ac2:555b:0:b0:4b0:6023:6f71 with SMTP id l27-20020ac2555b000000b004b060236f71mr2460351lfk.62.1670672028799;
        Sat, 10 Dec 2022 03:33:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o27-20020ac25e3b000000b0048a9e899693sm696055lfg.16.2022.12.10.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 03:33:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: spear: drop 0x from unit address
Date: Sat, 10 Dec 2022 12:33:46 +0100
Message-Id: <20221210113347.63939-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By coding style, unit address should not start with 0x.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/spear300.dtsi | 2 +-
 arch/arm/boot/dts/spear310.dtsi | 2 +-
 arch/arm/boot/dts/spear320.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/spear300.dtsi b/arch/arm/boot/dts/spear300.dtsi
index b39bd5a22627..f1135e887f7b 100644
--- a/arch/arm/boot/dts/spear300.dtsi
+++ b/arch/arm/boot/dts/spear300.dtsi
@@ -46,7 +46,7 @@ sdhci@70000000 {
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0x50000000 {
+		shirq: interrupt-controller@50000000 {
 			compatible = "st,spear300-shirq";
 			reg = <0x50000000 0x1000>;
 			interrupts = <28>;
diff --git a/arch/arm/boot/dts/spear310.dtsi b/arch/arm/boot/dts/spear310.dtsi
index 77570833d46b..ce08d8820940 100644
--- a/arch/arm/boot/dts/spear310.dtsi
+++ b/arch/arm/boot/dts/spear310.dtsi
@@ -34,7 +34,7 @@ fsmc: flash@44000000 {
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0xb4000000 {
+		shirq: interrupt-controller@b4000000 {
 			compatible = "st,spear310-shirq";
 			reg = <0xb4000000 0x1000>;
 			interrupts = <28 29 30 1>;
diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
index b12474446a48..56f141297ea3 100644
--- a/arch/arm/boot/dts/spear320.dtsi
+++ b/arch/arm/boot/dts/spear320.dtsi
@@ -49,7 +49,7 @@ sdhci@70000000 {
 			status = "disabled";
 		};
 
-		shirq: interrupt-controller@0xb3000000 {
+		shirq: interrupt-controller@b3000000 {
 			compatible = "st,spear320-shirq";
 			reg = <0xb3000000 0x1000>;
 			interrupts = <30 28 29 1>;
-- 
2.34.1


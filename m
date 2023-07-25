Return-Path: <SRS0=w88Z=DL=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372FC0015E
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 09:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37F91C433C9; Tue, 25 Jul 2023 09:40:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EF3AC433C7;
	Tue, 25 Jul 2023 09:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EF3AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-66c729f5618so4989843b3a.1;
        Tue, 25 Jul 2023 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278042; x=1690882842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=cujy8UqGDjuyBZJHn1z+l9lF/kWHcrNYBfxgTOA5WChq5oixPUID8eq47Zn8IWxCq/
         PmoRCyAOv90ccO4UNR85LS2dTxLgmecAMP+s37EVv/KF+5fFO14QK4/uBIcy1dq7lYbv
         naG8u2A/Ve+3BxAZmoTAyU60nWOmKHF9eTJ9RL0EaT06/kDw/3ChOknw/98kpWLHBplq
         2Sle8MMwZgox6Tz2cifS1ORN/SMyC8S1A0nP8mLu3TQg7bjgZmlHW9HJzRbCzF8Bjd7t
         mwoCkT02XhnIKvi2Q1CsiIcqgpNfQt7CqR/SYt7nLzNd1dSEKV0skG8EuMK6wnD7LNZ7
         M2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278042; x=1690882842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=ZmTvKeCrKZu9J30c6BWd5t8eNPMG8MeIClJljhmd5kyj6dYOGLMHooYnmC3aD6TGij
         zZ/qoPC4rBHTxXQtegjIDW679tB1vSC+HkEORZdZS/y2gOZONVjkyV9N5NOTrevz7Rl/
         /X7kg/6fh1o7llIhdtozUCLHaCt/pbDZFB4VFBU2O6looQgCG/l7RhJlxUWdDRcfchSV
         lw3JEB0NrCBzTFB09jcBHGs+mq6aPYGNkjT7F3tj2xhTvDbjCyS8KMYdPzZXm2qhKyBw
         AJvtjqrCU/g2Me9zhZyz0z/tU+XQUKbQqwl5f3CJ6S0+NJkuxtJWQ5xL92iR+nDJTTHc
         z24Q==
X-Gm-Message-State: ABy/qLYdcqZZxDAw6OhkTafS3X+jcL2W8hjIpk/N95Wj3qBVcpRwYHoo
	adaMUSOQR6Pxr2i66JCfGxo=
X-Google-Smtp-Source: APBJJlH0N05ZRzXPHsjXaGG8G3yeI+QTct1OR8cDXXiyThVYUCkJPZ4UoOTayAQk3LwqDxWxki0hZQ==
X-Received: by 2002:a05:6a00:15ce:b0:67c:5c21:b430 with SMTP id o14-20020a056a0015ce00b0067c5c21b430mr14332040pfu.33.1690278042621;
        Tue, 25 Jul 2023 02:40:42 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id l24-20020a62be18000000b0064f7c56d8b7sm9121132pff.219.2023.07.25.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 02:40:42 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	mjchen@nuvoton.com,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add rtc for ma35d1
Date: Tue, 25 Jul 2023 09:40:29 +0000
Message-Id: <20230725094030.32877-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725094030.32877-1-ychuang570808@gmail.com>
References: <20230725094030.32877-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add rtc controller support to the dtsi of ma35d1 SoC and
enable rtc on SOM and IoT boards.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 4 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 4 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index b89e2be6abae..b3be4331abcf 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -54,3 +54,7 @@ &clk {
 			   "integer",
 			   "integer";
 };
+
+&rtc {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a1ebddecb7f8..9858788a589c 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -54,3 +54,7 @@ &clk {
 			   "integer",
 			   "integer";
 };
+
+&rtc {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 781cdae566a0..394395bfd3ae 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -95,6 +95,14 @@ clk: clock-controller@40460200 {
 			clocks = <&clk_hxt>;
 		};
 
+		rtc: rtc@40410000 {
+			compatible = "nuvoton,ma35d1-rtc";
+			reg = <0x0 0x40410000 0x0 0x200>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk RTC_GATE>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1


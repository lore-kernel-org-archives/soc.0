Return-Path: <SRS0=98Po=DG=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02486C001B0
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 01:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E05F8C433C7; Thu, 20 Jul 2023 01:28:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F26D1C433C8;
	Thu, 20 Jul 2023 01:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F26D1C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b8a462e0b0so1594215ad.3;
        Wed, 19 Jul 2023 18:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689816518; x=1690421318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=eqUPBahja8GTfVR6T6fFNkk2833efQusNbZx+/WiUnuJ4kY/GBoQIUsDwZ/MP3Lusy
         F/ZMLqgaEQ9OL4AOnwKeWYtcAfbDHs5M195JDiqgIlbeyJe7ps3obAo2OPZCAtQGtIUl
         y+mfY0MDjUmB1+7V/1DuBg5bJYAsKbms9z0SCDU/N3vMohYXzS6D6RCyev1T/K+HnVVI
         E036YQ3eCNDNCGP+Z6JBnea7Nx9ZlSZNQhJYr7shN/AcUPTcdeWA+4+FnM6mvzHwHv2K
         lWNXwHnd3PrMc0g/jjNZrA86u58+hOYGuZfrCs1l1EOxU2lRshLeCVZLfe4k3zmivwNM
         zvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689816518; x=1690421318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=llrMR+axTOOdHDpzPnYzTM6DrLNW/9g+MuVoYBoKLf89YOpETkPziEcWyiQ3hnB3bh
         Rd+AfmQe5AQjdWInaNK5mU7lOYRB0AgvyN/TqKp98d0qgAQzuf6hAeTAXfEwvtbkGoMe
         QqCX6e2HtlAvVo8ClFTy+1pajUJhpeqH1f6wL+w7ECC6dRv646XNQBXmU5fLKj1euMnK
         oFzDILMvNaewpa/fmAc0z17jBesV2+/Jl+0piCX+Lwu48KOM38/q0vwF55vF59NakcDG
         qF+r5xLcx8uKU3AkHF0ex2V1EeNI/biqPtzcfVLjI3sNODFYE0qoRJSAmAibiEVOHf0o
         RDfg==
X-Gm-Message-State: ABy/qLYOjZan2yP9O7wbZdv+C/ClOZgk+v4f703ko41NDprx3gbMLrtu
	Nf/Z+T9GIbwrmeiuGLL8y+I=
X-Google-Smtp-Source: APBJJlEhuwr7n6DNGJ88bgpAmDcrLbybNZ+8zRVk9zTgXhTN0mbnD3ADnzhKzc0aNPcLpdskJYyXyw==
X-Received: by 2002:a17:902:9689:b0:1b8:8dab:64e8 with SMTP id n9-20020a170902968900b001b88dab64e8mr3762203plp.36.1689816518213;
        Wed, 19 Jul 2023 18:28:38 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001b1a2c14a4asm4673998plb.38.2023.07.19.18.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 18:28:37 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: nuvoton: Add rtc for ma35d1
Date: Thu, 20 Jul 2023 01:28:25 +0000
Message-Id: <20230720012826.430026-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230720012826.430026-1-ychuang570808@gmail.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
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


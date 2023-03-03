Return-Path: <SRS0=n/Pu=63=gmail.com=tomato1220@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86367C7EE2F
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 06:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 669EAC4339B; Fri,  3 Mar 2023 06:37:05 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FDFEC433EF;
	Fri,  3 Mar 2023 06:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FDFEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id y19so880914pgk.5;
        Thu, 02 Mar 2023 22:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUufnqGUd6ZHw3YSoTgde4z4+kgG2gE44eDuR5QPdSQ=;
        b=T0qlZ92uB9S9P2212hvx5nufAkStuhEvfjJuYeTTt38/bUnwhLGGjMOjSpq8kVJkoi
         acuuH28YYfnaUKPCpLVh783Ku4PotFXIOkfGYHJiifeSQ7s11NPkw8wd+QF9+TZiB2f1
         LESAtvLfZbZ5x2/7qPZnkVEHu29RZYsN/ukETcbAVw3qrAb5Seh52p2IYb3cWOSKocxO
         3p2V4e3lO73eaV5M/qzGkh9eEBBz6/g8liVM8hK4i1mHDfnOdZH//nFQjfexiNLwfESU
         c7GUtHaa2ZIfVAgAtoA8tSqCSZFgVS4nioNTiNRNZgspdEJmfGM1Z344Gwv80hPzzfcN
         KK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUufnqGUd6ZHw3YSoTgde4z4+kgG2gE44eDuR5QPdSQ=;
        b=DV8QXjIBh+eH7llm53P09fsc2+azdTrIDMUWnd9456DMlKWjr41RGW9JaGQaERFHH5
         66QA5ksoRUucc+7acMiOI+rbwKOmlaqNC43H7Mq6hbEbUfpvZg+C650gwwvHTmWSVfvr
         +1kMyw8NEeShqGO1iPYtnfaZd8EkhPDw+mvRnLD9vzY2z8i9drvRcsaSdOy9r1KGoJQz
         9vYNf5lwVVHdHUgtNelsSZhr8fD6CFwus+0E/27gHMW6FCvI93M/Z9AxdTZLPuFWLjvd
         UQb1SfUktrOX2fgGNvb4KK2Qor7ueu0mrVudTAzQupwu7DZl4BxT7EdXoACj5hr+HMKd
         WLZQ==
X-Gm-Message-State: AO0yUKWnBVEQgL2UvEtiIy6YjSTSAbMKGIJyGLhAHM3cIusT4pJf7+7q
	xPWV0QVONr0TTlXG59srmTw=
X-Google-Smtp-Source: AK7set+KhVV1I4OqZOVr0styK+EuLYSUZYlFYuUiA/gFYJhR8P8CMhyhb1vyP7395AzuKK1/fwoDXg==
X-Received: by 2002:aa7:940b:0:b0:5a8:b705:4dd3 with SMTP id x11-20020aa7940b000000b005a8b7054dd3mr1212764pfo.13.1677825423959;
        Thu, 02 Mar 2023 22:37:03 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:03 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com,
	David Wang <davidwang@quantatw.com>
Subject: [PATCH 6/7] ARM: dts: nuvoton: gsj: Add non-mainline nodes
Date: Fri,  3 Mar 2023 14:34:34 +0800
Message-Id: <20230303063435.803097-6-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the remaining non-mainline component of the patch that adds the
GSJ machine.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 2a394cc15284..48110f8aa3ca 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		ethernet1 = &gmac0;
 		serial3 = &serial3;
+		udc9 = &udc9;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
@@ -184,10 +185,40 @@ &gmac0 {
 	status = "okay";
 };
 
+&mc {
+	status = "okay";
+};
+
+&emc0 {
+	phy-mode = "rmii";
+	use-ncsi;
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&udc9 {
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
@@ -216,6 +247,10 @@ &adc {
 	status = "okay";
 };
 
+&otp {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
-- 
2.25.1


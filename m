Return-Path: <SRS0=f40L=D2=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178CCC04A94
	for <soc@archiver.kernel.org>; Wed,  9 Aug 2023 01:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3C61C433C9; Wed,  9 Aug 2023 01:15:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0736DC433C8;
	Wed,  9 Aug 2023 01:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0736DC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so41476105ad.3;
        Tue, 08 Aug 2023 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691543753; x=1692148553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=awr0YsovglR+Jd2wnMTzJ9wZrwIlhm5o09UjyNtJVH7JbzocQYlT465++coRkPHpCD
         ztOmH6QEptaiuxNr4nuA+ja4EWblQPW2h6oGs6fqJF66aN/SNHAOQ0pvrApD+RjHbOn/
         KnhB4CfI/487eM5HM4wsD7fZWpt1EUgvl/75KaAXPtHDIpr6e8o2MANh73mQyjJXK5lA
         moxFLenfURIwFhPTYn7/EPk/NPjU5OrYE3qMdNZ9c4Dt6SCOfPcgQXNH4GijyCQOKJMx
         cpc7bji2nBlBQ8oJ6UB2jgvsCqnMYB1Gb0vBRm9wA5W86ek3H+ioCBcIqvtEsk8XmNma
         iT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543753; x=1692148553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDGT67Q+ic1nejZuLGS46+I/MVwpubEr1pR0ugjy0IU=;
        b=WvsIT/ox5lHho/T55vsQzgWz+c9mmTgOC47R6mFhaxgusNxnC6JdiQso6J77k7wPpJ
         dyhEMEoBzv11TM6H+NtL3F3iDp22KDuq/jCpTMpBKh13m1q2WsfOPEO7XbPG43gmmDGK
         mcQonRpEN5oS4yBFAEywAlM/orMCQRdr6b5sa76Z0XR9AGuCe3SFafeo46L1bZ6PlTZB
         SnE3hf/dru0kHXrMqKGfc07Vzwnd1qr/EcysHDHltaPpKI30pwsb2Oy8OLYN9CyV3C7P
         AcWicXeZI+TrV+wl3Kfne5jCCNsM5RiMO3j6mLMiXA9SO9F3OP8xMI1wMoYVfbVXnc6h
         Lsdg==
X-Gm-Message-State: AOJu0Yy1sJJGJXBrrtigy6t5ZIImA40ECxHWzTcHOCgArpRj0h/xlMO6
	s8Mv9fvtnYpsZtkcqoy9Pj5yX43xd0E=
X-Google-Smtp-Source: AGHT+IGQH7HNY7Iq78cnQi9mP7ucP6QArzO99O5R9IRiNGKy1sSK/tfRzmIS4THliDgyzxklrRxmVg==
X-Received: by 2002:a17:902:d717:b0:1bc:50f9:8f20 with SMTP id w23-20020a170902d71700b001bc50f98f20mr1221753ply.23.1691543753224;
        Tue, 08 Aug 2023 18:15:53 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001bc68602e54sm5730449plo.142.2023.08.08.18.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:15:52 -0700 (PDT)
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
Subject: [RESEND PATCH v2 2/3] arm64: dts: nuvoton: Add rtc for ma35d1
Date: Wed,  9 Aug 2023 01:15:41 +0000
Message-Id: <20230809011542.429945-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230809011542.429945-1-ychuang570808@gmail.com>
References: <20230809011542.429945-1-ychuang570808@gmail.com>
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


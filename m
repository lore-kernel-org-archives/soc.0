Return-Path: <SRS0=rHyZ=LM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32C4C48BDF
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 20:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89379610C7; Fri, 18 Jun 2021 20:55:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C875761260
	for <soc@kernel.org>; Fri, 18 Jun 2021 20:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C875761260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id f2so12079675wri.11
        for <soc@kernel.org>; Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sTMrkLH33QcTYAmCmYzm6ZHr2W5AOWeg+lqcFyiCyr0=;
        b=O3dGmcXCtw9lYBqWTYYWBPbQzzstHy0LKNyQBUOmq3wzI5TxW0FvlMhvSWqyn64iCg
         RVLmEil0rlpF411jvMMfrn1ZcScnhIqmBUhszkSy21FREulFqltV0pTgeQ3p9SQvJKmR
         cI6JKwuXDqwfnSkZ/Iy4eFHCmW03phedmjxXAgyV+r7ygBmxpy27cEjA1XdHCzoc5/Fj
         XAjBpOVgoCgwzG4ZDKYS+S/6EyMAfw/jvxJHumD+Hea33wxCjDsCgAupd4sUoKfv8qXE
         BhUXMu1ij9xcaCUmHRk1Ygyqup9LZJV9Uxn9mQQ73nA0yKEPTDCg5m1oEkufuuZwTK3K
         HYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTMrkLH33QcTYAmCmYzm6ZHr2W5AOWeg+lqcFyiCyr0=;
        b=aeHqVFlxqiZ5plHA8hJ2dso4l26tTRhDg6jGq0KzY7D02fYwpdrcjqyFZONvhD2TXf
         0O65hQhB4x+R0q7wRYM18bnPvgQczYo/m6jeLXAxM6Of9mQvN/031pVARqDryk5iquGh
         D8Q+DPAnLGCxRCM2n0QKsJCX5GHAw3BkKJI1X9KuBjhS5+PiPco5ddIDQh1WvVoCXPAu
         sQSrICgg2zjeAwKmeGMchU/DiMnsYOEmYCDXnbGV4ye/d93VvEzGwItxeHuB0SChSER7
         gtXTL2oNj4L9mTxHYRf82uks4y3GV2xsgOkj40fyV5tEWlKTB8nfwNJbhzt85VblI6/A
         lCFQ==
X-Gm-Message-State: AOAM531Vk+2lY7Z41443f8peflGrpUKno3SJsUJmLY7fnYD8wI65fKQz
	oXLwwft7U3oQ6BCqzMwADnNAWg==
X-Google-Smtp-Source: ABdhPJzecFQwRn7K69AaWw6n1KwseQmQ6firgw6Oi59mrVcis9F+GSZhd+3uZB86CVKZ5AW+ggmAhw==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr13319533wru.129.1624049741534;
        Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	linus.walleij@linaro.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org,
	ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 1/5] ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
Date: Fri, 18 Jun 2021 20:55:29 +0000
Message-Id: <20210618205533.1527384-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding label will help simplify boards's dts.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index cc053af3c347..9fe0fd93ac9e 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -16,7 +16,7 @@ soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&intcon>;
 
-		flash@30000000 {
+		flash: flash@30000000 {
 			compatible = "cortina,gemini-flash", "cfi-flash";
 			syscon = <&syscon>;
 			pinctrl-names = "default";
@@ -322,7 +322,7 @@ pci_intc: interrupt-controller {
 			};
 		};
 
-		ethernet@60000000 {
+		ethernet: ethernet@60000000 {
 			compatible = "cortina,gemini-ethernet";
 			reg = <0x60000000 0x4000>, /* Global registers, queue */
 			      <0x60004000 0x2000>, /* V-bit */
@@ -365,7 +365,7 @@ crypto: crypto@62000000 {
 			clocks = <&syscon GEMINI_CLK_GATE_SECURITY>;
 		};
 
-		ide@63000000 {
+		ide0: ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
 			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
@@ -378,7 +378,7 @@ ide@63000000 {
 			#size-cells = <0>;
 		};
 
-		ide@63400000 {
+		ide1: ide@63400000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63400000 0x1000>;
 			interrupts = <5 IRQ_TYPE_EDGE_RISING>;
@@ -421,7 +421,7 @@ display-controller@6a000000 {
 			status = "disabled";
 		};
 
-		usb@68000000 {
+		usb0: usb@68000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x68000000 0x1000>;
 			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
@@ -442,7 +442,7 @@ usb@68000000 {
 			status = "disabled";
 		};
 
-		usb@69000000 {
+		usb1: usb@69000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x69000000 0x1000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.31.1


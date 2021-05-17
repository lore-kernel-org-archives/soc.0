Return-Path: <SRS0=sRvu=KM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58574C43460
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 19:32:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 280F561353; Mon, 17 May 2021 19:32:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A9A61263
	for <soc@kernel.org>; Mon, 17 May 2021 19:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A9A61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id d11so7614491wrw.8
        for <soc@kernel.org>; Mon, 17 May 2021 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8WTjWPmIl+NDRjCmABsKVn9l03ziqgB8V0IbKFuAe8=;
        b=aHD6a8IdVjOg0h8WRgNOByK07H0QAQ4/UU76vtJetpUiQI0uTzqBWSA+aUXa8IzbD3
         WVWXUrzA14bH2vQW+g6L7y3wLcY8BJwcnXStZbNfB8b3xGLAKXRFwMEcbHO7OKP6CRAp
         /XX2p4EC1cl1uZWnF/nmJKrmDaJDpiRYslPZ0PObUl53wQPmh1GLaK6wxVaFX/+3H1a7
         sPcwGqYazDaXq7Shh7WFdm94Me8lThY8yPoTRqgN6J7WTz6B73Vdz1cDyOBeW+po/JeP
         Tp7o1M1FmC+jGt0qRNgRok1ollox6tQZL7zsY3V7p2u8eOQ5jN4OinfScYXD5eHP1fiF
         MEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8WTjWPmIl+NDRjCmABsKVn9l03ziqgB8V0IbKFuAe8=;
        b=Q23MRqC9d6cIgW0EtFiKnlhnzGaIREjCBv7JDYQOsDYDA0ocgdSNtwVMllkkvXTnZc
         VN1TUwYl8tVZTGdxLjmk5jNFFhYYXoxiDZOeHNbofEuxRrYVAQfC1JZ/GYDD6MBAwZJL
         xYnNquODg7NdKvH/1LyFwOwKtHlsxTamAp8nhP5K5SSa7Up4E5EWHvdgRqbLTTrLRhjm
         drYnGyHyM9uwgIaG+DXA8TKR60ssnFXXRRolviXQeh9bfxeuo0/SiNcxyhTTAckiB47A
         tvhAxIadiwglTsAzSJhCDlxorD9wdEYk60k8F1eGXXdQcQWztUagLrAAQS7v7Jq/u+8D
         tcow==
X-Gm-Message-State: AOAM530FuWi86fBoUSZLualiITIQ56EsAJZTiTy7y2Cke7vBldS52XsE
	dAZS1dQghbcTefqv8Ef05C1hWA==
X-Google-Smtp-Source: ABdhPJw3CybUk4/0huZ1HOTg4nECJ87UHqLkIlNugxHB4p9+DNz+ufghReTZPLPr1/GLbP2eVN6sgA==
X-Received: by 2002:adf:f58e:: with SMTP id f14mr1545053wro.258.1621279937843;
        Mon, 17 May 2021 12:32:17 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:32:17 -0700 (PDT)
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
Subject: [PATCH 1/5] ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
Date: Mon, 17 May 2021 19:32:01 +0000
Message-Id: <20210517193205.691147-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding label will help simplify boards's dts.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index 065ed10a79fa..6e043869d495 100644
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
@@ -321,7 +321,7 @@ pci_intc: interrupt-controller {
 			};
 		};
 
-		ethernet@60000000 {
+		ethernet: ethernet@60000000 {
 			compatible = "cortina,gemini-ethernet";
 			reg = <0x60000000 0x4000>, /* Global registers, queue */
 			      <0x60004000 0x2000>, /* V-bit */
@@ -356,7 +356,7 @@ gmac1: ethernet-port@1 {
 			};
 		};
 
-		ide@63000000 {
+		ide0: ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
 			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
@@ -369,7 +369,7 @@ ide@63000000 {
 			#size-cells = <0>;
 		};
 
-		ide@63400000 {
+		ide1: ide@63400000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63400000 0x1000>;
 			interrupts = <5 IRQ_TYPE_EDGE_RISING>;
@@ -414,7 +414,7 @@ display-controller@6a000000 {
 			status = "disabled";
 		};
 
-		usb@68000000 {
+		usb0: usb@68000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x68000000 0x1000>;
 			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
@@ -435,7 +435,7 @@ usb@68000000 {
 			status = "disabled";
 		};
 
-		usb@69000000 {
+		usb1: usb@69000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x69000000 0x1000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.3


Return-Path: <SRS0=pvkH=TX=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C17C433FE
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 18:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F15C4C340EE; Sat, 12 Mar 2022 18:06:28 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 615BCC340EB;
	Sat, 12 Mar 2022 18:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 615BCC340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id t187so10203266pgb.1;
        Sat, 12 Mar 2022 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p0GzujtrGM9Z+sUlTt2clDdUTuQkuCPOBQNUOQ7491g=;
        b=JMoKF9I+mRFfMuK0T25u/ur8rVBEIOJGM/i02jlg13o5RMotmChfNNixCR57t0Zye9
         pvn7EzqX0tpt/14Pth37E42Twkvv8+2Wmxi9HIZuPtAh7cCnCQUJO2jYDhj9tw5qvtN2
         is3gU+XiPUjGNazWT1sYwkYyV9MwW2ZfcLeiYG1y6u9+yf/LVavP2eLBmAu+m67a0mCq
         5YOztOkUY65BA3fU9LklrlaFi6hPkAI2knZI+C2pmkVd4D1LWZUb7E+FgSOG3IMoGAF9
         l7fkMBP8iMlVc/p11LkxYMhePEOVs1+CrvFnAhVjJKbjuOmCd8LGw2vK9RtjhfSzPEqc
         UAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p0GzujtrGM9Z+sUlTt2clDdUTuQkuCPOBQNUOQ7491g=;
        b=IgEgnX94+hBNleL2msWrUiO1FrKz8vdXWi9dP2v4ntR7efxNYPenXto3Lu4fNy/EaO
         Fikfr1zNWZh67GLCIRb+AiOgSK/IMgzvASknjY6TbVrtJRyElwBYxi9lVfSKs27rw1GB
         3UprX4EjLYFagI+oD0O6NmP/no+6n0F0yKeKCDJGhCPHDDe9KsNj+NBJrLz4ZYykV48Z
         86Byn6L08frkPhoXUKH+ONlUenjMuboAp+w1kpj4AUoQbcyegPhWMhrcdRBf+Adu1AUU
         W3D73YZPLNZ4tRov50thO4ssMvoAdfLO/jEPBNogk2t5+MWtbQoKacGB+3/b6ojCM/EC
         POGw==
X-Gm-Message-State: AOAM533eX4fR71FSQBB3JNe40EbQEaOX0jp3PnJdNntTWfY35wAhOdFJ
	JbVZ50aO7JvnuATesoC/PnHTWmJ0Qp8=
X-Google-Smtp-Source: ABdhPJyF9kO3rvea9Hls8NcNDo5E9gu1t9UmoheAdi6EQE8QSPmyP5CHKblJH4//un/nzAQtzI1eSw==
X-Received: by 2002:a63:4412:0:b0:372:f29e:3108 with SMTP id r18-20020a634412000000b00372f29e3108mr13209087pga.354.1647108387749;
        Sat, 12 Mar 2022 10:06:27 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id z72-20020a627e4b000000b004f70cbcb06esm14017951pfc.49.2022.03.12.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 10:06:27 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: lpc18xx: Update SPI dma properties
Date: Sat, 12 Mar 2022 23:36:15 +0530
Message-Id: <20220312180615.68929-3-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPI pl022 describes dma-names as RX,TX.
Reorder dmas and dma-names properties to follow specified convention.
And while at it, also fix entries order within dma pairs.

Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
CC: soc@kernel.org
---
 arch/arm/boot/dts/lpc18xx.dtsi | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 10b8249b8ab6..b3070cc927b7 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -317,8 +317,7 @@ ssp0: spi@40083000 {
 			clocks = <&ccu2 CLK_APB0_SSP0>, <&ccu1 CLK_CPU_SSP0>;
 			clock-names = "sspclk", "apb_pclk";
 			resets = <&rgu 50>;
-			dmas = <&dmamux  9 0 2
-				&dmamux 10 0 2>;
+			dmas = <&dmamux  10 0 2>, <&dmamux 9 0 2>;
 			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -424,16 +423,12 @@ ssp1: spi@400c5000 {
 			clocks = <&ccu2 CLK_APB2_SSP1>, <&ccu1 CLK_CPU_SSP1>;
 			clock-names = "sspclk", "apb_pclk";
 			resets = <&rgu 51>;
-			dmas = <&dmamux 11 2 2
-				&dmamux 12 2 2
-				&dmamux  3 3 2
-				&dmamux  4 3 2
-				&dmamux  5 2 2
-				&dmamux  6 2 2
-				&dmamux 13 2 2
-				&dmamux 14 2 2>;
-			dma-names = "rx", "tx", "tx", "rx",
-				    "tx", "rx", "rx", "tx";
+			dmas = <&dmamux 12 2 2>, <&dmamux 11 2 2>,
+					<&dmamux  4 3 2>, <&dmamux  3 3 2>,
+					<&dmamux  6 2 2>, <&dmamux  5 2 2>,
+					<&dmamux 14 2 2>, <&dmamux 13 2 2>;
+			dma-names = "rx", "tx", "rx", "tx",
+						"rx", "tx", "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.25.1


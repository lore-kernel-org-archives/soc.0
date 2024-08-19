Return-Path: <SRS0=AqXq=PS=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814F4C52D7C
	for <soc@archiver.kernel.org>; Mon, 19 Aug 2024 03:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63ECCC4AF13; Mon, 19 Aug 2024 03:57:00 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A1A5C32782;
	Mon, 19 Aug 2024 03:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A1A5C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-202508cb8ebso1464665ad.3;
        Sun, 18 Aug 2024 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724039817; x=1724644617; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7CqcOuZDb75sy7+rOEgJahiFqYT4oGOo9E7PnEA6vQ=;
        b=DCSHiOnfe4DFx3RJFmjiWvnfurZ6UUnAKduK1gv3SPUg7mOBB5d09SqsKekmgcv/ZP
         3Mv6hm+dFQDjBWKeyt9hWnAf7+lAzmffTBYVhBCH6csQoGyFAzsKiBPj2SH0B9gXPFJj
         +ULmpulAoUnTvD710x+wT30DpQUAvZpBq7hPe4VRYgPOPbxBqgaNBL/YPoI1gPl/qINc
         +SY5b+LCpnDYdpGJ4PrWc4hyx4B6BpzhCjH7B83hv79AxufCFmpVFYVqBhKgztjIqXTT
         tjkLGJwC5fuEg3DVPuNctx8JREUZ9vEasOu+WJFE5fYDr8+7g1VT2Ifq61giEBkDM3GQ
         Eo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724039817; x=1724644617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7CqcOuZDb75sy7+rOEgJahiFqYT4oGOo9E7PnEA6vQ=;
        b=dGzlEzh/dDbyMl2lxDk36gLRzy3Q5mhUzjXXqSjpzqs9GlmBDQ6myXZpq7GwttQzbJ
         c1W5nOsyoTEZoT5w5EKHUEOeBMG1jGTfw7F1kFGdO48m4Jc8mC4F2L0nTNngHeJGhb7l
         ixl1UnRaeo9/jOrPLe7F+Bt8st2hgd6vApTYkylRlpqr8VFvem8i5ZsnTpLw6r6Dotct
         k+Gnhgu/nTgIykx6wsqvS3Gbe0XokKmzCGtbY+NAI24o/Wn4OdjwD8khrzWvDuHOeedz
         avR/YrcR8jkl0INK/l9Zx3aUEJmnx9G0D90iasB50PWKHW7FTlCkGi84Api6lUrhInW3
         vPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL86amH/+bCZQPtyUOE9Px6fPmXArvRzfYSq77kcA9lq7x62RVvohE/zBWGWhRjGzyd2OW6P0kgLhnTDtHLEJFC9pHS2nLfBPWS+ZoMZ0pUgJovyHaTSox3JqYimiNBi2yR9EauwLF
X-Gm-Message-State: AOJu0YwEVUYOJrSe6kg9dmsBmW6SjWU9XMFFGAM2/yI+yQb1vqdMCJzx
	lzMlWhSajUDo6KISp1dIKhpW4MAT9jhDhoPpIE0dYSuOyKlxWr74RNS09g==
X-Google-Smtp-Source: AGHT+IHU3gTDF66CcveSfeiQQiYyefEN8k1+ovIorB/+adjVvyzhffeIf5B5McTX4Ndz9vCpa3LrFQ==
X-Received: by 2002:a17:902:db11:b0:202:4d18:9df7 with SMTP id d9443c01a7336-2024d18a21bmr10607375ad.33.1724039816578;
        Sun, 18 Aug 2024 20:56:56 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375649sm55784435ad.124.2024.08.18.20.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 20:56:56 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com
Subject: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: Add pinctrl and gpio nodes
Date: Mon, 19 Aug 2024 03:56:46 +0000
Message-Id: <20240819035647.306-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819035647.306-1-ychuang570808@gmail.com>
References: <20240819035647.306-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Added the pinctrl node and its subnodes, the gpioa through gpion
nodes, to the MA35D1 device tree.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 149 ++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index a6b34e3e8b10..e51b98f5bdce 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -95,6 +95,155 @@ clk: clock-controller@40460200 {
 			clocks = <&clk_hxt>;
 		};
 
+		pinctrl: pinctrl@40040000 {
+			compatible = "nuvoton,ma35d1-pinctrl";
+			reg = <0x0 0x40040000 0x0 0xc00>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			nuvoton,sys = <&sys>;
+			ranges = <0x0 0x0 0x40040000 0x400>;
+
+			gpioa: gpio@0 {
+				reg = <0x0 0x40>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPA_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiob: gpio@40 {
+				reg = <0x40 0x40>;
+				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPB_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioc: gpio@80 {
+				reg = <0x80 0x40>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPC_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiod: gpio@c0 {
+				reg = <0xc0 0x40>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPD_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioe: gpio@100 {
+				reg = <0x100 0x40>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPE_GATE>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiof: gpio@140 {
+				reg = <0x140 0x40>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPF_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiog: gpio@180 {
+				reg = <0x180 0x40>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPG_GATE>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioh: gpio@1c0 {
+				reg = <0x1c0 0x40>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPH_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioi: gpio@200 {
+				reg = <0x200 0x40>;
+				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPI_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpioj: gpio@240 {
+				reg = <0x240 0x40>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPJ_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiok: gpio@280 {
+				reg = <0x280 0x40>;
+				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPK_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiol: gpio@2c0 {
+				reg = <0x2c0 0x40>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPL_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpiom: gpio@300 {
+				reg = <0x300 0x40>;
+				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPM_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpion: gpio@340 {
+				reg = <0x340 0x40>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk GPN_GATE>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1


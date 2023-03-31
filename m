Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B67DC77B71
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF806C4339C; Fri, 31 Mar 2023 08:35:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D301C43445
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D301C43445
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id q19so18517175wrc.5
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
        b=zpVKLNXIXAV4SUprLr3FH6VaLCVrQs08gq3PR6QBskuLieXpL9pEl0DVkVsySGg93E
         yLNJD1djIn/X5/LvUUqSRHXYEJVk7SAUsDK/K0+6UH1nscr58z0a2+WLSgpgFixAZ5s+
         XVlKqZi48mQZvF/zFCrX7vIRbb+FdULZG6d/Qp1a/u+lntuoZ8GZOg6zXBoOtlqkQjTl
         +3lMm0xkV7O4U1IG/ndjeBtRyTZWsdGzqvysaQJmpBAgxoXrpXG9j7WxvA4juS55aJJJ
         PrCK1zS9C4rMDksDfoq6YqSeSBN+2DD8GmU/GVEytLphbHRPoR6o2ael1PZWW4gdS9Sx
         DYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
        b=mruphKAcgtMyknUr+A+Vbbo+VYI+cPBjGGhdwg+MhKhjnA0a7u4qz9mE0ivTlaT8Ot
         5l5zChOkOyVE7+YsSZ5XSADwdB2veRJCkQLX7yX44JTvJ0eUiuvgSWmeeXkAaQe+aZct
         u14y3mRnsToAZoJyT2Y5M/WEi7ZbjgClnQOnj3wAnTVkjgUa5betdnSpqEEoxHex6tuv
         3gdASYny3kxvUMYhVKR4vSYVr+QOXrC1RkgAS2lKArXZwIGlMWdyObOq5VmtBsepkDUN
         amkRWZ5T6WGBGRxgViTMMQY3+5ChcK9wW+e16dXhrTL+kqQqt0syN+Vi1i9LxTo1VGiF
         acdA==
X-Gm-Message-State: AAQBX9duqM0hNxDiWD0WEv9ecsu2nrHcMl248mWd8P/vtwyl3OHgUV4B
	Lg2IXcW1Tmm0wDzCaStyfBdzTQ==
X-Google-Smtp-Source: AKy350ZEexxOqisnl/kxib2n7RjdcPxl4zAGraKXrJ/xa8HdVJ2bLN4RGB9qBmKUKQcdJQx9dqXdRg==
X-Received: by 2002:a5d:5342:0:b0:2ca:2794:87e8 with SMTP id t2-20020a5d5342000000b002ca279487e8mr19274846wrv.21.1680251698016;
        Fri, 31 Mar 2023 01:34:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:48 +0200
Subject: [PATCH RFC 10/20] dt-bindings: mtd: oxnas-nand: remove obsolete
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-10-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
for OX810 and OX820 nand bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mtd/oxnas-nand.txt         | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
deleted file mode 100644
index 2ba07fc8b79c..000000000000
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS NAND Controller
-
-Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
-
-Required properties:
- - compatible: "oxsemi,ox820-nand"
- - reg: Base address and length for NAND mapped memory.
-
-Optional Properties:
- - clocks: phandle to the NAND gate clock if needed.
- - resets: phandle to the NAND reset control if needed.
-
-Example:
-
-nandc: nand-controller@41000000 {
-	compatible = "oxsemi,ox820-nand";
-	reg = <0x41000000 0x100000>;
-	clocks = <&stdclk CLK_820_NAND>;
-	resets = <&reset RESET_NAND>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		nand-ecc-mode = "soft";
-		nand-ecc-algo = "hamming";
-
-		partition@0 {
-			label = "boot";
-			reg = <0x00000000 0x00e00000>;
-			read-only;
-		};
-
-		partition@e00000 {
-			label = "ubi";
-			reg = <0x00e00000 0x07200000>;
-		};
-	};
-};

-- 
2.34.1


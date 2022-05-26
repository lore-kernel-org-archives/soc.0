Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7306C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3B27C385A9; Thu, 26 May 2022 20:41:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62B39C385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62B39C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id fd25so3162765edb.3
        for <soc@kernel.org>; Thu, 26 May 2022 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnM7d2FXWjORwXgrumsp11N84bq4QYIyIpgikIJwxHM=;
        b=JFnsO6U/lk/DUvjClGZCl9nYgRoWYDvVHsv2qwZp2Z83jy21Nysn6Y2zTmqqOEIitM
         iMKpOx+M3g3VEnkp3w2d4coa90PoKRN/mUbzhpSEyseR791uWrHMYPPCBMegwGiSqIKG
         9a+dPzKJY/odfJrJyPTHl8ojm0lWzvO4IX/FrdljINszqbdfmK61xvWu6ITX1dzzrpKw
         3R3kiWBHwk6heYfPs8Yl5Igt2GFmFi18WuuijebaoIp5cj2rbwwM1j/6EU1Zh75Qs+p6
         bnCJbhbIb33eqpBm3WlmmJza9JJtA2HOphcctF1wwOOgG5nq4ojiZqZKKtHhnClw7552
         bD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnM7d2FXWjORwXgrumsp11N84bq4QYIyIpgikIJwxHM=;
        b=cBtqlPo/IfDRak+j4T6HD6vK74JRu7ZT2vZZ5DdyMH3wxXK8tQc4egRF8ca4VwQeWw
         0M1oCVzEfnhBlQvVOi7RGjt88WnOfnRtogsjcmvO3YXNSTFjzYcE88njK4Tw9Tg6Re5a
         nu1ZyxTdEh1w6dYrEcWwkRilo469WXlG5Zv67NSPGQoZD4GxftC8EVnoc8FvbujvHpdl
         YozkiT+9DrbSqqow5IT9fKzAnlEEnBEEmMLSnjvwA1xblwJhUU2rSDcLsMVZyniGQWmB
         1nEAKcQy1GbnxSXQBRuoqve/sf81zjTTguWUD9F4WU7ASRY/Uiv3x9gq1yzNvWYGG4Qy
         fKVg==
X-Gm-Message-State: AOAM533Iydnts1LrekIHv5ozTDlUtMuPRJIdsExkNC5dhno5Ov6hvajh
	fxCRTQNyC9auAfWJkJNFS6dvj0v9A6OOENBk
X-Google-Smtp-Source: ABdhPJyiMG4ilZtjdyf4pRUs2gQjxZI6aU6yVj3UYNQrudeIs6Xuc1/QXd1+YL3w62XLaTnWvbk+gg==
X-Received: by 2002:a05:6402:b12:b0:42b:cf04:3e11 with SMTP id bm18-20020a0564020b1200b0042bcf043e11mr8793801edb.85.1653597677631;
        Thu, 26 May 2022 13:41:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y8-20020a50f1c8000000b0042b0dd5db38sm1235470edl.36.2022.05.26.13.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:41:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: microchip: adjust whitespace around '='
Date: Thu, 26 May 2022 22:41:08 +0200
Message-Id: <20220526204110.831805-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 200 +++++++++---------
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  48 ++---
 2 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 699256f1b9d8..bf12be5e8d84 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -546,164 +546,164 @@ phy64: ethernet-phy@64 {
 
 &axi {
 	sfp_eth12: sfp-eth12 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp1>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp1>;
 		tx-disable-gpios = <&sgpio_out2 11 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 11 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 11 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 12 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 11 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 11 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 12 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth13: sfp-eth13 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp2>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp2>;
 		tx-disable-gpios = <&sgpio_out2 12 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 12 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 12 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 13 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 12 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 12 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 13 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth14: sfp-eth14 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp3>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp3>;
 		tx-disable-gpios = <&sgpio_out2 13 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 13 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 13 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 14 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 13 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 13 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 14 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth15: sfp-eth15 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp4>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp4>;
 		tx-disable-gpios = <&sgpio_out2 14 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 14 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 14 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 15 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 14 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 14 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 15 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth48: sfp-eth48 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp5>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp5>;
 		tx-disable-gpios = <&sgpio_out2 15 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 15 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 15 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 16 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 15 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 15 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 16 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth49: sfp-eth49 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp6>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp6>;
 		tx-disable-gpios = <&sgpio_out2 16 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 16 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 16 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 17 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 16 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 16 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 17 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth50: sfp-eth50 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp7>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp7>;
 		tx-disable-gpios = <&sgpio_out2 17 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 17 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 17 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 18 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 17 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 17 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 18 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth51: sfp-eth51 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp8>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp8>;
 		tx-disable-gpios = <&sgpio_out2 18 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 18 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 18 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 19 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 18 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 18 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 19 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth52: sfp-eth52 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp9>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp9>;
 		tx-disable-gpios = <&sgpio_out2 19 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 19 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 19 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 20 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 19 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 19 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 20 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth53: sfp-eth53 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp10>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp10>;
 		tx-disable-gpios = <&sgpio_out2 20 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 20 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 20 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 21 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 20 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 20 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 21 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth54: sfp-eth54 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp11>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp11>;
 		tx-disable-gpios = <&sgpio_out2 21 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 21 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 21 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 22 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 21 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 21 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 22 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth55: sfp-eth55 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp12>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp12>;
 		tx-disable-gpios = <&sgpio_out2 22 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 22 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 22 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 23 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 22 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 22 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 23 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth56: sfp-eth56 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp13>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp13>;
 		tx-disable-gpios = <&sgpio_out2 23 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 23 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 23 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 24 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 23 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 23 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 24 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth57: sfp-eth57 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp14>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp14>;
 		tx-disable-gpios = <&sgpio_out2 24 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 24 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 24 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 25 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 24 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 24 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 25 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth58: sfp-eth58 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp15>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp15>;
 		tx-disable-gpios = <&sgpio_out2 25 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 25 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 25 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 26 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 25 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 25 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 26 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth59: sfp-eth59 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp16>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp16>;
 		tx-disable-gpios = <&sgpio_out2 26 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 26 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 26 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 27 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 26 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 26 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 27 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth60: sfp-eth60 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp17>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp17>;
 		tx-disable-gpios = <&sgpio_out2 27 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 27 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 27 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 28 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 27 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 27 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 28 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth61: sfp-eth61 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp18>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp18>;
 		tx-disable-gpios = <&sgpio_out2 28 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 28 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 28 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 29 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 28 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 28 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 29 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth62: sfp-eth62 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp19>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp19>;
 		tx-disable-gpios = <&sgpio_out2 29 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 29 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 29 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 30 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 29 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 29 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 30 0 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth63: sfp-eth63 {
-		compatible       = "sff,sfp";
-		i2c-bus          = <&i2c_sfp20>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp20>;
 		tx-disable-gpios = <&sgpio_out2 30 1 GPIO_ACTIVE_LOW>;
-		los-gpios        = <&sgpio_in2 30 1 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios   = <&sgpio_in2 30 2 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios   = <&sgpio_in2 31 0 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 30 1 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 30 2 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 31 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
index d10a9172b529..ec90bda7ed6a 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -170,40 +170,40 @@ i2c_sfp4: i2c_sfp4 {
 
 &axi {
 	sfp_eth60: sfp-eth60 {
-		compatible	   = "sff,sfp";
-		i2c-bus            = <&i2c_sfp1>;
-		tx-disable-gpios   = <&sgpio_out2 28 0 GPIO_ACTIVE_LOW>;
+		compatible	 = "sff,sfp";
+		i2c-bus = <&i2c_sfp1>;
+		tx-disable-gpios = <&sgpio_out2 28 0 GPIO_ACTIVE_LOW>;
 		rate-select0-gpios = <&sgpio_out2 28 1 GPIO_ACTIVE_HIGH>;
-		los-gpios          = <&sgpio_in2 28 0 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios     = <&sgpio_in2 28 1 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios     = <&sgpio_in2 28 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 28 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 28 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 28 2 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth61: sfp-eth61 {
-		compatible         = "sff,sfp";
-		i2c-bus            = <&i2c_sfp2>;
-		tx-disable-gpios   = <&sgpio_out2 29 0 GPIO_ACTIVE_LOW>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp2>;
+		tx-disable-gpios = <&sgpio_out2 29 0 GPIO_ACTIVE_LOW>;
 		rate-select0-gpios = <&sgpio_out2 29 1 GPIO_ACTIVE_HIGH>;
-		los-gpios          = <&sgpio_in2 29 0 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios     = <&sgpio_in2 29 1 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios     = <&sgpio_in2 29 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 29 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 29 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 29 2 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth62: sfp-eth62 {
-		compatible         = "sff,sfp";
-		i2c-bus            = <&i2c_sfp3>;
-		tx-disable-gpios   = <&sgpio_out2 30 0 GPIO_ACTIVE_LOW>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp3>;
+		tx-disable-gpios = <&sgpio_out2 30 0 GPIO_ACTIVE_LOW>;
 		rate-select0-gpios = <&sgpio_out2 30 1 GPIO_ACTIVE_HIGH>;
-		los-gpios          = <&sgpio_in2 30 0 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios     = <&sgpio_in2 30 1 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios     = <&sgpio_in2 30 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 30 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 30 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 30 2 GPIO_ACTIVE_HIGH>;
 	};
 	sfp_eth63: sfp-eth63 {
-		compatible         = "sff,sfp";
-		i2c-bus            = <&i2c_sfp4>;
-		tx-disable-gpios   = <&sgpio_out2 31 0 GPIO_ACTIVE_LOW>;
+		compatible = "sff,sfp";
+		i2c-bus = <&i2c_sfp4>;
+		tx-disable-gpios = <&sgpio_out2 31 0 GPIO_ACTIVE_LOW>;
 		rate-select0-gpios = <&sgpio_out2 31 1 GPIO_ACTIVE_HIGH>;
-		los-gpios          = <&sgpio_in2 31 0 GPIO_ACTIVE_HIGH>;
-		mod-def0-gpios     = <&sgpio_in2 31 1 GPIO_ACTIVE_LOW>;
-		tx-fault-gpios     = <&sgpio_in2 31 2 GPIO_ACTIVE_HIGH>;
+		los-gpios = <&sgpio_in2 31 0 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&sgpio_in2 31 1 GPIO_ACTIVE_LOW>;
+		tx-fault-gpios = <&sgpio_in2 31 2 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.34.1


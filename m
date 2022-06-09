Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D7EC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CD23C34114; Thu,  9 Jun 2022 11:39:54 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B776BC341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B776BC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id n28so30815112edb.9
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0YNwH3n6PjIeqiCRdH4f7yYwMmdAgLu9xDerffdwL8=;
        b=kUR17GG84q6hCQJUB3Jwk7nEUm/YD6k+5F5oA1dajOpFX2gnQphROOBTGkRYxdjURL
         OFOYOfaNVInw8o9IL17hk9oRB+mbFJae6xn2ecIgiOlQLZ4JyTmh80Mdq9540Tp4Kvsj
         Kztvjfkt7qBMH61B1yi0VsVXE5tjPVo6Si++gUGxTdipP660vjgVZ7esQ5SXNuepKkvh
         jq3PbGD1R/hntODKPc+j7kwx/Jhj+pma/x+KWUQj15ORmsvt5BoxDOfcC4cXsb1b+ncd
         XAENwI7ChLHPRMhikZBohdOW/iFrQpOqSeaD1v7+ZmrCHuvrrebEwr2D15AD/yb3QDFd
         EyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0YNwH3n6PjIeqiCRdH4f7yYwMmdAgLu9xDerffdwL8=;
        b=dbwMKJ+lSWzzgUFWiOchpFfTQnAzXte0dfaajH3srYp2iUGEeVeJHoIEUe8re6yeWF
         reVthvW91tjI8YbMOyzAPWqtVhhfEEHcjPsFGxoQWz8SKsscRa2w/19y/zlDlzhc2ep2
         qQpGOY0gJuSw3aGfC5IyTooQ5rHzphuxoIjCwGPYdREE7GdjfB9FIk2R46GqW26p1HVe
         pYEKebTVIXr68cL6cS87Mdel6kTCzr+SML6LXl+tNfiVyYaSTE5TRV5WCub8mKGRsBFv
         nYffmRWDEcJX9oggww3tIlVKTSgwYTvSUI+rnMvSV3JmHY/aeMeecushannmUTE6v045
         /Hwg==
X-Gm-Message-State: AOAM531O4V/phaFuDJu9wOGgZT/c7Cf9cAKYGIbiKzHG5bf4Ot2Fbh64
	9ilpfv1FsyLXiWm1zd3pnXvRSQ==
X-Google-Smtp-Source: ABdhPJxuTqXWn9jMw8LX1nHZdeLpAzHoL0VJNRNgcmvZQR7MtWIU8k75RnzFOriBcJ7nj7Txl/gTVw==
X-Received: by 2002:a05:6402:369b:b0:431:665e:f91a with SMTP id ej27-20020a056402369b00b00431665ef91amr22678275edb.350.1654774793234;
        Thu, 09 Jun 2022 04:39:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 17/48] arm64: dts: marvell: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:36 +0200
Message-Id: <20220609113938.380466-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index caf9c8529fca..6721b9b4cf5c 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -45,7 +45,7 @@ red {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpiosb 20 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 871f84b4a6ed..15f6ca4df121 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -94,7 +94,7 @@ keys {
 		pinctrl-0 = <&cp0_gpio_reset_pins &cp1_wps_button_pins>;
 		pinctrl-names = "default";
 
-		button_0 {
+		button-0 {
 			/* The rear button */
 			label = "Rear Button";
 			gpios = <&cp0_gpio2 7 GPIO_ACTIVE_LOW>;
@@ -102,7 +102,7 @@ button_0 {
 			linux,code = <BTN_0>;
 		};
 
-		button_1 {
+		button-1 {
 			/* The wps button */
 			label = "WPS Button";
 			gpios = <&cp1_gpio1 30 GPIO_ACTIVE_LOW>;
-- 
2.34.1


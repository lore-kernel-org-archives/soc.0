Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD20ACCA482
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7D1DC341C0; Thu, 16 Jun 2022 00:54:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F290C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F290C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id s135so12889993pgs.10
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0YNwH3n6PjIeqiCRdH4f7yYwMmdAgLu9xDerffdwL8=;
        b=K0AVGQEm8suGzIiJnahUJLp+ZdFjU8WamJJH8Akpa5KPZmZE7aInFg6OiJFKbQhNhL
         RT0hmjB/JS9NmzdDhTJFeKR9Jw/RltbH8IpENXeqgTNl+Cfe/5bRJCx7MkxrMe6XDkVO
         6k7kB27DzRYO95/RSs7kC7XRnylf7zbv4BVoiYqWKPmuLokZadiO3yE9gl98SIOLWtdA
         zvrfqKAbTrGjiTbkeSjlSHeSvO3V4AGZMDsBbFV/IRgnrAykmekNAw4vk9pFk/hJ+/OZ
         an2k9jMiCClQPYIiw32debQq+kHrvINtM0ZNpwsCwiC+zmKr61i6Fb/ovnIgVj7ej1RC
         Mweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0YNwH3n6PjIeqiCRdH4f7yYwMmdAgLu9xDerffdwL8=;
        b=EJjBIHWvg7qmNnqZefURUqcxHgx0qw+PXHZHSRKO5eCRC1V0RTTsbnTj/Buefsw4SZ
         kH54d/+8zXnIkahKm0Tl/ot75F16mw958mN/uvdx1/bdfrtqXQSmyuzg6XvwEu/xHvtE
         YVLtysPf6l8z5GhEs7F6ydTeb48ivWDR/xJz0X9EQOZOdLKNr/78he9jwn4kOoa+DmMI
         2z5JRLILGNeZ1QUhdtWI35T25CP2q58ZBD52n2AzlNGWlCfQ+xRlUAN37QkQJ2v+J2Hs
         wj9AorAnDG27ghSyCFrWigSv3Fz2YyXJaXv+GCkyARJw8E0VsCrNrhTHMQViYHP8oXu0
         KfPA==
X-Gm-Message-State: AJIora+3w5MGSpJbM33z0PErMVDT729iLhOD09+JnJPJ9gnaF7f9G7Jq
	X/BKYiPNsuLUqjdazf39e9RX5g==
X-Google-Smtp-Source: AGRyM1tLNfmaBfmE0NEI0mTbmy0dpgYmXYHujjOMZg4bQk2kLfZaAhhrgg7Emu68enXZ5qFD+YkCbA==
X-Received: by 2002:a63:86c3:0:b0:3fd:9c06:ee37 with SMTP id x186-20020a6386c3000000b003fd9c06ee37mr2118122pgd.357.1655340849623;
        Wed, 15 Jun 2022 17:54:09 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 11/40] arm64: dts: marvell: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:04 -0700
Message-Id: <20220616005333.18491-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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


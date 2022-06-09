Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D4CCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC714C341C0; Thu,  9 Jun 2022 11:40:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A3F1C341C5
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A3F1C341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id x62so30800584ede.10
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cm99/QV8MCKPId9CWvCx5513sd3/VdteWTSHrf5MAuA=;
        b=IeIXgof4B0Q/CNadsJ81xWKhW4648bm0Bmz6NNJdmGo+xJ2aE4jH5B8LYqff4TQuMY
         CEgKWbiYJieOO734SxHsakpbjawn5PaZ96gNt4ljVViOAEDB5/FjrkLRAUgcStv37kfu
         8WGyFULk4g6iNjvEreTtLxa9PaGuVK/UkroYLQ7hWQ6QTKh7oManSUqZW9TzK13pO81S
         aY5CbeDB6gMYBYZ8qo4iVI/zAqLrRN+2sbZl4wEYpsFNvIo2DrdHMu1tfCavJzw4hYiO
         PtDQmC0yocG4AGknTgXKAdk+TAzbw23Glu0p7n2gQEvAIrMMj4ErTuC1CZjCJOvIhAuW
         Rk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cm99/QV8MCKPId9CWvCx5513sd3/VdteWTSHrf5MAuA=;
        b=XYSVPjXnbKYkYGIs1y5JrkNfrcFuRq396AX57gzqEQ718owiWTQwhX1pBqWkHelhg1
         ozkxldqe0bB9HkKsrv//7cmZqdCLGtAT4oXppVqGndCFv2eiPl4QICpv1HhDC50NFX7/
         M/wEGZaneNI+I8DXJhkIIIqUdJk0tawdzM4zbhSldqVOPx3ENqlg4IC28ghwrDcn9coO
         qhfGkMiEk2o9oXtCe5I61a6C24YXEMQL93geCC/yvafFvm2HnS37Lks4yic76W9nvkjd
         iRXsSl46wxHTKc1zd1VzY0s/QcKecW3ZFzZGZzNZF2aFgOVuumMAozrHMZmOfGrmy/an
         PjJA==
X-Gm-Message-State: AOAM532ygWTdPUmOo2jnj+jC5fgXcJagW3HmQ/EC5NOqi+f2w9jMPbdM
	zrNbV0P6dV9xhjsOXfTQD8CBuw==
X-Google-Smtp-Source: ABdhPJxPnZiByIuXXyPwrss2NwpXu20D98x3DIJyrJ7lhdZcBBZCjUqfnBRx6HVhmgLyTi/3GULYkQ==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id et11-20020a056402378b00b0042aad8c628fmr44617147edb.90.1654774839884;
        Thu, 09 Jun 2022 04:40:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 35/48] arm64: dts: ti: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:40:22 +0200
Message-Id: <20220609114026.380682-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts        | 4 ++--
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 57497cb1ed68..31039f7e36ac 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -73,13 +73,13 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&push_button_pins_default>;
 
-		sw5 {
+		switch-5 {
 			label = "GPIO Key USER1";
 			linux,code = <BTN_0>;
 			gpios = <&wkup_gpio0 24 GPIO_ACTIVE_LOW>;
 		};
 
-		sw6 {
+		switch-6 {
 			label = "GPIO Key USER2";
 			linux,code = <BTN_1>;
 			gpios = <&wkup_gpio0 27 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 2bc26a296496..b1691ac3442d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -26,13 +26,13 @@ gpio_keys: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&sw10_button_pins_default &sw11_button_pins_default>;
 
-		sw10: sw10 {
+		sw10: switch-10 {
 			label = "GPIO Key USER1";
 			linux,code = <BTN_0>;
 			gpios = <&main_gpio0 0 GPIO_ACTIVE_LOW>;
 		};
 
-		sw11: sw11 {
+		sw11: switch-11 {
 			label = "GPIO Key USER2";
 			linux,code = <BTN_1>;
 			gpios = <&wkup_gpio0 7 GPIO_ACTIVE_LOW>;
-- 
2.34.1


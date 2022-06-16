Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5BCCCA47E
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC26EC341C0; Thu, 16 Jun 2022 00:54:38 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 333FCC341C5
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 333FCC341C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id r5so6200812pgr.3
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cm99/QV8MCKPId9CWvCx5513sd3/VdteWTSHrf5MAuA=;
        b=NImzwtWbzdvjUciZzZ75bBK/ifBtQCZkTq+I1tvB5kYDZlwJY1su2Do4UoxE5UiHgj
         O2LtXBlTm7opVfjpc+JOpFzW8+XVh+884mDVoYKN5JBJpgOtuLx4ETAYlnjLNR5uwVIe
         TVkK5bo/jcOh4muVk0zCtb0jZ4IVrOoxpiOF59CgcR5ceEHdH7h1VavQansFMHD9vckL
         qSXsnirrqPtGftr9HkreIf43CjEYNXotGKzTqNJj86AoqFeHs7nWihktHu2x4b2dkKIk
         WGvIET3t7Pzh7cJeUwZxj4vLfWp4s1dRuzxAnxq+hCq9MHzFrfZNY1unyrgqjkWgkNYy
         DofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cm99/QV8MCKPId9CWvCx5513sd3/VdteWTSHrf5MAuA=;
        b=fXcN/l9dPyS59Q0ESwWbowlyMrnPFroFnz+nBGax57rT7lbqqCIukOgskae9XmUd+x
         01gzOg7XntEyY4WevVzgo29b8Bxl5FqPLcIio8VzSZpSNsi4qzuTSWzlHUiBn283eUHS
         5Lqy+tbApGOWPjFzEgWfcskFAoqtQqjwOJTngixS7C7UzpbUra9XY962cJZGQbnw4ZPo
         5j2c487tpZuIKxuiiDg//AovK0KzXKZTAztDf09mTVo3i42fEme0G7QhOdG76u2+1+F9
         qR6NrlX/8n+ujIw+INU2BVc4evSj8sP+YFyaqChvUXE9LwHrTFDA1Tc6S2Lz3ue7Jd08
         4F8A==
X-Gm-Message-State: AJIora/ILGqzoYB2HuMVidC/0hYXuAifTJmE3PKtmx1uaOwuMKakdcOA
	7jo0DfqTCN2Sim083x0qh8zhfk3/3XlsbA==
X-Google-Smtp-Source: AGRyM1ug3gEOXzVVQQttqWJAvEAq5QpOxIQ2fPNT12FaVtr4iUPT5YzVyIzHD563V5L5mFFB8He6wA==
X-Received: by 2002:a63:8a4b:0:b0:408:ab3d:4af3 with SMTP id y72-20020a638a4b000000b00408ab3d4af3mr2150393pgd.72.1655340877628;
        Wed, 15 Jun 2022 17:54:37 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 29/40] arm64: dts: ti: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:22 -0700
Message-Id: <20220616005333.18491-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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


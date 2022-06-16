Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD10CCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07650C3411C; Thu, 16 Jun 2022 00:54:41 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A68CC341C6
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A68CC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id s37so92241pfg.11
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=itsEy92F8LgvkoK7MoKZ9B/GZxw2SAC9YAvwl0r5wg8=;
        b=z5mXx8sye4HKPIB7GYHCqOmGAGj5X42fg9fh791Lw1DXhV5zcZncP75cSXTXhLmtq4
         g7lrX/EsU75RaPEGf5B5G1LkIlaX4z9WqBVCWdYV3NN27afzgqvw16AH9OKxJNmBTI2m
         XTDqrwImsp+HwpXvH5JaGdLGEAu+TZO0/v34UfNt4ZZA45u4YGMymWhC/aBPrG0ASGVG
         hsX/qyXqmismIyIMdc0A5XjYmziMgoCcf19URCMHJwhvGapnII2ctHcbpH3j7geIyCiQ
         xS+DWBIbMyt2NXaLdJSFA9QX4Sp/Wr1fLXKOQnkCYfh0v1mwUsly2UpmfRNpv8frmavd
         UHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=itsEy92F8LgvkoK7MoKZ9B/GZxw2SAC9YAvwl0r5wg8=;
        b=ZrVmQzwiXascMAWOZdWGp/LGoj947xAvtRlObkrsLEE0CfzihQAx7MR5wLtbE9Kmp3
         g9zwrB1VPubqQl+2CqOLWEUEj1SSb3D1Wj/n4tFFD42lukvKsxiLpn5aZG4BDgFQWnQI
         I/TrXcU/vk396Qdyp+H3656YGllJNDgL840hrooR+jB6ADTK+bvsyJdMNea+fIG6jUv8
         epe358M6m/gSkHcMpZmUXRsq5V1JSWQStlbU/zt05+93RrHMeA4AUm9nyxp2wEoMgkmM
         7U5VzRyibr7LmqV9SDUriRbXzFudLmRqE9n9GwBDHSQhTKbbraE+CLIKh59N1VbfUFAp
         0AVw==
X-Gm-Message-State: AJIora+wxtOxCd+ZFzH9S4KM8AJOvqxWweVNkwtlNPHO4c7xyKwzzRfm
	3+Q2DH43+p1IIC39meOoPHs5lQ==
X-Google-Smtp-Source: AGRyM1szTLtkES0t0cjWcjNlUNx3yfAdHRv1dieHB+qKOWjH/ekzn2LDX9kEaCAIRz7t5icSAt9ApA==
X-Received: by 2002:a63:f415:0:b0:408:808b:238f with SMTP id g21-20020a63f415000000b00408808b238fmr2093682pgi.469.1655340880158;
        Wed, 15 Jun 2022 17:54:40 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michal Simek <michal.simek@xilinx.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 31/40] ARM: dts: xilinx: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:53:24 -0700
Message-Id: <20220616005333.18491-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/zynq-zc702.dts         | 4 ++--
 arch/arm/boot/dts/zynq-zturn-common.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index cf70aff26c66..d23201ba8cd7 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -30,14 +30,14 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		sw14 {
+		switch-14 {
 			label = "sw14";
 			gpios = <&gpio0 12 0>;
 			linux,code = <108>; /* down */
 			wakeup-source;
 			autorepeat;
 		};
-		sw13 {
+		switch-13 {
 			label = "sw13";
 			gpios = <&gpio0 14 0>;
 			linux,code = <103>; /* up */
diff --git a/arch/arm/boot/dts/zynq-zturn-common.dtsi b/arch/arm/boot/dts/zynq-zturn-common.dtsi
index bf5d1c4568b0..dfb1fbafe3aa 100644
--- a/arch/arm/boot/dts/zynq-zturn-common.dtsi
+++ b/arch/arm/boot/dts/zynq-zturn-common.dtsi
@@ -49,7 +49,7 @@ usr-led2 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		K1 {
+		key {
 			label = "K1";
 			gpios = <&gpio0 0x32 0x1>;
 			linux,code = <0x66>;
-- 
2.34.1


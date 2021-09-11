Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD37C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 23:48:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1084D6101D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 23:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1084D6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE/QdggZEglB+OBZvImrLjso+Q08RCqRjCXf+9hrcSg=; b=TqpB/RA9UizL2F
	ChjSHnT4J1hNLk3m2rgxurWPW8iU2CeRu56YC2yqOEU/TVd6Q3v6zpvuA9ZAMQVypUoKdTVNY+EnD
	OHtRuudhqFz94K/r3Yc3zlXz4skXmcwBi/U0k9rQsDlTJhU6V5cDw24Ns6NSdLhqkrpeacO7PDC5W
	PiFDTyjeHsvI45YV2D3h6bTaGuNllpvnmtARBtMhJRgqUJ2L9/mO+ZQH83YuQprPxL3XdByevyz6B
	DevmzUkQQwpdKUJlP70zpkreh7LdRe2CZtHguIvQ43Y4ClbUB9m9uow+lGk82iZsi1yeInLCUve4I
	HZ8tvjwmlQhy7h/MLeyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPChR-00FZpd-PR; Sat, 11 Sep 2021 23:46:21 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPChE-00FZoU-KR
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 23:46:10 +0000
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id CCC61CB201;
 Sat, 11 Sep 2021 23:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1631402891; bh=vmQ4rNn9xJWouEc9m40mcIxw0axx16PXLSt9GfYTuFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nNFw4kxUDtCedYnt3PKINnVoATt+CXO0+C0jVgGkkC2mRgemdY0okPhOH5LvmnI1b
 LFmhpnbju2WpvK5k7AJ/QWp4vh/mbcz1ad2RRnv9nq+SfHkvMzPMIe/z6QOnvykJJL
 f38X2ldlW80KJFNkGrYSIYiKJH1qm+7ZFLyeoIQ8=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
 Luca Weiss <luca@z3ntu.xyz>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] ARM: dts: qcom: Add support for LG G Watch R
Date: Sun, 12 Sep 2021 01:27:02 +0200
Message-ID: <20210911232707.259615-9-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_164608_839658_7015CCF7 
X-CRM114-Status: GOOD (  14.88  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210911232702.obLzaq2VfgksUJtWGc9BNVjUpbUVQysnRH0V-oa6VKA@z>

Add a device tree for the LG G Watch R smartwatch, manufactured by LG
Electronics and based on the msm8226 platform (apq8026).

Currently UART, internal storage, power button and touchscreen are
supported.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts | 237 +++++++++++++++++++
 2 files changed, 238 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..8cb859728bd9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -939,6 +939,7 @@ dtb-$(CONFIG_ARCH_OXNAS) += \
 	ox810se-wd-mbwe.dtb \
 	ox820-cloudengines-pogoplug-series-3.dtb
 dtb-$(CONFIG_ARCH_QCOM) += \
+	qcom-apq8026-lge-lenok.dtb \
 	qcom-apq8060-dragonboard.dtb \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
new file mode 100644
index 000000000000..02c8dfb0988a
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+/dts-v1/;
+
+#include "qcom-msm8226.dtsi"
+#include "qcom-pm8226.dtsi"
+
+/ {
+	model = "LG G Watch R";
+	compatible = "lge,lenok", "qcom,apq8026";
+	qcom,board-id = <132 0x0a>;
+	qcom,msm-id = <199 0x20000>;
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&blsp1_i2c5 {
+	status = "okay";
+	clock-frequency = <384000>;
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		interrupts-extended = <&tlmm 17 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8226_l15>;
+		vio-supply = <&pm8226_l22>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp1_uart3 {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+
+	bus-width = <8>;
+	non-removable;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhc1_pin_a>;
+};
+
+&rpm_requests {
+	pm8226-regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s1: s1 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1275000>;
+		};
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1337500>;
+		};
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8226_lvs1: lvs1 {};
+	};
+};
+
+&tlmm {
+	sdhc1_pin_a: sdhc1-pin-active {
+		clk {
+			pins = "sdc1_clk";
+			drive-strength = <10>;
+			bias-disable;
+		};
+
+		cmd-data {
+			pins = "sdc1_cmd", "sdc1_data";
+			drive-strength = <10>;
+			bias-pull-up;
+		};
+	};
+
+	touch_pins: touch {
+		irq {
+			pins = "gpio17";
+			function = "gpio";
+
+			drive-strength = <8>;
+			bias-pull-down;
+			input-enable;
+		};
+
+		reset {
+			pins = "gpio16";
+			function = "gpio";
+
+			drive-strength = <8>;
+			bias-disable;
+			output-high;
+		};
+	};
+};
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

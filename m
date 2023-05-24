Return-Path: <SRS0=zWAG=BN=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2A4C77B73
	for <soc@archiver.kernel.org>; Wed, 24 May 2023 23:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE529C433D2; Wed, 24 May 2023 23:05:27 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42FF9C433EF;
	Wed, 24 May 2023 23:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42FF9C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-5ed99ebe076so2938336d6.2;
        Wed, 24 May 2023 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684969525; x=1687561525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fkrwg40zFByibU887SHRzu9lXrU4GGCkV4LKKgsv0o=;
        b=NBt5dlYLYOiMKlATvNroYIC5v6GCkfvrcw4AsE9OCgGHRw9GkCmV8QBvkrqRJo4XHZ
         KvIOuwcRTtVKvP4Epg7g+cz9WPlWDLb8AKH+gDvepeNTga27MIFR38gmQRacvKBxsODV
         YGfDr6cXk9yeLJXPNeh3dVuZ1QZkJCGpreMrmWwJnt3a6a+kRCii8s46sskv90I3EZkc
         bj03p3cmoEVaFxtTzLLpg//H2z46mZB5LXfzMmpweESpsGu4cMDUx2DNSiCh5Log4D0v
         4qAYIEuHELgqE7G8bZRg8FVo5EL8jvt4J/oh9qCUsCVxuAMZJlLnE+fy6Ni80jOuA/G+
         0A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684969525; x=1687561525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fkrwg40zFByibU887SHRzu9lXrU4GGCkV4LKKgsv0o=;
        b=BGu2ldWn0+vL9A9FTAWESTMML3NaCQXeiu0i7t3y+hhdj8SWqedVE6/rd0jjI6+GU3
         3OQP5z4W6X9y81EdZaZqF2rF5/0+0+Ubz7rJHI410SfkT63ED4dUkcgIbVE4etqu3+UK
         OTxqKyL2JJ9f8lDv5FPSRO13HaUjNDA6pQFz24Yh28zqhjpwpKCMw7po9jeEElAXZz2/
         7ztm0rMUaFIjbVUMUl08Yk78dhbiegSJQaNOF9fv8qh+Qn/fpi3GIysV2K3kE5LahYqf
         tf9eIZFA2wkhNbXznVzKWYSOZHuce5oK/vlNbhxQeidnUIbW1rFkdP5/m5vymRy0DEZg
         tTyg==
X-Gm-Message-State: AC+VfDwRyk0Qx9lOdD4Q79N30E3jSgtoSwtsFkMIjRTLDqrIg/JxD/o6
	7hInkYrgeAewCNf+VX+/fn4=
X-Google-Smtp-Source: ACHHUZ7easojD6kVwSRgqqQBNWAe/Hctor4HwCOp+1RegE63YmQMqq/P8pWNlwfL+dzd9+TagUyHhQ==
X-Received: by 2002:a05:6214:f0d:b0:625:aa49:9ab9 with SMTP id gw13-20020a0562140f0d00b00625aa499ab9mr4384894qvb.61.1684969525063;
        Wed, 24 May 2023 16:05:25 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:650f:ad8b:38f6:d091])
        by smtp.gmail.com with ESMTPSA id ea15-20020ad458af000000b0062075f40f61sm3914019qvb.73.2023.05.24.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:05:24 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: david@ixit.cz,
	Rudraksha Gupta <guptarud@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] ARM: Add Samsung Galaxy Express support
Date: Wed, 24 May 2023 19:04:58 -0400
Message-Id: <20230524230459.120681-5-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524230459.120681-1-guptarud@gmail.com>
References: <20230524230459.120681-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a very basic device tree file for the Samsung Galaxy Express
SGH-I437. Currently, the following things work: UART, eMMC, SD Card, and
USB.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/qcom-msm8960-samsung-expressatt.dts   | 334 ++++++++++++++++++
 2 files changed, 335 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..12c90f263142 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1081,6 +1081,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8916-samsung-grandmax.dtb \
 	qcom-msm8916-samsung-serranove.dtb \
 	qcom-msm8960-cdp.dtb \
+	qcom-msm8960-samsung-expressatt.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
new file mode 100644
index 000000000000..2d6f0def0589
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/input/input.h>
+
+#include "qcom-msm8960.dtsi"
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
+
+/ {
+	model = "Samsung Galaxy S3 SGH-I437";
+	compatible = "samsung,expressatt", "qcom,msm8960";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &gsbi5_serial;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&gsbi5 {
+	status = "okay";
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+};
+
+&gsbi5_serial {
+	status = "okay";
+};
+
+/* eMMC */
+&sdcc1 {
+	status = "okay";
+	vmmc-supply = <&pm8921_l5>;
+};
+
+/* External micro SD card */
+&sdcc3 {
+	status = "okay";
+	vmmc-supply = <&pm8921_l6>;
+	vqmmc-supply = <&pm8921_l7>;
+};
+
+&gsbi1 {
+	status = "okay";
+	qcom,mode = <GSBI_PROT_SPI>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_default>;
+};
+
+&gsbi1_spi{
+	status = "okay";
+};
+
+&msmgpio {
+	spi1_default: spi1_default {
+		mux {
+			pins = "gpio6", "gpio7", "gpio9";
+			function = "gsbi1";
+		};
+
+		mosi {
+			pins = "gpio6";
+			drive-strength = <12>;
+			bias-disable;
+		};
+
+		miso {
+			pins = "gpio7";
+			drive-strength = <12>;
+			bias-disable;
+		};
+
+		cs {
+			pins = "gpio8";
+			drive-strength = <12>;
+			bias-disable;
+			output-low;
+		};
+
+		clk {
+			pins = "gpio9";
+			drive-strength = <12>;
+			bias-disable;
+		};
+	};
+};
+
+
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8921-regulators";
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s4>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+		vdd_ncp-supply = <&pm8921_l6>;
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l21_l23_l29-supply = <&pm8921_s8>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+
+		/* Buck SMPS */
+		pm8921_s1: s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s2: s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		pm8921_s3: s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
+			bias-pull-down;
+		};
+
+		pm8921_s4: s4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+		};
+
+		pm8921_s7: s7 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s8: s8 {
+			regulator-always-on;
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		/* PMOS LDO */
+		pm8921_l1: l1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		pm8921_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8921_l3: l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+
+		pm8921_l4: l4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l5: l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l6: l6 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l7: l7 {
+			regulator-always-on;
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l8: l8 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3100000>;
+			bias-pull-down;
+		};
+
+		pm8921_l9: l9 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		pm8921_l10: l10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l11: l11 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+
+		pm8921_l12: l12 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		pm8921_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		pm8921_l16: l16 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		pm8921_l17: l17 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
+		};
+
+		pm8921_l18: l18 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1500000>;
+			bias-pull-down;
+		};
+
+		pm8921_l21: l21 {
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <1900000>;
+			bias-pull-down;
+		};
+
+		pm8921_l22: l22 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+			bias-pull-down;
+		};
+
+		pm8921_l23: l23 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		pm8921_l25: l25 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			bias-pull-down;
+		};
+
+		/* Low Voltage Switch */
+		pm8921_lvs1: lvs1 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs2: lvs2 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs3: lvs3 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs4: lvs4 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs5: lvs5 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs6: lvs6 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs7: lvs7 {
+			bias-pull-down;
+		};
+
+		pm8921_ncp: ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+	};
+};
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "otg";
+};
+
-- 
2.34.1


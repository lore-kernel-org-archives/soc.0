Return-Path: <SRS0=a/FV=24=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C0C433FE
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 00:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A320C433D7; Thu, 27 Oct 2022 00:54:45 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 412DDC433C1;
	Thu, 27 Oct 2022 00:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 412DDC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id t15so193951edd.4;
        Wed, 26 Oct 2022 17:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=agUfJhSL/7u/2Vjm1nnugKSFMcqrJl4gZcmjxoIEl1g=;
        b=c1yDcrGA3P2wThetdZ/lu4NMgMjfBlMmWFOYec18OiEEEQCYvaOX2qKRMIgbYJK0Nc
         /uvA3XBy6kFS5rdNPZduV6FnIdNqcMpxTHwXyZ8+1byL10cm1co2Khhh9qJkOZqDU6iL
         hgO29pBqwHO/Dfb0vlueW8pBcIU5yFSce9CJpLBD4yF3/O7qOfyozUK5Asw6wF+DTlPk
         SROTe2tzLGfR5WRYaK5ywCxje21+Z20zhtXDBrMBCtnRlayfpbr8XGIFIGeOo5DxziAQ
         9Ig51gp59OfNdabyzvXMvNNCcK/9fXtJNWX/Q9Y/RGlotg4hJeeS0kV2b+ZfN5NJ7+sK
         UVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agUfJhSL/7u/2Vjm1nnugKSFMcqrJl4gZcmjxoIEl1g=;
        b=dLXcmpEjg+ZYrwgiHI6GdLfvqT/RyP2q9pNFjKn0pB680Xdn6G6Gv+lovEJ5Lyf5xz
         pHVQf0ni6onCdU88lYP8Q9YI+zHczIFKx6PMTSdmar+ZqTZKjDRpI/x+v2kK15z11KcR
         xtH9fYjxUGqfPb4I/gksRUkdRNYRjcssq+YqPWNwGRsjlC6Im9x5z6xJG1ZS+g4RQQrv
         iyjqjF2NMy7Ik+7sMZeSI5NRQwHYVaGL7LYae3QXmYEB27LSYe9ulja93MCkGFRMCtwO
         uxjrL6jTmwfrONIznA/xs6ZJj6goPxaSo+wX3FwJEQsg4UG2WThWpcGXBrcJBcz69tKu
         m3bw==
X-Gm-Message-State: ACrzQf3VfTLfHXL5cwnhvSjCd5dyuAnvU8l/BXz7VdWUR70wt5NfEp52
	zEfhG/65mWe68fFj6GQiQbQ=
X-Google-Smtp-Source: AMsMyM6aIB8iArlp/yXdLbkVlfyR5S2chCIX7ypP3AB53UZCrMN6kr/dhBXe3qlkTlhGWpT++ItiBA==
X-Received: by 2002:a05:6402:2546:b0:45d:8bff:7afc with SMTP id l6-20020a056402254600b0045d8bff7afcmr42631340edb.302.1666832082497;
        Wed, 26 Oct 2022 17:54:42 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b007ad2da5668csm2286040ejc.112.2022.10.26.17.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 17:54:42 -0700 (PDT)
Message-ID: <e0679728-7a15-50e1-8a5e-847db1528726@gmail.com>
Date: Thu, 27 Oct 2022 02:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 4/4] ARM: dts: rockchip: add rk3128-evb.dts
To: kever.yang@rock-chips.com, heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
Content-Language: en-US
In-Reply-To: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add rk3128-evb.dts

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/Makefile       |   1 +
 arch/arm/boot/dts/rk3128-evb.dts | 105 +++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3128-evb.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 68ac9b360..0f26539d2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1127,6 +1127,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3066a-marsboard.dtb \
 	rk3066a-mk808.dtb \
 	rk3066a-rayeager.dtb \
+	rk3128-evb.dtb \
 	rk3188-bqedison2qc.dtb \
 	rk3188-px3-evb.dtb \
 	rk3188-radxarock.dtb \
diff --git a/arch/arm/boot/dts/rk3128-evb.dts b/arch/arm/boot/dts/rk3128-evb.dts
new file mode 100644
index 000000000..6ad4549d5
--- /dev/null
+++ b/arch/arm/boot/dts/rk3128-evb.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2017 Rockchip Electronics Co., Ltd
+ */
+
+/dts-v1/;
+
+#include "rk3128.dtsi"
+
+/ {
+	model = "Rockchip RK3128 Evaluation board";
+	compatible = "rockchip,rk3128-evb", "rockchip,rk3128";
+
+	aliases {
+		mmc0 = &emmc;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
+	};
+
+	vcc5v0_otg: vcc5v0-otg-drv {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_otg";
+		gpio = <&gpio0 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&otg_vbus_drv>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_host: vcc5v0-host-drv {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		gpio = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&host_vbus_drv>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&emmc {
+	bus-width = <8>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+	};
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
+
+&usb_host_ehci {
+	status = "okay";
+};
+
+&usb_host_ohci {
+	status = "okay";
+};
+
+&usb_otg {
+	vbus-supply = <&vcc5v0_otg>;
+	status = "okay";
+};
+
+&pinctrl {
+	usb_otg {
+		otg_vbus_drv: otg-vbus-drv {
+			rockchip,pins = <0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb_host {
+		host_vbus_drv: host-vbus-drv {
+			rockchip,pins = <2 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
--
2.20.1


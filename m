Return-Path: <SRS0=Qc4v=5V=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6567C25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC1D0C433EF; Tue, 24 Jan 2023 11:02:30 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 539E9C4339B;
	Tue, 24 Jan 2023 11:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 539E9C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558149; x=1706094149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fztzhObr1+DPfV8Dj85hL/YthEfox+DFu5vzVTCvub4=;
  b=ahTRxi6tuREJLb4NHwB39W7OfjR/eh+bKJxRXZkv8IkfzdYRLVj2ZWnp
   mHSRzPUY2RKi8ynowM5Uc2ijIzT21RVvWL0ZTp03yp+epUkxpIOMJNNMZ
   dHoSi07PyukK6tU43cqEuBSSVU547TAGfIv1PkgYi3q8ZJBcNainWIOpK
   yszj8Oxvfe3Tyn/NDwyc6WSY6/m3TFwMpDLgRBJ7q8MhOY4KmjyTcu7TE
   ZJBmRiSw8UjCiOpGyJt0qFH3Kw7VmLOoCKDWs7JxLMhreipkGyNgXKdrU
   e+AI9HpfIt7fitMHellEELaGYL2z+qeHcGV2v9StDxWUEW09DE1zL6/le
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616630"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:19 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558139; x=1706094139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fztzhObr1+DPfV8Dj85hL/YthEfox+DFu5vzVTCvub4=;
  b=lqKCjxHBSJc+jLpnAo3p60pWadHqTcLcQCugWNR4GR2itHV1eVBfbbeK
   zCaqbjavPHwHJS4gKN6x2ZGhlfFjrTisaexGL+0R75qIuV64WPWVWiB//
   oQcUBh9M7Hi8kSLTKZRw0BKUPmVpaHgOQxN3NJupgLJjbGOb2108FG+s8
   hct4HZernT1Z94Yik5RuiqA1gitPRGfEmAMcaQh4byz49DtyGhOKdgomP
   7+iyxz+EjxiJnhT9mw3CRps0tMUKnZyQBCDIki2QmNIma7LUV/wITEK+X
   IwC50NLcb0YJB5dpFeNIF7lOlFWaDmwLnWOyfOL3FBAu38bcubO5bg7QD
   g==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616628"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E272B280074;
	Tue, 24 Jan 2023 12:02:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 08/10] ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
Date: Tue, 24 Jan 2023 12:02:11 +0100
Message-Id: <20230124110213.3221264-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable drivers used on TQMLS102xA + MBLS1021A.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

Changes in v2:
* Changed symbols to 'm' where possible

 arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adcf..92628a160cfb3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -191,6 +191,7 @@ CONFIG_PCI_TEGRA=y
 CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCI_DRA7XX_EP=y
+CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
@@ -249,6 +250,7 @@ CONFIG_AHCI_ST=y
 CONFIG_AHCI_IMX=y
 CONFIG_AHCI_SUNXI=y
 CONFIG_AHCI_TEGRA=y
+CONFIG_AHCI_QORIQ=y
 CONFIG_SATA_HIGHBANK=y
 CONFIG_SATA_MV=y
 CONFIG_SATA_RCAR=y
@@ -329,6 +331,7 @@ CONFIG_TOUCHSCREEN_ADC=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_ELAN=m
 CONFIG_TOUCHSCREEN_MMS114=m
+CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_TOUCHSCREEN_WM97XX=m
 CONFIG_TOUCHSCREEN_ST1232=m
 CONFIG_TOUCHSCREEN_STMPE=y
@@ -483,6 +486,7 @@ CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_EM=y
+CONFIG_GPIO_MPC8XXX=y
 CONFIG_GPIO_MXC=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_SYSCON=y
@@ -493,6 +497,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_PALMAS=y
+CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_TPS6586X=y
 CONFIG_GPIO_TPS65910=y
 CONFIG_GPIO_TWL4030=y
@@ -533,6 +538,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_IMX_THERMAL=y
+CONFIG_QORIQ_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
@@ -821,6 +827,8 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SOC_TLV320AIC32X4=m
+CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y
@@ -830,6 +838,7 @@ CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_BRCMSTB=m
 CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=m
 CONFIG_USB_EHCI_HCD_STI=y
 CONFIG_USB_EHCI_EXYNOS=m
 CONFIG_USB_EHCI_MV=m
@@ -933,6 +942,8 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_FLASH=m
 CONFIG_LEDS_CPCAP=m
+CONFIG_LEDS_PCA9532=m
+CONFIG_LEDS_PCA9532_GPIO=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_MAX8997=m
@@ -949,6 +960,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=y
 CONFIG_EDAC=y
+CONFIG_EDAC_LAYERSCAPE=y
 CONFIG_EDAC_HIGHBANK_MC=y
 CONFIG_EDAC_HIGHBANK_L2=y
 CONFIG_RTC_CLASS=y
@@ -962,6 +974,7 @@ CONFIG_RTC_DRV_MAX8997=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_PCF85363=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_TWL4030=y
-- 
2.34.1


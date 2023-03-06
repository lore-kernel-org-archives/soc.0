Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D00C6FA99
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2998CC4339B; Mon,  6 Mar 2023 17:23:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76A53C4339C;
	Mon,  6 Mar 2023 17:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76A53C4339C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M4b5s-1pXaex3NmY-001j20; Mon, 06 Mar 2023 18:23:17 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Denis Ciocca <denis.ciocca@st.com>,
	soc@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@chargebyte.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 8/8] ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers
Date: Mon,  6 Mar 2023 18:22:49 +0100
Message-Id: <20230306172249.74003-9-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306172249.74003-1-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:apHcp3EmZDFHmusTpF0RTcwoyJeqPvigk6+aX2bNJECC+tUgQ/N
 KUbP1kVDBGdaW8jNnatNLV01ny0L8kAQblGyGQ1ONpnD8q2kEPfIupcKhRxrLgNvYFFEpba
 bkBoeW7BaH8TJc+K47y+GOiQncB3rqNB+tuM1iVk6uezW8MUDzfmiKnScEvr6uOC0UwMNVP
 PnufDfoFk2bjgy2s0myfg==
UI-OutboundReport: notjunk:1;M01:P0:a4m4bis2SwU=;axYlHSs0Zq4zPdsGn/qRKITU4rJ
 d/p/xFSrTK736liY0EaIN9oNQo77dfVlirVDI9XoQC3gEvfKrIYuIGi2Cw+bAa0iiOp4P399e
 RLNnQdwcTsmM7ZrrJ7OizDEa8402VlmgaZFDD4aoePhviIQB2GtuEknoDunBVqepsVNSxEmcY
 IxVuEjaTmbZw+8IAPpE3cCJXcPD1OJzykM2MU9tq199EEdfFj62t8f1ojIeeqAcsZ5WbD3zmK
 gD5mX8qXnTXRSKuecsmvVIHkw44NsDu/UPx4GieYHWxJMngf6QDHdGTY5MmPB7KxTenVUSN5C
 vqJlxUsH6Kt3hiRXETUMqzHj76IShO1XSV56SxibluyLFzVv/1jeOXmWBqEM/6dT5JC8mVLmb
 M1+ZDY+h+9Su1iofzMar0imtgMmtUlvENhJZsC7gXb0IfL6XMal29/czhl7YLGkwrLBHmHzl1
 dx1yrI+zjwNvdDaUKDOquQwlczqJMcMcH/nlsI4YrUxIWkrPBM/j8v+/jwWSn8UhHbG5qgY8e
 IasH22IGLHHukL6Oj8A4UvYIbArkMhKqCyhPAoSm+FXDWcnfVPyMBiwzibIZWCTwkZbZPaPbm
 FffbLQR6Lgn9XLh1oPwyMWyhMT2gPnO/SKR/gSgkWWOvvC13xze4ZADeiY9tdcTEoGxLY+sM+
 3O7c3hmccmHmIuXVhV61A2g5hlxe1t92Yyf17iAw+g==

From: Stefan Wahren <stefan.wahren@chargebyte.com>

We need to enable some drivers in order to use the following peripherals
of Tarragon:
  * QCA7000/7005 Powerline chip
  * One-Wire Master DS2484 with external thermal sensors
  * external 4 pin PWM fan
  * ST IIS328DQ I2C accelerometer

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 6dc6fed12af8..c854b03fabf2 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -128,6 +128,7 @@ CONFIG_CS89x0_PLATFORM=y
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
+CONFIG_QCA7000_SPI=m
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMC91X=y
 CONFIG_SMC911X=y
@@ -215,6 +216,9 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_74X164=y
+CONFIG_W1=m
+CONFIG_W1_MASTER_DS2482=m
+CONFIG_W1_SLAVE_THERM=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
@@ -223,6 +227,7 @@ CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_PWM_FAN=y
 CONFIG_SENSORS_SY7636A=y
 CONFIG_THERMAL_STATISTICS=y
 CONFIG_THERMAL_WRITABLE_TRIPS=y
@@ -403,6 +408,7 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_SOC_IMX8M=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_IIO=y
+CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_MMA8452=y
 CONFIG_IMX7D_ADC=y
 CONFIG_RN5T618_ADC=y
-- 
2.34.1


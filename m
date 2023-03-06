Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A88C61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1FBBC4339E; Mon,  6 Mar 2023 17:30:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51D64C4339C;
	Mon,  6 Mar 2023 17:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51D64C4339C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N3KY0-1qYSBu0EqI-010Jxc; Mon, 06 Mar 2023 18:23:12 +0100
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
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/8] ARM: dts: imx6ull: Add chargebyte Tarragon support
Date: Mon,  6 Mar 2023 18:22:41 +0100
Message-Id: <20230306172249.74003-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7X3G3jIfDeolQi6iDz99jJ77T1hJ6MIzBoLP/VTGvpwuL7H+am6
 i4jpzJZ+tJ1+9IJ0NWg9+L9a/eL+NIdTe6xSEUVZqrHjGaIqrCndO/l7+gMKBo5pXdqjbfI
 SvadKtkiC6z51w9fjaukEJYchDbTKMR4lQtsvJ1OsLxJkD9T/MXw3JTywK89H8qeDRw5J7l
 WrZDBj+iqz/RhEAfMPo2g==
UI-OutboundReport: notjunk:1;M01:P0:7EyuQ7Cbcfs=;Xua5hNz/BzfscGpMwi0Ahu8Xsjk
 JNO6JZjOzxSy6rthX6lKQOeqqdDZkTaxfCEWi+uJsKk+4ZoByob+YTTcHPj7AbFCd447fQUpT
 g6czCmWfby8DaGNM/gsp2P3/cv5COXY47uKhbGcwVsg/TIyxDjAZaguMjQn9q9irvOIJJgrdF
 OcNPAYv8DIM5eEMfxlDFLeQeYfiUPwxWL9I/fN502eicHPBTlUmPMOSpmJRynMNcgzqo3UzC8
 FqTeBmaCtSuaG8pMoKpuIcXiC3ug/P59PSgr2zHYe5jgEEcNIAVtIUDsz+HEskA5Yxjh8usRA
 76+0/foXyyf9iNyE3R5Z0WGe8WlVLZSgi6vfdjGt2aiPZ1o7Ptd39fTDZBVOa0Xk1QQVsNCIh
 x8GNGypIwZ2ByPhsDHYoNC7a/KkMmQO+hRhxP1UyNrMNoMKNzx+DjWgP+zezNcvLOpW6/SGW+
 4lby2xkgLdgIY/d2OmfZ8c37RAJTpre4lHoyimU7KhBBPilEfcAGYVOQUHtl8u6C+sBbHIHMq
 nFWNwDGruLEuQraWSb7zlAtVSyTJQ+3L4BKzbiNtZ43YGT8RNgGx7HnN3vF4HKX3Il32QeMrD
 XmGlqtX5oBlm5vQIBG2vcMCaNbB7k9gpTec15cqRdqhj0XKwHfn1+mztALsXSr7C+dzY9DpTS
 1tGjVpG/KeG/yvr+tAkzPNrzCg4+cqIa9Y1LPOa1Kg==

This series adds the support for chargebyte Tarragon, which is an Electrical
Vehicle Supply Equipment (EVSE) for AC charging stations
(according to IEC 61851, ISO 15118).

The Tarragon board is based on an i.MX6ULL SoC and is available in
4 variants (Master, Slave, SlaveXT, Micro), which provide more or
less peripherals.

Supported features:
  * 512 MB DDR RAM
  * eMMC
  * Debug UART
  * 100 Mbit Ethernet
  * USB 2.0 Host interface
  * Powerline communication (QCA700x)
  * 2x RS485
  * Digital in- and outputs (12 V)
  * One-Wire master for external temp sensors
  * 2x relay outputs
  * 2x motor interfaces
  
The Tarragon hardware is bundled with a charging stack under the name Charge Control C: 
https://chargebyte.com/products/charging-station-communication/charge-control-c

This series is rebased on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git?h=for-next

Stefan Wahren (8):
  dt-bindings: vendor-prefixes: add chargebyte
  dt-bindings: Add DS2482/DS2484 as trivial device
  w1: ds2482: add i2c id for ds2484
  dt-bindings: iio: st-sensors: Add IIS328DQ accelerometer
  iio: accel: add support for IIS328DQ variant
  dt-bindings: ARM: fsl: Add chargebyte Tarragon
  ARM: dts: imx6ull: Add chargebyte Tarragon support
  ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 .../bindings/iio/st,st-sensors.yaml           |   1 +
 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   4 +
 .../arm/boot/dts/imx6ull-tarragon-common.dtsi | 858 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-tarragon-master.dts |  82 ++
 arch/arm/boot/dts/imx6ull-tarragon-micro.dts  |  10 +
 arch/arm/boot/dts/imx6ull-tarragon-slave.dts  |  32 +
 .../arm/boot/dts/imx6ull-tarragon-slavext.dts |  64 ++
 arch/arm/configs/imx_v6_v7_defconfig          |   6 +
 drivers/iio/accel/st_accel.h                  |   1 +
 drivers/iio/accel/st_accel_core.c             |   1 +
 drivers/iio/accel/st_accel_i2c.c              |   5 +
 drivers/iio/accel/st_accel_spi.c              |   5 +
 drivers/w1/masters/ds2482.c                   |   1 +
 16 files changed, 1085 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts

-- 
2.34.1


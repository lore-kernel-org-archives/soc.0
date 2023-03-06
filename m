Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4590C6FD1D
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EA85C4339C; Mon,  6 Mar 2023 17:30:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3682C433D2;
	Mon,  6 Mar 2023 17:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3682C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MCbR7-1phj0q3Nit-009jEz; Mon, 06 Mar 2023 18:23:15 +0100
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
Subject: [PATCH 5/8] iio: accel: add support for IIS328DQ variant
Date: Mon,  6 Mar 2023 18:22:46 +0100
Message-Id: <20230306172249.74003-6-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306172249.74003-1-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8pOSVs5pr3qo5I8gRJ4mnb4mzsthHgbkNTMbUsy+rAaH8Tcqei4
 1nJJeYoOAlsnTs5CYx7U1BlLvzhb8SGehE1/OZn5fRLsm9jU7byYi5dcZ1jyaoaxkBZd9IX
 NTz7ElNVj2hIwUyMvNtjnSUwD5Mv7zp5Bs1Z4R96niKL6ZS5TiZ+mKuPzUecb38L5hShpV1
 G9g7EXMnmqV+QmXt86snA==
UI-OutboundReport: notjunk:1;M01:P0:7tgHV863EpY=;wRmrbcL0LDkeKRfkDjntSIwxaWN
 ROdAs1js6d5bVIdpNe6xXTmYa1NHZ9BAmpET9MYHMGJPO+bNKTpg5CIepdoqPK0kqeWI1xL+4
 Mo1tU4atqSFkk+SZME5p/TCwS5RMyODUBpDi51Pboa3H5jbUEy8MGT6+3NifhebwjTvlwlRSN
 mdFnk2IWoupePlo728DZN/zBEPMCGxCgMDOOubRs4f3sEUEjm7LTEW+zIMzE//gQ9BTNWAblr
 3k860LiFgA2oH9lwn6pMY/OnVMsiCjr3BzEdxftdIYUs1TFJnaCqClwJwWXgC1Dz+hTei+/J6
 JJnpCseXvfd9w68vQ5gCaq6ZeR2X+1G/Qs+wwA8mdlfH4Dj3m+C6QL8RVBA7t0nfWfaT1zr2G
 grKl31u6pgkZrcsOr72oCXNfiTVcMViTbMnVPuYEvyVmMZPbyb2AM+TnZOdF38EfsPNFuWO26
 SynX4TDHnDUJuve+eOnFH1HpOPgdZ4/uA8rLB3gjQOF/Jr7BGP5dwM6SrE1y4OLrCG7sTYJ/y
 pNq2BPwlyCAtymeW3vFsCYDMbu+AbDqA2/SqZiLYrQvAHa3AIo9C27XXZhzllVsmn5WE1sYm2
 sxSrwL4V7UXgMIEb1CF5O7dOIwd/DoI9+WSMOqbFxF+3Ty5Jtk1cGYuxsC2vQx+2GHRPHpprm
 C5bKAx70z3shhVZ+Q19GWihaKKsE+sw6hbMPZYGQlw==

From: Stefan Wahren <stefan.wahren@chargebyte.com>

Add support for ST IIS328DQ accelerometer to the st_accel framework.
The chip is compatible to the LIS331DL.

Link: https://www.st.com/resource/en/datasheet/iis328dq.pdf
Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/iio/accel/st_accel.h      | 1 +
 drivers/iio/accel/st_accel_core.c | 1 +
 drivers/iio/accel/st_accel_i2c.c  | 5 +++++
 drivers/iio/accel/st_accel_spi.c  | 5 +++++
 4 files changed, 12 insertions(+)

diff --git a/drivers/iio/accel/st_accel.h b/drivers/iio/accel/st_accel.h
index 56ed0c776d4a..e7525615712b 100644
--- a/drivers/iio/accel/st_accel.h
+++ b/drivers/iio/accel/st_accel.h
@@ -39,6 +39,7 @@
 #define LIS302DL_ACCEL_DEV_NAME		"lis302dl"
 #define LSM303C_ACCEL_DEV_NAME		"lsm303c_accel"
 #define SC7A20_ACCEL_DEV_NAME		"sc7a20"
+#define IIS328DQ_ACCEL_DEV_NAME		"iis328dq"
 
 
 #ifdef CONFIG_IIO_BUFFER
diff --git a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st_accel_core.c
index 6b8562f684d5..5f7d81b44b1d 100644
--- a/drivers/iio/accel/st_accel_core.c
+++ b/drivers/iio/accel/st_accel_core.c
@@ -517,6 +517,7 @@ static const struct st_sensor_settings st_accel_sensors_settings[] = {
 		.wai_addr = ST_SENSORS_DEFAULT_WAI_ADDRESS,
 		.sensors_supported = {
 			[0] = H3LIS331DL_ACCEL_DEV_NAME,
+			[1] = IIS328DQ_ACCEL_DEV_NAME,
 		},
 		.ch = (struct iio_chan_spec *)st_accel_12bit_channels,
 		.odr = {
diff --git a/drivers/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_accel_i2c.c
index 3f02fd5d5946..fb9e2d6f4210 100644
--- a/drivers/iio/accel/st_accel_i2c.c
+++ b/drivers/iio/accel/st_accel_i2c.c
@@ -119,6 +119,10 @@ static const struct of_device_id st_accel_of_match[] = {
 		.compatible = "silan,sc7a20",
 		.data = SC7A20_ACCEL_DEV_NAME,
 	},
+	{
+		.compatible = "st,iis328dq",
+		.data = IIS328DQ_ACCEL_DEV_NAME,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, st_accel_of_match);
@@ -157,6 +161,7 @@ static const struct i2c_device_id st_accel_id_table[] = {
 	{ LIS302DL_ACCEL_DEV_NAME },
 	{ LSM303C_ACCEL_DEV_NAME },
 	{ SC7A20_ACCEL_DEV_NAME },
+	{ IIS328DQ_ACCEL_DEV_NAME },
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, st_accel_id_table);
diff --git a/drivers/iio/accel/st_accel_spi.c b/drivers/iio/accel/st_accel_spi.c
index 5740dc1820bd..f72a24f45322 100644
--- a/drivers/iio/accel/st_accel_spi.c
+++ b/drivers/iio/accel/st_accel_spi.c
@@ -100,6 +100,10 @@ static const struct of_device_id st_accel_of_match[] = {
 		.compatible = "st,lsm303c-accel",
 		.data = LSM303C_ACCEL_DEV_NAME,
 	},
+	{
+		.compatible = "st,iis328dq",
+		.data = IIS328DQ_ACCEL_DEV_NAME,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, st_accel_of_match);
@@ -157,6 +161,7 @@ static const struct spi_device_id st_accel_id_table[] = {
 	{ LIS3DE_ACCEL_DEV_NAME },
 	{ LIS302DL_ACCEL_DEV_NAME },
 	{ LSM303C_ACCEL_DEV_NAME },
+	{ IIS328DQ_ACCEL_DEV_NAME },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, st_accel_id_table);
-- 
2.34.1


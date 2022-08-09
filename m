Return-Path: <SRS0=BO7e=YN=fris.de=frieder@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A4C19F2D
	for <soc@archiver.kernel.org>; Tue,  9 Aug 2022 15:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61D40C433D6; Tue,  9 Aug 2022 15:26:19 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C16DC43149;
	Tue,  9 Aug 2022 15:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C16DC43149
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FF2DC0115;
	Tue,  9 Aug 2022 17:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1660058775; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PSCP0kIbE147G2sIrP84ZavMu3rRxvkFSpWSssQnMYo=;
	b=K/oiX1i3u/0DjbBMEh1GiQmnZadk1fKqiK6jYJhrysrD7oDRj30bvtWFSA9jhOVJUeKt/2
	Ab1bllHDuL21IFPxcwQCJjihaJI/DIf5uQsDM3EIHNtk94js/rWqXxwbY/Bm18vq80dzSj
	s2pq/2U+0eTpQYQTEDGcRYrNIWxLyolIXkIQiHyOtV+q+WnjIBfzfLWZ1ztLSkOaNoC01i
	wfCBDQ7B9dz6/52SLhY0vvfXBhITBaIQ7i2svgZEJgi1zozULo/MoJ1lv0QRSENwVJbZXy
	a2MyyPKF/oAs4r20gnHV7RaI4Hav8pW7hF9XPt5kggwY8SGTO+Xbj6rJxSo3sw==
From: Frieder Schrempf <frieder@fris.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	soc@kernel.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Denys Drozdov <denys.drozdov@toradex.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 3/4] ARM: dts: imx6ul-kontron: Add imx6ull-kontron-n641x-s to Makefile
Date: Tue,  9 Aug 2022 17:25:30 +0200
Message-Id: <20220809152534.292034-4-frieder@fris.de>
In-Reply-To: <20220809152534.292034-1-frieder@fris.de>
References: <20220809152534.292034-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The imx6ull-kontron-n641x-s.dtb wasn't build as part of the
CONFIG_SOC_IMX6UL option. Add it to the list.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5112f493f494..2665db1c35bf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -696,8 +696,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-geam.dtb \
 	imx6ul-isiot-emmc.dtb \
 	imx6ul-isiot-nand.dtb \
-	imx6ul-kontron-n6310-s.dtb \
-	imx6ul-kontron-n6310-s-43.dtb \
+	imx6ul-kontron-n631x-s.dtb \
+	imx6ul-kontron-n631x-s-43.dtb \
 	imx6ul-liteboard.dtb \
 	imx6ul-tqma6ul1-mba6ulx.dtb \
 	imx6ul-tqma6ul2-mba6ulx.dtb \
@@ -726,6 +726,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-wifi-iris.dtb \
 	imx6ull-colibri-wifi-iris-v2.dtb \
 	imx6ull-jozacp.dtb \
+	imx6ull-kontron-n641x-s.dtb \
 	imx6ull-myir-mys-6ulx-eval.dtb \
 	imx6ull-opos6uldev.dtb \
 	imx6ull-phytec-segin-ff-rdk-nand.dtb \
-- 
2.37.1


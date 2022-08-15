Return-Path: <SRS0=bfhR=YT=fris.de=frieder@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32FCC25B0E
	for <soc@archiver.kernel.org>; Mon, 15 Aug 2022 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BD52C433C1; Mon, 15 Aug 2022 08:28:52 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00AD5C433D7;
	Mon, 15 Aug 2022 08:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00AD5C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D64CDBFAE8;
	Mon, 15 Aug 2022 10:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1660552128; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=24xyn2EcGe3/F2/wyHYU1Hh1pGAy3aJpsHHcjneCMio=;
	b=jLgnQEyT2ttQLDmozy84ZlASXmp3bBjEUrwipGpYZKNexyXqYSh+RsammlyLDqANMW47xb
	ABjit/9qwJikLTZS8AII7idywFlN9W78Vu90UWfWJp85fx4rC60mV/7akDwk7ZDg5z13xV
	8fI9hSTD+gVXBYIWJuAOgol05yqlUNB4wNHqmZsUbHh9/B1OYpcEgHhAWGhQAYi8riJUvZ
	sI6leRXbwFenvjrMEQ/cKDzrz0s1hXJJMdASqOossktTNgmyc/Bz7IqBfxPOxnX0Jo7O8q
	4AQPsfwh59C4qzEt2my67D0P98MUqVMPjKVrC1nb5USGdk17K7aDpfk5g7gr/w==
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
Subject: [PATCH v3 3/3] ARM: dts: imx6ul-kontron: Add imx6ull-kontron-bl to Makefile
Date: Mon, 15 Aug 2022 10:28:12 +0200
Message-Id: <20220815082814.27651-4-frieder@fris.de>
In-Reply-To: <20220815082814.27651-1-frieder@fris.de>
References: <20220815082814.27651-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The imx6ull-kontron-bl.dtb wasn't build as part of the
CONFIG_SOC_IMX6UL option. Add it to the list.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6627aed26fd6..1d0c79f61072 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -726,6 +726,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-wifi-iris.dtb \
 	imx6ull-colibri-wifi-iris-v2.dtb \
 	imx6ull-jozacp.dtb \
+	imx6ull-kontron-bl.dtb \
 	imx6ull-myir-mys-6ulx-eval.dtb \
 	imx6ull-opos6uldev.dtb \
 	imx6ull-phytec-segin-ff-rdk-nand.dtb \
-- 
2.37.1


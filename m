Return-Path: <SRS0=vHN4=UZ=somainline.org=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8534C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Apr 2022 11:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D7B1C385AB; Fri, 15 Apr 2022 11:57:07 +0000 (UTC)
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76726C385A5
	for <soc@kernel.org>; Fri, 15 Apr 2022 11:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76726C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from localhost.localdomain (abxj52.neoplus.adsl.tpnet.pl [83.9.3.52])
	by m-r2.th.seeweb.it (Postfix) with ESMTPA id D75053F642;
	Fri, 15 Apr 2022 13:57:03 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
List-Id: <soc.lore.kernel.org>
Cc: martin.botka@somainline.org,
	angelogioacchino.delregno@somainline.org,
	marijn.suijten@somainline.org,
	jamipkettunen@somainline.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 15/23] ARM: dts: qcom-msm8974pro-*: Use the 8974pro name in DT filenames
Date: Fri, 15 Apr 2022 13:56:25 +0200
Message-Id: <20220415115633.575010-16-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415115633.575010-1-konrad.dybcio@somainline.org>
References: <20220415115633.575010-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the 'pro' part to the filenames of DTs of devices that are based on
this SoC to make in easier to differentiate between Snapdragon 800- and
801-based platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/Makefile                                    | 4 ++--
 ...8974-samsung-klte.dts => qcom-msm8974pro-samsung-klte.dts} | 0
 ...tor.dts => qcom-msm8974pro-sony-xperia-shinano-castor.dts} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/{qcom-msm8974-samsung-klte.dts => qcom-msm8974pro-samsung-klte.dts} (100%)
 rename arch/arm/boot/dts/{qcom-msm8974-sony-xperia-shinano-castor.dts => qcom-msm8974pro-sony-xperia-shinano-castor.dts} (100%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 91f630f4dbfd..51d72dcd1f45 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1009,10 +1009,10 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
-	qcom-msm8974-samsung-klte.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \
-	qcom-msm8974-sony-xperia-shinano-castor.dtb \
+	qcom-msm8974pro-samsung-klte.dtb \
+	qcom-msm8974pro-sony-xperia-shinano-castor.dtb \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
 	qcom-sdx55-mtp.dtb \
 	qcom-sdx55-t55.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
rename to arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-msm8974-sony-xperia-shinano-castor.dts
rename to arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
-- 
2.35.2


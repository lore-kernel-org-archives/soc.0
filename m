Return-Path: <SRS0=vHN4=UZ=somainline.org=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C67C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Apr 2022 11:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C255C385A7; Fri, 15 Apr 2022 11:56:47 +0000 (UTC)
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B951EC385A6
	for <soc@kernel.org>; Fri, 15 Apr 2022 11:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B951EC385A6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from localhost.localdomain (abxj52.neoplus.adsl.tpnet.pl [83.9.3.52])
	by m-r2.th.seeweb.it (Postfix) with ESMTPA id 4493D3F612;
	Fri, 15 Apr 2022 13:56:41 +0200 (CEST)
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
Subject: [PATCH 01/23] ARM: dts: qcom-*-sony*: Mention SONY board names in DT filenames
Date: Fri, 15 Apr 2022 13:56:11 +0200
Message-Id: <20220415115633.575010-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415115633.575010-1-konrad.dybcio@somainline.org>
References: <20220415115633.575010-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SONY phones/tables are based on a common board ('platform'). Devices
based on the same are often close to identical. Mention their association
in filenames, like it's done in arm64 DTs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/Makefile                                | 8 ++++----
 ...a-yuga.dts => qcom-apq8064-sony-xperia-lagan-yuga.dts} | 0
 ...amami.dts => qcom-msm8974-sony-xperia-rhine-amami.dts} | 0
 ...nami.dts => qcom-msm8974-sony-xperia-rhine-honami.dts} | 0
 ...or.dts => qcom-msm8974-sony-xperia-shinano-castor.dts} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm/boot/dts/{qcom-apq8064-sony-xperia-yuga.dts => qcom-apq8064-sony-xperia-lagan-yuga.dts} (100%)
 rename arch/arm/boot/dts/{qcom-msm8974-sony-xperia-amami.dts => qcom-msm8974-sony-xperia-rhine-amami.dts} (100%)
 rename arch/arm/boot/dts/{qcom-msm8974-sony-xperia-honami.dts => qcom-msm8974-sony-xperia-rhine-honami.dts} (100%)
 rename arch/arm/boot/dts/{qcom-msm8974-sony-xperia-castor.dts => qcom-msm8974-sony-xperia-shinano-castor.dts} (100%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 252353fb4e3b..91f630f4dbfd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -988,7 +988,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8060-dragonboard.dtb \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
-	qcom-apq8064-sony-xperia-yuga.dtb \
+	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
 	qcom-apq8064-asus-nexus7-flo.dtb \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-apq8084-ifc6540.dtb \
@@ -1010,9 +1010,9 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974-fairphone-fp2.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
 	qcom-msm8974-samsung-klte.dtb \
-	qcom-msm8974-sony-xperia-amami.dtb \
-	qcom-msm8974-sony-xperia-castor.dtb \
-	qcom-msm8974-sony-xperia-honami.dtb \
+	qcom-msm8974-sony-xperia-rhine-amami.dtb \
+	qcom-msm8974-sony-xperia-rhine-honami.dtb \
+	qcom-msm8974-sony-xperia-shinano-castor.dtb \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
 	qcom-sdx55-mtp.dtb \
 	qcom-sdx55-t55.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
rename to arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
rename to arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dts
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
rename to arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dts
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-shinano-castor.dts
similarity index 100%
rename from arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
rename to arch/arm/boot/dts/qcom-msm8974-sony-xperia-shinano-castor.dts
-- 
2.35.2


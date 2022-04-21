Return-Path: <SRS0=noUR=U7=z3ntu.xyz=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6239BC433EF
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 21:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FDE0C385A7; Thu, 21 Apr 2022 21:20:06 +0000 (UTC)
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C974C385A5;
	Thu, 21 Apr 2022 21:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C974C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
	by mail.z3ntu.xyz (Postfix) with ESMTPSA id 24CB2CC10C;
	Thu, 21 Apr 2022 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
	t=1650575997; bh=5ScSxn4n5ySRopwqFbclap1GFEUkLSSL+DlpBzrrvQk=;
	h=From:To:Cc:Subject:Date;
	b=KoUyVqigeI1pJrTPGIqB1K06o9w5tlY0D/m6/YssQKeRf+3HZd29OO5GVU7rVamOG
	 5CsZU/QKsPuUWkM9HaelMXLps0RmexhLMiFRsP4iM8+RzYCL03h6kakQ6sBQve0/cI
	 tBJkd7EC/6KTxy/ZpNIAYQzpddD7FpKRi9Ofx1R4=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Luca Weiss <luca@z3ntu.xyz>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: msm8974-FP2: We're msm8974pro
Date: Thu, 21 Apr 2022 23:19:33 +0200
Message-Id: <20220421211936.345168-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fairphone 2 always uses Snapdragon 801, a.k.a msm8974pro so change the
include and filename to that.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/Makefile                                      | 2 +-
 ...8974-fairphone-fp2.dts => qcom-msm8974pro-fairphone-fp2.dts} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/{qcom-msm8974-fairphone-fp2.dts => qcom-msm8974pro-fairphone-fp2.dts} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3541e5eec611..728bbd0f8c26 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1010,10 +1010,10 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8916-samsung-serranove.dtb \
 	qcom-msm8960-cdp.dtb \
-	qcom-msm8974-fairphone-fp2.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \
+	qcom-msm8974pro-fairphone-fp2.dtb \
 	qcom-msm8974pro-samsung-klte.dtb \
 	qcom-msm8974pro-sony-xperia-shinano-castor.dtb \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
similarity index 99%
rename from arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
rename to arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 97d109a5c71d..08e723f2bdfc 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -1,4 +1,4 @@
-#include "qcom-msm8974.dtsi"
+#include "qcom-msm8974pro.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
 #include <dt-bindings/input/input.h>
-- 
2.36.0


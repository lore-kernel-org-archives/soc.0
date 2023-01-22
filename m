Return-Path: <SRS0=7SpG=5T=postmarketos.org=newbyte@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82911C25B4E
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69034C4339E; Sun, 22 Jan 2023 14:50:28 +0000 (UTC)
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
	by smtp.kernel.org (Postfix) with ESMTP id A48F2C433EF;
	Sun, 22 Jan 2023 14:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A48F2C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=postmarketos.org
Received: from shock.lan (2-248-191-197-no36.tbcn.telia.com [2.248.191.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by proxmox1.postmarketos.org (Postfix) with ESMTPSA id EC1DE140402;
	Sun, 22 Jan 2023 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1674399025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtyjs2pqrJrhJouhbcxDlpTK3vQz+8gAmTLZyHkw9gE=;
	b=cEMghCUCVTn9UbQVdx2Z+dFC55xH2Fi7qQJ8TIYV1jr3GlGeYEwyknv/Pwa2GZAsy/nHZK
	oksySJGKbZCsBGtI3G6T4NT+PfP3UyG3Nv7MCHkX294k1pqaFft++THEPU3UKYokYh7vZO
	lb1fvyPIGRvHDEbVC4fA6wBjnjGqgp8=
From: Stefan Hansson <newbyte@postmarketos.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	matti.lehtimaki@gmail.com,
	Stefan Hansson <newbyte@postmarketos.org>
Subject: [PATCH 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 10.1 LTE (SM-T535)
Date: Sun, 22 Jan 2023 15:47:50 +0100
Message-Id: <20230122144749.87597-4-newbyte@postmarketos.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122144749.87597-1-newbyte@postmarketos.org>
References: <20230122144749.87597-1-newbyte@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a device tree for the Samsung Galaxy Tab 4 10.1 (SM-T535) LTE tablet
based on the MSM8926 platform.

Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/qcom-msm8926-samsung-matisselte.dts   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0c07867aeab..e1fad9eb0d26 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1061,6 +1061,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8916-samsung-e7.dtb \
 	qcom-msm8916-samsung-grandmax.dtb \
 	qcom-msm8916-samsung-serranove.dtb \
+	qcom-msm8926-samsung-matisselte.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
new file mode 100644
index 000000000000..6df568f1f36d
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Matti Lehtimäki <matti.lehtimaki@gmail.com>
+ * Copyright (c) 2023, Stefan Hansson <newbyte@postmarketos.org>
+ */
+
+/dts-v1/;
+
+#include "qcom-msm8226-samsung-matisse-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 4 10.1 LTE";
+	compatible = "samsung,matisselte", "qcom,msm8926";
+	chassis-type = "tablet";
+};
+
+&pm8226_l3 {
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+};
+
+&pm8226_s4 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <2200000>;
+};
+
+&reg_tsp_3p3v {
+		gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+};
+
+&sdhc_2 {
+	/* SD card fails to probe with error -110 */
+	status = "disabled";
+};
+
+&tsp_en1_default_state {
+	pins = "gpio32";
+};
-- 
2.39.0


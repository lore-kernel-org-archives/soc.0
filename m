Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E830CC61D97
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2E2DC433A1; Sat, 21 Jan 2023 20:19:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D179AC433EF;
	Sat, 21 Jan 2023 20:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D179AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id v30so10402741edb.9;
        Sat, 21 Jan 2023 12:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH5ssNbMjjziLJwNcTMZ2d/eFIt2gMohhe8o5T2jQ1M=;
        b=cmlPIsUKJIXzWwqnC4S5Q6Sh3AiU8MryNr3cqUXSVhP42gUD0VfJGZsO9FNpADkAVC
         oyZWkecCioCu9CFyvvW4s4luOl1aSnKERWv1dsDFj2v8wwfSwFenA8UC4t/PtoXp8tSC
         V4vnx8CcjfkLS7KBz3EeOLEmmHI6dyPb43ize4jsyIAzcmnr7XVMf9pAw2Qj8l+4RRjP
         uaWlcfutQUME1qsMyRgJAmVL8FRjzl6ZtH56MV5Nq3iXHLS19sSlhgs0rlzPXLP9m34u
         yEhcfZQfiKa8qjge/o5uu2RTRXy29JhSN2w6fRMFlbnSNsjZ7lqxbpddCHpjzHLN9S4B
         2o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH5ssNbMjjziLJwNcTMZ2d/eFIt2gMohhe8o5T2jQ1M=;
        b=cf1ysYqoeoEYFyb3Op2Ry8YoGuUIZK8JxDjRB0NH9XCjWISZb3maUhswC3/VcISJEK
         L2P0IGrBwSsvT/Lg8E7kmImHa+YKayGGNxmHA5VFwfqG+t0AaPQ8ClSz4+dEMSON7lgx
         f1xMPs+jPKE20xeNB/dJrNSVEpSMKwUZzQQL0L2QbWa8y3SlrIXqVheA/PXCxhaGd8oy
         dV30waxxQwXnwo/jI4RzJMmBwHb0y6NHfvrK3Rlnv+YJg9zuhPrRYzEDnZaX2Vh1FxW9
         tRMprR/WN4KFIzYEFv4ycMfvIBUNUyMvQQ5nMf/+YHdNH3O67vgwuQ4GKf4aC2U1Xc+V
         jQIw==
X-Gm-Message-State: AFqh2kr9vaHwqWawg9sn9CLshZAMjZULLjwjDq09BmJF7/QITE5fOFPD
	byVtA4gP/4R/ZROl4NRgvse9pBKUJoS1aQ==
X-Google-Smtp-Source: AMrXdXt2T1rSWy07cfoufrTsb4Ux/gRiVjdxbuoH6X7KzDV2UqKSIKXY976EzcAdpKOxcUNxlm2uFw==
X-Received: by 2002:aa7:ccd3:0:b0:49d:f44f:7ef1 with SMTP id y19-20020aa7ccd3000000b0049df44f7ef1mr22672142edt.14.1674332341236;
        Sat, 21 Jan 2023 12:19:01 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0047c6f3eccb2sm19203423edr.50.2023.01.21.12.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:19:00 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/2] arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller
Date: Sat, 21 Jan 2023 22:18:43 +0200
Message-Id: <20230121201844.46872-3-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201844.46872-1-markuss.broks@gmail.com>
References: <20230121201844.46872-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver adding support for Exynos5422/Exynos5800 DSI controller was
merged in 2016, yet it wasn't actually used. Add a proper compatible
for it.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 arch/arm/boot/dts/exynos5800.dtsi | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 62263eb91b3c..b612468515eb 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -597,7 +597,7 @@ mipi_phy: mipi-video-phy {
 			#phy-cells = <1>;
 		};
 
-		dsi@14500000 {
+		dsi: dsi@14500000 {
 			compatible = "samsung,exynos5410-mipi-dsi";
 			reg = <0x14500000 0x10000>;
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 526729dad53f..8328ddb3b02f 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -148,6 +148,10 @@ opp-200000000 {
 	};
 };
 
+&dsi {
+	compatible = "samsung,exynos5422-mipi-dsi";
+};
+
 &mfc {
 	compatible = "samsung,mfc-v8";
 };
-- 
2.39.0


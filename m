Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE597C54EED
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94D64C4339C; Sat, 21 Jan 2023 20:17:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1154C433EF;
	Sat, 21 Jan 2023 20:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1154C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id b4so10484883edf.0;
        Sat, 21 Jan 2023 12:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH5ssNbMjjziLJwNcTMZ2d/eFIt2gMohhe8o5T2jQ1M=;
        b=Dv0b6ksBdcZ72PXJRcORAxnH0Iq1zuAyzyqI5LMnojaZXSC0kZdyTqXwLVlAalC+UJ
         SSYvgkG4A/QFPzDQKCUOiQCcFLbLJuzY944fdAEgdiwuN+ny16nJJAXvqRbgNp80U4ju
         Za/N7cpkvQtXHCAd1n9k8SM2acfBRiPGktOwlKA53S7IZ7tcqUOQ4JLl9NbbL1yhzycK
         KwxLpk3ymGjR+UnXczeQ2/FmonNY5wXKJ81wcddvJ2/sWgpBV4XCRkMoxnrLKUcI19LZ
         wJ8g47AQOvhce0mGA+PPUWxm5h+fs8+8fo+5ggNMDfkyMzDmLVSAH86AdP0l3Lnurfti
         q00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH5ssNbMjjziLJwNcTMZ2d/eFIt2gMohhe8o5T2jQ1M=;
        b=geDIURifBo/echYzGr1MPlEL69y7dNUIrC5uu6XId4Nk/eaKks7tk3NGWhInuUwv8Z
         Mr6t3hy3hNrfI8UZEGp5Z1ri6q2cCWXaKtkJcKYvNrc8Y6Ev8RfVtQ4f5IprvopWSZKt
         +tSZEm2oOMb9171ReNFW0W1xtXvSREm2zioQAwKFISj/jI0cZtz6jSGiRbujBdlb8tAg
         OgdBgX4Rr3PY0xdoN7F76SiRpmZvEl1kaFp5rXD6J/W0zX8fLVVDICfIHlSCNto+Jull
         GFflpLdvG9xYLSXnS6RsM9yBUKJZ9EFQe77xz6NuV2WSzmCOawhq/ihGcfrYl3PoD4gY
         dMmQ==
X-Gm-Message-State: AFqh2kqdI6YsQmkm+2AVez7R1vvw36o+ScN9wYBe6GN3v2a0XlPcEB9o
	Mgm0USL9zDUPKnRkaei0ErY=
X-Google-Smtp-Source: AMrXdXv89ONZz3LcxEWaKL43u1skuqG9qemHpKY74Z6CbJH6SiaDeaJuoUSKdDPdUTh27n2eDI/01A==
X-Received: by 2002:a05:6402:43c4:b0:49e:8425:6033 with SMTP id p4-20020a05640243c400b0049e84256033mr9862767edc.28.1674332225921;
        Sat, 21 Jan 2023 12:17:05 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b0049e1f167956sm8278427edp.9.2023.01.21.12.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:17:05 -0800 (PST)
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
Subject: [PATCH 2/2] arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller
Date: Sat, 21 Jan 2023 22:16:49 +0200
Message-Id: <20230121201650.46560-3-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201650.46560-1-markuss.broks@gmail.com>
References: <20230121201650.46560-1-markuss.broks@gmail.com>
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


Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BBC433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D363EC34116; Thu, 26 May 2022 20:43:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22A8AC385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22A8AC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id wh22so5158424ejb.7
        for <soc@kernel.org>; Thu, 26 May 2022 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcLvN03w1UKQPgjX9rv1d+qE6eJZjbxTCqhmh4Irl8s=;
        b=E7k7ti+TRjeingo8wiGVBmQhssUIKMovZq1CTFf8w0jfK1VOBKzeIvuBZ/R7Nk8+2A
         QLYTqx9W16pwQSh+Q72mBZwKap2PcQcem3gT500kqHb5BSaZtZGnun8lQ+XgIYMvs2Wm
         MGWpYFkwHUmBH4XshWzqYAkZiDGm1KyDr8hWyC13lHFLmbh9G9zeCS4WE+vK/3ahSqjs
         vgb90soY7g7HsjHcbvHFfqvUfM1uQXrxQ8TUlqgSqJKJ6HOspYgZpaEgTtyjGBvYjluR
         cSQtC4FudRd34ZUqiRfzzOM+3xwYEWQrzcjMfQOZdMqA3X1uRV/99BZNrZrsJe1bRtez
         HgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcLvN03w1UKQPgjX9rv1d+qE6eJZjbxTCqhmh4Irl8s=;
        b=KH70Lu2V7v5zPO8AyWXajAGUkdZQtOvmj0BPLgEMHb2c6r23HU3nahjHiOKInRshzP
         wFDny8SzOkRtECoy7ASL5C1CS5XmMfYnDdsIPKzx2uh5FumCJ5pL+wGeXqnvHYNvJCZV
         IsoXHK68ThzJM16w0Cim3UHOb2SHU2KH5zAOSqDD6sMsyZwqVfjxKoossbJotJmcd57Y
         Bi060HMTx5aZcfX0Z9p/xY7C6zwUjZdcAhL3JAkzfieft1+JEoLrekLuVNsn0kHddbmy
         0aMLmmv6ahHHtEG/edcv1DADQChc4hgp6o+nBlbOAYA2WWiohvDUiCqpilYwnZ5Q+ym2
         riNw==
X-Gm-Message-State: AOAM533qIKsk1oLK1ABvhuz267AFKSOw/o/l4GhZy9KMGzIgDXkXdKoe
	luUvKslElo3H5ton8lxG6uz1qA==
X-Google-Smtp-Source: ABdhPJzkQvWbZM/xotHvMbcGMGsupNTjLEPyTrX5WSzU+1e2khzPqzlRKi6W6SCEInuggwcCLax6AQ==
X-Received: by 2002:a17:907:6d26:b0:6fe:b8cc:4613 with SMTP id sa38-20020a1709076d2600b006feb8cc4613mr26198968ejc.229.1653597825692;
        Thu, 26 May 2022 13:43:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006f3ef214e59sm788041ejc.191.2022.05.26.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:43:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: broadcom: adjust whitespace around '='
Date: Thu, 26 May 2022 22:43:39 +0200
Message-Id: <20220526204339.832296-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org>
References: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/bcm28155-ap.dts | 8 ++++----
 arch/arm/boot/dts/bcm283x.dtsi    | 6 +++---
 arch/arm/boot/dts/bcm5301x.dtsi   | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index ead6e9804dbf..78465ad37c5f 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -31,22 +31,22 @@ uart@3e000000 {
 	};
 
 	i2c@3e016000 {
-		status="okay";
+		status = "okay";
 		clock-frequency = <400000>;
 	};
 
 	i2c@3e017000 {
-		status="okay";
+		status = "okay";
 		clock-frequency = <400000>;
 	};
 
 	i2c@3e018000 {
-		status="okay";
+		status = "okay";
 		clock-frequency = <400000>;
 	};
 
 	i2c@3500d000 {
-		status="okay";
+		status = "okay";
 		clock-frequency = <100000>;
 
 		pmu: pmu@8 {
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index c113661a6668..2718e1033929 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -50,9 +50,9 @@ cpu_thermal: cpu-thermal {
 
 			trips {
 				cpu-crit {
-					temperature	= <90000>;
-					hysteresis	= <0>;
-					type		= "critical";
+					temperature = <90000>;
+					hysteresis = <0>;
+					type = "critical";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 65f8a759f1e3..5fc1b847f4aa 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -568,9 +568,9 @@ cpu_thermal: cpu-thermal {
 
 			trips {
 				cpu-crit {
-					temperature	= <125000>;
-					hysteresis	= <0>;
-					type		= "critical";
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
 				};
 			};
 
-- 
2.34.1


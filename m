Return-Path: <SRS0=3lNK=UQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1E4C433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 19:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01449C385A3; Wed,  6 Apr 2022 19:14:45 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB93AC385A1;
	Wed,  6 Apr 2022 19:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB93AC385A1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-de3ca1efbaso3980323fac.9;
        Wed, 06 Apr 2022 12:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=KLlQ1IkC9C7bQI/xLa19AUtFnnf5phT7CLkzx6EP4rY=;
        b=H59LjHTjOH00tCuco3qAmeqlZJIwGuZ1NRqN58CIsha98Kb9X1+Jf0AqL7f6kEBBnt
         MCRHxMg9iSYB4WiPObn+Cib8H4G/YPK0nFv3lz6VXtrX0iIDmy4rQZONgwE6aG55K4IU
         xCuqjRodI21Nsvg3gak0KzXjtgcbUHaGvl76B5dtEO6gEJ/XWCSd5czL9hIGEWkkibFa
         oAfO9bvBnUV55vHq9S6kCDLIRThLpGCOFw0I2+UG0Src/fDlriKlM3zYL6aIOhZqtXsS
         i0jvqFfNLQkY7WaZWxBZ3N65znMu6MLju3WTyWrZ/l89BU1AUd6Yv+vBJFD37f/GSJ5V
         EKaA==
X-Gm-Message-State: AOAM530A9NHqPdrDhbZVf3VX0dH7A/5PK483zuBj02PTw5XuXBYmNzez
	rGM0D+OMWHTKs2RlhyKG7rC+A5dS+w==
X-Google-Smtp-Source: ABdhPJwY9QQB+z+KYwgWqsBU+dz27vO7uUH6/wlQdpbxYv3cBkEB3Dyo+UvlDBXEWsQzvoybZ2OsEw==
X-Received: by 2002:a05:6870:14c3:b0:da:3703:329b with SMTP id l3-20020a05687014c300b000da3703329bmr4664346oab.54.1649272482843;
        Wed, 06 Apr 2022 12:14:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020aca3807000000b002eef684bd2fsm6786167oia.40.2022.04.06.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 12:14:42 -0700 (PDT)
Received: (nullmailer pid 2610582 invoked by uid 1000);
	Wed, 06 Apr 2022 19:14:41 -0000
Date: Wed, 6 Apr 2022 14:14:41 -0500
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm64: dts: imx: Fix imx8*-var-som touchscreen
 property sizes
Message-ID: <Yk3moe6Hz8ELM0iS@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.32.0

The common touchscreen properties are all 32-bit, not 16-bit. These
properties must not be too important as they are all ignored in case of an
error reading them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Can someone apply this for 5.18.

 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 1dc9d187601c..a0bd540f27d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -89,12 +89,12 @@ touchscreen@0 {
 		pendown-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <125>;
-		touchscreen-size-x = /bits/ 16 <4008>;
+		touchscreen-size-x = <4008>;
 		ti,y-min = /bits/ 16 <282>;
-		touchscreen-size-y = /bits/ 16 <3864>;
+		touchscreen-size-y = <3864>;
 		ti,x-plate-ohms = /bits/ 16 <180>;
-		touchscreen-max-pressure = /bits/ 16 <255>;
-		touchscreen-average-samples = /bits/ 16 <10>;
+		touchscreen-max-pressure = <255>;
+		touchscreen-average-samples = <10>;
 		ti,debounce-tol = /bits/ 16 <3>;
 		ti,debounce-rep = /bits/ 16 <1>;
 		ti,settle-delay-usec = /bits/ 16 <150>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index b16c7caf34c1..87b5e23c766f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -70,12 +70,12 @@ touchscreen@0 {
 		pendown-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <125>;
-		touchscreen-size-x = /bits/ 16 <4008>;
+		touchscreen-size-x = <4008>;
 		ti,y-min = /bits/ 16 <282>;
-		touchscreen-size-y = /bits/ 16 <3864>;
+		touchscreen-size-y = <3864>;
 		ti,x-plate-ohms = /bits/ 16 <180>;
-		touchscreen-max-pressure = /bits/ 16 <255>;
-		touchscreen-average-samples = /bits/ 16 <10>;
+		touchscreen-max-pressure = <255>;
+		touchscreen-average-samples = <10>;
 		ti,debounce-tol = /bits/ 16 <3>;
 		ti,debounce-rep = /bits/ 16 <1>;
 		ti,settle-delay-usec = /bits/ 16 <150>;
-- 
2.32.0


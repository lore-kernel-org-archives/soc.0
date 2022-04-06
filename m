Return-Path: <SRS0=3lNK=UQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB31C433EF
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 19:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E6A0C385A3; Wed,  6 Apr 2022 19:09:50 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF027C385A1
	for <soc@kernel.org>; Wed,  6 Apr 2022 19:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF027C385A1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-e2442907a1so3610248fac.8
        for <soc@kernel.org>; Wed, 06 Apr 2022 12:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nkvvt5iU3/huYVMTWpqmeVmasOECJdxAJG738D8isiA=;
        b=nyBz7VgD8p2gtK3DqmlD73BEcxAXfLALhOPnWbWqEDHRnwQdx2ndDX6pwWl8+K9XAw
         lTmz7bDQZDzZRDTGsbRisRkSMaykW/c1Oh+PJSlazFTVPpDSboZoFmOyjgiOIzctoe6K
         Kw9ldHRYI4avCtua8Vodu1xK6tPJJPNxuwD5uN6HA3YLaM+dDn2qpktG4QYnEgKnR0RU
         0JMm5qdVJrLBvG1KOOB7HgJi0M1AktMRDvVASkrTI0qxAvrN7oo0jrj1x5QdOVYeRrgi
         +OAWVT9M67A80UZrWy01sPt7lmoMVYazJmkrzPV5LIcyATDxQSejZJyu2PDP+MgRZy53
         hjcw==
X-Gm-Message-State: AOAM530WumJq2I88oV+BNNQmVBEmw4ddeur8qXaGRfgBFYJ6Dso027Mt
	oqUH/HYS+loPWehaskRDnw==
X-Google-Smtp-Source: ABdhPJw25u3J4jdicjV95QI6NUKAkXMnWtfFRhrT2nJEQpb3wVemqoBH7x9wlwuPgFzL3oA/pMeSGw==
X-Received: by 2002:a05:6870:2103:b0:de:29de:12c4 with SMTP id f3-20020a056870210300b000de29de12c4mr4829087oae.203.1649272188810;
        Wed, 06 Apr 2022 12:09:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w1-20020a056808090100b002da82caced5sm6676892oih.3.2022.04.06.12.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 12:09:48 -0700 (PDT)
Received: (nullmailer pid 2604082 invoked by uid 1000);
	Wed, 06 Apr 2022 19:09:47 -0000
Date: Wed, 6 Apr 2022 14:09:47 -0500
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm: dts: at91: Fix boolean properties with values
Message-ID: <Yk3leykDEKGBN8rk@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.32.0

Boolean properties in DT are present or not present and don't take a value.
A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
matter.

It may have been intended that 0 values are false, but there is no change
in behavior with this patch.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Can someone apply this for 5.18 please.

 arch/arm/boot/dts/at91-kizbox3-hs.dts      | 2 +-
 arch/arm/boot/dts/at91-kizbox3_common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-kizbox3-hs.dts b/arch/arm/boot/dts/at91-kizbox3-hs.dts
index 2799b2a1f4d2..f7d90cf1bb77 100644
--- a/arch/arm/boot/dts/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/at91-kizbox3-hs.dts
@@ -225,7 +225,7 @@ pinctrl_pio_zbe_rst: gpio_zbe_rst {
 		pinctrl_pio_io_reset: gpio_io_reset {
 			pinmux = <PIN_PB30__GPIO>;
 			bias-disable;
-			drive-open-drain = <1>;
+			drive-open-drain;
 			output-low;
 		};
 		pinctrl_pio_input: gpio_input {
diff --git a/arch/arm/boot/dts/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
index abe27adfa4d6..465664628419 100644
--- a/arch/arm/boot/dts/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/at91-kizbox3_common.dtsi
@@ -211,7 +211,7 @@ pinctrl_flx4_default: flx4_i2c6_default {
 		pinmux = <PIN_PD12__FLEXCOM4_IO0>, //DATA
 		<PIN_PD13__FLEXCOM4_IO1>; //CLK
 		bias-disable;
-		drive-open-drain = <1>;
+		drive-open-drain;
 	};
 
 	pinctrl_pwm0 {
-- 
2.32.0


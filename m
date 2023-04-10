Return-Path: <SRS0=td4J=AB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E6C77B61
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 22:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 428E4C4339C; Mon, 10 Apr 2023 22:03:07 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A22EC433D2
	for <soc@kernel.org>; Mon, 10 Apr 2023 22:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A22EC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id t14so7915465lft.7
        for <soc@kernel.org>; Mon, 10 Apr 2023 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681164184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6mM1R+ckU2oGJnyS8VV3M/Eb0zoIxcYZR1aNJbcRZM=;
        b=ARWl1SuNqdHbpLz7jiBEmwb3tmRyB/IrNEfvfIQ/kmQ12MuOa1GYa7b82DjrAVjITL
         CuxSruIDiw4ZFgDZjIxEonnAt0KevcTvO8swAq2+SsToGN1ndiT/Ea8yW/TC3Vlo5EnG
         lPTHXQDYgPJ9Y753C2S21yUP0XZ8LNu1+GC4kn0q9Os9AWY8pfaXnlJnPNE+0vwKRsrA
         xcs+Azykqau9Yk94VS6NFvgCuzDHWkFknvmmd7cNcpAU3Cuj+BK9Tss4W2zd2xRdnqGC
         l8knIHaHXXnKj3GFjForzdHOG2r9HQuewql/V7gDpk8XkS/8ZG3mX3EjuMbcMoYy5wuK
         q/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681164184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6mM1R+ckU2oGJnyS8VV3M/Eb0zoIxcYZR1aNJbcRZM=;
        b=0ltsgZoXa4Q4HhLKea6OCeib1KhTskhhlwYc3NchDYR9mWdJMJxDKfQdk82HkPwO01
         k2ZwkGJe1pbSEBrb8DXeYXxMTpKIPxg7Pvd7MEJzLcJPAIUU8+LbXVLP8SyHNdZZITQY
         E+r3lQ55f2lk1hhIs/vnoFICa0LBf1/U+x6ZF3gtafqFKGZ213XJDFWq/J7bhfzbvva4
         BWG3+WJbDHsf2XLKTQTclemVnq8lf1vfw+Xybw77GP3/j3nSvuB5y99yoHH4c6EVVADY
         NmUn+5UNm9zInXG77fWI1uAI0BLlIjm+RQHuU9qOc/8IjBI+sK+60MkN3L9xXAMFBeXg
         D/LA==
X-Gm-Message-State: AAQBX9dAqz10XScEheFj3VrRyBnj7WguxwRFfQj2Sdd/t1Rs0JHx2XYc
	BMYovNXf0xHzRxKgNEs5helbYQ==
X-Google-Smtp-Source: AKy350ZCqxDYKl0d+/Jpc7jeAehMp++1PE/r2/BRXiXmhTFCN2P7hhlv7POZoJphogePchDb9b0/kg==
X-Received: by 2002:ac2:4191:0:b0:4ea:fc73:7c59 with SMTP id z17-20020ac24191000000b004eafc737c59mr3522299lfh.10.1681164183963;
        Mon, 10 Apr 2023 15:03:03 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id l10-20020ac24a8a000000b004cc8196a308sm2262218lfp.98.2023.04.10.15.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 15:03:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: nomadik: Replace deprecated spi-gpio properties
Date: Tue, 11 Apr 2023 00:03:00 +0200
Message-Id: <20230410220300.2431524-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

As stated in Documentation/devicetree/bindings/spi/spi-gpio.yaml,
'gpio-mosi' and 'gpio-sck' are deprecated properties.

Use the recommeded 'mosi-gpios' and 'sck-gpios' instead.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Link: https://lore.kernel.org/r/20230407162504.1683422-1-festevam@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly wherever DTS patches
for next goes, I do not plan to send any more Nomadik
patches this kernel cycle.
---
 arch/arm/boot/dts/ste-nomadik-nhk15.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
index 8142c017882c..4d741adc16cd 100644
--- a/arch/arm/boot/dts/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
@@ -210,8 +210,8 @@ spi {
 		 * As we're dealing with 3wire SPI, we only define SCK
 		 * and MOSI (in the spec MOSI is called "SDA").
 		 */
-		gpio-sck = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
 		cs-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 		num-chipselects = <1>;
 
-- 
2.39.2


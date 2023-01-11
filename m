Return-Path: <SRS0=huXH=5I=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED2EC46467
	for <soc@archiver.kernel.org>; Wed, 11 Jan 2023 13:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA6E4C433F0; Wed, 11 Jan 2023 13:22:16 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF1C1C433D2
	for <soc@kernel.org>; Wed, 11 Jan 2023 13:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF1C1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id e13so16036353ljn.0
        for <soc@kernel.org>; Wed, 11 Jan 2023 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=441mvFLohqxOuYmmdP8E+VY0LDXePT3i/GiYn1UFXPs=;
        b=BSgt/eyuXFtObCcbqqRzpZxA/3ZMZeOXLsuv82PTiZ7eW1R/wmBYpAGmToAepKqlUz
         tD0W21MteRm7V9LzwD7C4wiZTnFXSF1X/pAUDSGdXHluVitM4rPhwRNqrYIxZI8iVXPe
         1HfR5ytvlY7lP2r9Uo23z7pcxa5nj7Lq9s9O0DWOzncu3e2AkeYbIEdWEoPd33Qlis5m
         o13OIxY8Eyd1iR9cG1Ge6ygmtv4sN6j1d4mx8h0DUAtg5VVRKpnJq6CmUjr6K9IhgBYM
         e2Sl2+U83/KRlLmO0FdRYy3yVdFvKXQWNG3/FaeTaBOkoFTwFD799EcShdtOn9yj2tzE
         GX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=441mvFLohqxOuYmmdP8E+VY0LDXePT3i/GiYn1UFXPs=;
        b=y4vD1hm7QTUGpIIZNIYQAoPgvj8CcCf/Pf9F02Xp2DaFTCUiO9C5suPwhPekVYCp5D
         bmsgOiUaO3Wa+wg0qL2iJtr+mzwV1sxLL1dbvYmGM6pTjfjS9cZOPoLFCVLIjg1hYUXj
         abwsyp9tw0Q57pFa7WJscQkW1olaDWrNCHE6jxx4ffYnkZcrzy3EMRJ9AvEvCnasrAoM
         EQl/z0AwCN41xPZXIC/AyFNrL1i0kqeZhE/TcPCB7lzt22mXpDU3ZR8aPvfZUvD1ktEZ
         PK6AMlQVwKeL7CUised2YpF+ZIx8NlcLRxmnXXx2HKY1OGHb6rEu9sIfyqAnAoY0fPti
         QThA==
X-Gm-Message-State: AFqh2krWGiRRSvKtBpMq8516c4tnSQRoTvACr0rw2/mAmmxAfYmyVM0y
	iYam9QN7sk1gJxDNeKAWRxo1qg==
X-Google-Smtp-Source: AMrXdXuo3dYnKUctk03bL1xgUnZsSzLlulfB93CvttVRFeynVrAJ96k8feGjDXqg2a11XLRvmtWDMg==
X-Received: by 2002:a2e:be06:0:b0:26f:db35:d205 with SMTP id z6-20020a2ebe06000000b0026fdb35d205mr25481400ljq.17.1673443333765;
        Wed, 11 Jan 2023 05:22:13 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id f21-20020a2e6a15000000b00284126dbea2sm1353545ljc.55.2023.01.11.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 05:22:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
Date: Wed, 11 Jan 2023 14:22:10 +0100
Message-Id: <20230111132210.134478-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This converts the EP93xx to use GPIO descriptors for the
LEDs.

Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Lukasz Majewski <lukma@denx.de>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebased on v6.2-rc1
- SoC folks: please apply this patch directly for suitable branch.
ChangeLog v2->v3:
- Collected Alexander's Tested-by
ChangeLog v1->v2:
- Fix syntax error (doubled left parens)
---
 arch/arm/mach-ep93xx/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 95e731676cea..71b113976420 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -426,10 +426,8 @@ void __init ep93xx_register_spi(struct ep93xx_spi_info *info,
 static const struct gpio_led ep93xx_led_pins[] __initconst = {
 	{
 		.name	= "platform:grled",
-		.gpio	= EP93XX_GPIO_LINE_GRLED,
 	}, {
 		.name	= "platform:rdled",
-		.gpio	= EP93XX_GPIO_LINE_RDLED,
 	},
 };
 
@@ -438,6 +436,16 @@ static const struct gpio_led_platform_data ep93xx_led_data __initconst = {
 	.leds		= ep93xx_led_pins,
 };
 
+static struct gpiod_lookup_table ep93xx_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* Use local offsets on gpiochip/port "E" */
+		GPIO_LOOKUP_IDX("E", 0, NULL, 0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("E", 1,	NULL, 1, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 /*************************************************************************
  * EP93xx pwm peripheral handling
  *************************************************************************/
@@ -990,6 +998,7 @@ struct device __init *ep93xx_init_devices(void)
 	platform_device_register(&ep93xx_ohci_device);
 	platform_device_register(&ep93xx_wdt_device);
 
+	gpiod_add_lookup_table(&ep93xx_leds_gpio_table);
 	gpio_led_register_device(-1, &ep93xx_led_data);
 
 	return parent;
-- 
2.34.1


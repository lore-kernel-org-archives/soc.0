Return-Path: <SRS0=W2KE=FS=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FEAC4361B
	for <soc@archiver.kernel.org>; Mon, 14 Dec 2020 22:34:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C398D22509; Mon, 14 Dec 2020 22:34:24 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD5D224F9
	for <soc@kernel.org>; Mon, 14 Dec 2020 22:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD5D224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f68.google.com with SMTP id w13so34331452lfd.5
        for <soc@kernel.org>; Mon, 14 Dec 2020 14:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjPRCaFVWCdnn8mYG/NgP5hckqyQZLYagjkTOv6AH+8=;
        b=V0OF3VO9JvUWUPkBwWm6izGfSiPnbJcZY7ehsOFCZhl7Ak7yD7X67p9jDf18BlB+AK
         RZ8u48LJeIX2FyYadZaFOQn4E2bOzyX0a2t0dWaEYVbJjBJQxfZJUKAJfUwlJpNV80l0
         vP1e9iqTBF3uuY1jG1avhzvlAuLgXQrjMImxP22ophQ2viALF5efqvcZ7dKO4BGsx09n
         ZK/3FMv+koCSIiTt7Ox6P7XqILaCbIBB2I+s6i6nK9pUdJWf2JaG1XG6GrAE3+qbQ8cN
         qSchtFxj16+6orZFgc+tVgVJte6IPPFoElHs87ypO32xBJ6SR8aZv9taVIJLoWtl7hVb
         7X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjPRCaFVWCdnn8mYG/NgP5hckqyQZLYagjkTOv6AH+8=;
        b=LZ6+pE3jrTfBux1/vdc8UUXhJbd8x/ouzjLk+6puMj5MmSNCScIfn2mnqcMEsuS6BU
         1fVSu2yi2nBQ/J0RjBQjMk5ZCUiuFqvoUpiUfehOscvQgBUjQDtwRJYochXVfqxY5P79
         ufG9IfFd7tCLrAxCSQHlFIpyORwIcBTjXeOgabR2u851ePjcYR9IkxQI+kiYfffW2be2
         TWEOB2SFsVUA9doikjBU8NmDWMwdPbAIvrNpqJyYWfjV/D4ri9fAvJjP5+PmeJxrCuJr
         3n6zasIkJMp1IHqQG7PH+v/e4ZLGAr/yyIAMZDhgIAbgQxiaBlmNu5NGPwNZN28Sm68Y
         X1sA==
X-Gm-Message-State: AOAM532pfqK8D7onTg+NxuhVGxa4b3oyn22kRrJ0d8brz5EhNbn8eu6C
	mnvfyGEwnZZrq+Zkj5IJxduyVQ==
X-Google-Smtp-Source: ABdhPJxLgf69N3lYnZ/m5cqOfohxF2Nq7HVjQMQUi10x9lJxyiyhfNtiuJ+VDuE2EsH6D8OUXf4IYA==
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr11024356ljk.85.1607985260460;
        Mon, 14 Dec 2020 14:34:20 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id w9sm543421lfl.168.2020.12.14.14.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:34:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] ARM: dts: ux500/golden: Set display max brightness
Date: Mon, 14 Dec 2020 23:34:13 +0100
Message-Id: <20201214223413.253893-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A too high brightness by default (default is max) makes the
screen go blank. Set this to 15 as in the Vendor tree.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: this is a plain regression fix, please apply
it directly for fixes.
---
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index 939360c05713..73b09a49c55a 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -326,6 +326,7 @@ dsi@a0351000 {
 				panel@0 {
 					compatible = "samsung,s6e63m0";
 					reg = <0>;
+					max-brightness = <15>;
 					vdd3-supply = <&panel_reg_3v0>;
 					vci-supply = <&panel_reg_1v8>;
 					reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
-- 
2.29.2


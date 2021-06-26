Return-Path: <SRS0=JzHo=LU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05331C2B9F4
	for <soc@archiver.kernel.org>; Sat, 26 Jun 2021 00:03:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D22DE6196E; Sat, 26 Jun 2021 00:03:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D7261969
	for <soc@kernel.org>; Sat, 26 Jun 2021 00:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D7261969
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f169.google.com with SMTP id q4so6442521ljp.13
        for <soc@kernel.org>; Fri, 25 Jun 2021 17:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8VCDOCsJp5v3WN/LczjJScbfeU3b8TszUN1GnD1HtY=;
        b=Px74mKweRheGBA71uxntsZCq97iWLryT3coXwH3dglUKvsTRWz3LeRTSXf6W6JrMNb
         sMB4xTtk2P9bB6pbLej3SU8mZQKzitaWSJT5VVH/0zVeqNai9Q6S6TvhaDDUOfdSBFOD
         DW9JecD9dnRh1fjHxm1ze0lZEmifQ2ZmmoweHYqE+VQaoc1LNG8UORcL5+FdQBr9NKTa
         4xaOHYGuIP6u2x98yRtDuEInEMA94I83++gwHaG/IfOcyzWGQYs8WGwuU6BINI8jSjj4
         YvUWiA7R/yA5Dd6H+gpE/t+ebK0M0NdT0Sv4OAXoPGMT1VKC586hTAhSGUzP4YVfDCbg
         JPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C8VCDOCsJp5v3WN/LczjJScbfeU3b8TszUN1GnD1HtY=;
        b=pvtWV2LGT0toAUbRa8JGehI4VCUckc3yjyyMpLXfW4cjooQekYcNIaKIvbUq7lm28k
         VnPunol5godyewZSJajGGAQbsolyVm52eJd8PHRmGtVkd2uP8uOGRmbo2fslYTGZrc2Y
         T9kn2FfdWgAvxCz5ZZb5KOfB/rrrPYD3o8hA57NABDdqEP81xzbmnq/YGHW8cr7VWThA
         Eyycju6/A8NX/02Zh9iecQvWiLjQZHJsFmrHsHGnhiGHBP9aX/w9eleAT69BnLjdVoWf
         yrddayonxHL2gUFrk3QBH0WdC05ktkTkn1QUc9GCdbDxGCkjL3Z94WbcCizLq7dom3yL
         74Bg==
X-Gm-Message-State: AOAM531Eoy9zqrGTIyvGCA+OKyBbZHWyGhYkXVT1RDbI1lcCSc6I2Kus
	pGgEQ2/1D5BTXWl6YydrzUr2Sg==
X-Google-Smtp-Source: ABdhPJxwaX78Q1dhz57xYl1fh9eay+XLIGFG2USM9MniTT4k98meA/cmjrAxyjseWpVvSNYRiztlsA==
X-Received: by 2002:a05:651c:1ab:: with SMTP id c11mr9942848ljn.396.1624665787114;
        Fri, 25 Jun 2021 17:03:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w17sm634325lft.285.2021.06.25.17.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 17:03:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: nomadik: Fix up interrupt controller node names
Date: Sat, 26 Jun 2021 02:01:03 +0200
Message-Id: <20210626000103.830184-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sudeep Holla <sudeep.holla@arm.com>

Once the new schema interrupt-controller/arm,vic.yaml is added, we get
the below warnings:

	arch/arm/boot/dts/ste-nomadik-nhk15.dt.yaml:
	intc@10140000: $nodename:0: 'intc@10140000' does not match
	'^interrupt-controller(@[0-9a-f,]+)*$'

Fix the node names for the interrupt controller to conform
to the standard node name interrupt-controller@..

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20210617210825.3064367-2-sudeep.holla@arm.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, please apply this directly for DTS fixes, I have
no other Nomadik DTS changes queued right now.
---
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index c9b906432341..1815361fe73c 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -755,14 +755,14 @@ clcd@10120000 {
 			status = "disabled";
 		};
 
-		vica: intc@10140000 {
+		vica: interrupt-controller@10140000 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			reg = <0x10140000 0x20>;
 		};
 
-		vicb: intc@10140020 {
+		vicb: interrupt-controller@10140020 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.31.1


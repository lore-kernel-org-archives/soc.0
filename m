Return-Path: <SRS0=JzHo=LU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF01C2B9F4
	for <soc@archiver.kernel.org>; Sat, 26 Jun 2021 00:00:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B93726195D; Sat, 26 Jun 2021 00:00:46 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A2361962
	for <soc@kernel.org>; Sat, 26 Jun 2021 00:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A2361962
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f49.google.com with SMTP id j2so19087584lfg.9
        for <soc@kernel.org>; Fri, 25 Jun 2021 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuUO8AcQNdpRRUCohveWKo6jfr4batAeHXA30dP9DUc=;
        b=lzKidZeYIiMgIl+o8Iqxmr+9DBhhuSz6Jk3eVjgha2ZNtSnfyWiuI8BpTN3hZXgksT
         1vd3pl8oaLfaPpVY5eSQk7Awl4LFDBBO1mvyMzVNXpySuSqrl+29AAWO/AHNtQY4YLBY
         ZbG1WAtQC+Pnlrwh2JuYiLZf4UXCg33NAmwn4KVlLiSmE7STZEtpUTxFAliowP5Z1DlI
         SuQ4UO//56gqYMLwN+bnVwuTa4X20To1k/Q1bd01ioNzD84xwLKNhasKGW/+WxFPKX96
         fXXrRmoAizUWOABD0gOtwvbnbm+ssykccjUNSfF5wk+UZMABKJ0WMDOU+F2Fl/Kl5Aju
         2gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuUO8AcQNdpRRUCohveWKo6jfr4batAeHXA30dP9DUc=;
        b=qMs59TWuau7u6CTQ62xmciTzPwkGOl4rOF83tJNGswCwV8yMK2JpaDCmbVxKRSbnHV
         Uka7vwa+SW+MOgP/qVj3IsRy/rkRHQ7kWgHETis4euml6H6XA/in4zOYtmWJvMF2ag4p
         KjJAb+CscVUJBLTkdEFYKPreNaKzkbSKMRZ0Imbvc3wmZMv7GXfYAyAwYvN9oj2IFIhH
         fixki+xxXhExiuWdBwnlzGgMLLnkESmlWqqYuXdVXOw0BqkFCnJZ2zWYcs9fzFzZpvpi
         IbDDxcUWfXzLIN5Yea2qvXZA5UDV0+XOoLtrSW6BlhDkjmSLaMQNZzAtx8kqlXieTk5i
         H53g==
X-Gm-Message-State: AOAM533929LVIO+D8X/21b9M5fmwu3PW/sUwT48wk9zIcz8rQU7E/aRS
	unO5Y4pbOmx1jug4WfflKYNW1g==
X-Google-Smtp-Source: ABdhPJzxAbMGN2YgSmyxsJMo9kizX1YkXzNG311jNhAjyF7Og0FDWgNCxh3qjf9ZKGnYTKDQSiCjmA==
X-Received: by 2002:a19:c152:: with SMTP id r79mr9921951lff.388.1624665645021;
        Fri, 25 Jun 2021 17:00:45 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h25sm514428lfe.284.2021.06.25.17.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 17:00:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: versatile: Fix up interrupt controller node names
Date: Sat, 26 Jun 2021 01:58:34 +0200
Message-Id: <20210625235834.830035-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sudeep Holla <sudeep.holla@arm.com>

Once the new schema interrupt-controller/arm,vic.yaml is added, we get
the below warnings:

        arch/arm/boot/dts/versatile-ab.dt.yaml:
        intc@10140000: $nodename:0: 'intc@10140000' does not match
        '^interrupt-controller(@[0-9a-f,]+)*$'

	arch/arm/boot/dts/versatile-ab.dt.yaml:
	intc@10140000: 'clear-mask' does not match any of the regexes

Fix the node names for the interrupt controller to conform
to the standard node name interrupt-controller@.. Also drop invalid
clear-mask property.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20210617210825.3064367-1-sudeep.holla@arm.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, please apply this directly to DTS fixes, I have
no other Versatile DTS changes coming right now.
---
 arch/arm/boot/dts/versatile-ab.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 37bd41ff8dff..151c0220047d 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -195,16 +195,15 @@ amba {
 		#size-cells = <1>;
 		ranges;
 
-		vic: intc@10140000 {
+		vic: interrupt-controller@10140000 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			reg = <0x10140000 0x1000>;
-			clear-mask = <0xffffffff>;
 			valid-mask = <0xffffffff>;
 		};
 
-		sic: intc@10003000 {
+		sic: interrupt-controller@10003000 {
 			compatible = "arm,versatile-sic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.31.1


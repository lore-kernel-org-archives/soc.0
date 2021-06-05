Return-Path: <SRS0=h4/m=K7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE56C47082
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 16:12:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 979DB61107; Sat,  5 Jun 2021 16:12:13 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68082613F7
	for <soc@kernel.org>; Sat,  5 Jun 2021 16:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68082613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f44.google.com with SMTP id v8so18706432lft.8
        for <soc@kernel.org>; Sat, 05 Jun 2021 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESqwAY5hDTv/bxt7Kviu0j+zOztUXmB9vjmY3/+7G3Q=;
        b=WS9fTNdgGH7MgmLZUeyMtpBf/VtEA7StgyEHxY6k4tUbxAIxnWKgvvOSN6zmVQr9sk
         qvPjnWBEPV8uAuP0Lh5iQCiZU3BTrD5n0JBRYTLhTSjeeypw4qvBxGKWD85S/D2wOXoq
         UAqFFpnw+jfG5UBLd9VwSC0jVBzodUVjVAgEMKLSQ4rCl2HxmLzeGWX7JeWDzV3nhOxC
         yeGRYNkj9dkYnD5r9hOtuS/giWG70NhPi8cruCdMV5ZlOTMbd6M5ebAh9VtgKnYSLzZj
         OwHcUOyGlT087F8f76aFqY2OgKixEqpMMzxdKeLlfTzEJL1jEkcyOVVX6BOQvkE6yRqG
         N6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESqwAY5hDTv/bxt7Kviu0j+zOztUXmB9vjmY3/+7G3Q=;
        b=aYnnC1hWHAS22P1g+rYr4XE2sHjZ4rgYSYy8DIZBIpjI2FlOg6MtBCbjwqrUcLlFQe
         diY2AMumvg1lmq0qF1EnIEO6TCdqu47iftL7DqSaqZOSz+7gaIWoOJZBJlur1QWDwjkY
         n4AQPiv+2LvG+VU2sVCPtEnZHhyhb0jIwyTzmfCoupJ1HwSkRFZvrk0nkecy0c+NuVcn
         As+DkgLaDuaOAFXEEfcyBUwsLKbxSdxJSwKkp7zxeKo/Az+6OQCRgf3eoog61iwptXrT
         LwZrzfrzWzC+kCW49Zqcd2d/qsfYFsB2zc5Fg3TE0Z6C4+XTefdKNxlMm2DPOfmpYqaZ
         WR8Q==
X-Gm-Message-State: AOAM532Kvrxev5OCu2UiIJqt19eo3QGnCB/JfONgYv0ToFxeTpuxMKQ2
	gG86tpNKdJxb/aeOGoB942T543md+rZ8JA==
X-Google-Smtp-Source: ABdhPJzY9Tyrxp1quMruefiU5l7OCSQVtmo0a7U/PHE1biT6c0AA4aodJ4Uxuy4tvf8x1JxVuSca8A==
X-Received: by 2002:a05:6512:987:: with SMTP id w7mr6213289lft.41.1622909531766;
        Sat, 05 Jun 2021 09:12:11 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id v9sm1099317ljv.131.2021.06.05.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 09:12:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: dts: ixp4xx: Add crypto engine
Date: Sat,  5 Jun 2021 18:10:07 +0200
Message-Id: <20210605161007.3397216-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the crypto engine as a child of the NPE.

Cc: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please queue this patch on top of the
other ixp4xx changes sent by pull request.
---
 arch/arm/boot/dts/intel-ixp4xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel-ixp4xx.dtsi
index 528d5dc09cfc..a50427ad05e7 100644
--- a/arch/arm/boot/dts/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel-ixp4xx.dtsi
@@ -113,6 +113,14 @@ timer@c8005000 {
 		npe: npe@c8006000 {
 			compatible = "intel,ixp4xx-network-processing-engine";
 			reg = <0xc8006000 0x1000>, <0xc8007000 0x1000>, <0xc8008000 0x1000>;
+
+			/* NPE-C contains a crypto accelerator */
+			crypto {
+				compatible = "intel,ixp4xx-crypto";
+				intel,npe-handle = <&npe 2>;
+				queue-rx = <&qmgr 30>;
+				queue-txready = <&qmgr 29>;
+			};
 		};
 
 		/* This is known as EthB */
-- 
2.31.1


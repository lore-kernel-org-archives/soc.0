Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB99CD98D5
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D352BC433C8; Tue, 10 Oct 2023 22:49:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D3D2C433C9
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D3D2C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4064867903cso63413735e9.2
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978192; x=1697582992; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=ZiDxNNkuJx1QTvxJ3CllMwaZkg40xdoYMt6SqSz7LsJd6cNUdQSn0e/f3gsg8L/Uhs
         bJ4xek7g/nu3tHFryIpRb64EDnd6W6RFh2rydJ1Jy7XB0QILtdT8erC6nfPqgE6tzLFe
         uO8Pw8vHJtwKFl9/jY0ygo5sWhuh5G0x1KGkx5xamziaVOWEp4R1DYHgIdWqBhomOOVg
         BL1Hfvs0C1iJjamGbUCSpfOCSbugp+OI8pUalkT1l7VJ/u7KMAV0iEUOP5DNfrOd4Upk
         4SiElLmzjZ9BYx8+SL4YPCqEUCATI7vAIVyKGbSyGqSdkqyc6ldlN9OHWlMEP0PwK2rQ
         4tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978192; x=1697582992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=j1x4eXLcyHUMme8imcWLPk+UYYBgkqVIHtL7hc1G3t9L40kFH70LVTbf/QW7HGpvrt
         IaME6RtB9GtKvjs8PSybapu87VhcGRfH1ZJPG9fISOSMHLkY6PO3S9RPPtqvb699WvJS
         +vks065Rc0IX5tPSQnkxuptw+gogIdlcYRGj5i74wOIZEsJ4SIbBIdA+yJipwdhGg0+t
         s/Jl5xWec7WAYY82V4xD6N0pWu8W/rsHwOxmnt9Oc+q8QOU9UNtUssmVeB++dQOwfSyv
         4y9rVcOupFPn7WnQJ/CVL7fJt1jD/fELwHlay/QQPp5j/EyGoBTVjs5b3rMWTIGzpjin
         19gA==
X-Gm-Message-State: AOJu0Ywz1+TuK6EAgWpLSxdshqNe4yxRDBu+7HQW0DfOFTeFR/JFDtL9
	wTDGDfxeNXQ1pj5EnQX/avZ3Cw==
X-Google-Smtp-Source: AGHT+IFq7RnQsFfD4fu2RfO3iXmtJntMfPE1V308P1kDHa+sR25ENbIusBbQyBhO9DhcGLgTsGUgpw==
X-Received: by 2002:a5d:69d0:0:b0:31f:fa61:961d with SMTP id s16-20020a5d69d0000000b0031ffa61961dmr18822018wrw.63.1696978191901;
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date: Tue, 10 Oct 2023 23:49:12 +0100
Message-ID: <20231010224928.2296997-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..67c8767f0499 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,8 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs201
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +44,13 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gsx01).
 
 required:
   - compatible
@@ -69,6 +71,8 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -79,6 +83,8 @@ allOf:
             enum:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       properties:
         clocks:
-- 
2.42.0.609.gbb76f46606-goog


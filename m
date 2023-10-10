Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D40CD98D3
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C20D4C433C7; Tue, 10 Oct 2023 22:49:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 597DBC433CB
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 597DBC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5521335f8f.0
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978190; x=1697582990; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/2N9VEhdnqQrQEGyRgCM8Oc2C7+rGrmYFce8KXEeog=;
        b=kqvOLgR3SuuoHLAwLyWAbjpUF7EPmbRUAQAX07pQiaOAjZh5e0wwbPPmIxFLjHAmkv
         vNQrKbiL+JPXb0OAqbKwEeH2BYdkN0rqCjg1bz1iXm6GjrHwD/86hNXizr/GWHxptZA8
         Mv1v+NCjokEcyR6HXK63DYL/0mCFCEJkZsrGKjYkTXfMfofpHbHpHmTX+tFYOdtzflcs
         2LjqtT/J2QSTFQ6Lv4WUGDDlw6JSuheRC09CUkcmFCFqcqWuWvdR2IyhG0U+9YL63/Wk
         CCQRzodRZD74gzrQDcM7TeKGlfR7kB5P0hGnrIt6ExbnvYqoxtUL8FVj+E/ZxsHNfz+b
         Ur9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978190; x=1697582990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/2N9VEhdnqQrQEGyRgCM8Oc2C7+rGrmYFce8KXEeog=;
        b=iocEcNWUqg3wuzJUkfeIM1tU8mz82i5TkTVsJhjbYrDjPoGd37lLmeRoJirblyHfRU
         bqYcrBAqbblV59dqT1vj6QC+q8V9+XkE6aJuW+1T7ElD5/zz/O9DsfIfGgnEd7tepTNI
         3qmhzIDBfVzbcrOEXr75LT2C9Rw8Qifjj/t3q/9kLDSvzOkB/7g6Mq4rNC78hGctDDTA
         DSWKC2dmBjx62EThKK4Cg58Kcg0imQxH9uiY5E/2Et3Vnim5qAxAE1+7/aCM/FaLfUoz
         eaJQMRVZrZBOpErtPniErLyz2VS/jOLEyEYLjb+N1asLu8Bvn8lgbZZ8JP4NS9ZLKgUT
         nv/Q==
X-Gm-Message-State: AOJu0Yw/hrBxNAC0BXMAScnhi9c320VDuAzUAaPRI9WZ6oOHtTxDFu38
	ZV8y94MP7i3k941goDkYArbnBQ==
X-Google-Smtp-Source: AGHT+IH1+og7p5DzPPNzbqtLXyKGZvyfOjkS230zHmB92OxNHH9j/4yprSuLLOFfyAZIXF/2zZl1mw==
X-Received: by 2002:adf:e383:0:b0:323:39d2:5803 with SMTP id e3-20020adfe383000000b0032339d25803mr16775641wrm.3.1696978190529;
        Tue, 10 Oct 2023 15:49:50 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:50 -0700 (PDT)
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
Subject: [PATCH v2 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Tue, 10 Oct 2023 23:49:11 +0100
Message-ID: <20231010224928.2296997-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..dbd12a97faad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,12 @@ properties:
               - samsung,exynos5433-fsys-sysreg
           - const: samsung,exynos5433-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-sysreg
-- 
2.42.0.609.gbb76f46606-goog


Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B72AC5AE5B
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C4D6C43215; Mon, 20 Nov 2023 21:21:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54EF3C433C8
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54EF3C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso16881915e9.0
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515271; x=1701120071; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEC9m1sVf+gIOTorVlWOWetqCtBoH8t51Urz8Bp1ZAU=;
        b=QeuzVu6LRkuaS5rXcG2xXk5C/T9FfA+dkt/RI5eD+HzhKlyo7EYrXw/a7os9VJPtOw
         FbJVkOpreM+p95XBw3nYuHTK9Zxchy17u7gVex9+79AGj0UzRYH4hHZRhYBStwCnJZAa
         15gRp3YasztJ9i52xC0U9gHi3YvI3pM1vpks0xKuC0jnLd1UOiLYlI5Gg8Bj5waSscVi
         0bLzsUWE0q5V6lHOM/S5O1ShzYVpzqiyoPCBRUcJ/eF1Bk8PiiVj6lrbW6D5gDTHP8Sv
         SxomEvNQu9Xpox3GtKKe+1I5tlQlH1J0s08wPHPR/0E+HksS52lEhxEm6MMoiAucqd1J
         1ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515271; x=1701120071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEC9m1sVf+gIOTorVlWOWetqCtBoH8t51Urz8Bp1ZAU=;
        b=KJIPgBF3E4zBQV2RpG8jKMv7Cleo4UHErg+z+a4KEeyVx4qcYP4kc08oLy5HZaU7nj
         JD4P+0SWzIjqS+DlQrRn5PfNd2WZtMUnKH1KTfGgWzCW33Gs40yDF8F70WO6CLEGLA0S
         N9xpoAAgSnct+O6mQpusJ1y+aLtafs15SdewNgD8oKMgl1RVMg5cvAAqs5+9HtfMvbhJ
         YQilipPwktl0mWj/8Qbvy7prgYm2LLdgsEMbWJJ0uDi7/UN6mh5Up7eD51yAe7itv8V0
         HirbzrzzPyLdfN30A7QZIWe3DYYwNaBZp6bGDzS5bJu0JxGXBW6e6eQqBLNXpZhxLott
         VBOg==
X-Gm-Message-State: AOJu0YxnhAb/0i5RQAGaEZVV4uXoJ/81s4mmyxnsqQqffGcgRnnoQyjd
	nWF+ZdfDZm402lWTBIG9BEcmWw==
X-Google-Smtp-Source: AGHT+IFnkvKJwJBysGZpS8nFvlKDKPHNMjEYxQ4sEoz66mjYdkd3vAWAH3NdAz3AUc2EElNngqiZZw==
X-Received: by 2002:a05:600c:a4c:b0:40a:4609:9c90 with SMTP id c12-20020a05600c0a4c00b0040a46099c90mr7665820wmq.29.1700515271448;
        Mon, 20 Nov 2023 13:21:11 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:10 -0800 (PST)
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
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
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
Subject: [PATCH v4 04/19] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Mon, 20 Nov 2023 21:20:22 +0000
Message-ID: <20231120212037.911774-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" compatible to the dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..57468c2c5ece 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,7 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +43,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850
+      or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gs101).
 
 required:
   - compatible
@@ -64,6 +66,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
@@ -77,6 +80,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
     then:
-- 
2.43.0.rc1.413.gea7ed67945-goog


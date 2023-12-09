Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA0CC10DC3
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCC5FC433CC; Sat,  9 Dec 2023 23:31:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6847C433BB
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6847C433BB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so10791685e9.3
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164680; x=1702769480; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNKNc9ba2oW+5GVALaJt9jJ8CT91VxfoYNg+x7EUoR4=;
        b=Lh1upMCEh0efQCJbiu/eUEsr1wvvScase34iHWUSEYfDTNim+F7CCqjkgqPEIQCzD+
         3qoxqu8fphzc68qYtX/49aPRuVNnrtxlhr37WBVgEd6F30sgo4Ys8hReSGRVkgp9oCXK
         kbS8aGYToIqDLqAKVmUijhsKquUk9VJzyM6RdtsfsIcv8BKUnf3i3xEMbxhmzQfv6lGG
         w0HAnCUP2QZRRvnxj8hdh7L7FE7hLVYplrZkhAWWF6u97imJu/XXpPL8vz/t3w7qlRy3
         mVyd84mOd78jNhN12M4ETZ2RfOANl7Xpu8Tv0JTH9h1XoAG8yNT/jla6WiR7UhJOCnRv
         uxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164680; x=1702769480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNKNc9ba2oW+5GVALaJt9jJ8CT91VxfoYNg+x7EUoR4=;
        b=k+GL5E5Sz1KFoC/tP5hi4GATuXMSNWnWf69LfpKFrNtY4HFMh/yKtwAcJPS6fKRyCI
         hbJmvDFuCx6xUbOCFfFGPKrGrYQYCL0dPucKPoVkq1zV459RYSwWpvTYbk4J5UHtoM3u
         sQI/k2T7Gl4KZ1lkdU3BrGSEaRtf9oMDkv/zrH5u5ZG/99LO05LNsXvcv4YDw3/Gyi5Q
         UGdhseuL8CjI7Al6ZVdChBWsBRqB8K1kjgiivUSxnxL8BVZJ1/ilYYGI6KKYjbez/p7/
         4rD33VOAWLmInKSWbgBU+2ZCJGUhiDisYeRiyAuvqhreBLqmcN+RZt2td28UoIWlFyLy
         rMZw==
X-Gm-Message-State: AOJu0YycyE8fItQhNLkQuXRr2mdWRAXaKc1FeVpGP5W8ZH4w3IRQc520
	+YMOS5rAc4JdcLox0HrWJofuoQ==
X-Google-Smtp-Source: AGHT+IHxsGCDs1nqyGnKq+XEy7/JjY+5fCac/dj81p+I/NjwJHH6T+elv8cUb+jRy4JwuXiqskzBbw==
X-Received: by 2002:a05:600c:3411:b0:40b:4aed:ef31 with SMTP id y17-20020a05600c341100b0040b4aedef31mr1133307wmp.21.1702164679695;
        Sat, 09 Dec 2023 15:31:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:19 -0800 (PST)
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
Subject: [PATCH v6 04/20] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Sat,  9 Dec 2023 23:30:50 +0000
Message-ID: <20231209233106.147416-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" compatible to the dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
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
2.43.0.472.g3155946c3a-goog


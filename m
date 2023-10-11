Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817DDCDB485
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48631C433CD; Wed, 11 Oct 2023 18:49:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00B78C433B7
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00B78C433B7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-405497850dbso2357815e9.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050157; x=1697654957; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=g/uKwJyBC4xwtQTG4aIVE025G5bKKUQmDdLTSKtUbjHcR6J79TdczAaC4YZVMyCt/o
         8rNtZxgeqLDb5mUch6ZTggjAH9I4Srn/4H1T3/FerQaecpBfiPqKNFttX7bxqLLKD0uh
         PKV0J/rTffXK9DDHWwPWJ92QF9E3LgIk5hSj+RyV0WYsjc2qoAd7UltepEBD3IJBLvVN
         wnuZKTa0c+oN7hXo4wFauGoPS6b8F5F1SlBySlkzZfFiUG5OyCpJ4z4Ju+6aGXkcgSJa
         nZ3AAaIQKko06IUTEGpQBAWo3EiJGwq+DFoRpbhV4Tbx8q2L/Mo++cGFV3OKJ5F18SPV
         i5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050157; x=1697654957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=OUIQn2XfZLVh8PrGrfXg3CqdQiDEPlO7vvqFbO5KeYbZIqbyGH25PKyMH6SC6m/T/9
         wm4mV5QOBUGTDdWtpkMXvlUT9dVgs8/8sR2zatJG10KTuVi/7eBzflvpkP1WJahtSASf
         uYD30I3SNcm06h8Zl8Uln2j2Y0R7L+8T4Rz+imXyqaF9FQA4sUayO48STijQJG4cUmJK
         Xs4n25LSPF0t5UmvPPVjJ8LPGCffrfyrN/eD7GhZ8UX9/OwCrKF5u/FOpLK8oHUViyI6
         6s8waRSJX92vqft1pYkAvoklT6zP4iv5jye0gfsYdmmCbk/HHnPUdGr0rXpGzUPD/hPS
         WCXQ==
X-Gm-Message-State: AOJu0YyzO1tSTiz4kNu5t+n4x4XrdA17/wZeVOsL6uR5jHRyFXkHpr5C
	r+8cJLKQERVevdLmAXqquGltFA==
X-Google-Smtp-Source: AGHT+IFxlm4cPaWsTc52dhhsUdZJ7p0CWvQbKiYLmqnWDAlsMz9mO82xwtskyxNES5kIDLvUoOD0dg==
X-Received: by 2002:a05:6000:a12:b0:321:9c00:b886 with SMTP id co18-20020a0560000a1200b003219c00b886mr9286954wrb.68.1697050157235;
        Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:16 -0700 (PDT)
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
Subject: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date: Wed, 11 Oct 2023 19:48:07 +0100
Message-ID: <20231011184823.443959-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
2.42.0.655.g421f12c284-goog


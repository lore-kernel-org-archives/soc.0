Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69164C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D562C4167D; Fri,  1 Dec 2023 16:11:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44DFDC433C9
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44DFDC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b552deba0so23863515e9.1
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447054; x=1702051854; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1JAeCEVjgZk68Eq5bjRq8ACaz1sVDAww5ddLYt8WKU=;
        b=Sa5/TgDpD1dU7Yy6mcxD/ERqiMScmHnESAB/pJAo2gRKmL8Y1vJ1OuAin+WAY1tGwl
         fz2vj9VeDZU/MW7aJx4X7wloGLFlqqDPC+y4WwE4/DsdP3f/9Rtru6O2CIJPUj3eXv/k
         UgWXPi/OuzJCA918JPRQGnycOGalIHvQnXIhIZW5bjROcCKnLs7Fzu2mjl4kBxVM24A9
         hGnRysAQeNEAZHBL64lxrUAaw9BOM9tDSaeV1gCISdjhEfMCgLuj24zhQXOTzagX9kLx
         +1iklVpvHVnJIy1jM8mpGZkQ9l/ThJg434Qr+oPr4J3tHpJ4mdDVobjpM3VjYCXTm8a1
         qP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447054; x=1702051854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1JAeCEVjgZk68Eq5bjRq8ACaz1sVDAww5ddLYt8WKU=;
        b=gK6tGT0a4jGArfQzEhM8Qzc4vaT6KUFvmQIQHp+nj9SfOhA0t7NXx8dqLsHE5joc0u
         51ZUHT1XEzdDN6bhh1eGbYnkwPWnzyCqFNKEdEs7IiQbwohH+exKeM7dAnLbrMXVNsED
         i5EgwMbJK5TsJG+6qTwUhN/eaEf/DW3K1kTpgMMgl4h2hqYv8dlNzdkxpNeGYCvQIbRk
         LoFtX3QvdGqdv3WE5E8aLztdQ5fUDK/c7nu3rIK1OtyX+xgsDGgDowDvBRoCQEeWsTVZ
         AL0ttBi+s00YGErF0XsYohD9+8sd07r7edrfyPfPMotytgdQopoIgZjrKEmjZpHtO/3x
         x++w==
X-Gm-Message-State: AOJu0YwqKH0xtdg2ztMXl8KEyyW2KveFu4fCnGfIcUj1YgO+bxVHWhoQ
	Wm90h2dRfTytOixLWhUrq5oWzQ==
X-Google-Smtp-Source: AGHT+IE8dpPw2LTEdv4ELb+pk2xz+NejS+HBQ266o6P26fs1kcibxlGWDrw1GPkG3bTgo+OSe/jmSQ==
X-Received: by 2002:a05:600c:3d99:b0:40b:5e21:dd4e with SMTP id bi25-20020a05600c3d9900b0040b5e21dd4emr458905wmb.124.1701447054551;
        Fri, 01 Dec 2023 08:10:54 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:54 -0800 (PST)
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
Subject: [PATCH v5 04/20] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Fri,  1 Dec 2023 16:09:09 +0000
Message-ID: <20231201160925.3136868-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
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
2.43.0.rc2.451.g8631bc7472-goog


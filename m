Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D0C77B77
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C2E1C433A0; Sun, 16 Apr 2023 13:36:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 435ADC433A4;
	Sun, 16 Apr 2023 13:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 435ADC433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id c9so18616923ejz.1;
        Sun, 16 Apr 2023 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652159; x=1684244159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deq7iuiEl1RFyBysVZfY7LGeNc11tLOLC+fdaC0CAMg=;
        b=qEtVp1Z9nM6S8XbiJoCplRphuYpTjtmHGzrpd3ybx9pO5OzPHfLtuiS13LO3vQ9s/Q
         qoGy9AGmRbHe2T+uJpbJ/XB0fxB1oGjkmtRpD4i96E5Rbo336OvHKjIXQzJEQrOFz7je
         CzTcaRxn5wNjZq1KcN3EJh7GyzU/hPTpuhu0T0zgHUQALHuTKhyq3BKeAHRhL4qrfd6J
         P0LYKAp3jaS7077nis0aCe2ogPsmY5wIW8o7nQ/a/1RoNjjwH5zBKw6wmXDxlGBBJghY
         pKHDr2rKHpXlHKuaBu7qSr0eECmm8EXndI3L+x9b/M+GTy1Dwmo83Q4jHFsQ8k7SbdfD
         Dodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652159; x=1684244159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Deq7iuiEl1RFyBysVZfY7LGeNc11tLOLC+fdaC0CAMg=;
        b=TU7nHpJaHz1/OFYrj7GXgV+dvyj/WXVi7hA29CuZkKwaLCUONAJyqV9FbPJlEgPbE9
         GIGwWxpUGOZmz2j6vmM24d8fw3tfDyQ7dl1fj4Rh1jS//zAOcFd4ZePEDlgLMbCrWI4I
         G7zb5zOSdDAMvWl+2S3PDzzSDuVRfWKLJJ18VjLjMIPHSQlf1l3Rxo9t0b/SCHmDnjND
         ROt9vV/mFGmouwneokCIL5AWE2+OXRXid/nyLrrR3HpIK6mAky1ixp1MielSsNPmHHF+
         QUMwbHvibR2PWqBrFE+CX5LXRqVf/azFI+1rTOdX1boBLZ2OEW196gtPZ82T2JwCwwix
         HIuA==
X-Gm-Message-State: AAQBX9dZ0SiSwr7/4Or3hgEUzyaBOC2r8IWWAXlmWEJ1l0ufB8h+1JH1
	FUd9DZ9PqUvFO7naQaC7/0g=
X-Google-Smtp-Source: AKy350YadAm7tYLBr5BAsWXMhacr0mRYLnOX0Qe6f1ZBtmunodwY56V4KNqFq5dzyif3Jjvu2yo61Q==
X-Received: by 2002:a17:906:d1c3:b0:94f:26bd:e005 with SMTP id bs3-20020a170906d1c300b0094f26bde005mr3562160ejb.9.1681652158836;
        Sun, 16 Apr 2023 06:35:58 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:58 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 11/12] dt-bindings: arm: samsung: Add Samsung Galaxy Tab3 family boards
Date: Sun, 16 Apr 2023 15:34:21 +0200
Message-Id: <20230416133422.1949-12-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible strings for the Samsung Galaxy Tab 3 8.0 series
of tablets.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/arm/samsung/samsung-boards.yaml           | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index deb2cf971871..4ee026e7f7ad 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -104,6 +104,16 @@ properties:
           - const: samsung,exynos4412
           - const: samsung,exynos4
 
+      - description: Samsung Tab3 family boards
+        items:
+          - enum:
+              - samsung,t310                    # Samsung Galaxy Tab 3 8.0 WiFi (SM-T310)
+              - samsung,t311                    # Samsung Galaxy Tab 3 8.0 3G (SM-T311)
+              - samsung,t315                    # Samsung Galaxy Tab 3 8.0 LTE (SM-T315)
+          - const: samsung,tab3
+          - const: samsung,exynos4212
+          - const: samsung,exynos4
+
       - description: Exynos5250 based boards
         items:
           - enum:
-- 
2.40.0


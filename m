Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F4E92719
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2455C433CC; Thu,  5 Oct 2023 15:57:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AFA8C433B6
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AFA8C433B6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so1156286f8f.2
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521445; x=1697126245; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=Ydx1hF+eLgbJRYHGuyPvgumIKialxmDFdczJcogdoiReyMVMM9AuF1VN7dCJrVSplI
         HPfLoUNVWP4HrTvJpORntDZTte3ku+rttb6RWWhbrPM0HwV85kKedPkV4R2lRK+fpt0+
         P1X0N0MMHWkRxPq3tKsJ7F01mBUYoobUKzvxEhbQwdPNJgSQs5yuRyS7EIhrnOMp26Cc
         UT+yMsHA5KLXpOUiX1H4ZsVZxbi31SFb6ZfC7ZcgkJ1HX8/WaCEA/YLmw1QlqRHG6FE0
         1aluWpSPnlGfOMbLLcrdh1pTJqSMZmDoG0erhT6Ww3t7gCpogjMFe7p7oxNpRYDTPobY
         CHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521445; x=1697126245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=UjoDIYtXb4ig6NCDneZNQvVMkkninrfLSeuY0fYVLioyb9jcCO66qm+TuG7+KT0eJW
         x6L6jXo+UrTBBbn4Ktfn6AdfMHvC4NrayCELRYMPDvSWDrB356szhy22byx8OHLj42P1
         bj3heaOoYXBB0No3gRyqirJNNN+5z8uwUfrRKuqu6yNth4hMEd8CNTs6ORiuC8aEKZIr
         bBKHAPTifAPqiBE76RsfofLMzajzErXRyzTGxpdAh4hWJ4BSfFGfUl0us9Ct2ysiJsda
         KA/FwHsy5gP68hlVjYhp3YBPq4x7Gdqh1V9k85RoAhZMoLXmUOF6KaV2SPZEPZEZ0xD8
         A49w==
X-Gm-Message-State: AOJu0YzMZNp0t4LkTGr6pIGCcIqf8w/0aUpn68TS8/rq11dZNBe5sBFS
	uJE5EpcaKJS11YU3pFq3tjxJLQ==
X-Google-Smtp-Source: AGHT+IGiE4LAahvWXJtk7tI8KG5YKIIkGsBVrQ6crOBhLdNhWbs7O377srtrTm+hbZwXS/xfBg4ukg==
X-Received: by 2002:a5d:5912:0:b0:31f:f11b:8b68 with SMTP id v18-20020a5d5912000000b0031ff11b8b68mr4581645wrd.71.1696521445200;
        Thu, 05 Oct 2023 08:57:25 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:24 -0700 (PDT)
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
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Thu,  5 Oct 2023 16:56:01 +0100
Message-ID: <20231005155618.700312-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..02f580d6489b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -50,6 +50,13 @@ properties:
               - samsung,exynosautov9-peric1-sysreg
           - const: samsung,exynosautov9-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: google,gs101-sysreg
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog


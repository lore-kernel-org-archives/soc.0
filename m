Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEF4C77B73
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D69BC4339E; Sun, 16 Apr 2023 13:35:39 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADD2DC4339B;
	Sun, 16 Apr 2023 13:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADD2DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id fw30so4674450ejc.5;
        Sun, 16 Apr 2023 06:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652137; x=1684244137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcsub8KhIgRh8+LjsAALX2kQhfzLuSTeBZW6A1vW2A0=;
        b=iwMbVHa2MlgG+jx7mloofP6Nhzg6eDc/daviEdAbzrJm8snqyK4r5K/LnDuGCaHplN
         ux+3e6SEg7bmLl68gyyylkkkc6rLq2fFEmXiRkrdalZUEHrdlB31AYnZsceJw8Fl7mNZ
         mCvXrGL20X921acbXCWbvcPEhzWQyG2zfcJPJpnT41ZIFpDoyNYtmGi++8qjAAGiPzSs
         X0TUE/6/+8998N2H5pjWRVr2lLuo7pMNW/ES/2BThl+wol5rBLzECPqcWewNU8ImVjVK
         a9JzopBdhbPXQgoJOBKvvA2PcVrJjf319Ie4UI/yrHgFnE8rEBclRJkEYHBKNrk9kF4n
         iEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652137; x=1684244137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcsub8KhIgRh8+LjsAALX2kQhfzLuSTeBZW6A1vW2A0=;
        b=athbsGCRD2JwMJqt1K6fByERxc/6+U3niGlKg8kB+ZizttJMVrOceFqcTK+hvrjnSH
         nykMG4w1kMsB55FzbOcm3REBBrhk8fxRnUwUSGLZGU+IVdwoRMAD3tuY2C0bFRhXLWQD
         5pVnAqIWqH7J8qRN4E91HuxuACNd3j1FrR+FyLv3bVbjPZqPM9AngmMLzdqpFU/FZgbh
         8fukJBengjgruV0PraDq5TbfPuCHGq76sYPq9gTZPNs4ehaLdPFKj58ycDZ8sLeCZmfj
         E6x3jlAiPiVQ4r94eNFuE3TU3vqkDtBwSfRoPbwphzck5Yju+VHcV5RTq+2WAZWYDRCz
         zxHg==
X-Gm-Message-State: AAQBX9fsrkq3GB30tRoOGOJElr8sRrH6dIKRVkNLiqDyGF5JIfLkq3E8
	jceiRUIylt/Qh2uNYwQCLMg=
X-Google-Smtp-Source: AKy350bGaVuX5pzurnhlXfdKfoZIS5zhuQjlj1IZXMX185GoOm0fxbH3sL4jtNmKj8vjEVK4oORE4Q==
X-Received: by 2002:a17:906:254:b0:93b:5f2:36c with SMTP id 20-20020a170906025400b0093b05f2036cmr4220124ejl.61.1681652136807;
        Sun, 16 Apr 2023 06:35:36 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:36 -0700 (PDT)
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
Subject: [PATCH v2 02/12] dt-bindings: clock: add Exynos4212 clock compatible
Date: Sun, 16 Apr 2023 15:34:12 +0200
Message-Id: <20230416133422.1949-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../devicetree/bindings/clock/samsung,exynos-clock.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index 0589a63e273a..a36781a455b6 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos3250-cmu-dmc
           - samsung,exynos3250-cmu-isp
           - samsung,exynos4210-clock
+          - samsung,exynos4212-clock
           - samsung,exynos4412-clock
           - samsung,exynos5250-clock
       - items:
-- 
2.40.0


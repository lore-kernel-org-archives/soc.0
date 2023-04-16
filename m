Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11741C77B77
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4920C4339E; Sun, 16 Apr 2023 13:35:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFBC1C4339B;
	Sun, 16 Apr 2023 13:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFBC1C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id dx24so13439960ejb.11;
        Sun, 16 Apr 2023 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652134; x=1684244134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UY+jtzkZVxp695kD2INeOepNCktKBgUK3witE0IcM4=;
        b=iaTooN0HV3wy+r8wq4Tu/QDcwsEjpCqQ8moi/+BO4r9tom4CDZcYLjR3oWufi4pXYN
         DUnYtHtrBufhSYykf/7uASG1jLIRcIi3pBOgIPvkPQCBjmZsGJ/YUYlo4nDw/5rtH9zJ
         665gVk1zHEQlfSU2JIvzLHo32isQYdX9yg49Bfq0nSxHE9PS5Qn3oDcBa0H8Z2b19Ra7
         aQTK413zxQxnMRKoXShJvxc2Q6l8qNMBDEyZPTzcn47LVOWJ0qYWr3ACHhxTDVhFU1Y7
         3e6NsXzjs3aLxJvGCMBE7LzoPa8e2eh71tloy/03nMr0f17wKg5yH0wyP1l5TEXQdy+h
         JyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652134; x=1684244134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UY+jtzkZVxp695kD2INeOepNCktKBgUK3witE0IcM4=;
        b=aom4LRjunKIMQcmmZtxi/PzgkhJYe2APYx4bP45t5KwYNPAmd5+yQUuxoOVopWWLew
         yvxiixJYWyf3kIEzxi7uSkqfYtUviInA6V0rXGy/EVUk/vUiiZ7qQLVC9LZuHF26Z6xm
         lcTmpLeQVo3Ovj7XUmD38fa9fIKKx+STg3Oqth9feqwuTtrS5QP9zLGqeNK7ta18RQwN
         sS1Uu5hmV1Y3RlL+0yRIgmlXS/p73ozcrQ0Kxl/ttiW33V7a5EoEq7YTIFjWrVY3MXk0
         N/BBaywSihAHEipTJVwbNYlAvXEmmg9Wuplm6QP6cOy+jIwkfL3xR69dR7oPh8C4g7EO
         m9yw==
X-Gm-Message-State: AAQBX9dNSvXcQY8d5LX2ulJc+fk6eX8PgFHbJCPGipePgb7+ytsVrpmm
	kMf++WBrNf/+IwiM+1H5mX8=
X-Google-Smtp-Source: AKy350ZO/bAqHPULEAVisdWwkRtRXKRD5ZhIpPWHtjHQe58iG5EhjU3xPTw+FcVrRY82zYRSX+U8RA==
X-Received: by 2002:a17:906:58d:b0:94e:da66:c5b2 with SMTP id 13-20020a170906058d00b0094eda66c5b2mr3861559ejn.73.1681652134152;
        Sun, 16 Apr 2023 06:35:34 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:33 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: soc: samsung: add Exynos4212 PMU compatible
Date: Sun, 16 Apr 2023 15:34:11 +0200
Message-Id: <20230416133422.1949-2-aweber.kernel@gmail.com>
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
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f7c141dd11ec..be3128f2c0df 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -17,6 +17,7 @@ select:
         enum:
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
+          - samsung,exynos4212-pmu
           - samsung,exynos4412-pmu
           - samsung,exynos5250-pmu
           - samsung,exynos5260-pmu
@@ -36,6 +37,7 @@ properties:
           - enum:
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
+              - samsung,exynos4212-pmu
               - samsung,exynos4412-pmu
               - samsung,exynos5250-pmu
               - samsung,exynos5260-pmu
@@ -122,6 +124,7 @@ allOf:
             enum:
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
+              - samsung,exynos4212-pmu
               - samsung,exynos4412-pmu
               - samsung,exynos5250-pmu
               - samsung,exynos5410-pmu
-- 
2.40.0


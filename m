Return-Path: <SRS0=312b=AW=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA5CC77B73
	for <soc@archiver.kernel.org>; Mon,  1 May 2023 19:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CF8FC4339C; Mon,  1 May 2023 19:55:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72C3BC433EF;
	Mon,  1 May 2023 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72C3BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso3360018a12.3;
        Mon, 01 May 2023 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682970932; x=1685562932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG5Sr+UvBJkF4hZeZmJOgj40jy7b88Q0+yZEwWLbmAQ=;
        b=MnfkLblocHM2pnbYno0bochDrSf7U8mdgl6+UEZqa25Az1IZ+gLrgZP5WgHCZRuKF9
         7xLz18zVJd/K7wrCBlV32h6cfZPOFqvcpBdbi1U8hJE7PXY4RKiIKo1qLjqDBSn5Lz/h
         hlYQz8y3Ee3GSecIo9nMWXcf8EnKkljqF+NRTOSI+aM8cKCblZRuagjGLJKRLrczL9ZO
         ci3Oq1r1NFmtnztD7+J53zsSP8ve9BE1TmUMpq1hogIaF+qeU6eoMLv4YZXPiQRjTPbH
         1CwQTatLo3sUVL76icF9L0Omo8zm6xrZNabw1HnIW7IiDPmLW/YNuKHoNxvvtT37VcPD
         +xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970932; x=1685562932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oG5Sr+UvBJkF4hZeZmJOgj40jy7b88Q0+yZEwWLbmAQ=;
        b=ahDmkGbDoEcct4wtb8cF80hUQMISjD5JMQquHYNCwtZehv9s9jtGM6VU/WoiKCGd9A
         yj7ZIq9ilkkwdYdsF4SV2Vx/xuLNllMKH8ZI3UaisGUZmEpWjWkiL939aqxF00ShNtc6
         lK4SwaD2U+WBNvkdJ9spYtyBRBmZe6LEQQWd3hRxk9KofoEnT/u3q+fCtfMjmyDqm3le
         yjor9vP8bKmBJOlIQTb+XMEpmDooGTtsyYDyqjrKhK2qnR7JlWi+17pC4gNrY+ve2hz1
         3VIn45c2zmOiFdMsOpkfd0+qAqZ2vte1NMUxBmmoiFTlFnLy3NrSJ8/BVhRlB2lD1QeR
         nENQ==
X-Gm-Message-State: AC+VfDwF9tcta9hN/ToZ4qIhQy6/hHvDz/pA5iUgZXfpwcYU2OagGswM
	uuE6hXBCkz0S2bPN36BAB58=
X-Google-Smtp-Source: ACHHUZ6tUMl/jI3cnu8jGQfco5YOb/fN6HlvvKCVpDZoo0ebUZMqmLdiZI6JNGRKPJqWQmqchr3dSQ==
X-Received: by 2002:a17:907:3e08:b0:94f:29f0:edc0 with SMTP id hp8-20020a1709073e0800b0094f29f0edc0mr13127980ejc.44.1682970932547;
        Mon, 01 May 2023 12:55:32 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl. [83.8.115.30])
        by smtp.gmail.com with ESMTPSA id og36-20020a1709071de400b009600ce4fb53sm6333650ejc.37.2023.05.01.12.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:55:32 -0700 (PDT)
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
Subject: [PATCH v3 01/13] dt-bindings: soc: samsung: add Exynos4212 PMU compatible
Date: Mon,  1 May 2023 21:55:13 +0200
Message-Id: <20230501195525.6268-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501195525.6268-1-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the Exynos4212 SoC was originally dropped as there were
no boards using it. We will be adding a device that uses it, so add
back the relevant compatible.

This reverts part of commit c40610198f35 ("soc: samsung: Remove
Exynos4212 related dead code").

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changed in v3:
 - Added Exynos4212 compatible next to all Exynos4412 compatible
   appearances
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5d8d9497f18e..e1d716df5dfa 100644
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
@@ -50,6 +52,7 @@ properties:
           - enum:
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
+              - samsung,exynos4212-pmu
               - samsung,exynos4412-pmu
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
@@ -125,6 +128,7 @@ allOf:
             enum:
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
+              - samsung,exynos4212-pmu
               - samsung,exynos4412-pmu
               - samsung,exynos5250-pmu
               - samsung,exynos5410-pmu
@@ -143,6 +147,7 @@ allOf:
             enum:
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
+              - samsung,exynos4212-pmu
               - samsung,exynos4412-pmu
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
-- 
2.40.1


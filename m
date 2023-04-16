Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1B9C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42FAAC433D2; Sun, 16 Apr 2023 10:18:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EFFEC433EF;
	Sun, 16 Apr 2023 10:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EFFEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94ef8b88a5bso99072466b.2;
        Sun, 16 Apr 2023 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640288; x=1684232288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ictKT9aVXsy71NADauVKmbOAOmI+urQXpaOOBezHLGg=;
        b=NmVfd+lGkyzIR89aTXtzukxRcrjPYn7C0h2vuCLNzXGN+ESHg7XCpJ05A0r2JFDj8A
         ThSYnlSVdf/13t1J3961GHMbdlNv2jDuNPkJlyZjkQpoQAuDMQ019JKdzlhnNjhHsa2D
         fF8kmlHnLHneEsPKwni4PtIvZmmYjfJRYmQwNrKSQIjA2/H6QePZhY8yOK+Kuv/zbwhl
         PDA5PAAp+DXDXzgSneFDhQ5M5W+a1mPgofcdxOg5GbpESo+IvLoGqF1/f52FVuO5i8Jw
         4en1XGcuCPvnrP/0arn8WBfOQUQUGvUuA0ulv3xi+hslfOFu4dl0OrFKqk22Cn1W9ftc
         3QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640288; x=1684232288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ictKT9aVXsy71NADauVKmbOAOmI+urQXpaOOBezHLGg=;
        b=O3uEajmUZ44/97YbJ1PKNfr71w8PXMXxYBHsLHtls9iPqKDn1V8/vedvl9QP31ZPe9
         scE0TjEpdsAXE7j0jxwUO/ijH3ChgeDCYT0Fs8jMw8dnK799tabTAnh+myKp652J0Fxm
         LNBOJva+k1IwsbahHdq3V1gtQ8MqNDvmoZbLdjobJZec0ItA+tm/qNAlJIqSuyAZA5wS
         6ScoKUqCoqtHPfp/rD0+LEzh277mlZS7jmqsNY9LBybZ5vXlkRLwdWw3mjf/fr0mGWBr
         WcuBw/vxBfJKOHPuLUTVlZbZZl4a5Q9FDeZVPH/+tsQymxSYEcBt8XPSIQ/lw3NQ7207
         Dn+w==
X-Gm-Message-State: AAQBX9dImSPen1ds5bPS/nG2tPpscMgvn9WmsYURYHU73cfHyoLuXlA7
	DbNM6DMzMBpQ+MP0mKXQ260=
X-Google-Smtp-Source: AKy350b4tPKvu3DKWB3ezxr4rb5TH+DVkFeKgGXShis+Z10SPj3vkg0ePywiJThMbrjGTZeKUqdoTw==
X-Received: by 2002:aa7:cb19:0:b0:502:6e48:65ea with SMTP id s25-20020aa7cb19000000b005026e4865eamr8951620edt.12.1681640288447;
        Sun, 16 Apr 2023 03:18:08 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:07 -0700 (PDT)
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
Subject: [PATCH 01/12] dt-bindings: soc: samsung: add Exynos4212 PMU compatible
Date: Sun, 16 Apr 2023 12:16:13 +0200
Message-Id: <20230416101624.15866-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-introduced as part of the Exynos4212 re-introduction effort.

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


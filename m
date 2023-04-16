Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E1DC77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B81F4C433A0; Sun, 16 Apr 2023 10:18:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6D08C433D2;
	Sun, 16 Apr 2023 10:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6D08C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5068e99960fso1095806a12.1;
        Sun, 16 Apr 2023 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640291; x=1684232291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2Jvxyw959FBVgqwdIHjHqfLuFNRZ5ppQl2qELcKy9w=;
        b=a8/reai+fkCe0l97u3b5U2wOLRijCZpCFVTYo9W7WwvGifVyD2Svg5XOangqDnMw9v
         UiQvk2DzAV2i+ZCWAFQf/6bgUeFkblmNvoTTxbnSkRfeiNwAyelGLE3L7Hus0jMxVeXM
         5Xe/OpzoGwoC5Ih4ac9xayLYGRbO/Wft4yl576G4A6GdZlWl6UQKPspsHDch9VcoQOwv
         oEN6Dki2IBGnGA/7V1JeTbXIKTMN4FvNKfu6IyOLQ7F9R/vKjSABVb+9/mjqBpZ8LtmY
         EFV3hnyMz5SAO4Dhu/sQauy3yzQAFpgDXXcGm1+raTjNnE6nlXvp3FAkLShA3ESTSZqK
         8EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640291; x=1684232291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Jvxyw959FBVgqwdIHjHqfLuFNRZ5ppQl2qELcKy9w=;
        b=lhu51Zz+h41m+n/blIOBUbAvCl+VZLFzRGbIVzsh/C5s0wiaJFdl8AkbkEgKtOJvFY
         FNYG/1C16hZncaSVY83C0VG5s40yCGdQdN/B2UoiH/uOZug6z5Tj7heB1zV8f7Yi+2xn
         1FQUkCcDhfoW4osC/kteXezCp3maR1PenIALssDL63xCe1umvIbSDVGdDqo0lI9R3k6U
         YMUt2R+7QWKwJTi22JZzjWO8jVbkxuk2jNhLimPKaYOM1Zv1XRYBX7pv7WarChxEsTs0
         P92ZB3OyKeK1jLZaxK+R0NanBVJLi+Tmx5iW5d8P2sO5QQ9O9ecjCGVWkuPjj50FBBa7
         kuFQ==
X-Gm-Message-State: AAQBX9cQX3UmdeYh8RMfeMttRF95HSI6p1ZsILYDwLtM6+9dhuezDfo7
	bHgJotGaBlxn/uxvQzoutVM=
X-Google-Smtp-Source: AKy350aSVJC1e8d38M+/4GkG/aB/xdn2FE4imNsQNhQV8/4WJrKgBKEMZUfyCo5fWAX95bzv7TNC2Q==
X-Received: by 2002:aa7:cf87:0:b0:506:77e5:d157 with SMTP id z7-20020aa7cf87000000b0050677e5d157mr9264259edx.19.1681640290762;
        Sun, 16 Apr 2023 03:18:10 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:10 -0700 (PDT)
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
Subject: [PATCH 02/12] dt-bindings: clock: add Exynos4212 clock compatible
Date: Sun, 16 Apr 2023 12:16:14 +0200
Message-Id: <20230416101624.15866-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-introduced as part of the Exynos4212 re-introduction effort.

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


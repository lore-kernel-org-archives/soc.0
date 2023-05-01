Return-Path: <SRS0=312b=AW=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A107CC7EE21
	for <soc@archiver.kernel.org>; Mon,  1 May 2023 19:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85E43C433D2; Mon,  1 May 2023 19:55:37 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A57FFC4339B;
	Mon,  1 May 2023 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A57FFC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-959a3e2dc72so591005066b.2;
        Mon, 01 May 2023 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682970935; x=1685562935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioENJwwSwT8zGQMUXkQ8Tqi2ax0jSorolSTsZSyeeas=;
        b=K6eLCuzGsavXNmaXAh7srZI2woPo8xtK6L2wfwkbtp/Imj5Jj/+aB/6HBz1M9AkTO5
         TkKkJFUipDeWNfNhpiIbWXRobPXpksgkC1zaaE1mb3GeMtRRx6uWfz991ioq9MrzalxD
         1vWbe8+uUFp+LwcxQ2+hfg2Ub1LOs0AZ2IJh77xI8giNy2daVxEaJOftr0j6wInKM0Y8
         kyW6KtbU/F67Y5ukPSPemwBjQ6Mx6niLahdF+xg1nHFnlLfQUmjuJrInWzeKOtVVAQ4I
         lW5sHNlfOTxqPpOCwj3CYxBieq3mg7onrNaqVk+cCQa+XeKHQfcrZpluhX68gxtmAEa+
         E3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970935; x=1685562935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioENJwwSwT8zGQMUXkQ8Tqi2ax0jSorolSTsZSyeeas=;
        b=ggAbPgKxGARplKsoPEG/1XkKJKuYlXldCi8VbKQTVR6QBINlAAGvzpzrfIaKCPug1/
         RIyBzdnRudB+/z5auzbh4qzTpj0GFwkvvxn9T6d/Qhx3mDsIRAUHSqYkwNESxB9BlLi7
         KGsXxWdwmv0kxWhz+26/knS1w4MJp3JA6gDHCT9TAUfyRR/4rL6CcFa8qwKfi8IUcYD0
         tdk6Oguxh4g2n/uvCrUQvHvbBxXJpp3HJ+M4+8QQgJUIcH/ZIEPVemZeGBxc+l8bezRC
         m7kJ/HH826z36zHviVPKTpmIdk0c649CNczrr06TyIj6PJSIcLRmbnz+XI0wCZjuXmar
         jqDA==
X-Gm-Message-State: AC+VfDyHQvm35KqbZVievQYkpCXNLkq+P9gfvMHg/13UZUufagN/PaRr
	vb7s02OC1Gu1/WXnJg3Wh6Q=
X-Google-Smtp-Source: ACHHUZ6IVZDwDQOTnnbij4uvxNxCT1PMcB7uRFLQJHqaKRBGgkrS4fKg3jfhVmMzJmY8cz8Ps3IH6g==
X-Received: by 2002:a17:906:7308:b0:94a:8c3f:d0f0 with SMTP id di8-20020a170906730800b0094a8c3fd0f0mr14002808ejc.68.1682970934695;
        Mon, 01 May 2023 12:55:34 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl. [83.8.115.30])
        by smtp.gmail.com with ESMTPSA id og36-20020a1709071de400b009600ce4fb53sm6333650ejc.37.2023.05.01.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:55:34 -0700 (PDT)
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
Subject: [PATCH v3 02/13] dt-bindings: clock: add Exynos4212 clock compatible
Date: Mon,  1 May 2023 21:55:14 +0200
Message-Id: <20230501195525.6268-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501195525.6268-1-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the Exynos4212 SoC was originally dropped as there were
no boards using it. We will be adding a device that uses it, so add
back the relevant compatible.

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
2.40.1


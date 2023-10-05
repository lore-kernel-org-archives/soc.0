Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C04E92716
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25042C433C8; Thu,  5 Oct 2023 15:57:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB498C433CA
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB498C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32483535e51so1174837f8f.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521457; x=1697126257; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQQEqZ6dgoMIiE150E7fSsiHYzKXaQCMbIzJ/S4ZYh0=;
        b=oNPjQrFk+RGqSwseCJ4qb8sG7RMeffb3Vrqf1iCWy8qIM3F+lu7i87t13zIWkXZs7N
         /GGFohs5499knBRxXre8OrcWXgfN2QDBZWjUOxnYpzXy4+EQDtwN7pg7BvL1liWZG85U
         kGJL+AX4uiMBiWJrbcPwWCJ/aYeZw32EH5aGznOUXlcdfCDFK4YKr88uraSbVPkrcpzd
         JHFMTlePAtLb3cBwzaTFqVRjh+2n9C29vPrV4BzwA8nW9YJqyklGF8ypzDxVl3WgNSpu
         ZbQFmqsR+v/V2EITwRqjEyf1hz1it/aNUzCBFqH7IglRp9iQD07qFMMvXh91rf+BuBCH
         xHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521457; x=1697126257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQQEqZ6dgoMIiE150E7fSsiHYzKXaQCMbIzJ/S4ZYh0=;
        b=SXKuN1veI3DzWyWG+EyyLRQMwJMjN4xcZyl9HdBVxXk21nANeG/Aj2MlaTrGa6dxdJ
         aHdb1vY1hKMcaP8xn5fPN/FX29qORJC9DpWfo3y3K1vp+/eSFKE1oGuv+pQMpBXVZYaW
         h933MBbcCNc5d4kncnrdRtZpmNEHpu1+sQceyorXmzYftUBoqc74C3Zbnzwv7Oo7NkCH
         hGM/MelRdJQMH8bHuP4jQDvDDK9Lp0owsi/devwxQEJ1q6qtOF0rQif/zeHJPAd0Ox23
         JoL0GADwlL7gg6Jmal/UlF7ijXk/VR7KG2XQoMxvJic92ECeWiA7EZiYKp1bmEOvI4av
         AsgQ==
X-Gm-Message-State: AOJu0Yxc7t5ZNehtftm0IpOS6KUjP41h9G9SOCbA0qkaDTH+Edbt67mV
	3mMhdhHHQtASXwSL7J2iYuHTHQ==
X-Google-Smtp-Source: AGHT+IF/lcHc9XUltM5UGXmSAYqRcd/8VSrf26P8R3iLwmpTL9VeuYYzrZE6bmpvvFoO8WJJ0m9ktQ==
X-Received: by 2002:a5d:6909:0:b0:314:dc0:2fca with SMTP id t9-20020a5d6909000000b003140dc02fcamr5280803wru.29.1696521457202;
        Thu, 05 Oct 2023 08:57:37 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:36 -0700 (PDT)
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
Subject: [PATCH 12/21] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Thu,  5 Oct 2023 16:56:09 +0100
Message-ID: <20231005155618.700312-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thesee plls are found in the Tensor gs101 SoC found in the Pixel 6.

pll0516x: Integrer PLL with high frequency
pll0517x: Integrer PLL with middle frequency
pll0518x: Integrer PLL with low frequency

PLL0516x
FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)

PLL0517x and PLL0518x
FOUT = (MDIV * FIN)/PDIV*2^SDIV)

The PLLs are similar enough to pll_0822x that the same code can handle
both. The main difference is the change in the fout formula for the
high frequency 0516 pll.

Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.

When defining the PLL the "con" parameter should be set to CON3
register, like this

PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
    NULL),

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 9 ++++++++-
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4ef9fea2a425 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco = fvco * 2 * mdiv;
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1417x:
 	case pll_0818x:
 	case pll_0822x:
+	case pll_0516x:
+	case pll_0517x:
+	case pll_0518x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 0725d485c6ee..ffd3d52c0dec 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -38,6 +38,9 @@ enum samsung_pll_type {
 	pll_0822x,
 	pll_0831x,
 	pll_142xx,
+	pll_0516x,
+	pll_0517x,
+	pll_0518x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.42.0.582.g8ccd20d70d-goog


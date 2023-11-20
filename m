Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E7C5B55F
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EC02C4339A; Mon, 20 Nov 2023 21:21:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 721EAC43395
	for <soc@kernel.org>; Mon, 20 Nov 2023 21:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 721EAC43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b27726369so1442195e9.0
        for <soc@kernel.org>; Mon, 20 Nov 2023 13:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515281; x=1701120081; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EraxAgXD01aYcMU+QIfZtvlH26jTo2uuBot/Y3+Bk4=;
        b=U3eW80cQ6tT2Gp60BjPRTsWWXh1tquDrZslCGTfCQMzRQqpgsOaCYRWmVwhXJ+TqZr
         AaxBKvt29JpvQowseN7yKXuHazv1Olru/nyGWBFQdPk5DhGoAi/PrfNjE3n8y+t9n9uN
         Mv0sWkAsCQ0r4ZcOagYMAAQDvqa1nVdwc4qwwPt3AG9MRpjo1B2b0blME+VIhjO+1ILr
         Ac/skcnQfwhROUTb/C92M31nOAg7c3NQ8/5czsIcLTjGZcONZyjxXSjmKsbBUxKuMGZy
         oOWsBdRkIgvehhgn5j680yCpntVFZfe4/l45sLfIKe7hGs0bkOPni2Ztjr8YizwVsDIZ
         bFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515281; x=1701120081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EraxAgXD01aYcMU+QIfZtvlH26jTo2uuBot/Y3+Bk4=;
        b=TOtLvr1GsUKYLNorFEwtfBN9lVQwOg6LYbTcAHMSkLWuFQq3h1LoGCEEhIHF/oA0dd
         6gztnZvSm/Xpxn7FuSwl1UBLY7plAeFSetJo9L58Vm8LezPHQ2rA+54dmM1r6rswyDbW
         F2JFZC7i+NtBiSRz4GzZLPFR521d6PS24qnQMwKHRB2ddlZfzzhXNEnEFkzTjL8LhhO8
         EZreuaYfQ++03o81PTFzsRtVrX7ki2LhJrR8CL2ovahmMakC4SNfE/+ujBDDXm8m4zwn
         yctQ0s4FjguYeRSwR4i65MsUq1qxxOncITwSMYnBTZdWOsjmZ5V9lhTyrEfDaCl1tiXU
         V+lA==
X-Gm-Message-State: AOJu0YzKSyQtuL9Rnhevpe7JqF9A5c7Cz2ueAnmug3fpTcjbYUtxjSgN
	LvICuTu7z6JQHWI7ptrgcSa0cw==
X-Google-Smtp-Source: AGHT+IGy3YEgJ20TKsH6/a3Jw/bIpzgZuCc4CjGCayfoehbgZkUCQnZENANv4F6QaBjh+c2l3feHJg==
X-Received: by 2002:a05:600c:45d0:b0:408:41b4:7fe5 with SMTP id s16-20020a05600c45d000b0040841b47fe5mr7677260wmo.16.1700515281710;
        Mon, 20 Nov 2023 13:21:21 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:21 -0800 (PST)
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
Subject: [PATCH v4 10/19] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Mon, 20 Nov 2023 21:20:28 +0000
Message-ID: <20231120212037.911774-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These plls are found in the Tensor gs101 SoC found in the Pixel 6.

pll0516x: Integer PLL with high frequency
pll0517x: Integer PLL with middle frequency
pll0518x: Integer PLL with low frequency

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

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 6 ++++++
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4bbdf5e91650 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -443,6 +443,9 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
 	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco *= 2;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1319,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
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
2.43.0.rc1.413.gea7ed67945-goog


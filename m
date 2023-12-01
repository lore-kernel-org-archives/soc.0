Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F4C10DC1
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C771C433C9; Fri,  1 Dec 2023 16:11:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2BD7C433B8
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2BD7C433B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33332096330so466393f8f.1
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447065; x=1702051865; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na4sCZBqaYV+EJVudDdf2S+Yg7btkgpmOTYDQ5k6d0U=;
        b=ZhY8ljWy2aObEae8xsfEfRYhmo0KQMKSAS9lNNU8uXaP+Ebzi6CayOvhg7ZBVCahD9
         J4YRI+6bEnIHlTmZIpO54QsMSlRVv2Ai2MuI3Msf3CN4pVlUJA3Py4Jyr6iX/mB+SLR0
         lcmiuzcEvFjJDlC4FL2UaUBUgxHjofGp1R4a4Ttp6gJiY9cAGu5bpCfMNenKJnJ/9/KJ
         9LjKwo9sP9jPPXxwIy7j6MpvhEO2HplvQa8reMXqYVcoHbx/0AmigaArxMPPkR2feG0n
         9R+tx0XFN8KbvvmJOSmHhBbMI/DAXPW2PWj/e0UB0L1jF3u5fH8wXu5ZjM+060jwKQky
         bbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447065; x=1702051865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Na4sCZBqaYV+EJVudDdf2S+Yg7btkgpmOTYDQ5k6d0U=;
        b=kYmlxKVVmndrgymbcXrqH/X3l5PVuWDLdAVVYWGrGTcS2vORsyEp3DJLHKoSQjHr4q
         REH3qqtfnEtJoXaK5bA6anRsA4L1CIxLxujteuE0Di5uS6DrSpXlLbUkLhK+0EE8F+Mu
         eRan/gUJ4OUBw7hyJuTYllYnoQjOHi0uuHDicKQRVkeQFexvUlzfPgcz24UloaVHg4Nv
         2uV7gsibq8suQzFTN6i+Ify1rQhCqvvVr5FVmODlzrEZ6JbblxVV0fUZF1hf6zbfSmAz
         ElQdHyD1LoIuYYhdV6AhiggxSSe/G1HtTHvo2Y8SHDx0NZXlLIMYXcHi1zSyv5EgK21h
         oqaQ==
X-Gm-Message-State: AOJu0YyjMYK8w/O8oNKUM0CwJKs+Zryd0Xj7kgcF+reu13Qid3hSQoRF
	67gyb3M/IVVH/7doBXDpjzl5vw==
X-Google-Smtp-Source: AGHT+IGy8yElejPyYySJIajsgPiQMaC0muWo5E2zC9em+q/Gq3ClRVAOr7CPCFcYQtfWeHbthyy8Iw==
X-Received: by 2002:adf:ce8e:0:b0:333:e01:c265 with SMTP id r14-20020adfce8e000000b003330e01c265mr899191wrn.8.1701447065182;
        Fri, 01 Dec 2023 08:11:05 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:04 -0800 (PST)
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
Subject: [PATCH v5 11/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Fri,  1 Dec 2023 16:09:16 +0000
Message-ID: <20231201160925.3136868-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
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
2.43.0.rc2.451.g8631bc7472-goog


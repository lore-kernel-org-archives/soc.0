Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A48BC10DC3
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F14D9C116B6; Mon, 11 Dec 2023 16:24:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9060C43395
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9060C43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so32916045e9.3
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311870; x=1702916670; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDDirj6oE74DYjeFThqKliMdW5Crzi8BOjdGcSc3/xA=;
        b=JaIKzMCwewsE1US6SrGlGncWXFtCiySsqLNK44IuQwcCJ2xWGTZvFdTneheiHaS4Ij
         Ayrzqc1WBg/w3w+UHuQtMDtm750jMeirOalkdR3OALrewTDmG2d4JsswDg3OGOlBsEJq
         dKj9+vWofo3i523OUxE3twkauoRvrY6iKSimfAtlDOajZX+ycrjkhofFpvt3sR+1Grfi
         zjhvf2HjVwL9pc4nR2oaLaL75JhHe5iNNw3gYzLZYSvkHsRIEznVF6OZEah59x180zID
         pD+TeCfr5hzDpvUS+r/lUTtdBy2toN8OgTX7D9nr/OyWWskr8LeZrKkUT/dRVpPxsTcU
         ARbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311870; x=1702916670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDDirj6oE74DYjeFThqKliMdW5Crzi8BOjdGcSc3/xA=;
        b=PokndbVxkj1UAavJEl6NcJaMPt5b4a5oAe7l4nlhteFF5kVTSw/A9g5NK2XW4tzWAl
         spz4d7x9PdHXgbkqVx2p6idIWt2jyxAuHVwdHAdVMGT4H0F95Qp/msm8rLdICz0cH4Fe
         QoRGv9pu9ly8Qfl3L2gzsKQ0fpin3znwMFya3+rxEzVuT90inby05DeaO/k0P0JlQGt7
         vvc7spUvzqZBVQZLuiDLAZrkogwXact0arDkH4HvF3jzk69lYIFcyq4v3ZLQTtz5XDD6
         ofe0m+mxkATDWx1hA+mmYkzJgiD+iweqohQSFZcgZxe5YVMoyzyqZfMARKAYlAUvdGSd
         +AGg==
X-Gm-Message-State: AOJu0YwhJW5GoIJzh2GQuXy0SCLqmTElKVAgxjWKyP/INEnGGyDaTAtY
	+PBkBGuCU29noJyPLowA83OPDw==
X-Google-Smtp-Source: AGHT+IEAmbAul6ZrpXg2twzLckxDam20V+qQFqTsLJY9Hw6C2Df9rmcAE5tB+Ru7HFpc1ZGE1jzsyw==
X-Received: by 2002:a7b:c4c6:0:b0:40c:2766:5424 with SMTP id g6-20020a7bc4c6000000b0040c27665424mr2453843wmk.171.1702311869976;
        Mon, 11 Dec 2023 08:24:29 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:29 -0800 (PST)
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
Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
Date: Mon, 11 Dec 2023 16:23:26 +0000
Message-ID: <20231211162331.435900-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the remaining QUIRK macros to use the BIT macro.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 7ecb762a371d..b7a03668f743 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -107,11 +107,11 @@
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
  */
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
-#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
-#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
-#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
-#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_WTCLRINT_REG			BIT(0)
+#define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
+#define QUIRK_HAS_PMU_RST_STAT			BIT(2)
+#define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
+#define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
-- 
2.43.0.472.g3155946c3a-goog


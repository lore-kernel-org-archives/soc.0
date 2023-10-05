Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B42AE92717
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 025ACC433C9; Thu,  5 Oct 2023 15:57:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7146C433D9
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7146C433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32336a30d18so1045471f8f.2
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521454; x=1697126254; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsPPxazWNR9GZX2GO53uCm+7icHkcSZjslvI+J0YBFw=;
        b=YzRas6YJ6Sw9tbrqeuRUKUwy4qe3fzZw9rjA6Ho59n57P/pD1yhKaH5dCRo1cCi54h
         T3Ctpfunq8U7en0oVKDdWMBNhzhxoChEQ3PjZkyFwluUrx3j2wfBg41iDsyEqew42/UL
         OHZLWS5cn4QaETDgbvFhMvSnMTemggLG+V/GFuq17mBx2sv9qW7Rl3yXG3yzQxsc2wSW
         xR+TqqnxdxiUAKO81o/tjjtcBiovxpUlo5ZOqSs7A+NRtht0BElryfnoTbfmyhE265gM
         xIfHh6hNgqOOy02F/ahFQOdYY+RFw0umnxm3+2RIj4JOlLZYu0V+3ELdq9D+nBm68rBx
         zAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521454; x=1697126254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsPPxazWNR9GZX2GO53uCm+7icHkcSZjslvI+J0YBFw=;
        b=a+UFPao4OHR3mqIh7V8DC9tXnCIzm60skMal134YTsdr1g/ziXhIZmk8fYHcRyDiK6
         ow2owAo76h/ZbAV6gc/jRsOFUFNLa26Sql1kjFeO/HFdSBvJr6Jt9k+0N7d7a64oD2UL
         RkUfVeLmio64E4pSg+16G2ygAdaHraq0lPy1swYb2XrT0KQi1kt8bCNoZ+rtld35Z3oA
         Kk2KDGC/+uGEnCC7aQcDripmiyE1NFhuYpd0Gqej+t+LmGOI3/Q5M4Sl9CSlSkwUbZ/r
         +niBkm0qmkYQHYPBF1lVfMYMM/NLUW7bpb0mRaARVg4TV5E5P4p7AKEsZZfiZi8demvZ
         7isA==
X-Gm-Message-State: AOJu0YzdiD5TnpKE3FctvEE2SO6/SZxrJD5RncQwY95U0kW5ObcnU68T
	gDL64tW/vpYF2VL4OiUvCIk4Ig==
X-Google-Smtp-Source: AGHT+IHUyJpuQbW68qjMruXib/ii+3Nwgybhtbaupq7BnOuixwUEbyhlm+DL6/M5TMqX57BaO4ziFQ==
X-Received: by 2002:adf:e406:0:b0:31a:e6c2:7705 with SMTP id g6-20020adfe406000000b0031ae6c27705mr4915179wrm.50.1696521454330;
        Thu, 05 Oct 2023 08:57:34 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:33 -0700 (PDT)
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
Subject: [PATCH 10/21] dt-bindings: clock: gs101: Add cmu_apm clock indices
Date: Thu,  5 Oct 2023 16:56:07 +0100
Message-ID: <20231005155618.700312-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMU_APM generates clocks for the Active Power Management
controller. Add clock indices for those muxs, dividers and
gates.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/gs101.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/dt-bindings/clock/gs101.h b/include/dt-bindings/clock/gs101.h
index d1e216a33aeb..d9b8299fcc0b 100644
--- a/include/dt-bindings/clock/gs101.h
+++ b/include/dt-bindings/clock/gs101.h
@@ -201,4 +201,21 @@
 #define CLK_GOUT_BO_BUS			184
 #define CLK_GOUT_CMU_BOOST		185
 
+/* CMU_APM */
+
+#define CLK_MOUT_APM_FUNC					1
+#define CLK_MOUT_APM_FUNCSRC					2
+#define CLK_DOUT_APM_BOOST					3
+#define CLK_DOUT_APM_USI0_UART					4
+#define CLK_DOUT_APM_USI0_USI					5
+#define CLK_DOUT_APM_USI1_UART					6
+#define CLK_GOUT_APM_FUNC					7
+#define CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK	8
+#define CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK	9
+#define CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK		10
+#define CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK		11
+#define CLK_APM_PLL_DIV2_APM					12
+#define CLK_APM_PLL_DIV4_APM					13
+#define CLK_APM_PLL_DIV16_APM					14
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.582.g8ccd20d70d-goog


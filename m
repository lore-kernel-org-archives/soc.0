Return-Path: <SRS0=vNIe=RF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35FBC433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92F1EC36AE8; Mon, 20 Dec 2021 16:50:15 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D191CC36AE2
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D191CC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCFDB3FFDA
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640019011;
	bh=TDDgucefA92kv6IFGiQeWmS2J+I8+jj5NALcft5q+Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=m728LvxY4kSM3qSzgZL6qqRkZIvQ3IshEBTHjNUPMd9PT0hcTDZRLeykcZirxIaJj
	 7PfYfMS12fcQwIfLfr4sUYSspGQt2Nw+PEd5QplvQ70xOWMUxmd0ZPoX9MW5tnrWtA
	 isfonHq+OIgEj+K6KnaP8bXpRMG6A9PYO1yvu3cOKk83dzrxNKPisPKYebgQVpUZoy
	 ETUi+DlyOI6WPyOtN4uGD88PGVPwLrZAGWzzwlnIaf76hRJJRp765G3TlwC4AAyK8P
	 DKYvxxtb6akiVxWYM6DNfjdvVOjOpaPZHwfqA3HjsLy8fplpF9wHJakv5lbIYUMQ5K
	 109x8B479Kltw==
Received: by mail-lf1-f71.google.com with SMTP id 28-20020ac24d5c000000b00425c507cfc0so1949314lfp.20
        for <soc@kernel.org>; Mon, 20 Dec 2021 08:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDDgucefA92kv6IFGiQeWmS2J+I8+jj5NALcft5q+Oo=;
        b=wfNdUtxN38S+IX79h+tOlA998DvkwpssQ43BOcmYcaGH8DZkg08Z8lisB7SqUSo0G/
         MwX83B2L79NNESSzQ811CwQDhLURMXRfomBCJN7zaxtw0DQHx5v2xnBw8M4kyG+n1hJL
         sYhv3jTHPWU9BaGZwsjDzlzQJwUdDeW6b8LtNReSJ4osL6GXQddMPt6tZfV+ljrvcCIo
         ddFzB1NEt+B3S1lBPRud7qanyGTd1BV/NnprjG/y1hwC2Vj7DDza+kGClKXf00ni+MD3
         wmfwmTYkEvDZbSv+5OHKzr/eYX0Tg3+pVe2RwbgIkkp0FRoD8R66xOs6h8Q+ZlUysoek
         l6Cg==
X-Gm-Message-State: AOAM531l75Z/9TtpMK17qRB9jXRPQtGEGE03GaChtHYu/HsgNrnwkeoj
	LsIA/2vZGRUKFxCPk4xc7ww+7YZBzNkDKzEEDrznZ5J0TE65x7c6c+hFJFUrwNvNuL2GpMCC/41
	LKDQ10ugmWkfPD0+Lfe8fA9o=
X-Received: by 2002:a05:651c:218:: with SMTP id y24mr14866224ljn.50.1640019010915;
        Mon, 20 Dec 2021 08:50:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9vYQvb0Tws2YXTHifgYu6vGBrJoepioFXJkoFtu3EFn9V5yXXzJIOPdoiqfAxr0a3h4woAA==
X-Received: by 2002:a05:651c:218:: with SMTP id y24mr14866208ljn.50.1640019010738;
        Mon, 20 Dec 2021 08:50:10 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y8sm237152lfe.108.2021.12.20.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 08:50:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RESEND PATCH 6/6] arm64: exynos: Enable Exynos Multi-Core Timer driver
Date: Mon, 20 Dec 2021 17:50:04 +0100
Message-Id: <20211220165004.17005-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220165004.17005-1-krzysztof.kozlowski@canonical.com>
References: <20211220165004.17005-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Szyprowski <m.szyprowski@samsung.com>

Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
for ARM64 Exynos SoCs.

Even though ARM architected timer is available on all ARM64 SoCs, and
used for managing timer hardware and clock source events, MCT timer
still can be used as a wakeup source, as stated in commitae460fd9164b
("clocksource/drivers/exynos_mct: Prioritise Arm arch timer on arm64").
It's also nice to be able to test available MCT IP-core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Link: https://lore.kernel.org/r/20211101193531.15078-3-semen.protsenko@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1aa8b7073218..91f5e9568122 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -89,6 +89,7 @@ config ARCH_BRCMSTB
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
+	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.32.0


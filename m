Return-Path: <SRS0=rjqO=K2=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D110AC47082
	for <soc@archiver.kernel.org>; Mon, 31 May 2021 07:50:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9ECEF61278; Mon, 31 May 2021 07:50:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CA6611EE
	for <soc@kernel.org>; Mon, 31 May 2021 07:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CA6611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-lf1-f47.google.com with SMTP id r5so15526372lfr.5
        for <soc@kernel.org>; Mon, 31 May 2021 00:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=7JJXnQcbUkF2IsgmL8QixZQFkfim3UiqiyexVMF81w8=;
        b=co0pFxUsYHOCRmbZZm9fdWGId0uNZDrAboEMQrkqKWxd0NZnSNt7fyMHXnDX93nBPr
         OfPXjIlzxOJc0lkWnoD27Ebc324eMrfCkUWLg2UEYyiZAbYYpD78fmBkEADhQgoKpkoA
         60O5vXOXeUEEmHvnr4HR5K5PTyFfq8cdBs9OXMxOdsOKgLCNGepvYjxueiOQKqdawAtK
         7LVR5Xb96DyaF8HWOz4Ki14s6T3lpDfT+uIGZcgb4j0JXHcjk+SqPKWJ3pt/XqhLnzMQ
         qEjZlfkf8S5HUbyg9wFz6EbAfue1JHyfACEeoxP9wCRTlxHnow11OuJHjkY9hOXkTlnT
         0YSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=7JJXnQcbUkF2IsgmL8QixZQFkfim3UiqiyexVMF81w8=;
        b=BLD2paBR0FGpzesDlmHkOnu52efj6GIgrBZ0QtKnCGA/Oia4WlqxljRnBVChU0Et2p
         mjfL1exPY1ovIgv55fBZm4Q9DuRvPt7I8p32LUy6xK663P7jDfWicWPZKKoKM8+IV9zA
         UZurKIOgOSqJlr6U7ZyLXwDXV4Ag9KeRU2+sl5jVC49fRb5aIX4zn6mB0o1QKjHQzOEH
         d1CYOm4+O9RGhn7F2887T4OHXX0RxAzYxhytkWAIP25aD0SBGAIzq/VAUzLW0BHrecmw
         TgOEDOqSxcMZV3Hj3hTn2zK7Xj3+uopYf1MWfJ/JDABKVVcUH7elfjQdGmNxLa9kaoUJ
         cs9A==
X-Gm-Message-State: AOAM532fsE24zqEMP+MCHp2k/9DgG2oBik4Ve6rFiz0hLyHwDG+lgXPY
	jw+XAhvtICkOMP8WqPtDLunFFqksTlAkLh9s
X-Google-Smtp-Source: ABdhPJwQOMcMWs3PD1aoVYMsyg53z0Z3Ssu3X3+YorxL6u6vTzQcMNg1LXcnTRL0VYAzIXAizSFXOw==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr7304345wrp.122.1622446898808;
        Mon, 31 May 2021 00:41:38 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8? ([2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8])
        by smtp.gmail.com with ESMTPSA id g11sm16508698wri.59.2021.05.31.00.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 00:41:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.13-rc
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <73e76706-f3f4-bebf-10dd-d2ec9106a234@baylibre.com>
Date: Mon, 31 May 2021 09:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Message-ID: <20210531074136.MT-smqicDsnk_XsB7-D7TFHlLpsqI0pgO91cbFYvqGY@z>

Hi,

Here's a couple of fixes for v5.13-rc1, one for the amlogic Kconfig and another for the meson-clk-measure soc driver.

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v5.13-rc1

for you to fetch changes up to 4cce442ffe5448ef572adc8b3abe7001b398e709:

  arm64: meson: select COMMON_CLK (2021-05-31 09:27:08 +0200)

----------------------------------------------------------------
Amlogic fixes for v5.13-rc1
- arm64: meson: select COMMON_CLK to select a proper implementation of the clock API
- soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: select COMMON_CLK

Qiheng Lin (1):
      soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()

 arch/arm64/Kconfig.platforms            | 1 +
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)


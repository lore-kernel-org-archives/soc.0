Return-Path: <SRS0=RU8f=K2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECA8C47082
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 May 2021 07:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150C561220
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 May 2021 07:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150C561220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fb2qgShRLPqLTJ2xBU5oHmOv3chj207L2N2fMeK5oU=; b=T0b9nNatU5jn8f
	YOj7QBxJpdAxr3ivX7Gg7A/dhW7s5ArXJwf1iu+D/ZRT+UnfTWu8Cv0ONX9db/1eOHjDsh8lMCei7
	fV3fu+U3aVDxl7h9EHfOSd/v/Mmg3ijhZ2rw5e061RC+T1TNe6hPpcJ7gQKjPv7DrazcTMzO0HvIe
	fL72FFsPeimkjfMnS9ajBFPkOgY6azeNVTFA8wVOKf2LivZjLqo/3ZIObMrTXVQWukgEaL2VrpRV3
	XQBcrxu07k9o7IMLNCNC3TvwXmgBuHzKBSNyJ/eF1x9XOvt/37w8bNLfFm2dt3vtrLIhyx6dJE3K3
	iMNx9FQS0fN9y/49dVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncYe-00BEse-Gl; Mon, 31 May 2021 07:41:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncYO-00BEnE-Km
 for linux-arm-kernel@lists.infradead.org; Mon, 31 May 2021 07:41:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id z8so4756943wrp.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 31 May 2021 00:41:40 -0700 (PDT)
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
 b=Tywnlp+ro+XyGjfN476gyylO3aCdo+2GIzMCDmtT17R/gjFlIa31h05FlqsGhQYEfJ
 Bm3IsiJpL9BSde0En57fkPxN8PpUiDaDqiRnGxsteMP8jvOYlG//xQr9tq9w+44xL2gx
 80EfQQFM8h0TaNgE2lIsQBudG1tINU0c3V2v0RKKSKZ8AV1QVPSqMKnOw5lANVGi01Vx
 Hd6x5phpBd12qcq6Su5JZFAXdaB3UE9f7/HM4HlOsvat/annkF116k/tssMC6oEA7X3A
 gda9dQahUew7/B3Kn6U+Oym5pRiI7Paoe8iMbUYHjCR+M6iVSIMaeJogHfS36tZY0TMw
 f4jg==
X-Gm-Message-State: AOAM532KFCz1xI4eKPqcW9PJs2ddFmxmwAH9/nBmVsRoKm7Nq+7dmZ0t
 rbSxjF2OcmCFDl9ZfYY8vrngdx0cTd3VreUZ
X-Google-Smtp-Source: ABdhPJwQOMcMWs3PD1aoVYMsyg53z0Z3Ssu3X3+YorxL6u6vTzQcMNg1LXcnTRL0VYAzIXAizSFXOw==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr7304345wrp.122.1622446898808; 
 Mon, 31 May 2021 00:41:38 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8?
 ([2a01:e0a:90c:e290:6567:aa5c:6dc2:fff8])
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_004140_709554_787295F1 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210531074136.oY7HHYVqeVCguB9W73FIbxltJCR_WrCK8o67cj3vEgU@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=NWdI=K4=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321A8C47083
	for <soc@archiver.kernel.org>; Wed,  2 Jun 2021 08:41:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEBDF6139A; Wed,  2 Jun 2021 08:41:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B65C16121D
	for <soc@kernel.org>; Wed,  2 Jun 2021 08:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B65C16121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id j14so1420204wrq.5
        for <soc@kernel.org>; Wed, 02 Jun 2021 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=r3vRbfjQCGNJB8B/HupD/7FCKWHIrL1DKpr1YR4K1ME=;
        b=g9O4RX/DJokdg0WffDlpvLr44YG00xVUL6p6t+GvaSqsSojwb67cJwbm+h8ftNuV+N
         J3ZAMOsJBG3x9LKL2zjXEHsqtCfKpi8aET4hY909GdJvZ+7XK/oJ4aMwFpuYGmrPDvOa
         o1y6KquCCZd/HURNtrFA4aackOuKVGv81osAWz8wMM2elUK1HmdaenaEFgL1VE18lw9V
         mav0M9vjmBEh0EpdmmNw7HGBWrgnOTjuBr/C8xa6SMON8RCcf+FoLnj2oZf3PNrK7DDj
         FemmLjkTaNltIOjxTZF4kNwf4UUdKvjzU4E/GlMNfFblwskAG92RmmohlG7a8vKw4CDb
         yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=r3vRbfjQCGNJB8B/HupD/7FCKWHIrL1DKpr1YR4K1ME=;
        b=U3i2n0C3JO9CPdXHHks4c4HHDMVWdTMl/ZI1BixcWlpgeiFwFb3ePihnmqbD3PQB//
         D/0xnpSLTR8D1SXSmk2xFZD88F7dhVkAC0QjvtoTOkAN5S2IxdE1WYYrrY8ASL6fYx3b
         zIz1EsxZZtABjXpdCMwFmo8m3dY58qwRKLBG00pSvPk/Q3Z3Ayt8+d6LngvMby3NMkyQ
         ieuNk9OroJEzouLRAutfbl214yRtsTcfEUf2HgxHZeHHKQPKE1LD9BAIjoy/xci9Po82
         XaR0VzZxWjuXoIhptbXsS1C5iAZyzsJdtUIWuHBRlIeomY4T/pLpv2/Uzjskb3+9Xql6
         MP4Q==
X-Gm-Message-State: AOAM530ZmWv/5dV61OUIwybI7j24Cu8Z1h7jYWndAPEdohJ9BVZBrMsg
	T8WqQuPJtXgPxYY+BycPsn369Q==
X-Google-Smtp-Source: ABdhPJx5MRXNhc5eSwZplehRDh0YJ1vXdtj0oT9GekLomseOUixW3fDg0HrfC7FXpdKeTILjRexV9A==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr4450786wrl.62.1622623308380;
        Wed, 02 Jun 2021 01:41:48 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:5bc3:680:d34c:955b? ([2a01:e0a:90c:e290:5bc3:680:d34c:955b])
        by smtp.gmail.com with ESMTPSA id n12sm6193151wrs.19.2021.06.02.01.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 01:41:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.14
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Organization: Baylibre
Message-ID: <58283600-2d9a-c259-4d80-6915e6e6c79e@baylibre.com>
Date: Wed, 2 Jun 2021 10:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a single cosmetic drivers change for v5.14.

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.14

for you to fetch changes up to e93e6bef7930cc23b878b6768f617c479f1a5c50:

  soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off" (2021-05-28 09:52:06 +0200)

----------------------------------------------------------------
Amlogic Drivers updates for v5.14:
- soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off"

----------------------------------------------------------------
Martin Blumenstingl (1):
      soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off"

 drivers/soc/amlogic/meson-ee-pwrc.c | 46 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

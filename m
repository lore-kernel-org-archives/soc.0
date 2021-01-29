Return-Path: <SRS0=PH9V=HA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F93C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F00A64E09; Fri, 29 Jan 2021 19:33:10 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DB0164E06;
	Fri, 29 Jan 2021 19:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DB0164E06
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-qk1-f179.google.com with SMTP id x81so9886273qkb.0;
        Fri, 29 Jan 2021 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
        b=frlSKUglNEaK6Zpvp86GtgN++a9yOZ+2aO/YgJHiBy5G2bESsrJHWyNI2fyjx3vG8k
         36MAdBp+4c7E3fDNpL0vQtOPHajP3DYI7sJw4kH4iPjWTWkKPGr1HW2IeE/3NUUQPLnr
         mhr8CQvXb/jEl5SVirY4jZrvGzz7ussoXU9QYtuGzAjXsUjRs2258+JRMYJ+7sqdOnp2
         iQR8/b9kimu0cg4uqhZa9/KTqXm/16i96G7ea7be05PasQqDomlBcbcju9uk6ChGgXZu
         ZOE/XO4pzNNdazf3bFB5grzxkAYj3mD6CDwGkirWuwdcwkBcTuqkhvdObrFVw1sUt4oN
         UpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
        b=dS9xueiOlvHp69pLXScPobs6NTjCfmJIneOlTHAiZSwtFVEs6l8l12SPU+pqoUZFMl
         FcwlmNELT2yV8GoIDUwh9vt1eX+DfVb87OMDvaYXSfeakhKzNIWDZKqMawhMx95uzCKC
         tC1ubH174xSb0ytxjrGoxzQvbFvC0yx+bc3qMw9w4JSRoyVCA7ncbeiNxyChWnxQ0En0
         vQtpX4f7GW2grIaH9TXpEPlykVJQLvPy8ssvJMbI6HZRyGu7IQUv6J/Gx2AOWfkuqk9T
         QVEiVAMTD+2xmwckZxHpMSEhQDFZdfLyvw6TnpsaYrJf+0WNIA709oWasDYjC2WG1jEk
         fw8g==
X-Gm-Message-State: AOAM532p0s/PzaFIVs3wItHXrJpTj9oe6hJ8NUozu9DeCFa+Dbm00VRp
	+8tct27CLNHwOkU+lK/38eTXIZtcUiE=
X-Google-Smtp-Source: ABdhPJyNcVv2s6OfH0LXqQSxzBg0bM2teWMMrnalWOh+8lH382eWJR2cTxp36jtmwKB0alXh5vStVg==
X-Received: by 2002:a37:a70c:: with SMTP id q12mr5811740qke.25.1611948788759;
        Fri, 29 Jan 2021 11:33:08 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h25sm6766744qkh.133.2021.01.29.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:07 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Default configuration changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:52 +0100
Message-Id: <20210129193254.3610492-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-defconfig

for you to fetch changes up to 760f9c2b84106fd02de701c964e7989c9802791b:

  ARM: config: Enable Tegra SoC Thermal driver (2021-01-19 16:54:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver on 32-bit platforms such as
Tegra124.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: config: Enable Tegra SoC Thermal driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)

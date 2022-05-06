Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8D7C433FE
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E464FC385A9; Fri,  6 May 2022 14:30:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 519BAC385A8;
	Fri,  6 May 2022 14:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 519BAC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so6934361wms.3;
        Fri, 06 May 2022 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvaElvDoQ8pBWySsVTh3qmfFd4tIUh/A43DFaMB1/G4=;
        b=nyNfXaYl1M70mFIzcY1umhpNNlUZN6U7uMj52RGEaHwPD1VOGliGvzxQPOhSOK7E6j
         cHm1nfSj43H/w9cRvky8Q/5UUisoa4GBW+BbSvKPgCZbJF/2kxWLePLrdK7St4aOBfis
         ueRBWtSrM79jsnS6x8FQw5yM2phOM88LArn4ANR/JHL/1CqqOZbLMH6SzaXTpDts2gI6
         j/mJSwfcyv74+ADWwEUSDaCnA9hGPZRIfnkYy3YnByW0iPDMfvtfyxRujm880mtT6b2w
         lrGKAoFfoxR2H86gyqst1VNgednewnhG4HA4M5/nWximR933egj8k9qo9HsAfJuwb+96
         uEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvaElvDoQ8pBWySsVTh3qmfFd4tIUh/A43DFaMB1/G4=;
        b=mg94mYA7cPidotHQTCMKieqIIRU/uTDyUQwkhtOoYu/3kTrMppCrDINatiX6+pPzHF
         MD1I9u07s72QGpFegAtH5Zs8NK9eF2WWgd2qk2cNpf/vKAGVBR556WZWPN3WnrqlTwf+
         VATDuKgPPsOywVsoGJEDnLvMxhnDmto+nyQVJkU0t4vi0gqpZb3SRw2TTBGi/3X6qRtN
         bHwJumgCk9woma9/7oYu0xz/dAwU9fFR91MpXqTM27vhn/8osOReSBi9rT7ocGLYBPRq
         91XRtKIufE8iNJtrgCTGYQxVwxzPQY0pLdfSIVgLUTKCxg6V7KKb/x77EGanD9h7qmCY
         ZYFw==
X-Gm-Message-State: AOAM532hN2KurVFLE5gS0kp3aFMWX4Ss4ZaDYTkNRUmYJlWtC1ztSkUH
	pP4a/zuf2nQi4vbdXmfPFp1y7M2+A9A=
X-Google-Smtp-Source: ABdhPJwn8YmIyWXWGg4u+lgeafyDX8mby0b9SzbPfCrjclWnSFOZw2+RjI10sXdPPkjuM66pv2zs9g==
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id z3-20020a7bc7c3000000b00389cbf1fadfmr10228752wmk.147.1651847414311;
        Fri, 06 May 2022 07:30:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c1c1600b0038cf0796675sm3918448wms.0.2022.05.06.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Default configuration fixes for v5.18
Date: Fri,  6 May 2022 16:30:03 +0200
Message-Id: <20220506143005.3916655-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm-defconfig

for you to fetch changes up to 39ad93d280506f4953a9d0c545cfffa581889326:

  ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver (2022-04-06 17:03:30 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration fixes for v5.18

This contains two updates to the default configuration needed because of
a Kconfig symbol name change. This fixes a failure that was detected in
the NVIDIA automated test farm.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
      ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

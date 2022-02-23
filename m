Return-Path: <SRS0=YzVA=TG=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72354C433F5
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 16:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F30AC340F1; Wed, 23 Feb 2022 16:22:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BEBAC340E7;
	Wed, 23 Feb 2022 16:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BEBAC340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so4684033wmp.5;
        Wed, 23 Feb 2022 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnE+WudaLLlXe/21f7Ie3oBqq+MidREoBIhzxdwLp6k=;
        b=jbcrSNaRltckX5lyk408zPe1yRFc0yF0ehFTmMMqBvuqfB3964Lfe48UGW2ylNCe6V
         ucBETD/KR89WLwnTDHWf5+Ex/9leQjnANgYltWcbToF3D/2MCU7eWQ5iVhUN4KJWcusS
         4doEZjE3Og123Ov2E2QEDUX/2vBgeQ0c2D3HXpYzyObp7PJbE09iQHPbYmiwKVUHIeWT
         V/IZ8RF4WRjP00j/lKQ01t9tLMs0B05X13PVhxx0GA5kc3b1Fle+5wOi4+bg3eDpQzTw
         qUZP72njMfYPOaug+bTFMqM5d3lxj9thrWf12CLg7Yvvu/oLfm7q94Umv4rVS80cHQcP
         ao+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnE+WudaLLlXe/21f7Ie3oBqq+MidREoBIhzxdwLp6k=;
        b=PlX1CwhaEsshfCFRqLoYaEvYNRSa4bNvM0i2rg5/jR82ZcxNcH17C38dxUmmmfSJxJ
         arKZZ+Met+F1xXFOgrR51C848pJ+IsnO0BpuCRrUMLTgBDEXca3L1FB/vS7hb4Mc0i2F
         qT7DeOWcN5sRIcm25/jIh/JEx4x9MwiIER3niDlYnVAjQmg4kcNFpioGWoYnkrEKdTrm
         fnCuHgWBLQ0c2ZpGczR2RCGUH8HHwwnbBs4QcMHaoqAz9NgMVT5HQV7UTjGZE8UQF9Hb
         S/3lIZg/nBtrdl6fJTQRo69GQXlE1/neRXqWZTHw4kahan1zRm4KvT6tNspqJNIjjx90
         V3Ww==
X-Gm-Message-State: AOAM533u/SSKbeJZ7hGrPVzQy0D52AvK2GNezqTPBpCOlb4HyPrGNW5+
	V8lXUktxuv5EQzx3oY4b+wOn2jjVmEI=
X-Google-Smtp-Source: ABdhPJx6D71sd/JvA/8VP0qsMY062QL9s4mCFQAvm8EGoEifrsmu/+IzHaRDOHy+ddLSUHVKYADO8Q==
X-Received: by 2002:a7b:cb44:0:b0:37c:4e2d:3bb2 with SMTP id v4-20020a7bcb44000000b0037c4e2d3bb2mr8139793wmj.96.1645633341454;
        Wed, 23 Feb 2022 08:22:21 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g6sm150194wrq.97.2022.02.23.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 08:22:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: tegra: Fixes for v5.17-rc6
Date: Wed, 23 Feb 2022 17:22:09 +0100
Message-Id: <20220223162209.293722-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit bd048487af68a9782ebccc3af6606e9e0d7d9f8b:

  ARM: tegra: Add host1x hotflush reset on Tegra124 (2021-12-17 14:55:32 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-dt-fixes

for you to fetch changes up to 8d3b01e0d4bb54368d73d0984466d72c2eeeac74:

  ARM: tegra: Move panels to AUX bus (2022-02-23 13:26:00 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v5.17-rc6

This contains fixes for the eDP panel found on the Venice 2 and Nyan
boards.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Move panels to AUX bus

 arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
 arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)

Return-Path: <SRS0=n9NU=VH=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188A1C433F5
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 08:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCCDEC385A4; Fri, 29 Apr 2022 08:06:33 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B2CDC385A7;
	Fri, 29 Apr 2022 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B2CDC385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id gh6so14029916ejb.0;
        Fri, 29 Apr 2022 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xxUzI1oJheU9knTzW0wnYUCOLKxTgcApqGuAyosALCE=;
        b=Jpytbh+2CPm+A4u61C1hWqZZDgIqu3GS9jdGpHp8WZmt09RjOv0Ej+hl4rJvBqeJUg
         R499Ek1yTZlyMrl+Hjikb321HLNKFh/bFgPA99Cd6LkfrGBNk4UUEPgVQ+qu99lWKzGL
         McN1P36MTeSgatkeEXbC5r9bhEuWtrxIodHkM4dLIXh5lzwsLxapOTt856TQf2DKshDQ
         t6ub4E4jUCBPWMcpEgzRANzr2xumXEQZDXOJDGbzXXCquAHV7pyggMkSBSTeafKai+uZ
         pqbfEjfF/JP1D9OiIxtxNi5helcKBO/mIjZ1WxXhzBjTziXBAXKlWyuk6cUKV9ziy0+d
         BT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xxUzI1oJheU9knTzW0wnYUCOLKxTgcApqGuAyosALCE=;
        b=Wbm6nhtqm26swTMSPRPJKfk1FCcO7Nj0nQuf0pp8YmO9gMvrPcSmGspWWCmFXlI4sx
         eNwT8xyqX4HWDDzNhLNqey+TKniWSbu00FlkfCFIgWaVolAuZFi9YoyuNvOYR2pms2vV
         KkuLl/gwcLgiY9ex+IawQsQR5wlyNomiZKkGBCTd8uN3VBcfCIJyOQ4CXOexryl2FoW/
         bd2JcApdeJbISGqK2tiNjOdhevzTpwIHggkc51lYQXbvIdWGIZMFhXdEZqhjjHWJSLei
         lvcopTPuVmRC8XrJIIsoGz8rku/yicT/W5Ho+5fMgvoNezua4k42N6Wzax17TV/aZuQV
         jiMg==
X-Gm-Message-State: AOAM531CA90G/ocFoZEeIhym1ddPCZxtCuCSnfnBvKHSmNWlZptJwLtB
	QoETdAjyYLQI/uqVwXm8jnPXT1YuzsE=
X-Google-Smtp-Source: ABdhPJzUKEirgE7x/5Mk2iXnFUh0bCskDs+XcoEuf84DQsh58WlUFGnqA/6cnGLnejLFacbSqCbkIQ==
X-Received: by 2002:a17:906:5d15:b0:6f3:77e6:2126 with SMTP id g21-20020a1709065d1500b006f377e62126mr27353283ejt.707.1651219590998;
        Fri, 29 Apr 2022 01:06:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i12-20020a056402054c00b0042617ba6385sm2620506edx.15.2022.04.29.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:06:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: tegra: Default configuration fixes for v5.18
Date: Fri, 29 Apr 2022 10:06:26 +0200
Message-Id: <20220429080626.494150-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm-defconfig-fixes

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

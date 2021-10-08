Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D92C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EC3461019; Fri,  8 Oct 2021 20:11:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABFD60F93;
	Fri,  8 Oct 2021 20:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EABFD60F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id u18so33119928wrg.5;
        Fri, 08 Oct 2021 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
        b=ZGGG50RMsvaM0LmZv4TUd+MC7cLPHPMBm2857GtsESEqfpuTzJkSIfdJG/nhQQL2Ti
         HFmYLcVzIYd2MV2S8/vahu133dJgu4fgKCYd7dseaYgMUPwMurVdRd1t+t/zEAZ50Iip
         kksBJ3BLiQoAJpRUaSolDM3s5ztO16dwoEjTn0Fe4YbJsII7IDRjAQUGieIHH2AZlcMk
         Nt4oJmGtVAvulzUeIktBoxaJgjE+bNk+Aw9BP5590rjH3cGHUtGX3lmBgPxyd6d9GJKK
         f6gKTXdJw1ghIf/mSZiliL6DgUuglOBXxrICVgRbrgW6n6cR79YqvpZSKONWH3VLXFbB
         M3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNWLHFXqYdT2gh+x9edoWxDGJ0oKoVJDV2MDrZvoAMA=;
        b=ARW4R+W7PV2Ua6vEh/j9ja4lTxN/yS25tPVj+T6dD1aFkm5K4dch9+aTA3PYHp3x72
         2fxEfBQF8oGVUnvQVoFu2+fbSyYr3v5xiou95ZH45zglRvzUblRrkFGAQRi7ca9Hj7g2
         dyx7iEJIelqZ06cmYF94SUHSMSovHYyfiWw3jWrrcxGH+BE42povlxh40JzwkbB+V/3K
         bsbE8jCaYBd3Dy9qk6GhAzw2oXWqR8jSG2/1uhexQqnjgl7ZY5FjmzXKK3pcY3y2ZAO6
         fMO3+JKXsLtoFGnH2Yyv7j6ZDMFvHGWYlDcIu7MmwfgcjhwdX9eKXiIydTipFMJlMvAs
         YdWw==
X-Gm-Message-State: AOAM531GD6TMnpIYolER5hYx54CZx2ewHw0EpU2f5x5D7rTXyYWvCEnP
	sArNO0g8FVIBgbitrNdkXjA393H7utk=
X-Google-Smtp-Source: ABdhPJyZqAhm8yNPkHyUdVV334CDf1LNzNHzLHaAeINNVw8lzonUpGBlNJwkIMmre4Oytgd+MRbBdA==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr6593758wrd.24.1633723900124;
        Fri, 08 Oct 2021 13:11:40 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f16sm286418wrr.53.2021.10.08.13.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:39 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:28 +0200
Message-Id: <20211008201132.1678814-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-soc

for you to fetch changes up to 76d89474310e05d9c592a8beed2aefe4d3396d2d:

  soc/tegra: pmc: Use devm_platform_ioremap_resource() (2021-10-08 21:42:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.16-rc1

This set consists of stub additions to enable compile testing for more
drivers, exposes the PMC's USB regmap on all SoC generations, removes a
state synchronization workaround that is no longer needed and adds an
error reporting driver that can help troubleshoot crashes.

To top it all off, an error handling path in the powergating code is
fixed and the devm_platform_ioremap_resource() function is used to
remove some boilerplate code.

----------------------------------------------------------------
Cai Huoqing (1):
      soc/tegra: pmc: Use devm_platform_ioremap_resource()

Christophe JAILLET (1):
      soc/tegra: Fix an error handling path in tegra_powergate_power_up()

Dmitry Osipenko (5):
      soc/tegra: fuse: Add stubs needed for compile testing
      soc/tegra: irq: Add stubs needed for compile testing
      soc/tegra: pm: Make stubs usable for compile testing
      soc/tegra: pmc: Disable PMC state syncing
      soc/tegra: pmc: Expose USB regmap to all SoCs

Mikko Perttunen (1):
      soc/tegra: Add Tegra186 ARI driver

 drivers/soc/tegra/Makefile       |  1 +
 drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c          | 28 +++++++++++---
 include/soc/tegra/fuse.h         | 31 +++++++++++++---
 include/soc/tegra/irq.h          |  9 ++++-
 include/soc/tegra/pm.h           |  2 +-
 6 files changed, 138 insertions(+), 13 deletions(-)
 create mode 100644 drivers/soc/tegra/ari-tegra186.c

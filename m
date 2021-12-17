Return-Path: <SRS0=mL40=RC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7498BC433FE
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48DE1C36AEA; Fri, 17 Dec 2021 16:22:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8FC9C36AE8;
	Fri, 17 Dec 2021 16:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8FC9C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id a9so5042178wrr.8;
        Fri, 17 Dec 2021 08:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8pUod1rJ8BKM00tNDrqEm69jNJuPPsCXj/GPzLhEkg=;
        b=qgcswfc2FeMKuVZJt9dTF9WELwWEHfzvuj3QJVngxi6Ew8rwMCnolub9lMsTh+nqXt
         wdvmaPa1FmR+TuHHR5pKtlEnqY1c3R48UK9EyAW7Y8syaRNvQygo7W8ppSA4hh2fZO4R
         VHBJX0X+TKIgFYicVLHZyVcp2Q/6f5PzmwuEZ7J4S2EsajM/DA5cTvIoQaX4Qpuazigl
         6EUqCOscXP7fvjE8HtH49au1neBtnYH3FuYvqS3gNtHwDtauUGC4iE3KxlDD9mQXDVjW
         gxWe7JIuizEGnBi5BBi0ZY9EJmiXkJpRvf3Npvzi4Jyt+OS9btFrv/bAC24g7wKaZyBv
         OawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G8pUod1rJ8BKM00tNDrqEm69jNJuPPsCXj/GPzLhEkg=;
        b=gIMWRg/2STjeSQPd8+ujNedDzilGp0ecOItUw6mDra2Y0drhecqfd9Pfet0hgDBS1U
         9zgDHeJkHpKUWaGkjI6G8gwjth8A+dAxhxIkP7oVS2cHcVcgZ1P+5K+wMIOjEcmGVu9M
         to38WBALSpWRKLUCKsmjV0pJ1R+GxGpmiWSkLMWKnozsa9WXzGtCWcFJuvn3VpWNlpEg
         mYh0Cndeoi99c0vUInnchDQm/sPmSnQb1IPwo0LtieZIoS65EeVya4SbVuhr+9TRLcr5
         g4EvU+1v+OYPbqRvXAQL2LYOtG9lTCx7Y2gGP02jwPPCgY7u0Mi3uOXBgE07BcP/r06v
         Plng==
X-Gm-Message-State: AOAM533gGD0YKaTpSZAGvq7wXyc0IkJsveQjB60A/wrdDDXyqmWHD4Yb
	QLuJICtiSPxIqRCaRM88rX+wPBtynv+FwQ==
X-Google-Smtp-Source: ABdhPJz/bOkEs4384vt3/kweTJfOmZ0H7sRcry48HWvxwFLtpAuSa+XR8tfOaFtLOPySt0urpAtWqg==
X-Received: by 2002:a05:6000:1449:: with SMTP id v9mr1396032wrx.280.1639758175667;
        Fri, 17 Dec 2021 08:22:55 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d1sm7536400wrz.92.2021.12.17.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:22:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v5.17-rc1
Date: Fri, 17 Dec 2021 17:22:48 +0100
Message-Id: <20211217162253.1801077-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-soc

for you to fetch changes up to 81c4c86c66650f61c6d7a712737d43a3e4d072bf:

  soc/tegra: pmc: Rename core power domain (2021-12-16 14:03:38 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.17-rc1

This set of changes contains some preparatory work that is shared by
several branches and trees to support DVFS via power domains.

There's also a bit of cleanup and improvements to reboot on chips that
use PSCI.

----------------------------------------------------------------
Dmitry Osipenko (8):
      soc/tegra: Enable runtime PM during OPP state-syncing
      soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
      soc/tegra: Don't print error message when OPPs not available
      soc/tegra: fuse: Reset hardware
      soc/tegra: fuse: Use resource-managed helpers
      soc/tegra: regulators: Prepare for suspend
      soc/tegra: pmc: Rename 3d power domains
      soc/tegra: pmc: Rename core power domain

Jon Hunter (1):
      soc/tegra: pmc: Add reboot notifier

 drivers/soc/tegra/common.c             |  29 +++++++-
 drivers/soc/tegra/fuse/fuse-tegra.c    |  51 +++++++++++---
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  33 ++++++++-
 drivers/soc/tegra/fuse/fuse.h          |   1 +
 drivers/soc/tegra/pmc.c                |  41 ++++++++---
 drivers/soc/tegra/regulators-tegra20.c |  99 ++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 122 +++++++++++++++++++++++++++++++++
 include/soc/tegra/common.h             |  15 ++++
 8 files changed, 366 insertions(+), 25 deletions(-)

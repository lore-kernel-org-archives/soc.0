Return-Path: <SRS0=1gXN=3V=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A01EC4332F
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 17:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FE4CC43148; Mon, 21 Nov 2022 17:12:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ADAEC433D6;
	Mon, 21 Nov 2022 17:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1ADAEC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id f27so30156629eje.1;
        Mon, 21 Nov 2022 09:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/STuBXraPKUI11mbHj9+9HyD5/ejZSw22vpVmblNRsQ=;
        b=XFnyxlfrDj0t3mBzkP6QFuzEderAkpKEzCcPH1baBIbm6J4M2Y2VzmPhzvA/KZgS4j
         5ndDf7nuF7upf28fCjR6c7MD3yU33BxUFkLZMyFYuSW71jzEKn9PIc+/JU9AfwJhbCxB
         lnxO2DF32+B60dRnTMNimwGMrh963KMu2gzfP9DZO3NKDqren45ljKQMkc7ukBkNbOs/
         LgsGzrJMGzK3WNRfmrzCcBxkSqCOLj7s8BJ17VSuKrOVbdZyrLLwHv1V5k+rvz1wDfZ5
         3I2kh0YapTe5wdzCcFvaGn67qJ6CvyoQwyh8ozeSaPANrmYvZU11CNnrG3gdK/w4V2LM
         lHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/STuBXraPKUI11mbHj9+9HyD5/ejZSw22vpVmblNRsQ=;
        b=zOrBm3nXzUYxEd/TGbu+y1k74VN6TrV8QsMrC7UxfYz5O5tm7cg+7dYGt5HlqCGWL7
         fSchey1y35kaotpNYNhoe3rLVHlkaEV9n5oQEnXRDAtgix+H+0Gpv7Sd/dUsGOXuAyTM
         2YmO/9KuWKOwikpoyBhWX4Zaaru0SiIfVJLf63Vuerf9iau0+hiq8dqeI+O1obRGNt+M
         vaFu9zw/XxtKF+98CftN7XxVE3GMlJbI57T3CpU4gYx+PQwE6NCACPaJBejkjF2mANXv
         ACjZ64mFCxZp0uBEd1E2RR0dM2HH8OJ8P6uvNO488YZgY5xqAeDbBoKg3FtYtLgTBiqa
         v8bQ==
X-Gm-Message-State: ANoB5plOgmyCEfguzEOlQupzfxbW9DfwgpGBqAtxpnX/rOznA124qot+
	wgsoz1HWn+bMGtrBCHDidNggiiB5XZc=
X-Google-Smtp-Source: AA0mqf45YUum2N9LxChlLd2+6BGzxa4M+ofMic1KxQlOZzMOCxdfhWaoUDbZj+Yy21GJlU81Dvskbw==
X-Received: by 2002:a17:906:398b:b0:7ad:b868:f096 with SMTP id h11-20020a170906398b00b007adb868f096mr16641404eje.295.1669050763692;
        Mon, 21 Nov 2022 09:12:43 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qk14-20020a170906d9ce00b00772061034dbsm5115852ejb.182.2022.11.21.09.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 1/7] soc/tegra: Changes for v6.2-rc1
Date: Mon, 21 Nov 2022 18:12:33 +0100
Message-Id: <20221121171239.2041835-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-soc-v2

for you to fetch changes up to b6c6bbfc65f53c4d314ea69ff11bad04606e83e4:

  soc/tegra: cbb: Remove redundant dev_err call (2022-11-17 23:21:36 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.2-rc1

In addition to a number of improvements and cleanups this contains a
fix for the FUSE access on newer chips, adds Tegra234 I/O pad support
and fixes various issues with wake events.

The SoC sysfs revision attribute is updated to include the platform
information so drivers can check for silicon vs. pre-silicon, among
other things.

----------------------------------------------------------------
Kartik (3):
      soc/tegra: fuse: Use SoC specific nvmem cells
      soc/tegra: fuse: Add nvmem keepout list
      soc/tegra: fuse: Use platform info with SoC revision

Liu Shixin (1):
      soc/tegra: cbb: Use DEFINE_SHOW_ATTRIBUTE to simplify tegra_cbb_err

Manish Bhardwaj (1):
      firmware: tegra: include IVC header file only once

Petlozu Pravareshwar (4):
      soc/tegra: pmc: Select IRQ_DOMAIN_HIERARCHY
      soc/tegra: pmc: Add I/O pad table for Tegra234
      soc/tegra: pmc: Fix dual edge triggered wakes
      soc/tegra: pmc: Process wake events during resume

Shang XiaoJing (1):
      soc/tegra: cbb: Remove redundant dev_err call

Sumit Gupta (4):
      soc/tegra: cbb: Use correct master_id mask for CBB NOC in Tegra194
      soc/tegra: cbb: Update slave maps for Tegra234
      soc/tegra: cbb: Add checks for potential out of bound errors
      soc/tegra: cbb: Check firewall before enabling error reporting

 drivers/soc/tegra/Kconfig              |   1 +
 drivers/soc/tegra/cbb/tegra-cbb.c      |  13 +-
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  18 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 170 +++++--
 drivers/soc/tegra/fuse/fuse-tegra.c    | 134 +----
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 278 ++++++++++-
 drivers/soc/tegra/fuse/fuse.h          |   4 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   1 +
 drivers/soc/tegra/pmc.c                | 878 +++++++++++++++++++++++----------
 include/soc/tegra/fuse.h               |  15 +
 include/soc/tegra/ivc.h                |   1 +
 include/soc/tegra/pmc.h                |   6 +-
 12 files changed, 1092 insertions(+), 427 deletions(-)

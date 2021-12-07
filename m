Return-Path: <SRS0=jFfF=QY=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E897C433EF
	for <soc@archiver.kernel.org>; Tue,  7 Dec 2021 16:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE326C341C8; Tue,  7 Dec 2021 16:21:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 446D2C341C1;
	Tue,  7 Dec 2021 16:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 446D2C341C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id p18so11189332wmq.5;
        Tue, 07 Dec 2021 08:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7ii81gvEv/XyGJMLeUrAHqpo7gd4t4eLbDbmhNoqw8=;
        b=eZ9sikbZ8a8IcF8BB6Y85oYexf8cgSR77yULf72M2chIjZwK9VQsEVjcCDCI0vGGjm
         wrruDYpOQNAxgBayL+f1V66yotjzPiTc5UF9D6eNjjbJOjQdBOoAJyrnSM/E2Bn9sYJO
         ptxmrVu7EtCojp9uadhoEzPhih2A0fz3c36a6GjwCD60gyinK0ArvYcjmItIJnybyF7R
         OsQuSoNjNl2zOjEwT+NSj/+fQSDaOjAjh8NuQ6knQWjth6LmrEF2owmW/ARwYQQYRg4N
         fL+cFyOBVuTYj5X/xZKmf1hqzvHO8eB8wjz/4ZkUwrPm5L184CfK9B1Qnwj13WnQ+bfH
         M1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7ii81gvEv/XyGJMLeUrAHqpo7gd4t4eLbDbmhNoqw8=;
        b=r32X4ukgqz+k0qwDjSxY6ejDap8KpLfnLHUbBhasYeFwxwbeEd2Fz7Poqfz4EidCSV
         IwyAgKqpf2l3E1cvI4PjDyqyosGBe3QDdLQ2ycKpURQ9bi5a48QOynrLv38HaBKrsCTx
         aSymqb2BJXZCtRenG1nqC+068V3+dJoRHHYQHTMm6Mx66e4K/+ChSrwxVXfAIBWpOD7w
         rYHDBzywjv9zDVnvIpmluc12s38fykKAK3lyGJ+EuCw/qsQibLU8Jk0kgQMGxyt8/f6W
         yjFJNxRcaPWUkg6rT0vPW2ym64b/UJE6oIT0vmABlYNXO0SO2MUR1Kr2el63oglquGzC
         8gYg==
X-Gm-Message-State: AOAM532QEN+2XAwEOMwVgsKcI83HgWGGaN2+RKoK38Q6mKvW1y/5eEkF
	MvlDx/zE82JUjJr0+m8hm7FWQe4QSTNe0w==
X-Google-Smtp-Source: ABdhPJxKuXY92SDEEEZ3VxfFZcnbW7srW3w3hMbi7cTpybyEpqIy+Qpnecupjtt1kiP++ZF2eHpGIQ==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr8360269wmc.187.1638894081015;
        Tue, 07 Dec 2021 08:21:21 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f7sm184210wri.74.2021.12.07.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:21:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] firmware: tegra: Fixes for v5.16-rc5
Date: Tue,  7 Dec 2021 17:21:15 +0100
Message-Id: <20211207162115.450554-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f11c34bddf8cd2a3107a7d11b6446c66deda9590:

  firmware: tegra: bpmp: Use devm_platform_ioremap_resource() (2021-10-07 20:52:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-firmware-fixes

for you to fetch changes up to 711e26c00e4c7b7cef0420c76a61e6d818e12687:

  firmware: tegra: Fix error application of sizeof() to pointer (2021-10-18 16:04:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: Fixes for v5.16-rc5

This contains a single fix for an incorrect usage of sizeof().

----------------------------------------------------------------
Lv Ruyi (1):
      firmware: tegra: Fix error application of sizeof() to pointer

 drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

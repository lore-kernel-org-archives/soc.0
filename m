Return-Path: <SRS0=nkI+=ZT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D702ECAAD8
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B62BC43143; Fri, 16 Sep 2022 10:20:05 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24C5DC43470;
	Fri, 16 Sep 2022 10:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24C5DC43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id lc7so48458985ejb.0;
        Fri, 16 Sep 2022 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+Qwh9Fiu09wuBBgjyS2RCt9cQRNgS7gUGyaRZ+a59cc=;
        b=nzM+z3hahlB24FjW+Ir6yks4MrsDDNqghwdJ9ObGZBL6XavyJINbs3GX+79ZpJyen9
         uphbHqCjL4jf4NabpVXP161NeLtOaarli9Y47iubL2OqBiMTga62OjHoPwaeQd5UUCZZ
         GRvocSie2TX0Mobvmb9SXPx/lqd4C9IvyUl3HMmrYLKwkqwGMkIDwLE3AmyIG3pbjC98
         rDxgDR0f8IlbgixR3FQlk3uy2G7OslRFYjyYFcySv5wMcuevdtsrv9laHmT8Q4xTEkvo
         Tb0cDAZ2rk7LKdu8MIEWR/TrNxfJGpaR/oK1iXFv2bilCmQiNTwviQWaXjCXurmUFsri
         qnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+Qwh9Fiu09wuBBgjyS2RCt9cQRNgS7gUGyaRZ+a59cc=;
        b=D61dSlRyjrINWvA87JuGDBzL3pD7t78M3rO4Wuon+mo2gYu68/dY5UDH7mga23mPbq
         q41ipF2iTiV+QXz3aAl2rl1qF8GNTHGa3ETMpCwrF00KmoUljzZkFipYwY8Zk+aY3RRb
         gfCZ5A5iXLlJn7UsKu1Y5/XbmNrg94yqVDY6Dh/mNV2La1N1hXwgR3laNjKpD60iICNJ
         zOZcf4UDjPh4o5QRNHbDoL6QYifN31498hKrxNR0Frf5QaSGSlbbIrgBfU35oXmwIxee
         YZEqbEexWys2hcOz4hJQ4ax+6rkbWw4ySECqj8FZOkFyfc7dHGI59rzH0oh43ii8vdnu
         q+cQ==
X-Gm-Message-State: ACrzQf3olNlCWnbKQ1epWPTuVsWvhgDB0MtSgkXbzoqiNk5gksmuIMyM
	kHagA7WtffcB8+dC/V4twoUFjnv5PfQ=
X-Google-Smtp-Source: AMsMyM4s4izcB6Dd9WAvU+HE15lJeBLAMLoYLrMTubz283dqy1O7KRU5go4bdLQDFRJWyI+AjtC68w==
X-Received: by 2002:a17:907:948f:b0:780:4c66:6689 with SMTP id dm15-20020a170907948f00b007804c666689mr3096844ejc.401.1663323601732;
        Fri, 16 Sep 2022 03:20:01 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm10309783ejb.95.2022.09.16.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
Date: Fri, 16 Sep 2022 12:19:52 +0200
Message-Id: <20220916101957.1635854-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-soc

for you to fetch changes up to 74f7f183d81c26a53c2b1708364069d391b1b4d6:

  soc/tegra: pmc: Check device node status property (2022-09-15 14:10:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.1-rc1

This contains an assortment of small fixes and cleanups. One new feature
is introduced in the form of simple wake events which are needed to wake
the system from sleep on USB port events.

----------------------------------------------------------------
Christophe JAILLET (1):
      soc/tegra: pmc: Use devm_clk_get_optional()

Dmitry Osipenko (1):
      soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA

Liang He (2):
      soc/tegra: fuse: Add missing of_node_put() in tegra_init_fuse()
      soc/tegra: fuse: Add missing of_node_put()

Petlozu Pravareshwar (1):
      soc/tegra: pmc: Check device node status property

Thierry Reding (3):
      soc/tegra: pmc: Remove leading space
      soc/tegra: pmc: Add support for simple wake events
      soc/tegra: pmc: Add USB port wake events for Tegra194

 drivers/soc/tegra/Kconfig              |  1 -
 drivers/soc/tegra/fuse/fuse-tegra.c    |  1 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  7 ++++--
 drivers/soc/tegra/pmc.c                | 45 ++++++++++++++++++++++++----------
 4 files changed, 38 insertions(+), 16 deletions(-)

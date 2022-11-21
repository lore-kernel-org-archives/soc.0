Return-Path: <SRS0=1gXN=3V=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB06C433FE
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 17:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08C8CC43145; Mon, 21 Nov 2022 17:12:48 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15E52C433D7;
	Mon, 21 Nov 2022 17:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15E52C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id l11so17182851edb.4;
        Mon, 21 Nov 2022 09:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY70Yev9QdiV3UD01epXVUTgE//iw8cadwhCJt+Sn+s=;
        b=DLZlZFu42apwdJHgOEo/yiU8+64XPQWVTmj+RggiQ3Jg00Z5Hype8GMW+DXcftyAc3
         ESFnati4U0N/v78cKN/0RAOhh9l8Kcf7qgNb89+vM0WR7Q3gTN/N+4+FAWtuc0dhcgt4
         yXEZ2x5e1eaMg9hmi/aUf5T3y9agOdlDENsIppQuO3/m/YbWOIBpgM0KJnpLLPQklYm8
         MeWKJzlOHK+1u5GU9zOydveppussejTzpxx39nUgKPpDGC9XMrb7LFP9ei3Fuh7xxx2B
         GSACM7orsYsn4g3YmyHzGvS+zWye5nu1VFQgFUjVLIqRT1KqXSVy2BwgK4mSGm+sfLlL
         MzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY70Yev9QdiV3UD01epXVUTgE//iw8cadwhCJt+Sn+s=;
        b=G6MMuqyGric6f6fKkb8EnEDUc+cz7KGr52yxvxHrxmpB6Gxk6f2/oD6++872tFj0R6
         M9B72hiwlYO1Kw7xLKf3CmV8tv3yC+J221wHScIHlYgEDjYCwn8SVxeqaasPx6OYlTPc
         1YVHT25P50XurcZfsghaQaWkrJ+3OJ1pdEK0VoQQyTTubCTK78bDbF2e+CKEkyGhqPqj
         11Gu4/67G6JKuWtvBWs5JdBeakDfJj+pSxLBfi8xFa3/2OdZwtLCMaw2Z/OvqZM7l9nX
         9YVqPgH5vtoXWhn5a5i70kt1K8vnYRju5Dn05xR25M7maX+xqElIg6OXv8epWD5jqLjQ
         ueOQ==
X-Gm-Message-State: ANoB5pnl2PBeqQtlzE1VQGAZ1lYGFMEp0WXd0huTlOZkTfo0w2VJn4/2
	7oi9FhC926iTAMfKp0B2A75yZ5HOQ/U=
X-Google-Smtp-Source: AA0mqf6tRk51Lbhn8FiGeIXPSjfOadBGoIYut3ULUNNTA21nw4KAgxXV3F5WQDtUI6X6GJI9acoH6Q==
X-Received: by 2002:aa7:d94a:0:b0:463:6b8f:f203 with SMTP id l10-20020aa7d94a000000b004636b8ff203mr17139124eds.236.1669050764890;
        Mon, 21 Nov 2022 09:12:44 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c053000000b00456c6b4b777sm5321535edo.69.2022.11.21.09.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 09:12:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 2/7] firmware: tegra: Changes for v6.2-rc1
Date: Mon, 21 Nov 2022 18:12:34 +0100
Message-Id: <20221121171239.2041835-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-firmware-v2

for you to fetch changes up to 198d4649b0b813bc9fc1605cfb843b6624518f92:

  firmware: tegra: Remove surplus dev_err() when using platform_get_irq_byname() (2022-11-17 23:52:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.2-rc1

This adds new BPMP ABI so that newer features can be enabled.
Furthermore, the BPMP driver is updated to use iosys-map helpers to
allow working with shared memory regions that are located in system
memory.

Apart from that, several minor cleanups are included.

----------------------------------------------------------------
Peter De Schrijver (1):
      firmware: tegra: Update BPMP ABI

Thierry Reding (3):
      firmware: tegra: bpmp: Prefer u32 over uint32_t
      firmware: tegra: bpmp: Use iosys-map helpers
      firmware: tegra: bpmp: Do not support big-endian

Yang Li (1):
      firmware: tegra: Remove surplus dev_err() when using platform_get_irq_byname()

 drivers/firmware/tegra/bpmp-debugfs.c      |   62 +-
 drivers/firmware/tegra/bpmp-tegra186.c     |   36 +-
 drivers/firmware/tegra/bpmp-tegra210.c     |   15 +-
 drivers/firmware/tegra/bpmp.c              |   33 +-
 drivers/firmware/tegra/ivc.c               |  150 ++-
 drivers/thermal/tegra/tegra-bpmp-thermal.c |   15 +-
 include/soc/tegra/bpmp-abi.h               | 1796 +++++++++++++++++++++-------
 include/soc/tegra/bpmp.h                   |   17 +-
 include/soc/tegra/ivc.h                    |   11 +-
 9 files changed, 1545 insertions(+), 590 deletions(-)

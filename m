Return-Path: <SRS0=fmoZ=3T=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED10C4332F
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 01:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2107C43144; Sat, 19 Nov 2022 01:20:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68D8EC433D6;
	Sat, 19 Nov 2022 01:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68D8EC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id v17so9382350edc.8;
        Fri, 18 Nov 2022 17:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv0PzlcVaQ/CTTukfY7VRJbJbSOMPXowRTFbtjysSwg=;
        b=ZC2O0lE+hjzh3BprparTmGNrHsKw6nIMx5gPBimEjmIwG+vxvXYRlXnBdSbn0r5TLo
         HfIK/AG1BcA2XBBufKBuwLYnvJiZ9lJjGdsuNt0Xw7sNtKR2uWG+qOgypV3Jbk/btvZ5
         N4cLLrf4w3WfjvjviECTM8B+utJsxDNzKnLaiGVvOCiec3K9B17XvF/OB7u8VHET1BW3
         wX0vVDxXN6mSFCuBBnA8etz2wRMbiiIpSlplQtGF4N9dKsjgTUTZQDjbyJkxJMAMX7gt
         ArJcHxKnJa3xI6aYN0t5TbUA4JUqoyRe1u/RmCuceLCsNzejc7pJpjPm+l52uXeEeLsN
         DrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv0PzlcVaQ/CTTukfY7VRJbJbSOMPXowRTFbtjysSwg=;
        b=1Ns4fb4xH1HN7eArz9LKPaYHatdajkbVTWYKxnAj74y+4hWknr0gYPbXQXIiSvpaJx
         38YmesT64WxjAkbi6ELlXnDpqfyeB/J5AJIhGC3lKi17z4n6ZjQJhKU8/aHgcMhqAEiL
         cBqZ60M+CnyXYmNWV/99veyqnBTTmm4M3P/Csksm3m/Zfmbv2mIyeiSHuOHHm8iiia3B
         w4Cnr7P5k6Eq8mNKsroVZc+0eIJhqiQyD29ygCp/tIcsghq7xfNQufS71AX7WpWrBxUa
         8G+5DglIPrkU98rCTbc4s4Z4XcBb0ZAYRsOcte38zvr2rwSh6vTzC0YOLDmVU5ptDHeB
         aJhg==
X-Gm-Message-State: ANoB5plKTMnkbHDyWWlqUvVjLqd+0KXBG2TJhDuIz7MpE/ron8k6cU+R
	FL3NrK/SruHS2+5rlgZNj/5Zu2nMOvQ=
X-Google-Smtp-Source: AA0mqf6RDXtJ6Nw7/im4zwSUmPzxxG8bvUWvOjIAK6+jcFUufKf609PJ34Ob0oFxjbPyVUIqCUv+Bg==
X-Received: by 2002:a05:6402:530b:b0:461:f919:caa4 with SMTP id eo11-20020a056402530b00b00461f919caa4mr8302496edb.255.1668820827392;
        Fri, 18 Nov 2022 17:20:27 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id en20-20020a056402529400b00461bb7e7ef1sm2431853edb.30.2022.11.18.17.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:27 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Changes for v6.2-rc1
Date: Sat, 19 Nov 2022 02:20:19 +0100
Message-Id: <20221119012025.3968358-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-firmware

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

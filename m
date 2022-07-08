Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DEACCA47B
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8012FC341CB; Fri,  8 Jul 2022 18:56:17 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF958C341C0;
	Fri,  8 Jul 2022 18:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF958C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id y8so22154548eda.3;
        Fri, 08 Jul 2022 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IeIPKM4BU2jF2s7DxP/vGk+XtsPSpZLfG+vuDyH9vz0=;
        b=pB8GbtiLkPB5t3bFN0GP6yKb3i10z9VqcipYX6GGp7xHG2Lm7KllrOEIjoCZptYva7
         F1IqLrK9iqIAt1K6mYXbmmGzW5qwBCDwF1OX7nhIVXJEniGQrxBLvUtqeKiMvcgtyVfe
         Ix5TUlNzwtyXbZazq+JDuQsW4ZJGzhhx/1gKL0FR4y4j6zaMacoMJ6GGfDb8Y6S/8Z5/
         Qs0y1hIauG1EyEj1cYbeSS7t41g9WYObSTLGauJJRvmMHVOMY3Eb1Xc4KSSPP/u2Frn+
         05KLAVt6eh4LZvZC8kv2Ds1pOXkmphO/d8VlDJx7LoJwJWC1lXRTyUr4zrhorLFx+2K8
         UQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IeIPKM4BU2jF2s7DxP/vGk+XtsPSpZLfG+vuDyH9vz0=;
        b=tvwQ00losIqTC+1QDTUg5CdG/2GF5V9d2goYfWz0OluuwpFHdxpjE2gqyVgwzzukgp
         sO4pWcHn1t6Dh9JhreBC2hqCAwuvtrCDHtfdSSEnY0zKIwR7jVuwGY/MJVfRORokgKh4
         INgGu0DQsySn/z3h8qsq5dLiAUa5mmZqi3lvxPWvJ+bdCUglJhd5cwFiESZn0e5lzDS9
         mA654LUsvWp/FhOvRHpVTrs8nfXyqsHpXNdovrw+W6lFEDhxLpf7sYVZ5briWOIW+BcF
         nnaswVVECOLMdqhUgztyGpnyMEsSs/NW6NhyEhoy1aiMGLqg+t5XYk4p5H0QmWO0EoxE
         FdzA==
X-Gm-Message-State: AJIora95Ha5Z7uSXpCc0ipYd1kCUkwxro4Fng2fbVmcUjZgUUPZA+sK0
	J7ucYzKp6muvc+KXjdwyfbw9mU0Egx8=
X-Google-Smtp-Source: AGRyM1s9b13kJlhzX8CNsN9hY9yzpH4KD7GakMwkFcbKEQodlz22d3oUvEMc9oR7k/hpMRZPV+4yHQ==
X-Received: by 2002:aa7:d916:0:b0:43a:2421:a023 with SMTP id a22-20020aa7d916000000b0043a2421a023mr6608529edr.124.1657306574633;
        Fri, 08 Jul 2022 11:56:14 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ek5-20020a056402370500b0043a253973aasm12639055edb.10.2022.07.08.11.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] soc/tegra: Changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:02 +0200
Message-Id: <20220708185608.676474-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-soc

for you to fetch changes up to 4773d1c739e22101a92f89c0ae0983190ddbe112:

  soc/tegra: fuse: Add missing of_node_put() (2022-07-08 17:27:26 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.20-rc1

The bulk of these changes is the new CBB driver which is used to provide
(a lot of) information about SErrors when things go wrong, instead of
the kernel just crashing or hanging.

In addition more SoC information is exposed to sysfs and various minor
issues are fixed.

----------------------------------------------------------------
Bitan Biswas (1):
      soc/tegra: fuse: Expose Tegra production status

Liang He (2):
      soc/tegra: fuse: Add missing of_node_put() in tegra_init_fuse()
      soc/tegra: fuse: Add missing of_node_put()

Sumit Gupta (4):
      soc/tegra: Set ERD bit to mask inband errors
      soc/tegra: cbb: Add CBB 1.0 driver for Tegra194
      soc/tegra: cbb: Add driver for Tegra234 CBB 2.0
      soc/tegra: cbb: Add support for Tegra241 (Grace)

YueHaibing (1):
      soc/tegra: fuse: Add missing DMADEVICES dependency

 drivers/soc/tegra/Kconfig              |   11 +-
 drivers/soc/tegra/Makefile             |    1 +
 drivers/soc/tegra/cbb/Makefile         |    9 +
 drivers/soc/tegra/cbb/tegra-cbb.c      |  190 +++
 drivers/soc/tegra/cbb/tegra194-cbb.c   | 2365 ++++++++++++++++++++++++++++++++
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 1114 +++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra.c    |   16 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   36 +-
 include/soc/tegra/fuse.h               |    7 +
 include/soc/tegra/tegra-cbb.h          |   47 +
 10 files changed, 3791 insertions(+), 5 deletions(-)
 create mode 100644 drivers/soc/tegra/cbb/Makefile
 create mode 100644 drivers/soc/tegra/cbb/tegra-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra194-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra234-cbb.c
 create mode 100644 include/soc/tegra/tegra-cbb.h

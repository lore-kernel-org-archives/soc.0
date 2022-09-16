Return-Path: <SRS0=nkI+=ZT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16ABC6FA8B
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA200C433B5; Fri, 16 Sep 2022 10:20:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B94ACC433D7;
	Fri, 16 Sep 2022 10:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B94ACC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id w28so6853974edi.7;
        Fri, 16 Sep 2022 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9D6Cy0qk8oSMPdVYps0zgDOs5+iKxwodqerE+wzvy+Q=;
        b=agcyp26HZ9Qbsu2kOoNg8/h3Gv90yvlZO5aSXi3fUS0Ik1tWcN2paSadnkCzNXGCH+
         gF/h7+513AF3O5AGEBg6JcZRdyD498C0XtccIgVu4wolaOuVh5VMOXZd6ffDqclafhI9
         55TPnnuFDARzp8GGaafPA84j5aV1li8okTa+K2RAGz+H/Fu1oyvzMpw3+YBtdObCFxmc
         KNOWc2K83PfxZjghUfojo+udKe4R+sZibdIjNgRNPDaraOZNYT4M3BPrF7aMSRfdI2si
         FHNI+rA6ZqzYFtv2tNamoB0QHfRV5FViHByCgmk/fmq398u9R5bFH2bFV8zfseQDSdUI
         lb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9D6Cy0qk8oSMPdVYps0zgDOs5+iKxwodqerE+wzvy+Q=;
        b=GJP01QTVdEaja0fX4Wyf6Y2y+HziSNPi1/qQcCPekKmv+1L2Xl1tbzyh6yKFH8UpHv
         cPyLk4eSSSabiaWd52/ZOX0INy2nKmPDwr5V+LPDnxHSlbCfbHmIaav8cg+RzqEojXBf
         opV0peOs7FXivQPH8AwqAkIKar+ARaoDv/+fu+PjZTYhfynoa6rDou+ozt0N1RH65h7X
         ak0Yie7IB+6xOt+FiqvaJrPDE3AY1W7/3Rejj7ekV633vy5RNbIjCNrQfkWl3efib0rP
         BTJ/zxo59X5F9bPC/eOrYMrxT6NvmMnbOCosVSwfYA0tKzbqEepEg8ffUNY0U2pOTnPU
         HpIQ==
X-Gm-Message-State: ACrzQf0gMBIiptYLP+CBlv173RknxetC8oF4EsDU7G6zIf4DzQ2zv70j
	KaSqRsQWTn70FAQ+x/jsxteJ1nhscfo=
X-Google-Smtp-Source: AMsMyM6DPyiX7amS2zxG2EkNS1kJRE3hY2uqJbWM0G5gI83sURx9mUKkGob+QWDckHp2/QtxIZ82pw==
X-Received: by 2002:a05:6402:5110:b0:450:c196:d7b1 with SMTP id m16-20020a056402511000b00450c196d7b1mr3363248edd.117.1663323603422;
        Fri, 16 Sep 2022 03:20:03 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709061dcb00b0078034812bc7sm3478790ejh.200.2022.09.16.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: cbb: Changes for v6.1-rc1
Date: Fri, 16 Sep 2022 12:19:53 +0200
Message-Id: <20220916101957.1635854-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-cbb

for you to fetch changes up to 53283105cab6f408968b7546826303ad329e9983:

  soc/tegra: cbb: Add support for Tegra241 (Grace) (2022-09-15 12:41:36 +0200)

I've split this out separately for now because after the discussion
last release cycle there wasn't quite consensus about where this should
go. The EDAC maintainers said that they didn't think it'd be a good fit
so I'm including it again for ARM SoC here, but it being on a separate
branch it won't block any of the other patches from going in if this is
still a contentious topic.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: cbb: Changes for v6.1-rc1

This introduces the CBB driver that is used to provide (a lot of)
information about SErrors when things go wrong, instead of the kernel
just crashing or hanging.

----------------------------------------------------------------
Sumit Gupta (4):
      soc/tegra: Set ERD bit to mask inband errors
      soc/tegra: cbb: Add CBB 1.0 driver for Tegra194
      soc/tegra: cbb: Add driver for Tegra234 CBB 2.0
      soc/tegra: cbb: Add support for Tegra241 (Grace)

 drivers/soc/tegra/Kconfig              |    9 +
 drivers/soc/tegra/Makefile             |    1 +
 drivers/soc/tegra/cbb/Makefile         |    9 +
 drivers/soc/tegra/cbb/tegra-cbb.c      |  190 +++
 drivers/soc/tegra/cbb/tegra194-cbb.c   | 2364 ++++++++++++++++++++++++++++++++
 drivers/soc/tegra/cbb/tegra234-cbb.c   | 1113 +++++++++++++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c |   29 +-
 include/soc/tegra/fuse.h               |    6 +
 include/soc/tegra/tegra-cbb.h          |   47 +
 9 files changed, 3766 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/tegra/cbb/Makefile
 create mode 100644 drivers/soc/tegra/cbb/tegra-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra194-cbb.c
 create mode 100644 drivers/soc/tegra/cbb/tegra234-cbb.c
 create mode 100644 include/soc/tegra/tegra-cbb.h

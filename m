Return-Path: <SRS0=B3vr=LB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB3FC47082
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jun 2021 09:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723B7611AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jun 2021 09:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723B7611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CICgPHDaybS+6IKSsOm6v8N7gxmIVii9nQo7qEvTJNw=; b=B7BaNGK85cyzih
	++5lwLkG4CMCkkGVnEX3Kp5efzxZ+wNy8tm4d47LYB9PZ+iOa3FA+L/DjXPFmkJOuoV2pAkR5+SzL
	Q//SWlItPbKBFP3fW1QjzxY6UbswCN01es0EM0yJZMBNqqSQPN+ItVaDWysnmJhfZlTI3CRAYp7PQ
	YHtPwHEhpXpE5ecuZYkWXNSkWyVTX6v9AJss6OuDkt8zcDemXgMc0wIaviai5gBbiK5ZMyyZkecH4
	7Qn9vaw6c/y0i6RVqXfofJF4oy/LiI/wbPGAEFV7sVY4e1yLOgXINk0cbMcxXnd/WG1ecu3eI4zV6
	T8nUnt8itmoeAXCr5muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBPa-002XSr-4d; Mon, 07 Jun 2021 09:19:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAwh-002PNx-1o
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Jun 2021 08:49:21 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqAwc-0004kt-PE
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Jun 2021 08:49:14 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so7584221wrq.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cZ1PobqwBPaq9OP1zdBWQXQtgWjqazmERJP5g1G4lIo=;
 b=ZAfc1KI9oyc3I+gRZ9hzdSB0lOktDj+IMd53dbwUOKQ27i28Dd2SAqNoQuljvC9Ifd
 xFsaRNmqkArdK31X43z5Wutbo0uEiUaZEIvB9gC99ZDryXrVGnntoLlSyaGlqCMPaVFp
 WSVM8ZsLT1gxxnF2i4XNjThH8oOg7t0qoY3eayRhyKu6XE3s+sbf84x8CF6hsnwdwLfR
 2Nj1BQw/QJRnSVXXaCOcZ3KSSK/9D7HLea7QcuI0Ge0XJS5kpU8E8AJ1TrDoxZjUGktR
 VREUB7M3UNn6v1qmcjVqbkIGz/nOjesk8+4GCeQ7T/jmfDrZO4K5Zyo89IExofO9TZ77
 0NXg==
X-Gm-Message-State: AOAM532ZSnQoBINaoAHv6kvH0fOh9yOrgPIheaydCE+wV0H64EsVLYUJ
 jJpKPG0pOnjHgBvV0TbICpBW9XZ+4wHbaR/fNS1JMC6dtAah9Rx6rWWh/j0VBwnAh6IWdsnIDw3
 M7skA3wUpvNcBQTsEAeaTH/YiwabdYe0VJgqKTQnIhelay7vCHrpf
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr15594915wri.208.1623055754368; 
 Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA7m3LT7tZJSbZni7ARguVUZ0E3Tcg3okMcx3uwOvjUO9dttwrLYXz7AJDCS5ICKmPinUN0w==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr15594895wri.208.1623055754224; 
 Mon, 07 Jun 2021 01:49:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch.
 [188.155.185.9])
 by smtp.gmail.com with ESMTPSA id k16sm13380079wmr.42.2021.06.07.01.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 01:49:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] memory: Tegra memory controller for v5.14
Date: Mon,  7 Jun 2021 10:49:10 +0200
Message-ID: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_014919_286387_B0E256A4 
X-CRM114-Status: GOOD (  15.35  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210607084910.BmhlEErP6iK3Fwa7QXy9abN-1ODm-yARk1j6TSy8APc@z>

Hi Olof and Arnd,

Tegra memory controller driver changes with necessary dependency from Thierry
(which you will also get from him):
1. Dmitry's power domain work on Tegra MC drivers,
2. Necessary clock and regulator dependencies for Dmitry's work.


Hi Thierry and Will,

This is the pull for you to base further SMMU aptches (prevent early SMMU
faults).

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14

for you to fetch changes up to 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a:

  memory: tegra: Implement SID override programming (2021-06-03 21:50:43 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Tegra SoC

1. Enable compile testing of Tegra memory controller drivers.
2. Unify Tegra memory controller drivers. From Thierry Reding:
   "This set of patches converges the feature sets of the pre-Tegra186
   and the post-Tegra186 memory controller drivers such that newer chips
   can take advantage of some features that were previously only
   implemented on earlier chips."
3. Implement SID override programming as part of work to prevent early
   SMMU faults.
4. Some simplifications, e.g. use devm-helpers.

This pulls dedicated tag from Thierry Reding with necessary changes to
Tegra memory controller drivers, as a pre-requisite to series applied
here.  The changes from Thierry's tree also include their own
dependencies: regulator and clock driver changes.

----------------------------------------------------------------
Dmitry Osipenko (18):
      clk: tegra30: Use 300MHz for video decoder by default
      clk: tegra: Fix refcounting of gate clocks
      clk: tegra: Ensure that PLLU configuration is applied properly
      clk: tegra: Halve SCLK rate on Tegra20
      clk: tegra: Don't allow zero clock rate for PLLs
      clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
      clk: tegra: Mark external clocks as not having reset control
      clk: tegra: Don't deassert reset on enabling clocks
      regulator: core: Add regulator_sync_voltage_rdev()
      soc/tegra: regulators: Bump voltages on system reboot
      soc/tegra: Add stub for soc_is_tegra()
      soc/tegra: Add devm_tegra_core_dev_init_opp_table()
      soc/tegra: fuse: Add stubs needed for compile-testing
      clk: tegra: Add stubs needed for compile-testing
      memory: tegra: Fix compilation warnings on 64bit platforms
      memory: tegra: Enable compile testing for all drivers
      memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
      memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()

Krzysztof Kozlowski (1):
      Merge tag 'tegra-for-5.14-memory' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into for-v5.14/tegra-mc

Thierry Reding (16):
      Merge branch 'for-5.14/regulator' into for-5.14/soc
      Merge branch 'for-5.14/clk' into for-5.14/memory
      Merge branch 'for-5.14/soc' into for-5.14/memory
      memory: tegra: Consolidate register fields
      memory: tegra: Unify struct tegra_mc across SoC generations
      memory: tegra: Introduce struct tegra_mc_ops
      memory: tegra: Push suspend/resume into SoC drivers
      memory: tegra: Make per-SoC setup more generic
      memory: tegra: Extract setup code into callback
      memory: tegra: Parameterize interrupt handler
      memory: tegra: Make IRQ support opitonal
      memory: tegra: Only initialize reset controller if available
      memory: tegra: Unify drivers
      memory: tegra: Add memory client IDs to tables
      memory: tegra: Split Tegra194 data into separate file
      memory: tegra: Implement SID override programming

 drivers/clk/tegra/clk-periph-gate.c      |   80 +-
 drivers/clk/tegra/clk-periph.c           |   11 +
 drivers/clk/tegra/clk-pll.c              |   12 +-
 drivers/clk/tegra/clk-tegra-periph.c     |    6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c |   16 +-
 drivers/clk/tegra/clk-tegra20.c          |    6 +-
 drivers/clk/tegra/clk-tegra30.c          |    6 +-
 drivers/clk/tegra/clk.h                  |    4 -
 drivers/iommu/tegra-smmu.c               |   16 +-
 drivers/memory/tegra/Kconfig             |   18 +-
 drivers/memory/tegra/Makefile            |    6 +-
 drivers/memory/tegra/mc.c                |  321 +++---
 drivers/memory/tegra/mc.h                |   25 +
 drivers/memory/tegra/tegra114.c          | 1245 ++++++++++++----------
 drivers/memory/tegra/tegra124-emc.c      |    4 +-
 drivers/memory/tegra/tegra124.c          | 1306 ++++++++++++-----------
 drivers/memory/tegra/tegra186.c          | 1679 +++++++++---------------------
 drivers/memory/tegra/tegra194.c          | 1351 ++++++++++++++++++++++++
 drivers/memory/tegra/tegra20-emc.c       |   48 +-
 drivers/memory/tegra/tegra20.c           |  110 +-
 drivers/memory/tegra/tegra210.c          | 1433 +++++++++++++------------
 drivers/memory/tegra/tegra30-emc.c       |   52 +-
 drivers/memory/tegra/tegra30.c           | 1292 ++++++++++++-----------
 drivers/regulator/core.c                 |   23 +
 drivers/soc/tegra/common.c               |   97 ++
 drivers/soc/tegra/pmc.c                  |    5 -
 drivers/soc/tegra/regulators-tegra20.c   |   75 +-
 drivers/soc/tegra/regulators-tegra30.c   |   75 +-
 include/linux/clk/tegra.h                |  100 +-
 include/linux/regulator/driver.h         |    1 +
 include/soc/tegra/common.h               |   31 +
 include/soc/tegra/fuse.h                 |   20 +-
 include/soc/tegra/mc.h                   |   65 +-
 33 files changed, 5566 insertions(+), 3973 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

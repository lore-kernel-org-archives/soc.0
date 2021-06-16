Return-Path: <SRS0=8GBa=LK=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5F3C48BE5
	for <soc@archiver.kernel.org>; Wed, 16 Jun 2021 07:21:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D8A2613C7; Wed, 16 Jun 2021 07:21:03 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013AD613B9
	for <soc@kernel.org>; Wed, 16 Jun 2021 07:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 013AD613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1ltPrB-00050c-Cw
	for soc@kernel.org; Wed, 16 Jun 2021 07:21:01 +0000
Received: by mail-ed1-f71.google.com with SMTP id q7-20020aa7cc070000b029038f59dab1c5so493129edt.23
        for <soc@kernel.org>; Wed, 16 Jun 2021 00:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ell4BUrMgrtyqS9cInjZM3Ta31GxY1IGr3t7oJoqWfg=;
        b=uXYQflPl9YSNcQPabwTHjH52mclHQRbBvBHYw7gs9fzT/qXpNOAOYpw94gD0hG5p3v
         V8xDvUqIYeoqtpfBSvKhnRPfsrCces+A2KGmqAe4s9l/3KY+T4TV8rU85ANxO1YcDi2X
         bm1Z+q72Cco8nXSFTK+UvaRYmOkNh0RViR1jBCy4BuYut5slZYNVe8h6S9tGauiW/BMh
         uUwejGn8rBOqHkY70L+/ly4XQzoFWO8FhgKd5LXSkqviswC+dbHyo52Z2VyKHFoQf2SW
         2gDasT3MlNldae3HT4bowhJ6JI8Bo6cSIqQwMNYBW0+mp/OAT9wMZOPcPXOz6a4wS9+V
         a5Tw==
X-Gm-Message-State: AOAM530lSdU4NmJLuCVVo6dWBMkpGPF01CnYcmdyml5msY7xkt8lEqDB
	hCgfUix45m1XSADugt5myQiyC6ku0MfayMuwozsEvF6s9G3ic+dECveRsWNQomvKTP1UgOEG8Yc
	qmSiO82q+4T8PdlK4RhBib8Q=
X-Received: by 2002:a05:6402:268f:: with SMTP id w15mr2494856edd.228.1623828061026;
        Wed, 16 Jun 2021 00:21:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu59bTqQn9pskrd9dMesPi7L+ZDLenz9d/Rj/sOcSccmFSIJklIVlV/auiJJpqq9BuqUTH7g==
X-Received: by 2002:a05:6402:268f:: with SMTP id w15mr2494832edd.228.1623828060690;
        Wed, 16 Jun 2021 00:21:00 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id x13sm978468ejj.21.2021.06.16.00.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 00:21:00 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra for v5.14, part two
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>
References: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
 <20210615154155.GE11724@lx2k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f4f3762d-7036-15fd-2f05-fcd617634aef@canonical.com>
Date: Wed, 16 Jun 2021 09:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615154155.GE11724@lx2k>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15/06/2021 17:41, Olof Johansson wrote:
> Hi,
> 
> 
> On Mon, Jun 14, 2021 at 09:52:00PM +0200, Krzysztof Kozlowski wrote:
>> Hi Arnd and Olof,
>>
>> Tegra got quite big rework this cycle.  The last piece comes from Thierry,
>> however it depends on one patch in Will's tree.  Since the last Thierry's
>> patches depend both on that one patch and other memory controller drivers
>> changes, they are here.
>>
>> Best regards,
>> Krzysztof
> 
> So, this pull request is a bit weird. It contains a lot more than what the
> email indicates:
> 
>> The following changes since commit 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a:
>>
>>   memory: tegra: Implement SID override programming (2021-06-03 21:50:43 +0200)
> 
> This seems to be a patch in the middle of the new material in your branch, not
> the start of what we already have in our tree.
> 
> As a result, the diffstat when we merge looks completely different. While
> I generally trust you to not try to squeeze in material under the radar, it's
> also unfortunately making it hard to double-check that you didn't accidentally
> bring in something you didn't mean to.
> 
> So, before I merge this.. can you confirm, or even better generate a full pull
> request summary/diffstat/pull request email that shows the full new material?

There should be nothing hidden and I created this pull request on top of
my previous Tegra one:
"[GIT PULL] memory: Tegra memory controller for v5.14"
https://lore.kernel.org/lkml/20210607084910.21024-1-krzysztof.kozlowski@canonical.com/

I had impression you pulled that in, but now I don't see the such branch
in the soc tree. Maybe that's the answer - the earlier material was never in?

Anyway, before is the full diffstat of that branch so:
tags/memory-controller-drv-tegra-5.14 + tags/memory-controller-drv-tegra-5.14-2

However I think it is still good to pull
tags/memory-controller-drv-tegra-5.14 first, so the tag-message won't
get lost. That tag-message was also explaining why there is a pull from
Thierry (with clock and regulator).
The second pull does not mention earlier material.

=====

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14-2

for you to fetch changes up to 2c1bc371268862a991a6498e1dddc8971b9076b8:

  iommu/arm-smmu: Use Tegra implementation on Tegra186 (2021-06-11 08:44:53 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Tegra SoC, part two

Second set of changes for Tegra SoC memory controller drivers,
containing patchset from Thierry Reding:

"The goal here is to avoid early identity mappings altogether and instead
postpone the need for the identity mappings to when devices are attached
to the SMMU. This works by making the SMMU driver coordinate with the
memory controller driver on when to start enforcing SMMU translations.
This makes Tegra behave in a more standard way and pushes the code to
deal with the Tegra-specific programming into the NVIDIA SMMU
implementation."

This pulls a dependency from Will Deacon (ARM SMMU driver) and contains
further ARM SMMU driver patches to resolve complex dependencies between
different patchsets.  The pull from Will contains only one patch
("Implement ->probe_finalize()").  Further work in Will's tree might
depend on this patch, therefore patch was applied there.

On the other hand, this ("Implement ->probe_finalize()") patch is also a
dependency for ARM SMMU driver changes for Tegra.  These changes,
bringing seamless transition from the firmware framebuffer to the OS
framebuffer, depend on earlier Tegra memory controller driver patches.

----------------------------------------------------------------
Dan Carpenter (1):
      memory: tegra: Delete dead debugfs checking code

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

Krzysztof Kozlowski (2):
      Merge tag 'tegra-for-5.14-memory' of https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into for-v5.14/tegra-mc
      Merge branch 'for-thierry/arm-smmu' of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux into for-v5.14/tegra-mc

Thierry Reding (21):
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
      iommu/arm-smmu: Implement ->probe_finalize()
      dt-bindings: arm-smmu: Add Tegra186 compatible string
      iommu/arm-smmu: tegra: Detect number of instances at runtime
      iommu/arm-smmu: tegra: Implement SID override programming
      iommu/arm-smmu: Use Tegra implementation on Tegra186

 .../devicetree/bindings/iommu/arm,smmu.yaml        |   11 +-
 drivers/clk/tegra/clk-periph-gate.c                |   80 +-
 drivers/clk/tegra/clk-periph.c                     |   11 +
 drivers/clk/tegra/clk-pll.c                        |   12 +-
 drivers/clk/tegra/clk-tegra-periph.c               |    6 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           |   16 +-
 drivers/clk/tegra/clk-tegra20.c                    |    6 +-
 drivers/clk/tegra/clk-tegra30.c                    |    6 +-
 drivers/clk/tegra/clk.h                            |    4 -
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c         |    3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c       |   90 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |   13 +
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |    1 +
 drivers/iommu/tegra-smmu.c                         |   16 +-
 drivers/memory/tegra/Kconfig                       |   18 +-
 drivers/memory/tegra/Makefile                      |    6 +-
 drivers/memory/tegra/mc.c                          |  321 ++--
 drivers/memory/tegra/mc.h                          |   25 +
 drivers/memory/tegra/tegra114.c                    | 1245 ++++++++-------
 drivers/memory/tegra/tegra124-emc.c                |    8 +-
 drivers/memory/tegra/tegra124.c                    | 1306 ++++++++-------
 drivers/memory/tegra/tegra186.c                    | 1679 ++++++--------------
 drivers/memory/tegra/tegra194.c                    | 1351 ++++++++++++++++
 drivers/memory/tegra/tegra20-emc.c                 |   52 +-
 drivers/memory/tegra/tegra20.c                     |  110 +-
 drivers/memory/tegra/tegra210-emc-core.c           |    4 -
 drivers/memory/tegra/tegra210.c                    | 1433 +++++++++--------
 drivers/memory/tegra/tegra30-emc.c                 |   56 +-
 drivers/memory/tegra/tegra30.c                     | 1292 ++++++++-------
 drivers/regulator/core.c                           |   23 +
 drivers/soc/tegra/common.c                         |   97 ++
 drivers/soc/tegra/pmc.c                            |    5 -
 drivers/soc/tegra/regulators-tegra20.c             |   75 +-
 drivers/soc/tegra/regulators-tegra30.c             |   75 +-
 include/linux/clk/tegra.h                          |  100 +-
 include/linux/regulator/driver.h                   |    1 +
 include/soc/tegra/common.h                         |   31 +
 include/soc/tegra/fuse.h                           |   20 +-
 include/soc/tegra/mc.h                             |   65 +-
 39 files changed, 5662 insertions(+), 4011 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c




Best regards,
Krzysztof

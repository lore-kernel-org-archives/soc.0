Return-Path: <SRS0=dDY2=FA=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A26C56202
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 17:55:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B1275207BC; Thu, 26 Nov 2020 17:55:12 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F10620665;
	Thu, 26 Nov 2020 17:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F10620665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm1-f68.google.com with SMTP id c198so2886410wmd.0;
        Thu, 26 Nov 2020 09:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+B2qpXSSe1VK6szPqxKjMyjHrtTFIco3Uktbz6wSbPc=;
        b=Flu/Rrf/87oo6vfuJ1Vi9aoxUYjj4o+FrkUgwVvglP/ROCQs0bfQcV/IhQJfDJnASU
         NXRadcm8kkz/4+ycbGWfeRK2Lqyc2kOx/ysuEzKPYcQd9NPB8ZYxS44KUhiIXkII7+nQ
         K9MQY/pqZQ5bx1bpxRJRQDUfUfF45XMO9eQohaSkWD3vou+z3HJzXWp6UAWJFfODSYeE
         9tb01finYOhJbUAD2hZePzSGaqpmwmexPAwJWjzspaoicqqCwhdBsScSyZoUpbpn+oTP
         gqMpXKh+9SXhW/x0vlU3DAJv6PAJgx5Nw/cxfocye/gYAxtRhXEGq9DQI644lgwcu87p
         5glA==
X-Gm-Message-State: AOAM533/ZizhkTOIHmFz07uiirBo4vQLwFJj54AgqzJVzk/PnN5t56M8
	2wczszm/CB9uQ+FkdcVVxb4=
X-Google-Smtp-Source: ABdhPJxdqeeFF3GQ07Ymhm8mPAEDRus4YWpvcNVdxkP+yMCt83rXm7N2Vc2ZYGWOluYgj6uwL+WO2g==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr4446907wms.111.1606413310395;
        Thu, 26 Nov 2020 09:55:10 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k16sm10387010wrl.65.2020.11.26.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:55:09 -0800 (PST)
Date: Thu, 26 Nov 2020 18:55:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [GIT PULL 2/2] memory: tegra for v5.11
Message-ID: <20201126175507.GA17085@kozik-lap>
References: <20201125184529.5392-1-krzk@kernel.org>
 <20201125184529.5392-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201125184529.5392-2-krzk@kernel.org>

On Wed, Nov 25, 2020 at 07:45:29PM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> The Tegra memory controllers work was big enough to get its own branch and tag.
> It also includes few SoC and clock patches, which I shared externally via a
> stable tag to devfreq tree.
> 
> The work is not yet finished, so more patches from Dmitry will be coming.
> However I want to flush my queue now.

Hi Arnd and Olof,

Please ignore this pull. Only this one. The 1/2 is good.

Thierry pointed out that include/dt-bindings patches are not used by
drivers but are a requisite for DTS patches. I'll send a fixed pull
request for 2/2.

Best regards,
Krzysztof


> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.11
> 
> for you to fetch changes up to e45b57df4b9e9f8b5df7553a9a001acd9cae1b5d:
> 
>   memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe (2020-11-23 17:28:48 +0100)
> 
> ----------------------------------------------------------------
> Memory controller drivers for v5.11 - Tegra SoC
> 
> There is a bigger work from Dmitry Osipenko around Tegra SoC memory
> controller drivers, mostly towards adding interconnect support and
> integration with devfreq.  This work touches all Tegra memory controller
> drivers and also few other SoC-related parts.  It's not yet finished but
> the intermediate stage seems ready to merge.
> 
> Beside that Tegra 210 memory controller got few fixes and received new
> swgroups (work of Nicolin Chen).
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (35):
>       dt-bindings: memory: tegra20: emc: Correct registers range in example
>       clk: tegra: Export Tegra20 EMC kernel symbols
>       soc/tegra: fuse: Export tegra_read_ram_code()
>       soc/tegra: fuse: Add stub for tegra_sku_info
>       dt-bindings: memory: tegra20: emc: Document nvidia, memory-controller property
>       dt-bindings: memory: tegra20: mc: Document new interconnect property
>       dt-bindings: memory: tegra20: emc: Document new interconnect property
>       dt-bindings: memory: tegra20: emc: Document OPP table and voltage regulator
>       dt-bindings: memory: tegra30: mc: Document new interconnect property
>       dt-bindings: memory: tegra30: emc: Document new interconnect property
>       dt-bindings: memory: tegra30: emc: Document OPP table and voltage regulator
>       dt-bindings: memory: tegra124: mc: Document new interconnect property
>       dt-bindings: memory: tegra124: emc: Document new interconnect property
>       dt-bindings: memory: tegra124: emc: Document OPP table and voltage regulator
>       dt-bindings: tegra30-actmon: Document OPP and interconnect properties
>       dt-bindings: host1x: Document new interconnect properties
>       dt-bindings: memory: tegra20: Add memory client IDs
>       dt-bindings: memory: tegra30: Add memory client IDs
>       dt-bindings: memory: tegra124: Add memory client IDs
>       memory: tegra: Add and use devm_tegra_memory_controller_get()
>       memory: tegra: Use devm_platform_ioremap_resource()
>       memory: tegra: Remove superfluous error messages around platform_get_irq()
>       memory: tegra: Add missing latency allowness entry for Page Table Cache
>       memory: tegra-mc: Add interconnect framework
>       memory: tegra20-emc: Make driver modular
>       memory: tegra20-emc: Continue probing if timings are missing in device-tree
>       memory: tegra20: Support interconnect framework
>       memory: tegra: Correct stub of devm_tegra_memory_controller_get()
>       memory: tegra20-emc: Use dev_pm_opp_set_clkname()
>       memory: tegra20-emc: Factor out clk initialization
>       memory: tegra20-emc: Remove IRQ number from error message
>       memory: tegra20-emc: Add devfreq support
>       memory: tegra30: Add FIFO sizes to memory clients
>       memory: tegra30-emc: Make driver modular
>       memory: tegra30-emc: Continue probing if timings are missing in device-tree
> 
> Krzysztof Kozlowski (1):
>       Merge branch 'for-v5.11/tegra-soc-clk' into HEAD
> 
> Nathan Chancellor (1):
>       memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe
> 
> Nicolin Chen (5):
>       memory: tegra: Correct la.reg address of seswr
>       memory: tegra: Correct tegra210_mc_clients def values
>       memory: tegra: Sort tegra210_swgroups by reg address
>       dt-bindings: memory: tegra: Add missing swgroups
>       memory: tegra: Complete tegra210_swgroups
> 
>  .../bindings/arm/tegra/nvidia,tegra30-actmon.txt   |  25 +
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  68 +++
>  .../memory-controllers/nvidia,tegra124-emc.yaml    |  19 +
>  .../memory-controllers/nvidia,tegra124-mc.yaml     |   5 +
>  .../memory-controllers/nvidia,tegra20-emc.txt      |  22 +-
>  .../memory-controllers/nvidia,tegra20-mc.txt       |   3 +
>  .../memory-controllers/nvidia,tegra30-emc.yaml     |  18 +
>  .../memory-controllers/nvidia,tegra30-mc.yaml      |   5 +
>  drivers/clk/tegra/clk-tegra20-emc.c                |   3 +
>  drivers/memory/tegra/Kconfig                       |   9 +-
>  drivers/memory/tegra/mc.c                          | 155 +++++-
>  drivers/memory/tegra/mc.h                          |  22 +
>  drivers/memory/tegra/tegra114.c                    |   6 +
>  drivers/memory/tegra/tegra124-emc.c                |  22 +-
>  drivers/memory/tegra/tegra124.c                    |   6 +
>  drivers/memory/tegra/tegra20-emc.c                 | 528 +++++++++++++++++++--
>  drivers/memory/tegra/tegra20.c                     |  77 +++
>  drivers/memory/tegra/tegra210-emc-core.c           |  39 +-
>  drivers/memory/tegra/tegra210.c                    |  60 ++-
>  drivers/memory/tegra/tegra30-emc.c                 |  73 ++-
>  drivers/memory/tegra/tegra30.c                     |  72 +++
>  drivers/soc/tegra/fuse/tegra-apbmisc.c             |   2 +
>  include/dt-bindings/memory/tegra124-mc.h           |  68 +++
>  include/dt-bindings/memory/tegra20-mc.h            |  53 +++
>  include/dt-bindings/memory/tegra210-mc.h           |  10 +
>  include/dt-bindings/memory/tegra30-mc.h            |  67 +++
>  include/soc/tegra/fuse.h                           |   4 +
>  include/soc/tegra/mc.h                             |  27 ++
>  28 files changed, 1299 insertions(+), 169 deletions(-)

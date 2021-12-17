Return-Path: <SRS0=mL40=RC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D1EC433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C18C6C36AE9; Fri, 17 Dec 2021 16:23:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E35C6C36AE1;
	Fri, 17 Dec 2021 16:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E35C6C36AE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id t18so5020299wrg.11;
        Fri, 17 Dec 2021 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yisB2sBDYOOSNkfBetYak0Yx/DrETgULS8zG4daqePQ=;
        b=OMDj0tnPFCx7rdJ4n66c7jwfbEV5TbGi/2QsuYunV38JZhWQ9WIVhjFjylIr45saeH
         JGDr9dmD5/l7Ed4wv0oo2riAAt32c+Z0Rv3UraHtnwbO+VlHzaoRbrPyRdpEXxjGuzuP
         gyFXPIfu+BLWjrSWOmDFVjaRUZlMuXDcWRXe1pYgIPNAPQCH3LVmps07Ii9DmLI6u3H+
         znHJ6hTWQ2twmZMv8XtC+/cUcjc9gYOAo/3yYt1cRw8j7Wx1Z4jwqzTtWOcKcHZu8HTE
         a9Mw4bE8h8z4iKpsjHiIpBEM6y7VCZ2M77K8uR8P/T2fyLdeHd6BoXlqZ5y0dMck6trR
         6q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yisB2sBDYOOSNkfBetYak0Yx/DrETgULS8zG4daqePQ=;
        b=eMx5RPLCPmlsWHfvzE87egtv4ckn4AZLPf/aZD7EpVzp8MBfwJM0c10MwDSXR8KVnt
         LjPnWPOkaqjH9ChX58pKr9/z1edoD2PuIgJl1TnmkaEqd88pRSrUQ7j/a2kRCeyl+vKV
         W1oAgG1PbuaaD0w3zQZBwluVB642woRBx5BWsIAAHvrEzjdvwJECfNWDSVJoTRow1tmC
         Eg51I/vwbxKe17AyCGT1Gtr2tss3R8eWDWvOYAG1oR82ujlWijP6wDZUWIM9G9jQ4yGk
         vPcI5yzHm5bZgjoKtpuNNCxk1rnjey9taFkwGVPB9+zGWMS53Lz3akJPcEZTgxwoWCcW
         q2Ow==
X-Gm-Message-State: AOAM531hAaDhKguu6in1QfAl7HMMdUiAAWAoAYmwvz25M6xKIr+NisyM
	XT0R2eSJutKRkc1as0VezmvTTRNH1pzvZw==
X-Google-Smtp-Source: ABdhPJydA+0Y50jNwlA466rohG9flJZ+NbDOIQaS9J4G5uwRNEiqf6zwCDo7tNvSoUPZPqBx1tSmQg==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr3104681wrh.276.1639758182735;
        Fri, 17 Dec 2021 08:23:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g198sm8978790wme.23.2021.12.17.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:23:02 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] arm64: tegra: Device tree changes for v5.17-rc1
Date: Fri, 17 Dec 2021 17:22:51 +0100
Message-Id: <20211217162253.1801077-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm64-dt

for you to fetch changes up to 914ed1f56581f99094035f1cc989ab4498104e94:

  arm64: tegra: Add host1x hotflush reset on Tegra210 (2021-12-17 14:58:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.17-rc1

The vast majority of this contains various updates and cleanups to the
Tegra device trees that will eventually help validate all of them using
the dt-schema infrastructure.

Another notable chunk of this contains additional Tegra234 support as
well as support for the new Jetson AGX Orin Developer Kit.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
      arm64: tegra: Add ISO SMMU controller for Tegra194
      arm64: tegra: Add dma-coherent for Tegra194 VIC

Mikko Perttunen (6):
      dt-bindings: Update headers for Tegra234
      arm64: tegra: Add clock for Tegra234 RTC
      arm64: tegra: Update Tegra234 BPMP channel addresses
      arm64: tegra: Fill in properties for Tegra234 eMMC
      arm64: tegra: Add Tegra234 TCU device
      arm64: tegra: Add NVIDIA Jetson AGX Orin Developer Kit support

Prathamesh Shete (2):
      arm64: tegra: Add support to enumerate SD in UHS mode
      arm64: tegra: Update SDMMC4 speeds for Tegra194

Thierry Reding (40):
      dt-bindings: memory: tegra: Update for Tegra194
      dt-bindings: memory: tegra: Add Tegra234 support
      Merge tag 'tegra-for-5.17-dt-bindings-memory' into for-5.17/arm64/dt
      arm64: tegra: Fixup SYSRAM references
      arm64: tegra: Add main and AON GPIO controllers on Tegra234
      arm64: tegra: Describe Tegra234 CPU hierarchy
      arm64: tegra: Rename top-level clocks
      arm64: tegra: Rename top-level regulators
      arm64: tegra: Add native timer support on Tegra186
      arm64: tegra: Fix unit-addresses on Norrin
      arm64: tegra: Remove unsupported properties on Norrin
      arm64: tegra: Fix compatible string for Tegra132 timer
      arm64: tegra: Add OPP tables on Tegra132
      arm64: tegra: Fix Tegra132 I2C compatible string list
      arm64: tegra: Drop unused AHCI clocks on Tegra132
      arm64: tegra: Sort Tegra132 XUSB clocks correctly
      arm64: tegra: Rename thermal zones nodes
      arm64: tegra: Rename power-monitor input nodes
      arm64: tegra: Fix Tegra186 compatible string list
      arm64: tegra: Adjust length of CCPLEX cluster MMIO region
      arm64: tegra: Drop unit-address for audio card graph endpoints
      arm64: tegra: Use JEDEC vendor prefix for SPI NOR flash chips
      arm64: tegra: Drop unsupported nvidia,lpdr property
      arm64: tegra: Fix Tegra194 HSP compatible string
      arm64: tegra: Drop unused properties for Tegra194 PCIe
      arm64: tegra: Remove undocumented Tegra194 PCIe "core_m" clock
      arm64: tegra: Rename TCU node to "serial"
      arm64: tegra: Remove unsupported regulator properties
      arm64: tegra: Rename GPIO hog nodes to match schema
      arm64: tegra: jetson-tx1: Remove extra PLL power supplies for PCIe and XUSB
      arm64: tegra: smaug: Remove extra PLL power supplies for XUSB
      arm64: tegra: jetson-nano: Remove extra PLL power supplies for PCIe and XUSB
      arm64: tegra: Add missing TSEC properties on Tegra210
      arm64: tegra: Sort Tegra210 XUSB clocks correctly
      arm64: tegra: Remove unused only-1-8-v properties
      arm64: tegra: Rename Ethernet PHY nodes
      arm64: tegra: Add EMC general interrupt on Tegra194
      arm64: tegra: Add memory controller on Tegra234
      arm64: tegra: Hook up MMC and BPMP to memory controller
      arm64: tegra: Add host1x hotflush reset on Tegra210

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  98 +++-
 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  36 +-
 .../boot/dts/nvidia/tegra132-peripherals-opp.dtsi  | 426 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  48 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  20 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  20 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  32 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  95 +++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  12 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  20 +-
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 231 +++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   3 -
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  37 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |  40 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  53 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  22 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  27 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  24 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  24 +
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   5 +
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |   1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 541 ++++++++++++++++++++-
 include/dt-bindings/clock/tegra234-clock.h         |  26 +-
 include/dt-bindings/memory/tegra234-mc.h           |  32 ++
 include/dt-bindings/reset/tegra234-reset.h         |  12 +-
 31 files changed, 1606 insertions(+), 298 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h

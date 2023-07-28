Return-Path: <SRS0=sj+x=DO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C380C41513
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22E3EC433C8; Fri, 28 Jul 2023 09:41:39 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19A2FC433C7;
	Fri, 28 Jul 2023 09:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19A2FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so2751055a12.3;
        Fri, 28 Jul 2023 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537296; x=1691142096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hg9uRA7ZWqARyiSAN0CUxk5gUO5+BhSuRdsdA7nhVQ=;
        b=UZy92RmN0e3+jx8nUFEodC8imGOg7lfqPeoG0hmAUsNF+aucVc1I8S9gB5s2nUCMzm
         +mR4afVPS9ym4bEkTz4eghXQKmXhp+Mqk9xV0jRZJdQPqVpHB563kLAf8wFf1L6ptejV
         mNsbR2lWpD2ANYGHonnSBRO9GY8dAH2M+5qG20fiT8Ws3rYAjYJmSSXFfaNNLinIpydl
         cjc2/pvR74E3w9lVnq2d2LPjrIugAsKM5V6ht3oCsVpjnv4r4X5+Rk7J4n5xOa0tUBh9
         0B3tc0t4WLWJcg5kne3X6Ck5Lguo6cMvQhYmHolnE5Yc9b6JFoRRat6vfD4RwZOQUBiT
         qQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537296; x=1691142096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Hg9uRA7ZWqARyiSAN0CUxk5gUO5+BhSuRdsdA7nhVQ=;
        b=f+0s7HDnD2mY8KomL036X+THBjpmJ7u7yovi/WO1oeJHtNk9QmkFg0O1Z1d08eRjVl
         8fl0NYugzT2wr0ZlSqqPY7drvfp7pbElJWc+8i3fiiEIrEVed+w5bCjDP8X4dUR2CvX4
         j3+vOJASmOTECZsGFWIK5DaKuBFOn+dneIyY1YUPWqNVgKFpSGsqz1E5lVLUW9Hg75mx
         x/kk9jL2V26PfsQDzlXNbKdIDe3sdupNk8wOTDfBudDXcunPIJf1hjF7WV547q5kKLzS
         5CJWZMQBrX5QjITLbjFU9QM3Wsd2yWRItdL3BRr9lsyfsRT5pyUIy/lIucC3k77rim8g
         CchA==
X-Gm-Message-State: ABy/qLalxFnI3d8JfNUVxgYN2Pxqx/Cnv6UmostoRq9eJfSsbkSx7+/7
	zpCDtClAjxIMskr1eRFIEUPr047GFaI=
X-Google-Smtp-Source: APBJJlEH8f/baV6q50+6Wd3WlHPcRrYf4GTRbjv+G8XFtyDh9IU5L7K0aik3s/yu82C036S7r1gHtg==
X-Received: by 2002:a17:906:8a70:b0:982:1936:ad27 with SMTP id hy16-20020a1709068a7000b009821936ad27mr2018053ejc.11.1690537295814;
        Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b00992a8a54f32sm1835004ejx.139.2023.07.28.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v6.6-rc1
Date: Fri, 28 Jul 2023 11:41:28 +0200
Message-ID: <20230728094129.3587109-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728094129.3587109-1-thierry.reding@gmail.com>
References: <20230728094129.3587109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-arm64-dt

for you to fetch changes up to d7fb6468ec9f18db52ef3c84eb44a9025021c830:

  arm64: tegra: Add blank lines for better readability (2023-07-27 16:48:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.6-rc1

The majority of this is fixes all over the place for DT schema
validation warnings. However, there are also cleanups for some things in
DT and audio support is added on IGX Orin. Jetson Orin NX and Nano also
gain a new thermal trip point to help keep the device cool at moderate
loads.

----------------------------------------------------------------
Artur Weber (1):
      arm64: tegra: Adapt to LP855X bindings changes

Diogo Ivo (1):
      arm64: tegra: Fix HSUART for Smaug

Gautham Srinivasan (3):
      arm64: tegra: Add UARTE device tree node on Tegra234
      arm64: tegra: Enable UARTA and UARTE for Orin Nano
      arm64: tegra: Add SPI device tree nodes for Tegra234

Jon Hunter (2):
      arm64: tegra: Add missing alias for NVIDIA IGX Orin
      arm64: tegra: Fix HSUART for Jetson AGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Drop incorrect maxim,disable-etr on Smaug

Mohan Kumar (1):
      arm64: tegra: Add audio support for IGX Orin

Sameer Pujar (1):
      arm64: tegra: Update AHUB clock parent and rate

Sheetal (1):
      arm64: tegra: Update AHUB clock parent and rate on Tegra234

Shubhi Garg (1):
      arm64: tegra: Add PCIe and DP 3.3V supplies

Sumit Gupta (1):
      arm64: tegra: Update CPU OPP tables

Thierry Reding (9):
      arm64: tegra: Sort PCI nodes correctly on Orin
      arm64: tegra: Remove duplicate PCI nodes
      arm64: tegra: Add 35°C trip point for Jetson Orin NX/Nano
      arm64: tegra: Remove dmas and dma-names for debug UART
      arm64: tegra: smaug: Remove reg-shift for high-speed UART
      arm64: tegra: Remove current-speed for SBSA UART
      arm64: tegra: Add missing reset-names for Tegra HS UART
      arm64: tegra: Remove {clock,reset}-names from VIC powergate
      arm64: tegra: Add blank lines for better readability

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |    3 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    3 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |    6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |    5 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |    5 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |    1 +
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi |    1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 1991 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 2121 +-------------------
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   41 +
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |  178 +-
 .../arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi |   78 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |    8 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |   66 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  |    7 +-
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |   27 +-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |    2 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  387 +++-
 23 files changed, 2705 insertions(+), 2235 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi

Return-Path: <SRS0=d2Xh=TI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148A7C4332F
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F16F0C340F4; Fri, 25 Feb 2022 16:47:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46915C340F0;
	Fri, 25 Feb 2022 16:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46915C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id j22so5341810wrb.13;
        Fri, 25 Feb 2022 08:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TaiciRnsDcfgO8GDkMABX+K/SPVvrajOY+9YF54/XGY=;
        b=AHDHm6vMJ27EIWq0Ahmvl5H90BOYatk9+JoEcAqRO1rtNkdcs3/V+ZVrYNa99qSIkY
         V4GBra0cochxuIHTQ4xvCOXb9PHdt6T7sFZKB3kxrPrmZNgJA5wkXDzqO1XKNu7g9yLO
         pmhEVEN0BTZ1h7TDLt0MQvcimhDNzqIlmzpqDdQjM3qh9QkiXnwFzbwmYWwAJB+j5QPe
         5wP3sFbG6uv/LL42GzI0eZSZXYExdtyf6d9Fkgwz9vd0xfyT9XiHCmvOTwdR6Vvg5mBN
         zR5/rA1VzzFXY9hTABxlphzHb8rJ/ZcWJWwclj2mh7+ZcG2+xJLoI3aNwYjgupF6tEaH
         LUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TaiciRnsDcfgO8GDkMABX+K/SPVvrajOY+9YF54/XGY=;
        b=MEJ+Mi3rWTy348l9ZKESBa/dCjYpbujVLAnzmfEJZNeqiyhnQVRTu4eXA4XqsbhOBh
         rFA4q+XGbxmVCj3T95I46poqZg67voaHyy0M+VqIMjRc5uSQvOqasBdMerNX39i7bPqK
         /jWrvYu+IxsbwK+cU2bN3y/qpD1Fgbsjn1+ToBemHDO7+6ENhGeB2xaVlFVe6F0U0RWS
         IAvJ07HmRNEx09AIPC9SVsNw0bRAZMJ3UciQZlLyCi72QtT7pxXGVc72aazDy+QD+pkM
         oaCxLjfSOI5K9hyd8zqzTXhwq1e++LtwUTB2uWmr5aTvumP4HMrxEhmoQu0vFKEPkpVZ
         okuA==
X-Gm-Message-State: AOAM532rlGsr84aiXRhWDryu12Lc4HdRM5XS/NknEkBVxDfB6RlmRN2q
	HXVmKYU8VCxVmZgt6NB9D69DKEjBCq8=
X-Google-Smtp-Source: ABdhPJwdkE703MCZOPQXTZdTU06WNy4Hqs3Yk6dpMqRSb01CH3cRNAo02PTsih8+B4fqTfOWDb8YeQ==
X-Received: by 2002:a5d:55d0:0:b0:1ed:bda2:4e11 with SMTP id i16-20020a5d55d0000000b001edbda24e11mr6706741wrw.6.1645807673083;
        Fri, 25 Feb 2022 08:47:53 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b001edc107e4f7sm4037270wrq.81.2022.02.25.08.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] arm64: tegra: Device tree changes for v5.18-rc1
Date: Fri, 25 Feb 2022 17:47:40 +0100
Message-Id: <20220225164741.1064416-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm64-dt

for you to fetch changes up to f0a481209d6fa70854673173bf5f8a1cb24bd7f2:

  arm64: tegra: Drop arm,armv8-pmuv3 compatible string (2022-02-25 14:40:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.18-rc1

Based on the for-5.18/dt-bindings changes, this adds various new
features on Tegra234 such as IOMMU, audio, gpio-keys, I2C and PWM
support.

Device trees for 64-bit Tegra boards are now also built with overlay
support enabled, which allows firmware to apply overlays and customize
the DTB that is passed to the kernel.

There are also a couple of cleanups and additions for older devices,
such as USB device mode support on Jetson Xavier NX.

----------------------------------------------------------------
Akhil R (5):
      dt-bindings: Add headers for Tegra234 I2C
      dt-bindings: Add headers for Tegra234 PWM
      arm64: tegra: Add Tegra234 I2C devicetree nodes
      arm64: tegra: Add Tegra234 PWM devicetree nodes
      arm64: tegra: Add GPCDMA node for tegra186 and tegra194

Jon Hunter (1):
      arm64: tegra: Enable device-tree overlay support

Mohan Kumar (3):
      dt-bindings: Add HDA support for Tegra234
      dt-bindings: Document Tegra234 HDA support
      arm64: tegra: Add HDA device tree node for Tegra234

Sameer Pujar (3):
      dt-bindings: Add Tegra234 APE support
      arm64: tegra: Add audio devices on Tegra234
      arm64: tegra: APE sound card for Jetson AGX Orin

Thierry Reding (5):
      Merge branch 'for-5.18/dt-bindings' into for-5.18/arm64/dt
      arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit
      arm64: tegra: Add Tegra234 IOMMUs
      arm64: tegra: Move audio IOMMU properties to ADMAIF node
      arm64: tegra: Drop arm,armv8-pmuv3 compatible string

Vidya Sagar (3):
      dt-bindings: Add Tegra234 PCIe clocks and resets
      dt-bindings: power: Add Tegra234 PCIe power domains
      dt-bindings: memory: Add Tegra234 PCIe memory

Wayne Chang (1):
      arm64: tegra: Enable Jetson Xavier NX USB device mode

kartik (1):
      arm64: tegra: Enable UART instance on 40-pin header

 .../bindings/sound/nvidia,tegra30-hda.yaml         |    3 +
 arch/arm64/boot/dts/nvidia/Makefile                |   11 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   46 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   25 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   54 +-
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 1824 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 1010 +++++++++++
 include/dt-bindings/clock/tegra234-clock.h         |  135 +-
 include/dt-bindings/memory/tegra234-mc.h           |   75 +
 include/dt-bindings/power/tegra234-powergate.h     |   22 +
 include/dt-bindings/reset/tegra234-reset.h         |   45 +-
 11 files changed, 3239 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h

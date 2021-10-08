Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4A2C433FE
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 71DDF610E5; Fri,  8 Oct 2021 20:11:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4956B60F93;
	Fri,  8 Oct 2021 20:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4956B60F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id r10so33084023wra.12;
        Fri, 08 Oct 2021 13:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
        b=jNAIOVRVou5pRLaLljnHnuuDcM+O8yh7ViN38/lGI4LU8NdL4usiHkE/sSjz1iahDL
         dZhz8MHiLg0dk33XZ0lh9z2FmjgAW7NUMSH4Dvgoarka10VUwCOBakAzmod++EacZuqi
         L6M6DImyN4aMlzbNN10s/PM5ZEjN96TqqJ0P0IyJA8UKBi6u/3iZ2kcjcmfSirYlDfig
         gacwMgq3XurCP7LxsfBOobR0sksyMpjT0FB6SD9HxtzLGf96VkGn21/qDnbrpkjL7JGA
         BB98ZPBSPlNTboITjzsiamrIGKkWLYwpd9dlyLWnbsydlPYed0TUS/v7QV1vWNbYZQSO
         twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJBkgInhT6PLCmAU8FT+r7FUkf+LpzjWJN55V3vRhsM=;
        b=jsvROC4m4ZZX1Q81kYzzTeJY+b1fobk2w+XkYRXvA2kDyNwJq5b8zBrqdpgFsxG7yR
         P14P6L5ccaJiMPXg4iUhavWxY8DAjPIWWIrCeUtRmqcjo2tx7/wQWLmKspsHLTh+FWuB
         jI/a8aUV6my7fVDPK5sFesOz0Dgq3hUFsFFXke9y80kWYrBfGCqZu2WmpvCAHxGNJ48O
         v9VoDM5wTWr/dUDiRW8L/U0ehCIIXgdbUQJk/MYZiQQnr94kbUFBIkgQFtHySqpvpuYJ
         D7ndu7q0syxtZf7SIT45OwXwhLN+rxBt6tLRJBrOC9H7o2xKsmGZNLenusdSqnpOeOkl
         zhyA==
X-Gm-Message-State: AOAM532BvLtOhS4Sn3iQY5kAjWhYcXd89FLgJAGfkgKz7DwXMQHzTTGI
	B5bMJAZ8gKwi50RZNsq9WrTvdPVJ/hY=
X-Google-Smtp-Source: ABdhPJyCi6SYxdSoPHScuvGYOUYb3kBIEa8OHcQM2/3o2YR/dtdUGf7iinL4/1CLgqhr0PiwSX6cCA==
X-Received: by 2002:a7b:c8d1:: with SMTP id f17mr5776836wml.35.1633723905379;
        Fri, 08 Oct 2021 13:11:45 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s14sm281313wro.76.2021.10.08.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:44 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:31 +0200
Message-Id: <20211008201132.1678814-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm64-dt

for you to fetch changes up to b9e2404c8bb280e0b7cbf1c2e9b491baab107137:

  arm64: tegra: Fix pcie-ep DT nodes (2021-10-07 21:23:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.16-rc1

This enables additional interrupts on the Tegra194 GPIO controller for
better load balancing and/or virtualization, adds audio support on
Jetson TX2 NX, enables the NVDEC video decoder on Tegra186 and later and
enables more audio processors that are found on Tegra210 and later.

Various cleanups across the board top things off.

----------------------------------------------------------------
David Heidelberg (1):
      arm64: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (1):
      arm64: tegra: Add new USB PHY properties on Tegra132

Mauro Carvalho Chehab (1):
      arm64: tegra: Fix pcie-ep DT nodes

Mikko Perttunen (1):
      arm64: tegra: Add NVDEC to Tegra186/194 device trees

Sameer Pujar (4):
      arm64: tegra: Audio graph sound card for Jetson TX2 NX
      arm64: tegra: Update HDA card name on Jetson TX2 NX
      arm64: tegra: Add few AHUB devices for Tegra210 and later
      arm64: tegra: Extend APE audio support on Jetson platforms

Thierry Reding (1):
      arm64: tegra: Remove useless usb-ehci compatible string

pshete (1):
      arm64: tegra: Add additional GPIO interrupt entries on Tegra194

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    2 -
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   12 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1244 +++++++++++++++++++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  506 +++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  136 +++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1243 ++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1246 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  209 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 ++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   81 +-
 11 files changed, 6416 insertions(+), 15 deletions(-)

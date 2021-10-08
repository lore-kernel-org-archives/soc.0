Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CECC4332F
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C59DB61019; Fri,  8 Oct 2021 20:11:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D03060F93;
	Fri,  8 Oct 2021 20:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D03060F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id m22so33181718wrb.0;
        Fri, 08 Oct 2021 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
        b=qrHEyjZyO2e45qwd0XdaUIYhv+hUXOcwbsFQhJU9Wtcp8uP11nBRBOhSpCmpBZfQTg
         iy4stduEugSUQM83ajywaXEyFoD+anZYXAgDjs3ys8/ToCfJ3fXJ18LEMl6f1CURBMOo
         F17yA8CFqD/JEJHYWN2hODJy0Zoi5rllvoB2SaR7eWJdXppS0qNhUawk8hx72sgYlXZ4
         M1+u1gXp4eVsImi4xOh2z88q2j0nwIpmWtBpyUrjVupEX3iY5CcG5cDe3KkIQ2NxtzqO
         7feSky/t16fkRF9RDW/gPu863nRnY+rw6u65aPBgfR93ko9BUMywzqR9qV/2tGyOqobu
         DWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
        b=FSA31M7LbvIOex3M6KX0+KJjnkNZtgKKmDoJ28fdLcXMlKgGIjMxf7dISr6W1SX2Eu
         wfL+76PIKqDGNLR2l50EJgv5ViO5guu41nf9CnBRFUiotvD9HbNEc7Pqg97V0emqjU8N
         P+0CmuGobnczXTMKfifJJ8zhP3m+Du7vfvAHss6Z6Jk8IhzDOrW4Lvc+dD+xFcnQ3XK+
         z0ran9qsouNgwBwTtJSpiqN6gi0CYcBbSCEeGyGJf8479kiyzjLViocp2Ip+Qg8CBOWf
         yYeT/DNWB0x00cwaER1U5MjZA8uaZdWry1x/MlII2p3ob2tLAz1YDU1Bf9UkLDNHyd+5
         zXuA==
X-Gm-Message-State: AOAM531QCm5FZGLzOquW4/Ie3qus4IqZnENOUz/zgW6mMeGbXtP5MZfZ
	M5tMGxld2BQvJSBskkKXba3sjnqIoRY=
X-Google-Smtp-Source: ABdhPJzUdsl+jyJQtzEmc3jeD02XVww5KUUKF1zqP1bw43gWE3PSySMJnKXFuahVkKblKjJhWQBl8w==
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr6896509wra.156.1633723903685;
        Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u24sm12018470wmj.48.2021.10.08.13.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:30 +0200
Message-Id: <20211008201132.1678814-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm-dt

for you to fetch changes up to 96f4adcd888d7ecb17ba5c88c141ed107cedf913:

  ARM: tegra: Remove useless usb-ehci compatible string (2021-10-07 20:59:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.16-rc1

This contains various cleanup patches to 32-bit ARM Tegra device trees
and enables USB OTG mode on the Nexus 7.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
      ARM: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (3):
      ARM: tegra: Update Broadcom Bluetooth device-tree nodes
      ARM: tegra: Add new properties to USB PHY device-tree nodes
      ARM: tegra: nexus7: Enable USB OTG mode

Thierry Reding (1):
      ARM: tegra: Remove useless usb-ehci compatible string

 arch/arm/boot/dts/tegra114.dtsi                    |  8 ++++--
 arch/arm/boot/dts/tegra124.dtsi                    | 12 ++++++---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  7 +++--
 arch/arm/boot/dts/tegra20-paz00.dts                |  2 --
 arch/arm/boot/dts/tegra20.dtsi                     | 13 +++++++---
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 30 +++++++++++++++++++---
 arch/arm/boot/dts/tegra30-ouya.dts                 |  5 +++-
 arch/arm/boot/dts/tegra30.dtsi                     | 12 ++++++---
 8 files changed, 69 insertions(+), 20 deletions(-)

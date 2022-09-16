Return-Path: <SRS0=nkI+=ZT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B93C54EE9
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3480C433C1; Fri, 16 Sep 2022 10:20:11 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E05AAC43470;
	Fri, 16 Sep 2022 10:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E05AAC43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id y17so43336706ejo.6;
        Fri, 16 Sep 2022 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lvWfz5XMCXijTtD7aKm6gLi8utYEMVarSMbjGKxHpZ4=;
        b=SOCYY3oUTJcuAledpJtxqIHVwQyTLCmT8qddWNiuCQOQCw8iw20L26GM3Ium8Aiud6
         cTn6iRz9ZLrl3XW2LJzCcRTEGdapyOjXwwnHsf6ae0KErRZ4j5RvE/HcjUVTSnmWgZlv
         RxVV+ioOGFMEC0FwunEKdg+Uk5W5uzRcXdJ9Mao3Rpq3WMUeja2hmb4cmn/nWh97jjVs
         GcPxxaAspjYfV/iBjkkEi4EkB3ryxachZeV8kQoHkPIeGR5SBZ5EDWwT4lxmYam6iwK8
         AnfF7rz0B53y6da5jgkOmaNDakuCJcF0/Ys0JH/71eYzj5rEfMPhh2WpFPJgOOg8Ga05
         F9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lvWfz5XMCXijTtD7aKm6gLi8utYEMVarSMbjGKxHpZ4=;
        b=j/n78Q5gUMPaU/T/9tu4GyXnsW5Lr8wOvWnvwRjgZed8iIoxKwtgINL9SXCg4AhGqq
         cqPAI0Xx8KT+7HJiZNUvJPNfc4fwicNKTCPfYN55qFSiNO11gwAFkD34Xv8shA/jw4xW
         iV0Tp4skuqvO+WQF03CRTDKz7affrJ3PUcF24V1D0lp/VLKJPzmyTtbXWv/AC4Nl8IKa
         vvvf3Pa5kwU0Tl3DlY7RQXNxJTfXHnhHOhS9nj/fzQotDPgiGrbvH1xiB5vm+HB9wbt8
         fJTQ9ypbSS5dGTLcixEEmfXyIT8K+d9tC39M9aC9SEKRGO/RbbgqM6jM25iQG8JxPlKL
         iBIw==
X-Gm-Message-State: ACrzQf30vY//yuUuFk/15AKS+kLa8yjrKadxPoMReOoqgubnlah241bZ
	XhqgDR3jxyAgmBfl+uSC2weg6Rd9kUQ=
X-Google-Smtp-Source: AMsMyM68DH6bFSZw9QAcddZxF85j5nEpxM+u4fn/qfL17eRXsRnI3DctNl1K87UglMJutF1RBNx0UA==
X-Received: by 2002:a17:906:6a07:b0:77d:f99c:5ab8 with SMTP id qw7-20020a1709066a0700b0077df99c5ab8mr3110804ejc.544.1663323608312;
        Fri, 16 Sep 2022 03:20:08 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b007420aaba67esm10351575eju.36.2022.09.16.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v6.1-rc1
Date: Fri, 16 Sep 2022 12:19:56 +0200
Message-Id: <20220916101957.1635854-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-arm64-dt

for you to fetch changes up to 8e4428051df12f3574b5d7927821c6fb75098d9a:

  arm64: tegra: Add GPCDMA support for Tegra I2C (2022-09-15 21:30:38 +0200)

Note that this also pulls in the changes from the for-6.1/dt-bindings
branch to satisfy build-time (and DT validation) dependencies.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.1-rc1

These changes enable PCI, Ethernet and HDA support on Jetson AGX Orin.
DMA support is enabled for I2C on a number of SoC generations and the
Google Pixel C (a.k.a. Smaug) device receives Bluetooth and Wi-Fi
support.

Other than that this also contains some minor cleanups and fixes.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Add GPCDMA support for Tegra I2C

Bhadram Varka (1):
      dt-bindings: net: Add Tegra234 MGBE

Diogo Ivo (2):
      arm64: dts: tegra: smaug: Add Bluetooth node
      arm64: dts: tegra: smaug: Add Wi-Fi node

Mikko Perttunen (2):
      dt-bindings: Add Host1x context stream IDs on Tegra234
      arm64: tegra: Add context isolation domains on Tegra234

Mohan Kumar (2):
      arm64: tegra: Enable HDA node for Jetson AGX Orin
      arm64: tegra: Add iommus for HDA on Tegra234

Thierry Reding (5):
      Merge branch 'for-6.1/dt-bindings' into for-6.1/arm64/dt
      arm64: tegra: Fix up compatible for Tegra234 GPCDMA
      arm64: tegra: Add MGBE nodes on Tegra234
      arm64: tegra: Enable MGBE on Jetson AGX Orin Developer Kit
      arm64: tegra: Fixup iommu-map property formatting

Vidya Sagar (3):
      arm64: tegra: Add regulators required for PCIe
      arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT
      arm64: tegra: Enable PCIe slots in P3737-0000 board

 .../bindings/net/nvidia,tegra234-mgbe.yaml         |  162 +++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   49 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   49 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   36 +
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |   36 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |   73 ++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 1115 +++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           |   10 +
 8 files changed, 1511 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml

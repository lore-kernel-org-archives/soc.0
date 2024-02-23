Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC42C54E4A
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A38FC3277C; Fri, 23 Feb 2024 17:48:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A378EC433C7;
	Fri, 23 Feb 2024 17:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A378EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so1487491a12.0;
        Fri, 23 Feb 2024 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710536; x=1709315336; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5gnokApRZBLpCTRCXRQsO1BqHcf2N+yhxb11K1iRr0=;
        b=RbiEwW2ofTmDewc75hc112V8NLmCpY0f+cSe5peFWqRdwOHYYfudSEM+DXkDDTUoCC
         xBlOFKqwnNrL57ijeuCfntIsaQn0bd87nwojGHaNwzUKNwJVFA1Kq4Llbw3ZiWpSH2ZH
         pId58sjuSqgm9J5oQJHjVSW/cX7QMRMNhrPvbd41s3ZmoN+P5VP+gnp3oU2bFJWaSM4H
         K863k0uHl5CIPA8Xtp31dpng/hXONzDiY9pYb2pZAyQqEb+4DZwuZGZIJBXpiZ0V4Fbd
         BlT0JpRGxO969ZEKvDHvxELS/TsQ0Qsr9hCLN8PdQqyCFDE9KoTV4wM4wUYsSewktT+g
         WfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710536; x=1709315336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5gnokApRZBLpCTRCXRQsO1BqHcf2N+yhxb11K1iRr0=;
        b=HjNroId7xVfu5EqmnxHXHM3qJZRVRJSSZLOzNGV12guLPpGPEIgyxkk0xScTZQAUMh
         LcE+V5+4+qgmnwZgwclFeAeSXXb+km4D+URzEiZM6lUbcEWyGcuc7j8FEjhgXWqbtM1o
         CnzGHBQ8xHmo9GGIblpYzkExPp4AXGhKRLg47NJnDG/Ha1EV0hXYdGpCt9r1TC4/idU/
         grrN84P3FG1DRlFPQviUMl6ive7fBNsanqL684MNTDCuwO/rgFEjSSm+WiFyjycCWIyd
         C/AzvygKp1HAXIcnkOhckt2jVk4s/s0NoSLcQLSi1fWoPr/YQvunlZ2RCLzhof9oOJT5
         nSWA==
X-Forwarded-Encrypted: i=1; AJvYcCUol0OS+dopudz/CUkl7/GhslObboTP6iS7GHaqBiyYtwah4yoSVVb6647WxFpO7fjK1w4ssRpSiK3Zi9Ipjw==
X-Gm-Message-State: AOJu0Yy4v/ez6gR1uLRfDRdlKb87Guxq9jccjqxec8wfTTvt6ohv92Ls
	av1LnnGtlDK27Yby/eVEze+8RncpmBw6uhKDWhhxZVUQzZ0ROtvRVtmy718v
X-Google-Smtp-Source: AGHT+IFcQ5Y9+WAUxM022fZ14XREgi8VhEN58GAxsKKt4sup6AUre9XBREThXiY/cBj8Z83jz4593A==
X-Received: by 2002:a05:6402:148d:b0:564:5764:a5d8 with SMTP id e13-20020a056402148d00b005645764a5d8mr350882edv.25.1708710536577;
        Fri, 23 Feb 2024 09:48:56 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j21-20020aa7c355000000b00562156c563esm6576396edr.33.2024.02.23.09.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:48 +0100
Message-ID: <20240223174849.1509465-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-arm64-dt

for you to fetch changes up to cc36acb8a67ddfe4bc7bc722748f6c1b72eed5ed:

  arm64: tegra: Remove Jetson Orin NX and Jetson Orin Nano DTSI (2024-02-23 18:20:02 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.9-rc1

This set of changes refactors the audio-related device tree nodes on
Tegra234 and improves USB support for Jetson AGX Xavier. Furthermore
this consolidates SD/MMC aliases on Tegra234 and provides correct
configuration data for the MGBE Ethernet devices found on Tegra234
so that they can operate at full speed.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add current monitors for Jetson Xavier
      arm64: tegra: Add USB device support for Jetson AGX Xavier
      arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier

Mark Hasemeyer (1):
      arm64: tegra: Enable cros-ec-spi as wake source

Thierry Reding (2):
      arm64: tegra: Use consistent SD/MMC aliases on Tegra234
      arm64: tegra: Add AXI configuration for Tegra234 MGBE

sheetal (4):
      arm64: tegra: Move AHUB ports to SoC DTSI
      arm64: tegra: Define missing IO ports
      arm64: tegra: Add audio support for Jetson Orin NX and Jetson Orin Nano
      arm64: tegra: Remove Jetson Orin NX and Jetson Orin Nano DTSI

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   50 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   51 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   27 +
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 1953 +-----------------
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |    1 -
 .../arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi |   14 -
 .../arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi |   14 -
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   86 +
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |    7 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0005.dts  |   12 +-
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |    1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 2138 +++++++++++++++++++-
 13 files changed, 2355 insertions(+), 2000 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0005.dtsi

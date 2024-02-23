Return-Path: <SRS0=8G8C=KA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42171C5478C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 17:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0854BC43399; Fri, 23 Feb 2024 17:48:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29B4CC433F1;
	Fri, 23 Feb 2024 17:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29B4CC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a36126ee41eso95897466b.2;
        Fri, 23 Feb 2024 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710535; x=1709315335; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQCCxPjVwc9J88j7D/qvdajFk19hWL/B2Jwz7nQJAz4=;
        b=Z3kze6WP+E7nwgNU4hbhXH1UOyr5aKFP46aK9CGRBniUv1AEInr+4ULEEyoDNBaZbD
         ufJE/fkwhYIdVEE0awJNJ9EhajxWH645RCpvBNkHu2SRQGux37K0b2LvsbcJRknKNZS7
         6hBvemVWO9DiTytIMMDFxM3+LPQYsB39O6YMOPzoQCmaD6t9z5E3qEaZjetin06triY1
         zx8P2pY+3MzMJ2czmqEBoCPaCnzZirAsEpfEyzrftu/N0G2KaVluu3f47FHOtcw7fpSf
         iW34SjO8SxvO6ehsSOYOr9DRT/RXY2jpcHFswHU8Ti/XgztiInSWJArReRWHqyhtyC9x
         Bkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710535; x=1709315335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQCCxPjVwc9J88j7D/qvdajFk19hWL/B2Jwz7nQJAz4=;
        b=k6esNgUc9VLAxOHehjUQQmP4ohdQWdU8Uwbc8uQy8KzDt3If+EACf2ULll1IEKnbGe
         LD8EeOK4mjJqmjid1ul+Cl8cQIjGUGqA88ZpAHSOOcrwdDamGQFd5wSW220dcpFYtJ8v
         brflaAxQ6E0uAPEU4ljkzQMc4BIsqCsqPIhGXcCnRCpDOx1Ef5Z6kLY1G6cHlR4/5G/U
         p2JNqTEjMJ51DLJCv3AW75172wmqPgtjTU6KmpZoIBY3p9jgLc75O//cF8jf5OBBkQLp
         xfHukc5o5b9SYASWj8s7xukRnQDQpHrwsMu6F/KbvRbRKgH6wmS1q07oEL7d7SFEnps9
         TtbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdzephXfZgnOvOjezubviBLqwAV5UMX+IRlv6Yw4Ze/MBsnfsNnQX77CIAZe8nsDtqDbjKuhldlrlQTQQIdg==
X-Gm-Message-State: AOJu0Yzns3kY/rg/ELxS2HwHXLIF2/h3XTBJbK6xTjvrYSL5ECWhvSzz
	VwLq26KET4hYYaUMQXrBDbERIfdTsYkk5aWpqKbYl0X+B1O8ubvoFCF2mMTb
X-Google-Smtp-Source: AGHT+IHnCj9S63ZRVSecjO3NdFK2lOFoKvDAvMbcxc++eU+HueUQ3s8wWxrBN+TXpzj1GehR+Y6czQ==
X-Received: by 2002:a17:906:6d8b:b0:a3f:dae9:1e88 with SMTP id h11-20020a1709066d8b00b00a3fdae91e88mr315648ejt.37.1708710534525;
        Fri, 23 Feb 2024 09:48:54 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906251800b00a3d9a94b13fsm7113688ejb.136.2024.02.23.09.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:47 +0100
Message-ID: <20240223174849.1509465-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-arm-dt

for you to fetch changes up to ea5e97e9ce0466b421bf0350fdb05409f5369162:

  ARM: tegra: Add device-tree for LG Optimus 4X HD (P880) (2024-02-22 18:20:45 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.9-rc1

Add support for the LG Optimus 4X HD and LG Optimus VU devices and clean
up some minor issues.

----------------------------------------------------------------
Mark Hasemeyer (1):
      ARM: tegra: Enable cros-ec-spi as wake source

Robert Eckelmann (1):
      ARM: tegra: nexus7: Add missing clock binding into sound node

Svyatoslav Ryhel (2):
      ARM: tegra: Add device-tree for LG Optimus Vu (P895)
      ARM: tegra: Add device-tree for LG Optimus 4X HD (P880)

 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    1 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |    1 +
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |    3 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |  489 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |  496 ++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        | 1812 ++++++++++++++++++++
 7 files changed, 2804 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi

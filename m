Return-Path: <SRS0=ubxS=ER=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3B9CA0FE8
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 10:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AD5EC433C7; Fri,  1 Sep 2023 10:17:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DF97C433CA;
	Fri,  1 Sep 2023 10:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DF97C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so372619966b.0;
        Fri, 01 Sep 2023 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693563469; x=1694168269; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEUJ9dGTWHYlfawb2VxJeWDhFCdnxgU0Kgh1CdlV0lo=;
        b=YcRNokojZ7ZZkP9EQAxUNn/aG4MoLxWi5KHhjUY5JpV+lJsIfKc8rAJmz1Lfy/MhJg
         KFsWL51c6VtSamk2xHmXdId5o9TYWXxd1rBshU40MgOdEnfmvsdGI66EvgE2Tj7kZuYz
         Pf2DkfYk70L/UerE3qvBfXB4L9XlBFY1+OD3nWZJqXhOPMnO0oqh7xWMflpu/FPujus1
         BonkDZ29mdiawIES3OFpRrtygOASAf10myb9QJB7HXc6veZP8OFR7i8QP/UCpabehQYv
         VJo0OcavICvH5VbWsNGB+bERjgZWbxlTnjV6NQxQgkReo5OnBY2Li9ZRjL+1rIJp2+8G
         hmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693563469; x=1694168269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEUJ9dGTWHYlfawb2VxJeWDhFCdnxgU0Kgh1CdlV0lo=;
        b=K8Oda4xVgBvr650GU2so4hpWHIQt10qPz7Iex8JrtcLTLDNMd5bImuV7qh4nkVjFZD
         nQD9jeRB3zoj7ISBKyUJ0SMNgHR0X9MqMT+vBci/nNjVjCQbOMJgZrvv641fdmxoz5EK
         jGs4wCHELBVOULJ+LnBBB/DGozzxDJBogVv7q41rk4V9BeySYA+RMiqkJ0wgl06lO1p7
         1fSVYGvQD0kmrfgggWQuD2VdBXbiZdK6jb0kYZB0B7bnhhg81RWthV6sgW9xapbu6mUQ
         0aM8Y9C55NwUJJbwgriBEKRYveI1ARqDf4CMDkJJegDjQiBldO1rUiSOgr3i57wt2Vti
         R5yg==
X-Gm-Message-State: AOJu0YyitmzcbN+UEnwBkwyYBV+RhYRFJCw45jv3IiW7kUTrp0fwhGMa
	nKyThu2C1k4bC7bpBRQgO4QeM9MWGAk=
X-Google-Smtp-Source: AGHT+IHEpjnCKl2scwsxKg6+R3OIwiUl7xKK7TbtKEI80NY66k3gP9vC5Eu9FxriU6AISgnz/dfKeg==
X-Received: by 2002:a17:906:749c:b0:993:eee4:e704 with SMTP id e28-20020a170906749c00b00993eee4e704mr2693077ejl.38.1693563468969;
        Fri, 01 Sep 2023 03:17:48 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g24-20020a170906395800b00992e265495csm1803299eje.212.2023.09.01.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:17:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 2/2] arm64: tegra: Device tree changes for v6.6-rc1
Date: Fri,  1 Sep 2023 12:17:41 +0200
Message-ID: <20230901101742.1871434-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901101742.1871434-1-thierry.reding@gmail.com>
References: <20230901101742.1871434-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit d7fb6468ec9f18db52ef3c84eb44a9025021c830:

  arm64: tegra: Add blank lines for better readability (2023-07-27 16:48:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-arm64-dt-v2

for you to fetch changes up to 112aead4e3d08b455723fa49c17119fbbb4f6e6d:

  arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114 (2023-08-18 17:24:51 +0200)

As discussed previously, here are some late updates for the Tegra tree.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.6-rc1

Contains a bunch of improvements for DT validation as well as some fixes
for P3767. This also contains the addition of display support for Smaug
and enablement of the IOMMU for host1x on Tegra132 (Nexus 9).

----------------------------------------------------------------
Brad Griffis (2):
      arm64: tegra: Fix P3767 card detect polarity
      arm64: tegra: Fix P3767 QSPI speed

Diogo Ivo (3):
      arm64: tegra: Add DSI/CSI regulator on Smaug
      arm64: tegra: Add backlight node on Smaug
      arm64: tegra: Add display panel node on Smaug

Rayyan Ansari (1):
      arm64: tegra: Enable IOMMU for host1x on Tegra132

Thierry Reding (5):
      arm64: tegra: Add missing current-speed for SBSA UART
      arm64: tegra: Remove duplicate nodes on Jetson Orin NX
      arm64: tegra: Use correct format for clocks property
      arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
      arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 66 ++++++++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |  4 +-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 13 -----
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 40 ++++++-------
 7 files changed, 93 insertions(+), 34 deletions(-)

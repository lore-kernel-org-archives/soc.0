Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7DCC43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 341A1C341C7; Fri,  8 Jul 2022 18:56:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BC94C341C6;
	Fri,  8 Jul 2022 18:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BC94C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id os14so8899951ejb.4;
        Fri, 08 Jul 2022 11:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lcigr+7qhzmX48vBaS4O1yAbIqvGgXz8MJ5tWHzkL2w=;
        b=S7AZl82CjuxiguT8yH+IFQMzWBMKUHi5kkHvoxX5KISdc610SmqyLGqjoS2/XfxHGj
         6IPc/es5+zy8wMXE4JpF1jgU34lPNqVXEyIN7JcuJZS/PuGO8gA4JgXANbmmTW2dK9jS
         vXl6gSYcjwPZM4ZEFmHFEjtR6miQheizlB07AvinpaaxTb/MwyZPcDt5C1KGzNC/ve3J
         CfSVgRe5y1l0kWxh+lG4qe7iFXfDOem8zjgIyxTfoRD3/sIQh5tqjJ7u1/zHg3QI7sBg
         ZSbnrm597NUddEwm8XW8qNl9bE7kGtgLSm6ESp+NyL76d3dH/xvqIs7kSEjaUrsiX7zq
         MB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lcigr+7qhzmX48vBaS4O1yAbIqvGgXz8MJ5tWHzkL2w=;
        b=e0FVQJZzYR2Z2EjeQAM2hvrs2l8TPK1zBVQQRK6GldRe8sQIMvkiECD3UteO2MnvL7
         PdaXx7u8NYAt285B45X/4Wx5/byHpnePYMzxhwewofObv+CX9NIgPcWCYOnE6tufWAtw
         7ANWGEPzSkyoYefPKoukzNGUf7o7RRiiYQK8/suSZfDkAvT1EONmBXL/VdZpYZthy+Vy
         1r20kcMehl32cv1TuxRKw8MVloya5fJCw70+5XiWMVvzYMjGQOaAsySCfwBXk/Z3lFK2
         bq9WQR/twFqDYSl8KscDlevQcID0h3dJ8oJQaWZEMHUwYNgRqoR+cH+5q1K+ENCocqPz
         DvqQ==
X-Gm-Message-State: AJIora/zL7NfcFtDUY30IgeCo94llYJt8XLtsQiCub+8M9w08h/OA/Qk
	w7k+F8+7IRkwQUjR0vRfsakpHet94po=
X-Google-Smtp-Source: AGRyM1s8q5iyATcoXfEIULl8Ta0Z7t1epXgBJKL1vldly5xR4qRLy9Wcg+osHSxjBFohwlVXnTYa2g==
X-Received: by 2002:a17:907:28d4:b0:72b:307d:fb53 with SMTP id en20-20020a17090728d400b0072b307dfb53mr2035803ejc.84.1657306579287;
        Fri, 08 Jul 2022 11:56:19 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906a38d00b006fed787478asm20782991ejz.92.2022.07.08.11.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] memory: tegra: Changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:05 +0200
Message-Id: <20220708185608.676474-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-memory

for you to fetch changes up to 5060237b0ee1b1c70fcd9a8048664905b74ba6a4:

  memory: tegra: Add MGBE memory clients for Tegra234 (2022-07-08 10:29:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.20-rc1

Add memory client definitions for the Multi-Gigabit Ethernet (MGBE)
controllers found on Tegra234.

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: Add headers for Tegra234 GPCDMA

Sumit Gupta (3):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding

Thierry Reding (5):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      Merge branch 'for-5.20/dt-bindings' into for-5.20/memory
      memory: tegra: Add MGBE memory clients for Tegra234

 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |  40 ++++++++
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |  97 ++++++++++++++++++++
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |  74 +++++++++++++++
 drivers/memory/tegra/tegra234.c                    |  80 ++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h         | 101 +++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  21 +++++
 include/dt-bindings/power/tegra234-powergate.h     |   1 +
 include/dt-bindings/reset/tegra234-reset.h         |   9 ++
 8 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml

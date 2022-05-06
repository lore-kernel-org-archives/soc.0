Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEEBC433FE
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39D01C385B3; Fri,  6 May 2022 14:30:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86AFBC385A9;
	Fri,  6 May 2022 14:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86AFBC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id bg25so4543204wmb.4;
        Fri, 06 May 2022 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qj8VvfvNLf5X/XXAEqMgbERZ6Sf7ST2uQfq1vXcwhpI=;
        b=NVqgU+o7fiPGaCVuxDtU40bjPMu6PjKZOa/GRG9U1vFjE8HFjkCINfQNB6heayiSDV
         DHEsW5MGwLMzZTwTK8tni9SJkrUoOteY6+qxBOI6bcj8ttzJavTQY1/D3GQPQzqlwWke
         ICbgJPbCvMIG3hF/bfdD26ZAB0POTg1MT6pffqJzCD6X/W/vr8F0AdalO/ZQzuEtwV9C
         KDUM+FZJZs+cPYP9AUsng7AIFILS/Gu42uCfyHor1YpXsD+qUu1uDbf9y10FW55mDK3w
         h//UnuVyESMvsDgIjUZFgX0Gk0nR4xUZst5zXsOLf0o/apllyM8Cq/exwA6X6qiMcq5w
         52HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qj8VvfvNLf5X/XXAEqMgbERZ6Sf7ST2uQfq1vXcwhpI=;
        b=yQJfQO6BTfH6i1SIJHWK4+KP2iuZSRo+ZHZoQLpkYD69xJ7RlBx32hdY/1r3guy1I+
         zXrP4sMay/5gZNQKzA8DszV5g0X47AtmOj26GAoNSlQ8vsqS/SmYn9wIgxXw/j/8wHbw
         uurUqnAgE+I34rSd6ROB/VHQ0+6mnKDO4d7voMt+K4t3+W767BEv/SmLlGu1z0cFeSla
         inw5YzcvXhVar5e6aSOxChHKgTuoPTz8XXWQ4JUGIoek1OS5dKOGu2b8Rd3QOgNLqg3b
         pW5OLE/KyjIuFBIuFVJQ/3e8ri9FryNhdl3+46z13SjKvcyUJUddH6yuFIneJ7+qUqXi
         2osg==
X-Gm-Message-State: AOAM531BncCc1VZeu0TE4tPGN8IVooHBBkQnJ6B6i61877dOLbm0LEgs
	QOUr7JGA9PK4M1Ipd2WF0A0chVToT2M=
X-Google-Smtp-Source: ABdhPJzZZ6NlmG3qpIn0vOksUwxltxK41NOzqCYn3QdHEdm6Ii8AyQZCqO1fdsplbWsFIJ5TnL870A==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id c2-20020a05600c0a4200b00393d831bf05mr3556821wmq.187.1651847416293;
        Fri, 06 May 2022 07:30:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b9-20020a5d6349000000b0020c5253d8c3sm3786285wrw.15.2022.05.06.07.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.19-rc1
Date: Fri,  6 May 2022 16:30:04 +0200
Message-Id: <20220506143005.3916655-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm64-dt

for you to fetch changes up to 0017f2c856e21bb900be88469e15dac4f41f4065:

  arm64: tegra: Add missing DFLL reset on Tegra210 (2022-05-04 11:22:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.19-rc1

This adds some improvements on Tegra234 (QSPI, CCPLEX), improves the
SDMMC clock speed on Tegra194 and adds the ASRC audio block on various
chip generations. Memory controller channels are also added on Tegra186
and later and the missing DFLL reset is added for Tegra210.

----------------------------------------------------------------
Aniruddha Rao (1):
      arm64: tegra: Update SDMMC1/3 clock source for Tegra194

Ashish Mhetre (1):
      arm64: tegra: Add memory controller channels

Ashish Singhal (1):
      arm64: tegra: Add QSPI controllers on Tegra234

Diogo Ivo (1):
      arm64: tegra: Add missing DFLL reset on Tegra210

Jon Hunter (1):
      arm64: tegra: Update PWM fan node name

Sameer Pujar (2):
      arm64: tegra: Add ASRC device on Tegra186 and later
      arm64: tegra: Enable ASRC on various platforms

Sumit Gupta (1):
      arm64: tegra: Add node for Tegra234 CCPLEX cluster

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 223 ++++++++++++++++++++
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |   2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  15 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 225 ++++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 225 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  42 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   5 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  12 ++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 223 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  67 +++++-
 include/dt-bindings/clock/tegra234-clock.h         |   8 +
 include/dt-bindings/reset/tegra234-reset.h         |   2 +
 13 files changed, 1038 insertions(+), 13 deletions(-)

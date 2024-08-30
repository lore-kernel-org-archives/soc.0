Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD77CA0FF9
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02CA8C4CED6; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32243C4CED4;
	Fri, 30 Aug 2024 14:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32243C4CED4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3730749ee7aso1300867f8f.2;
        Fri, 30 Aug 2024 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027009; x=1725631809; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RJ1FPZC+rVZlb51jlc31En5hT69orcbEeq1sqqoigc=;
        b=BcU68/fwBhx13Sh1tynsMsxBeIwdyqUyLpGaMzNdOJSj1M4oWs3WRc63mGrqfYPH2I
         8aQdTQd/fjhbuNOElUOQh7EvejsMRxbSMF3/iexfbi61+T3kEhhLnTNSZdOjYv44fMA3
         IAIgdXfciUMA5p6KSygEKiWiVcrD8BrOhC3SaPwuE9DN6Ni17EkANuBV8L5Rn6x/qOcF
         nYJAn9Bz5LuhtZXpNRyspf3OlG5onpnXIGJCfKreJpqXPq3Yfqax7smyTTnfwDIc30Bn
         31e4EjBVIF4U34uEdvF/FQBOKJ6ZThUH5TYdqAGq+DSbmHyvkCRmWRWEbNQfch3/RBxT
         iBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027009; x=1725631809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RJ1FPZC+rVZlb51jlc31En5hT69orcbEeq1sqqoigc=;
        b=CmP3VFuBBz2RUTzlmKj10LOYE7nDqf74GiWCYZn19wIASUT5KNhccwAOmV0089vESL
         VgAd+epelKVueNujk4STTO30dkjX6wvPliVPIRW+AobxAwGv+idye1/CaaxPl/Q+bpZa
         Rcw6QNh6j4rmeic4dsQ/9mMWJZKlPl8oC3OOSuKB94HO3PjsWnIYfVeU77k8Si792Zni
         Ik4EMa4UmPXZSN3WQDE9BfWRY+N/OuFO94c2lXn4oNf2rAY9DAXVp5VbsyHE2k20swvj
         9oJJitZzEshhenKrqDij417YF/z4nswQE6Hmwkz8xjyXf5Ddw4FnQPUuBMwfSdeeuouy
         9nQg==
X-Forwarded-Encrypted: i=1; AJvYcCVCoP329X0EisvRCsVYBPMYhyYxhQTc/Ljvnvy2Zf6j6qRTRHhXftVKpURaMkMcrLBsPxk=@kernel.org
X-Gm-Message-State: AOJu0YzYovQGlbuaTu8xZr4ZSCkBppbDLxdCPkfg0xyPw+F+afIhxmGy
	hqXCERgGo5ol0bZv+5cxlJ6JpcBJfOvGUM++vN/RzBGaPVcv2JQwwWNoFVZO
X-Google-Smtp-Source: AGHT+IEeHeAt1JoFxeGnZsodFkqRqHsRdx29ZzeEC4F0qoCp6hYYtYLfQeRzmunZcnzpHRFwCiXUAg==
X-Received: by 2002:adf:fc88:0:b0:371:88f2:93e7 with SMTP id ffacd0b85a97d-3749b544847mr4374310f8f.18.1725027008329;
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee72ec6sm4090941f8f.42.2024.08.30.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:01 +0200
Message-ID: <20240830141004.3195210-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm-dt

for you to fetch changes up to 8f4c834d89150e9b1c6c3e006668ed6fd9ee2b15:

  ARM: tegra: Wire up two front panel LEDs on TrimSlice (2024-08-29 17:36:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.12-rc1

These patches add a bunch more features for the TF701T board and wire up
the front panel LEDs on TrimSlice.

----------------------------------------------------------------
Svyatoslav Ryhel (11):
      ARM: tegra: tf701t: Use unimomentary pinmux setup
      ARM: tegra: tf701t: Bind VDE device
      ARM: tegra: tf701t: Correct and complete PMIC and PMC bindings
      ARM: tegra: tf701t: Add HDMI bindings
      ARM: tegra: tf701t: Add Bluetooth node
      ARM: tegra: tf701t: Adjust sensors nodes
      ARM: tegra: tf701t: Complete sound bindings
      ARM: tegra: tf701t: Bind WIFI SDIO and EMMC
      ARM: tegra: tf701t: Re-group GPIO keys
      ARM: tegra: tf701t: Use dedicated backlight regulator
      ARM: tegra: tf701t: Configure USB

Tomasz Maciej Nowak (1):
      ARM: tegra: Wire up two front panel LEDs on TrimSlice

 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1558 ++++++++++++++++++---
 arch/arm/boot/dts/nvidia/tegra20-trimslice.dts    |   30 +-
 2 files changed, 1381 insertions(+), 207 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A11D619F
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271797; cv=none; b=rX4lrgNQeWsNTzdrVuMCmDOe3tJUMTDHXQdY4M616uiS9Mvle9NZkue6RfixVkGf3w6VONDzxhAw57qYKU4YOsoYuHGTd64MkjlCWgKu2xmb6qi3erjnUpLpBT7JpLuPHpRaZ+30FkCgI9K0C8zFjmtLrzGRC163NyfloZXzceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271797; c=relaxed/simple;
	bh=WlF3nKUmNavgZ2QL1+b0EzOu74PpWxeIy3ufvxiL1kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msMYfLq1H3C92y/EpkcnlbT3a30Y8QlVZz3yScFD500xabRYaD8UxO+sVTpoXTN+jYQ44oeCSp+O3in6A+xdhinaBob+tVK1ntqgyLbhzic+r6/MURZRa2QSeA0BFDluIp81mFqoQK3qMnrvQwDbAtfD+GOzwbJwoXmjtcKWav8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y92z5f9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y92z5f9v"
Received: by smtp.kernel.org (Postfix)
	id C3511C4CEED; Fri, 11 Jul 2025 22:09:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC446C4CEF5;
	Fri, 11 Jul 2025 22:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC446C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1607773f8f.0;
        Fri, 11 Jul 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271794; x=1752876594; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=Y92z5f9vdz2I/6Whd0/ZiODm9u0c/XJRj46cfwl0hCvQG+9litkoLJBkWNqhnRZwM7
         Oe2qNa5ZSHYwN7gPMBXZJ8WHakgfuhK0iWoNpAFiJPIMSf/jKcdqwHxw0FZdC3ncnzey
         4ZCnl0AeoZ6FYAVrryXU+H7EVV2sj427PCgpND0OpCBSA/0KRSNL/v66sc6tonkGo582
         98nB0YIP7lMkfD9uSHrdYNO2IK1wiJkHck0p+IahJoH2OvxUtyzCX3Q/R10qNI9O/13h
         NlyEJxtE+jScxthZOYIaw8ELYtAVGFCRXHgztXSpQnYf4H3Y09YXMQhZsd4a2K1nsRDz
         rQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271794; x=1752876594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=dLOLOMjYM+NTVhkkN3kD/n/xvO/kWPFzznawslXSo0CHLsLXXK+zbMsHGeK1V2Mvhz
         f+ENQNwgNSMOLO3xMmslvUqnpnGzgtB+A7RD7Q5CegmawQzb6OC7Ume8Vqr4lkhOHxNg
         LAJr4fS3bzDCUkKvNbuDcpeXuGCDEdy+OVfUh9g3F24+VrSBhsGVEdaIx+VogF3vUCcr
         d4wSQidQ1/hWw8XRtTCFH4L6du43jAa8gZQKNkKwesk5WFrbqHOKIZW1sgqyx3ZtVP9D
         Chs+U77CyECV8uCjP+bhaWSY5HtIFbNebDYzq4jmH3drRgv+ozX4Ki/w9p/Y8AJYuzU+
         Lmqg==
X-Forwarded-Encrypted: i=1; AJvYcCWVrlyQm800F7GB7bevu74QBoeUZNJxL2I7SWH8Xtr+jBp2FOMYsgsin4sumgdP5Rjpvqg=@kernel.org
X-Gm-Message-State: AOJu0Yxc3dzRWrn+mr7L5I6FdaRbVbAReSihXlwxSbhZFE9uOV7hjeM4
	/mGpL7NDFVJ1eiitFIy/2C7UsgpUA1J62puSm/STiSViJKgpgxqCH0Ou1IhG6Q==
X-Gm-Gg: ASbGnctxOqiZYHUEKhnPvhrA6XAJUmix7lseRs64F5BMRSusMLAMp3KxlEj+niQyjAY
	0PoPvWM5fAO3q4luJKKejwC0iYnE8J09fkPZydJbiJq6E/lltSsQzNJirwoQSMFz/x+L0K5rnXn
	gNyP1RkHN0tm1Qg62QU+MC4pph3wfADLR6dA8+SJUUHxpnjpIEzNHpHoIYVGrUXBNTvW7zHiWHz
	VKogOFxEMd9nj7Y+h2vY46Xj/VlMYmV6xmcc+aQU118JL2BJm8z46Y3AbVj62A2bIXBjxR6UGHq
	oyxXMelPo0eOohZubuIoC0cfXvSMAxc6SeI+HC6Cb9csoDN8oZ+rHm9Uw8xXBnX14FBRdEU2yQW
	XYAoeozHiPRqaaUYaFiGopTVC7rH4fyx3SCi2kKXYxgkZ/ql8RNo4R59fNVVWW6XWuv+yb5pMNm
	Od2Yl8sNDzp2gG4w==
X-Google-Smtp-Source: AGHT+IFrfogdrgCJD9N76R6dzps69tuCBPv2TcIdLoEKcZbRZKlsXRZeI4f3CBmq7rSlADwE0IUmWw==
X-Received: by 2002:a5d:4389:0:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b5f18cebf9mr4138320f8f.37.1752271793586;
        Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd54c512sm59580125e9.37.2025.07.11.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] memory: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:37 +0200
Message-ID: <20250711220943.2389322-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-memory

for you to fetch changes up to 2401dc4dcdd02920faa9a8c4384f1503a15e779a:

  memory: tegra: Add Tegra264 MC and EMC support (2025-07-11 16:49:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Updates for v6.17-rc1

Enable support for the memory and external memory controllers found on
Tegra264.

----------------------------------------------------------------
Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      memory: tegra: Add Tegra264 MC and EMC support

Thierry Reding (1):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/memory

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++++-
 drivers/memory/tegra/Makefile                      |   2 +
 drivers/memory/tegra/mc.c                          |   5 +-
 drivers/memory/tegra/mc.h                          |   9 +-
 drivers/memory/tegra/tegra186-emc.c                |   5 +-
 drivers/memory/tegra/tegra186.c                    |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h              |  50 ++++
 drivers/memory/tegra/tegra264.c                    | 313 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++++
 9 files changed, 613 insertions(+), 8 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630B223DE5
	for <soc@lists.linux.dev>; Sun, 14 Sep 2025 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831973; cv=none; b=gJpLHze0N5UB8uQdF50imwwK6bw2G//lT672pw5Go38zYixhoiCikOt4jPov6ye5LFYkPcWQDh+xp+apNr60uHwreUEZmtu7sZ0Ag+U598yPvgwcOFP2vpk4fXlWmemBsGycmDIF8FQYrSqX81qIlZ8ObhIRIHLWSNE3gZfajZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831973; c=relaxed/simple;
	bh=4FFNZ7Qc1XP5MwlijQ36HKg31FNbc8PhI5xahVdCOy0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MKFlm6tCPkP1bV7n9FC5uNmXd3tFwdkIfJLwmj+zBDzMeCocnqbzVMr8OlsmbCE8Jk2B8WCEX503ob6TXOG3P7f5ka/Pk0rL6TBWk5wCvCw/4wjl5sZFT0+PD1hh5Kh6ilkMGZrpEtZLb03/rKI6GN/otTk+gOsEmyNtGC5oarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EehTy5YQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EehTy5YQ"
Received: by smtp.kernel.org (Postfix)
	id 7D1D6C4CEF1; Sun, 14 Sep 2025 06:39:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B7D1C4CEF0
	for <soc@kernel.org>; Sun, 14 Sep 2025 06:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B7D1C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so1578945e9.1
        for <soc@kernel.org>; Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831970; x=1758436770; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=EehTy5YQhuWxr6cajQRZIl0FBz0FMIP1O4m3Ol79ZaxUGtS8N1ZaCGZaDY2oq4KKd/
         AtjzYaotMElAMv4ISwBf0k1+df6oRSeU97GTRadquHvMmXy9/X+JEYUpiCoBzgLqc5mT
         d0DACfj0Ab4HYq9q2KkSp8JWEpuVF0uz/H4VC9+XbgNESC9q/WaPRdvzIqLpdp7GZctd
         fUwTXI8RLMnT6z6eHyZI9vXaZCypOEXTSKSBDLQ1NukwiLgprbUMKgOyvm7UiDreeYy8
         9jBWaAAG3HztGoP96Si3d0CfdObpPbaMjth520jvV4mknWEbAE9oqePdvm/XTBcp5C0O
         h0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831970; x=1758436770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=RqPNjV6+ZuhkRZl+iZFbuuSoai1UdT0IFKYSvdYDvoEDWXsfwAJivnzEU22rJIGbXW
         3CA7IUR9shSKJwiWZtK29lUjEADhfiBfpVLNnKsmGcScq0ZOplUl0DPE1zLQErcnSvR0
         7drOGUDuOJW8GecVvp50Z0fsiJRDe9qyzgOSFFqGu17I9N9dlfjA9ptrxFqzP7JgqhKr
         X7SoVNkL+WVZX+Jy/4oKEwuLibnD1ZJNShiKdoSa96X3To9WEdUxlpBcx79mt8jXzgqM
         wI1EB0fG3eXUdaGqJrITFxmdy5FsQqWRFFmmS9Yn5FbqMT0dXzvNMItQm1adEVABtVuk
         6OrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMGh2JcUXU3mRC6NH6Tu6uxolzR37Eq7eumoLFjjiT1MTToLto6bhvB8vE+wb/nNhOOso=@kernel.org
X-Gm-Message-State: AOJu0YxQW2f8lhoGjZ4GgupSHuETneSdA0u8wQ50lV7T44jBKRTZLtkY
	VE5mbH8yw2zJxKafi68qStwEH8MbCUDxsMGQnarb+dv8f7qVLZUxFgLt
X-Gm-Gg: ASbGnctbG9REhZ01FnSmNvnI68HXAnYHhIKXXhonCoz0sQT8y20Klg6Lu+Y2VKHOHIU
	dgo0NNRELWPAzBd/DeFyhkLPD6T8MZey+hlpJoR7bZ0x8CKbys9VkKKLRhgVwpU0S8pYub8ccm3
	qYHswNfeEZhfbN9LAEoq4fWZHBs//pbEoxiooadsmO3EnSNmywwz2GYJNgGaqSA+LOFGlAqyAy+
	Di4KATuwoyNtoFRYXqK9S4ynGv48AWaurnMjDVXV2JfIl4UWzHd1/0YiSi5SMHIcvdF1rZrF+ZI
	S/BZfEmfIHak0F9LdXjxq8LCATQ27dRbeLbQD2SPaR4WjAFRZGFW2houYQYMq5kpe6gVqvIHKgf
	9n3b9XG4r/lmuT+2pS56DVaxJo86/6vEU9SlVKPOXF53SfEb0FITHzOtafZKCZo/1rL1fQBkTxk
	mbcYAxQQRAJBv7pP3+KOFjYLGm
X-Google-Smtp-Source: AGHT+IHsVQaLwK9kbPhi5b+T5uL5yRbv3z8nvbXvjRDH7NM+UJPCf41nboJd5RQK8c2xCzYZfBtU9g==
X-Received: by 2002:a05:600c:4755:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-45f212933ebmr70561585e9.15.1757831969491;
        Sat, 13 Sep 2025 23:39:29 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f2abd2c03sm18404525e9.13.2025.09.13.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:22 +0200
Message-ID: <20250914063927.89981-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-dt-bindings

for you to fetch changes up to 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.18-rc1

Support for the Tegra264 generation of I2C is documented as well as some
older Tegra devices, such as the Xiaomi Mi Pad and the ASUS 101 devices.

Contained are also some additions to existing bindings for Tegra114 and
a fix for the power supply feeding VI/CSI.

----------------------------------------------------------------
Kartik Rajput (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C

Svyatoslav Ryhel (5):
      dt-bindings: display: tegra: Move avdd-dsi-csi-supply from VI to CSI
      dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
      dt-bindings: arm: tegra: Add Xiaomi Mi Pad (A0101)
      dt-bindings: reset: Add Tegra114 CAR header
      dt-bindings: arm: tegra: Add ASUS TF101G and SL101

 Documentation/devicetree/bindings/arm/tegra.yaml            | 12 ++++++++++--
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml           |  3 ---
 .../bindings/display/tegra/nvidia,tegra210-csi.yaml         |  3 +++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         |  7 +++++++
 drivers/clk/tegra/clk-tegra30.c                             |  1 +
 include/dt-bindings/clock/tegra30-car.h                     |  3 ++-
 include/dt-bindings/reset/nvidia,tegra114-car.h             | 13 +++++++++++++
 7 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h

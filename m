Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37E27702
	for <soc@lists.linux.dev>; Sun, 16 Mar 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742135711; cv=none; b=WsG8gm5gtz7gIgkLu0QpAW2nxcWGXa9A02biXURNIE6QOn8lnzTmVTKRb4h43sFGHco/nPEAS0iBO+RbIZRvyPaYPcti6Aqv2+mL6GZEHQP6iDsbL7vSDr1oW0WrnEWZ8H4lLA6b2kY64EXW4ww1D6Ul7OpiMkadMu2QIrxgSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742135711; c=relaxed/simple;
	bh=aiWwqXClDI29wp152Atw0mqy74j2Tu4jTQhO5oypHY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLAPx5Zi8/mHytYJzXYC0Lrb4zjotEqzsqtAZo51w2bGOnDzDl/nRzIfsy6DB4CzGOdxZ+d6gbXoqSZQopzsOaXxsuhAwjzsdOp7efiiYQ6v8c7ZUxjriKvQu/Zo8oAWavR6VfheNx4mySYm8hMjN9y8pyv61B2DK11WU8lV0Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvxvygw0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvxvygw0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so1407675e9.2
        for <soc@lists.linux.dev>; Sun, 16 Mar 2025 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742135707; x=1742740507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iZTnPcKiX3WQla8ra0bJdBCPKBZDqCAqRVNy0t/Nug8=;
        b=hvxvygw09LYDqY4+hU2nWTL3y6HG1/Cg2CLxoewmFvwqGfGjMYI/3+EFHWtSiXLkOh
         ftczeY9bu3FPVcSTiwh4o3DXoz4WoENvRTIC/cDJTY7hDDAP94Ft6bfzzw2UNU4rkn1Q
         rj02jFKGY6AcLbw4Hwc22ii9yVTmKQFlIY/fqAj2akGemYxEKeYFO9tW4Q9mMDWCTMqR
         ODk1d/QlcmOCBBKuTDqgQtXn079IwKaPhchCDzcMM8Cl9V1p6kI2fYXBy99eW/zhtfjI
         ARGYJ1GujENC7+oTuFWmtJw3V2v6cpBJW0Z1ee+gHDppW3wNNE+l0eJNx4rEm42gD9ct
         M3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742135707; x=1742740507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZTnPcKiX3WQla8ra0bJdBCPKBZDqCAqRVNy0t/Nug8=;
        b=ChddnZV0PZ4DUf1D8OZj0AB0IiUspVO15/h//5sQ952E7nWKFr/kIGf5tnKRpVFkum
         X5h5go8K3DOTconhZO2UmE4RaPkF63PnX8eNVCh4AtVVrdY4LVyxgbfZL6a5UIxaLSiz
         M3bI1hb/f7bDVtJxmnsovG2BOzu9p04GDw4f0W7YUxN4UHFYqI6WDrTCuE4vltOM8QFG
         TblhR53gOMBkUu04mFCLi4jrl9NH3D+Hyn8Z3VN1/6Ntrut3taia2mkRoLdumzlMJu5K
         DoiodHZRNICKan0zG37N49Lt8ksqgdbEDApJx1oDBABHg0ayRLrR3SPCk5UdCjPoKA0T
         Nk8w==
X-Forwarded-Encrypted: i=1; AJvYcCWrWbqdUV5hoe9UHl/p7XBGLx1c49cHmbZqJyDPvOO4hDpGsaowJtsku5/vBG8ir0doW6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJrr1rMH3TudikA12ZoLzpOji4anHvnMdVC/q5pKeEuzSAQdFl
	Hq5hCPc1AZOjLqTbOKgMQbb3Njn3ewGeLLqmcz0+myt58jFJRrxsOeuuxuZMHaI=
X-Gm-Gg: ASbGncvawpqqSdZr5Ot+vCo3hH6GTmr782SFUX96UQMMra6rW0sx8KJ8JJdIvoFcliQ
	orm13zjdWeWT5TuXI0EJ8Ts7RQQytM5dQmjfbnV+zNFgNrBMGvEDMKAqLX1Wuwbqj//Q8qJehwK
	kEMj1ITC57hF20tlPtFHT7uqeYpFPKW4EVdhMLG8mufptApw2YSOee7ecNdgLCJ5Yy2aomORbqE
	/zsIAnCT6fjcpXhAVgOmpe0tr38t9G8ta4nxhdANZx0YP69PNiJ0eRZDUfY7B15sJYaIFtQxYZi
	XUX6rykuSuJ4Psn6bALWXdUmx9E+EurldPsUvmXNPbW9Mj4oIYSnBXpr2bQ4Rs1tTPNs
X-Google-Smtp-Source: AGHT+IEjZUE3rI1hZ2BrgUwthxLukTEiV/0aM6N061MV+389eG1w1p0htt/ZIDPTn2KdSk5qkOG68g==
X-Received: by 2002:a05:600c:6994:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43d1ebfc1afmr41782705e9.0.1742135707545;
        Sun, 16 Mar 2025 07:35:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm78451835e9.10.2025.03.16.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:35:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.15
Date: Sun, 16 Mar 2025 15:35:02 +0100
Message-ID: <20250316143503.17620-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.15

for you to fetch changes up to 90a0fbaac4a588a1116a191521c3c837c25582ee:

  memory: mtk-smi: Add ostd setting for mt8192 (2025-03-10 15:18:18 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.15

1. Minor cleanup in Nvidia Tegra20 EMC.
2. Extend support for Mediatek MT8192 to match recommended by vendor and
   improve VENC hardware behavior during stress testing.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      memory: tegra20-emc: Drop redundant platform_get_irq() error printk

Xueqi Zhang (1):
      memory: mtk-smi: Add ostd setting for mt8192

 drivers/memory/mtk-smi.c           | 33 +++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra20-emc.c |  4 +---
 2 files changed, 34 insertions(+), 3 deletions(-)

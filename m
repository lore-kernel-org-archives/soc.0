Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDF20C477
	for <soc@lists.linux.dev>; Sun, 18 Jan 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723390; cv=none; b=LR9UtmgusWmhWd0RyBdHNPsh2BXgadfWWlKQIpT6YpXeGU+uh7m/anNpdaU6YckUG2shxWCYh5oAtE/WokciSqanbPYK+OCCqLzPaksLHBOMVaWVdM65gLvvCRLAi//ep/n0WqFxOmIeFBzp9z6RZ140TKsuWbpzSCrg3xH6X30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723390; c=relaxed/simple;
	bh=jrTP11soEfORrLVH+xR41AKz6lAjKbEzIalTUkv5/1k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pXNbqofq2hSxYPvaD38xYhQNhPh+cRvqkWAbfhseBD25pbmb1uml+yB7pESX+lTd3B+mxcZA7MoFXS2oVgfGEmKz4twIQLWyFPNj2rLpoIlflalXZ36awuff4Mc1E4vMZQYU6u4IjYE+/9wM4dB2plrKDmSLF0ZrO65ZYabEs1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/+99dC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/+99dC6"
Received: by smtp.kernel.org (Postfix)
	id A55BAC19421; Sun, 18 Jan 2026 08:03:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6242C116D0
	for <soc@kernel.org>; Sun, 18 Jan 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6242C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so17379305e9.0
        for <soc@kernel.org>; Sun, 18 Jan 2026 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723386; x=1769328186; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=K/+99dC6aHVMv+qnhsrfb3PBEecPmFDPGx+4HJ5yWv4t0TqNXl62YSleckUDzWaaOe
         slTf+jfnyrMUc4Uua5POJJ++UBbNcX5fMrlEsGW8soAsA1UGA+AeGPKKeF+2SqCFrzh8
         stCZxkpHpchBvLh7g80+NOikrYl2N9ZWiMyM7HCLq05Qfjymkoe4HzCBzCR/qRKmGYr4
         o/XNO9G5g6XaLjsSetEixo6ML9+HFtbpJf7XPMe1o4GYZNN5lT59posD+UPTTtlqdE7l
         SvFUGS3/hnVXic7lxHTVK6z1V9WAPt5dhs4Ib4l/PGtOzAoQpPNb5I6S9WNA3eXZULe6
         1woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723386; x=1769328186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=Y0v/E/0u4BXM+gxKRiPI5DUraE6n/+feDZfHEp6KVQBIRpNJX2Pf90cRKU8HwFzOjG
         9XAsOzW1UXnkUa9A/VX0T4hzhezrPbwCkW2iLDd5YMfb8VQ67j2ruWWeEgJ51ZP9IRwo
         l88UC/GRTgsYsnusS8cP17L/vah1YfMFH5DdIAtff+Po/YWTos26wS/ckTk9CTc3K+sJ
         CBkHszMkDUfkgE9i9M7LbEYf3wq7V5ozRwnkRA/4HZFa6CaxaoTFfoflqTZ0ss+1lxTj
         33zgd9/y+0/3pVPNYv11MBwsbT8YEtjbLfyC3JrtMI8aoa3WODcjwGJu2vw+YaCcmMh6
         rd/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqAYzq8nQv74VaJEsBYwcEEqnoeU0UJiM0imiKIpkTc0243N6Teq/fPb92Jx9m/LDp/94=@kernel.org
X-Gm-Message-State: AOJu0Yx0ga76y1ESnimSnlPvUy9LqSWELupzb9dIGR6pjYmtWnpMUJjk
	zADNJ9GY3eibvsZY9+t2GwwjCFrhU015bcS/7tB7GHTrao7/Oo4vGs5V
X-Gm-Gg: AY/fxX6dS0bjbEsbVCqwoEvRuZ080nZuWJmH3bPwiy+mwCzymUdCAv8OCz05vN9zs+/
	+q8c06/NURs9xxIK5e+HzVe/hYPz9civVl07rmDPxv5+mKi+Mjk07yxuX+iumn06xjq4ne7ciES
	7zmVCX3QDjsEwhF+xZgILrbKTrwQHQEt+6LXF+voPt0HXUUbVFhPL+ruKVpoXjhWob875e/GBXe
	vmoa486Dr2NYB2LBmT1muns+HuzWVkH1ywdoVHNAsauekfyMOdcAe5yYfCWAo7H6jtWJmd2xueH
	Ye5hD3M/5iOW0n2W4PpC+y46sYQs1eGBmG2FbnQc5ARFukxLyGNah3GWLW5NQ7fk6+8XOXkVr/i
	MJiBrpR/F6y2I9mGcvYbHFBRYlr1vjxQgYyVaSRZPdHPk5U+lxCFoNzdEBysUdYuHLYaqcN22/k
	igXx2zm9uAPQYVUYkNwQvNE3hmV4tyBMuWFM0LSx/YHYttJ05/VN/TcqTt6yhUD9KRt4C38t53L
	Tbe5AE=
X-Received: by 2002:a05:600c:4e50:b0:47e:e946:3a59 with SMTP id 5b1f17b1804b1-4801e3503fbmr93270645e9.34.1768723386007;
        Sun, 18 Jan 2026 00:03:06 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm229099345e9.15.2026.01.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:00 +0100
Message-ID: <20260118080304.2646387-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings

for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:

  ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.20-rc1

This series updates various DT bindings for Tegra architecture,
primarily focusing on schema validation fixes and new feature
documentation for Tegra234 and Tegra264 SoCs. Key changes include
correcting realtek,rt5640 audio codec bindings (adding missing ports,
clocks, and jack-detect sources), converting Tegra20 NAND bindings to
YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
(introducing CMDQV and DBB clock support). Additionally, it resolves
legacy warnings for Tegra30/132 display and VI interfaces.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Add NVIDIA Tegra CMDQV support

Charan Pedumuru (1):
      dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

Jon Hunter (4):
      dt-bindings: tegra: pmc: Update aotag as an optional aperture
      ASoC: dt-bindings: realtek,rt5640: Document mclk
      ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      ASoC: dt-bindings: realtek,rt5640: Document port node

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document Tegra132 MIPI calibration device
      dt-bindings: display: tegra: document Tegra30 VI and VIP

Thierry Reding (1):
      dt-bindings: memory: tegra: Document DBB clock for Tegra264

sheetal (1):
      dt-bindings: dma: Update ADMA bindings for tegra264

 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |  11 ++-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |   1 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |  19 ++--
 .../bindings/display/tegra/nvidia,tegra20-vip.yaml |   9 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |  15 ++-
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  27 +++++-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |  42 +++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  13 +++
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 .../devicetree/bindings/sound/realtek,rt5640.yaml  |  13 +++
 MAINTAINERS                                        |   2 +-
 12 files changed, 238 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt

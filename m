Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD72E040D;
	Tue, 24 Mar 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358435; cv=none; b=Wh1lUaJmpxoT6rvhrs4gQ7EgZM0Nme5qMWVmtmxiG1YXeHmoT5Tp4/jp86IEs6yxx4c0MDqSMtJi+IOAdiXZRhSH9LzkePiyVHYwgIjnP1NqZRd8jL810BDLAg+Iftw24uv9GD+exEmos9W43Lk1U2ij3Ixim/+cp6BZwzDv3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358435; c=relaxed/simple;
	bh=y9Qi9TED49iQ0lf1cvUnVGu4qg1OfCLPZNIEGzqhp0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9GKgmy0LE5H18/NJ1GJBrrYhQzPjK9QyB28bawqthO78ZSFI13NKOlB6P2mkCfqHTob3p83K3JVW+UZaa4Y4ShsliuKKUEKr0raREeSeMYRYWj58avkUGMtTsWiOGE3RMfaupsQgCUDOLyss4z0wnsKJavRWJgakG4FBKJz+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tH88miOB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tH88miOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B294EC19424;
	Tue, 24 Mar 2026 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358434;
	bh=y9Qi9TED49iQ0lf1cvUnVGu4qg1OfCLPZNIEGzqhp0w=;
	h=From:To:Cc:Subject:Date:From;
	b=tH88miOB2khXWWjd/tyy5xNp73WGOvP4eseuS/pWtzoVvjfvTVvpGh1AIPYxJDsd7
	 cUjYHJBx5Bn08Y4okUpgxIwbEzAlv9TgWGYdHFZJ3ycBfU42w7e81AXNLGcyZDnGM1
	 juMx0sPihVtFae4kSjkUr88gAngzFJR1L+sBlfIGYiDA2hXlG3vKJVCTeqNkqplp3e
	 CGDVa8QB7olBfAxP9/jSndi8BLN/KZHv7ft1rw4Sm2SmueBKMWt7NC3fS8AcevkDPX
	 m8pxqIMRS8ag3djvSASb8zaKwJQ+z1fh8TO/JnEBaeBxzGz6XUK9AFYwrPoRE4ePQj
	 r0Xon4cXTfUQw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v7.1
Date: Tue, 24 Mar 2026 14:20:28 +0100
Message-ID: <20260324132028.65350-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3637; i=krzk@kernel.org; h=from:subject; bh=y9Qi9TED49iQ0lf1cvUnVGu4qg1OfCLPZNIEGzqhp0w=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwo+cFuBPdqHdh0hXhxCA55RLiFYm+bgLBKg8i Nzt/oAjeruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacKPnAAKCRDBN2bmhouD 17wZEACEW939WDzNQkxq3SAnaZFejO2eSBwABYopj2SEeAKbkfWc4LQ/OeuMGX7Y+YNiiWMrW+C uH2sUZAUqh9tYnpL8AZf2JB5ZZMdrD+CABfvDz4csfGhI5JPsApcTg5gFEx2pXI9YJFnZOQvkNz KR3khBFU2gcAh320w73db9h68siIKyc5wPya5EPIJe3GU9wg8tksreYYkRtAB9o7RRftUjO9T5E YHEep9dmEaB1ra+eGXVJrUXQtJ3jVqGRLIB9u2tZ4VfZv3soFSiweKMKEPmJrgGUY8tKi9TmFF7 FUu3ByAUYTYW61tLFfGDmqCcCboqdWDzFtRy10/RYbgW/ofdPYPAoVy7dodAircKrYDcYfJcbMz 46v9roGy5FS7qXpuZqMCOQFaQ+SOgd7xUEB8mpHEJNlaWuW1ZgHSwCnVt0T4j9PEpcLs8qzMqsz VX1Vg4/Eet4qjEx5BOqG4AB/MAfXin4wrdaWlXjAe3kd+VxLWPCLFGzp2Wle0b2znKEFw8dBUTg ZFhBGFkS68AzbnkA4/Olh+sJmWgdbsCl1J/WOamsUllB8z5ah0sEG3jeSKwtT48YcLIYSK/0Jzq 0d+sv6un1BkvRzEUnQSZ3G88UdIHsJAyTqPLNufPv8+pQfsIAS9YcwUmvGMSW0FLQEtD0uXr8VY 7Gzr2bXydNVYGcQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.1

for you to fetch changes up to 82169065ffb07577075a5088b313d78673ded331:

  memory: tegra: Add MC error logging support for Tegra264 (2026-03-07 18:02:48 +0100)

----------------------------------------------------------------
Memory controller drivers for v7.1

1. TegraMC:
 - Few fixes for older issues - missing clock on Tegra264,
   missing enabling of DLL for Tegra30 and Tegra124.
 - Simplify the code in a few places.
 - Rework handling interrupts on different variants and add support for
   error logging on Tegra 264.

2. Drop Baikal SoC bt1-l2-ctl driver, because SoC support is being
   removed tree-wide.

----------------------------------------------------------------
Andy Shevchenko (2):
      memory: bt1-l2-ctl: Remove not-going-to-be-supported code for Baikal SoC
      dt-bindings: cache: bt1-l2-ctl: Remove unused bindings

Florian Fainelli (1):
      memory: brcmstb_memc: Expand LPDDR4 check to cover for LPDDR5

Ketan Patil (6):
      memory: tegra: Group error handling related registers
      memory: tegra: Group register and fields
      memory: tegra: Add support for multiple IRQs
      memory: tegra: Group SoC specific fields
      memory: tegra: Prepare for supporting multiple intmask registers
      memory: tegra: Add MC error logging support for Tegra264

Krzysztof Kozlowski (4):
      memory: renesas-rpc-if: Simplify printing PTR_ERR with dev_err_probe
      memory: tegra-mc: Drop tegra_mc_setup_latency_allowance() return value
      memory: tegra-mc: Simplify printing PTR_ERR with dev_err_probe
      memory: tegra-mc: Use %pe format

Mikko Perttunen (2):
      memory: tegra124-emc: Fix dll_change check
      memory: tegra30-emc: Fix dll_change check

Thierry Reding (1):
      memory: tegra: Add support for DBB clock on Tegra264

 .../bindings/cache/baikal,bt1-l2-ctl.yaml          |  63 ----
 drivers/memory/Kconfig                             |  11 -
 drivers/memory/Makefile                            |   1 -
 drivers/memory/brcmstb_memc.c                      |   8 +-
 drivers/memory/bt1-l2-ctl.c                        | 323 ----------------
 drivers/memory/renesas-rpc-if.c                    |   8 +-
 drivers/memory/tegra/mc.c                          | 135 ++++---
 drivers/memory/tegra/mc.h                          | 155 +++++---
 drivers/memory/tegra/tegra114.c                    |  18 +-
 drivers/memory/tegra/tegra124-emc.c                |   2 +-
 drivers/memory/tegra/tegra124.c                    |  40 +-
 drivers/memory/tegra/tegra186-emc.c                |   8 +
 drivers/memory/tegra/tegra186.c                    |  22 +-
 drivers/memory/tegra/tegra194.c                    |  22 +-
 drivers/memory/tegra/tegra20.c                     |  31 +-
 drivers/memory/tegra/tegra210.c                    |  21 +-
 drivers/memory/tegra/tegra234.c                    |  22 +-
 drivers/memory/tegra/tegra264.c                    | 420 ++++++++++++++++++++-
 drivers/memory/tegra/tegra30-emc.c                 |   6 +-
 drivers/memory/tegra/tegra30.c                     |  18 +-
 include/soc/tegra/mc.h                             |  40 +-
 21 files changed, 809 insertions(+), 565 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cache/baikal,bt1-l2-ctl.yaml
 delete mode 100644 drivers/memory/bt1-l2-ctl.c

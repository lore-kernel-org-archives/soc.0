Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61E1221265;
	Sat, 22 Nov 2025 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763822063; cv=none; b=DvVwf5efJ/8DXtVgROmcAxC1jBda7/vuwANytblGBpxRmSCHExh2oldMvvW1fDnHnE4cd//R6YgP+Yl2P4WQkKGzPRO1lKMVXwl/z7BqcVSnd27VJQ7zwBdyI0mA4mUD7gZIPOzEMl2Y85lKiXxevQKv8mrh1Yk8Bj9dLXJig/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763822063; c=relaxed/simple;
	bh=T+6mWQVCFsla9EUgNqlT9JSbzGiGlClNcL+IwLTmnJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMlgbfQm4JS1WVwMt5C+dIvD4zk/F7Dg6fTC/ZpymOM5hNkVjrCZN013/Wew/TLpN1TNljIFCGgr/zXdYsJzaGyrIavDwGtSg3R4WPthlR2elbfQrOQLK5eTy9B5rlVnrABU0TlPq+eOO/fDnTcWEzY7MMg1Ivkub7l02vMZHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsiZQLWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsiZQLWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A93C4CEF5;
	Sat, 22 Nov 2025 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763822062;
	bh=T+6mWQVCFsla9EUgNqlT9JSbzGiGlClNcL+IwLTmnJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bsiZQLWSG7BjnQYJcpG/lzJozWeDi5cVSkEtfkqkn3l32EizemIyGRuWdWII9Tzg3
	 k33OcK4bdD1IFn9P0Qb6nqj0v1kMD7thoi+SIer8jqfPaIKsqj7FO6WKb7/y/Uv0L2
	 uWYRke1xA+VrVM82ptgvQ2lcOXboD8u4YCeuiJWXJdgpyJtf8bnHn5TROjyiCC1VQz
	 mU9k6seQd/vSeaswAqMEh/vFF35kdf3d+/TXzhNxPUynv4je635YWsPDKELPVFAZY+
	 hL/pNVRFdgNCBV/hndN1yAiHKbOMWCuKAutCuNJGJmIeX8E2ifLjQahHD863RKYto5
	 mhrNbllqOQn7g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] memory: drivers for v6.19 - replacement pull (v2)
Date: Sat, 22 Nov 2025 15:34:08 +0100
Message-ID: <20251122143409.68115-2-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; i=krzk@kernel.org; h=from:subject; bh=T+6mWQVCFsla9EUgNqlT9JSbzGiGlClNcL+IwLTmnJQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpIcnhy40yDKg+V3FjazX3U/w5YaYWspTAl8H/W GgiI6ae3uGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSHJ4QAKCRDBN2bmhouD 18uuD/9vnbiUaQ2I+CWmOToSCcHGVxi/FGFxj6HPAMYTolBuJ1juiFvViMwNoixuRK5LoH6TFfu vQgGNeoxiEtWjqw8+d/mKTj8xLA6P1mjsr5b2l3zZO+mgrDvc+DKQlybSC7SGRODigkc+MJVCm3 QJdauI6N8R14AGDzTySo8UOiQRpf3KZmOnSvNahVLSDGN8D1L19cd2pFtqZ/IcqzkJEeA0T0iBl eJW3cs5ZTcJzQvBvZbVBIDcXksJInTM34ODbYdTRMjs2iN/xS+4b6HerbvCK75HA0cI7PRTZWYB xNaLG5sDp9pLnpPxnWXb+dySiT5Iwikb/CDnAodh1PJKOuPw9KhW5O7iMuJJtBm+yHS4bjaKyEG y80Y/ZdCR9oIeOAvv2FPOppRNEq98bGygGvIrREJJEq/MBOvU1ShUKn9PYOivvj7Dzpqon4FFAO /dxJij3y3XuparGZQsZmY4vvYdNuEirohoSZ6Iy2nQ1VlujHV2HdvXi5aL8RJ6WRM5R+o3k273o PnEUHmkjU91dyzYb7YIj2GlXBi1wf8d1roENpZ5p+x5qdbIk0wpx7hyueXGD/4U07dzJeCbdN+0 6aXLnzhzsRIGj8q8K9Yjz8qYr2TOOHgKHTs/nL1YHHavAGyNCCooObpRq8z3CGEy6zvz5A4UlBK dDlrCaSluMRWD2g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

This replaces previous pull request:
https://lore.kernel.org/r/20251110173624.3127-2-krzk@kernel.org

by dropping Tegra ICC changes, because Jon [2] reported regressions and we
could not solve them within reasonable time.

[2] https://lore.kernel.org/r/82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com/

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.19-2

for you to fetch changes up to 1463299a227d02b40c842a5d91d989cb26da5bbb:

  memory: tegra186-emc: Fix missing put_bpmp (2025-11-22 13:41:24 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.19

1. Tegra drivers: Several cleanups (dev_err_probe(), error messages).
2. Renesas RPC IF: Add system suspend support.

----------------------------------------------------------------
Biju Das (1):
      memory: renesas-rpc-if: Add suspend/resume support

Jon Hunter (1):
      memory: tegra186-emc: Fix missing put_bpmp

Krzysztof Kozlowski (13):
      memory: tegra124-emc: Simplify return of emc_init()
      memory: tegra124-emc: Do not print error on icc_node_create() failure
      memory: tegra186-emc: Do not print error on icc_node_create() failure
      memory: tegra20-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra20-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Add the SoC model prefix to functions
      memory: tegra186-emc: Add the SoC model prefix to functions
      memory: tegra20-emc: Add the SoC model prefix to functions
      memory: tegra30-emc: Add the SoC model prefix to functions

 drivers/memory/renesas-rpc-if.c     |  56 +++++++++++---
 drivers/memory/tegra/tegra124-emc.c | 140 +++++++++++++++------------------
 drivers/memory/tegra/tegra186-emc.c |  35 ++++-----
 drivers/memory/tegra/tegra20-emc.c  | 150 +++++++++++++++++-------------------
 drivers/memory/tegra/tegra30-emc.c  | 119 +++++++++++++---------------
 5 files changed, 250 insertions(+), 250 deletions(-)

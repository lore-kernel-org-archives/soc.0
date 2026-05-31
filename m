Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCDE372B32;
	Sun, 31 May 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780229970; cv=none; b=hPoRJ/7o3hRYuq8H58MUCg7glZYqkIJZ7pQ5v6KlQwDtrBEsimHBFQUeiojgPOwb7+1GilHAXhBAACjYNEcdO0J2rOjT25i4kA4ZkOcF8zDsLjf64W2Y9DwDvJyjobjPbUWdswv5ycWqt6KqnNAI8Yu3b0DINiMG+GKEMpnAa00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780229970; c=relaxed/simple;
	bh=UuG7wp35xIoXgDnOnI4+b6zdYhQkJDtCe8Z57BM2X2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqomL7OoZDqnUTjOWkX2HZFVFbZrzFWlDgtoEkuocfoIEGrpCfxaOYcYZYd81cjgXf8yU0vvStlr3/fi7yqMZehOlHE+XTovJAeELvZvzYDE6XLmfoIhW9v3OHCMTa74ouAiOyWgPuxNo8L7q59Xb4qRBIYXdrImarLxGjDeoLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiu3CKHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiu3CKHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2083A1F00893;
	Sun, 31 May 2026 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780229966;
	bh=BOjNE0ZyCPtHeDevfNwnLaiZk6K+s3a08d/1p4NIqds=;
	h=From:To:Cc:Subject:Date;
	b=eiu3CKHw5iSXS6+eJvmat+zT68Ql4iJ2/1r/yCY67AGhixmXWf9uElqnBA4ZdhQVe
	 oZc5B3vlpvP45Hwch3Rgc+1DPgY7b+Xt5B3cdacoff8sdMGjNwnAYeUt4Y0FvHCno7
	 F4Wah2cTZE8MRa/SxNKrA2B7sigkh0h8i5DgP7seYilGcLktY303u8FuXYlrRF4Sdr
	 VqkKs36m8zRcS1LVE7goAFhFin0YpNSbVW4urwGCuyc4E3N2qZFHiDt+A3KyK4g2Ws
	 ihn4CFI4d/oCq6RmVG7Rft+iTZTeHi14a5Bas2BeXsFEtBBlOUFamBK5mStBifW1im
	 msQ+n7EV4gj0A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v7.2
Date: Sun, 31 May 2026 14:19:15 +0200
Message-ID: <20260531121914.22421-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4549; i=krzk@kernel.org; h=from:subject; bh=UuG7wp35xIoXgDnOnI4+b6zdYhQkJDtCe8Z57BM2X2M=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqHCdDkA+DDBVmovE0fXNpMnlzWJFTREvJtOSyF V4yKK7iZ3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahwnQwAKCRDBN2bmhouD 18w7D/0bhn/lVoAznd8crm+hAFfKa8lsWH0kX/N4iy/i0d2PXi2NvNQ3xYXjaI5jnMFceLCSWgq EA2nmweGnjeq2n51qCMVAjGGKCGzvUeNYj0mFUD2r1Nqcfva+2S5/Bjr5J9hrmmPlrHl6VZDfxW am/P3cTrY0pYC+Ux/DBiTMhsraXWacvNCBHhNMHCRUlx5uWqj+kBgO4XAKh8ATaEAU6FXNAnMz8 4AJIJ0xOs5CG6/B4wmu0n71ygrHAN/lUOvPtA+nIxFEqeHdqcsj6Y+56TanyXefga74EKlf86sj Se5qnPT24HtocWIDVW8tGiKzuYgT/sKvrn7YW5RnZCm/g3rpYTaRx1HlCLrVvImKGEF4BxjK21I +ICgS1MVDtcVaxg/fiuxU1bSe1vFiTAI1oLSkCyOosdrYrk8MncDfBevQToeoXuTxhZz61assWe OT5NTrfI+3bdDGb01p+6l6qgSoD+YERR2zjvjJCou4rzkovTdH6HMJRFoY/uA9ZzeOeQoUrDGib y6iAjrJlO1XrVQaATd35IepvvCEtwUbWtBsYoxwE00pbFFn2QEdDVGMWQ59WMkSkXUYIv5xsWC/ 7sq78QbgOGTVUu606jMRLarfOrNmYPBOFcNSpPa46HIVDxqllFmoPu7kQ6mzSPvpxrxzoaFv6DS QGaOWUgFx8DEAAQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

On top of previous fixes tags/memory-controller-drv-fixes-7.1
(which contains only one commit)

Best regards,
Krzysztof


The following changes since commit 754d60ad1c91895be0bc7d771fbf9fb3c9448640:

  memory: atmel-ebi: Allow deferred probing (2026-05-04 19:15:59 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.2

for you to fetch changes up to d530ed059dac445dc5b81d564adf1952b5c4adba:

  memory: tegra264: Add full set of MC clients (2026-05-27 14:50:19 +0200)

----------------------------------------------------------------
Memory controller drivers for v7.2

1. Tegra MC/EMC:
   - Handle system sleep, necessary to re-program registers after system
     resume.  A few more improvements.
   - Add Tegra114 and Tegra238 Memory Controller, and Tegra114 External
     MC support.
   - Grow Tegra264 support.

2. Renesas XSPI: Document RZ/T2H and RZ/N2H variants, compatible with
   existing devices.

----------------------------------------------------------------
Ashish Mhetre (5):
      memory: tegra: Make ->resume() callback return void
      memory: tegra: Wire up system sleep PM ops
      memory: tegra: Restore MC interrupt masks on resume
      dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
      memory: tegra: Add Tegra238 MC support

Ethan Tidmore (1):
      memory: tegra: Fix possible null pointer dereference

Krzysztof Kozlowski (4):
      Merge branch 'for-v7.2/tegra114-mc-bindings' into mem-ctrl-next
      memory: tegra114-emc: Do not print error on icc_node_create() failure
      memory: tegra114-emc: Simplify tegra114_emc_interconnect_init() error message
      memory: omap-gpmc: Silence W=1 kerneldoc warnings

Lad Prabhakar (2):
      dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
      memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms

Mikko Perttunen (1):
      memory: tegra: Deduplicate rate request management code

Sumit Gupta (3):
      memory: tegra264: Skip clients without bpmp_id or type
      dt-bindings: memory: tegra264: Add full set of MC client IDs
      memory: tegra264: Add full set of MC clients

Svyatoslav Ryhel (4):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller
      memory: tegra: Implement EMEM regs and ICC ops for Tegra114
      memory: tegra: Add Tegra114 EMC driver

 .../memory-controllers/nvidia,tegra124-emc.yaml    |  174 +--
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   31 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |   31 +
 .../memory-controllers/renesas,rzg3e-xspi.yaml     |   60 +-
 drivers/memory/omap-gpmc.c                         |    6 +-
 drivers/memory/renesas-rpc-if.c                    |    2 +-
 drivers/memory/tegra/Kconfig                       |   19 +
 drivers/memory/tegra/Makefile                      |    3 +
 drivers/memory/tegra/mc.c                          |   40 +-
 drivers/memory/tegra/mc.h                          |    9 +
 drivers/memory/tegra/tegra-emc-common.c            |  143 +++
 drivers/memory/tegra/tegra-emc-common.h            |   46 +
 drivers/memory/tegra/tegra114-emc.c                | 1351 ++++++++++++++++++++
 drivers/memory/tegra/tegra114.c                    |  193 +++
 drivers/memory/tegra/tegra124-emc.c                |  107 +-
 drivers/memory/tegra/tegra186.c                    |    4 +-
 drivers/memory/tegra/tegra20-emc.c                 |  110 +-
 drivers/memory/tegra/tegra234.c                    |    2 +-
 drivers/memory/tegra/tegra238.c                    |  391 ++++++
 drivers/memory/tegra/tegra264.c                    |  568 +++++++-
 drivers/memory/tegra/tegra30-emc.c                 |  107 +-
 include/dt-bindings/memory/nvidia,tegra238-mc.h    |   74 ++
 include/dt-bindings/memory/nvidia,tegra264.h       |  287 +++++
 include/dt-bindings/memory/tegra114-mc.h           |   67 +
 include/soc/tegra/mc.h                             |    2 +-
 25 files changed, 3291 insertions(+), 536 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra-emc-common.c
 create mode 100644 drivers/memory/tegra/tegra-emc-common.h
 create mode 100644 drivers/memory/tegra/tegra114-emc.c
 create mode 100644 drivers/memory/tegra/tegra238.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h

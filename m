Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE833CB8FD;
	Mon, 27 Jul 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179290; cv=none; b=PTv2N9EuO1uu2cd4NLi4d9cTq/sCV1+vVt+WhHsNmtrNb8mI/1LQ2YtDdyAXtdiM6miL4tEinwtjiS5IYRzlv9K4rl+Me799AXAGS0v7hwhQFhO1wpXW+jVMPp3DRQaRIM8rzAhXs4doGiyCARS1FU+tir2Wr4BUzS4Jn5+rr8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179290; c=relaxed/simple;
	bh=tCJRwJar7uZdqcxSum9GUM50W/GgKgTB8wDkrfSX8+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyyEyOiWztbZk2rdeJUWSdU3Six0d93w16ehRTeRkR/BoqfTC6UaLF5OfX28Gile0bKX1+D+EfezdaYzlWALmOVNY3ymqGYYpWmN5pCAGoffUQO2BOox2GQwZ4ijdleLCyruylI8CcOYq1z8bCkRvG/JKNq15uNXlyrJoV608k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2KAhd9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2KAhd9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A89C1F000E9;
	Mon, 27 Jul 2026 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785179287;
	bh=bnbbgnXJAZwwGCF8TzALHmthr78bYckB2Cx0o97mffA=;
	h=From:To:Cc:Subject:Date;
	b=C2KAhd9yDrY/JVUgOm7UjHRozyyW7IEhJtdC3LZ4JaafHTYQkoNyrXaPlGvQoysWN
	 KlGhTEjxBY0UNR+nhgrVeAZbFRlEjB+I1FeasobCFhI/CsN1bS4tIDqM5C6VNT44OF
	 UjCcg/UYRawW6xicYi5lR+lm5d7nH4wTMNSqPCWsQEXIIE3E4VwTIfm5ae3LisiHJK
	 lXHcruwGYZyhP3GmaUDB5crG6VpKjabiFEepPevr7mMNVgEFziscQmOzvJ08fELQyU
	 W+dkvLmfUVPwdqsXv3XtO80pPyWyuW3CZ4iZnYNIVPfez11eLWqN/mKmBeu1Z4JyeM
	 2ztW+d0kWnQuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v7.3
Date: Mon, 27 Jul 2026 21:07:58 +0200
Message-ID: <20260727190758.406132-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=krzk@kernel.org; h=from:subject; bh=tCJRwJar7uZdqcxSum9GUM50W/GgKgTB8wDkrfSX8+M=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ6yPMFq5iVlu7geLaP9PlW75dLVwXepuK16FA c2wcTNn3z2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamesjwAKCRDBN2bmhouD 1x4uD/4mm7yd450A/SjFISdfmTpfq3X70RuoytuVru2KG6Ap/srUx1zvA9DqpJvSeInwfR/afJu /NvVPXrXetT3crtKElY1hxMNPiXSgsS2LIFW1AiCsU0AtgSqHIpZDH9LAzYf3xX0n4ggRkRfm1o lMGHwTGjUy7XpEqiTSUah9KXJh4BIimY0ypm41cOHhco1j5wF9ElePwlcccheDdMEHDKJ9kuOsD JsH72EYvjcrZblG7ZRTNgQY/DYfRccl4ziTCcgtrN+SJ7RnjhdbL/twDWVgdcvGXiS7kQnroxpZ 84GwgTFV3gbEpVZsw9zh6qzDhJ/pEMDzM86ffxo4szLif5x/dQpNFGf24Yb9qgUqA5c3N/uuS7f KlTAH0Rtpra19YvThKxwxE/rrOV2sK93pzqs/Wa2TSqlhUp65wF52f0ZICXoamNMn9zGjhkmdaC ojIFR+/4OPR7SQEnxRkVTWSJHW7F7ta8bU8ZbufFr+dqhIiUDfpzALF1Soldp3cqgI9RraxySzD Uk4RDoUk2O1Dmg8AKuQymmo8GdfXezGDnaQeS9ixppTIZ/jZlg2Bw8tLSCYzNTDhhItJEVG/GeQ UM5oD3iXQA5xq0Sqtplm3Y/6ORhRkg77NQtBPvMY5b0b3Roxpk7oZVNpR3O6TGEiN5G/cCHS+xI 8+MM9/5wwz9cCVA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.3

for you to fetch changes up to 96aa6902ff2bf81b9b8e0fa228494595dc2374a9:

  memory: jz4780-nemc: Use dev_err_probe() for clock error (2026-07-25 18:51:00 +0200)

----------------------------------------------------------------
Memory controller drivers for v7.3

1. Few improvements: STM32 OMM, Tegra MC and JZ4780-nemc.

2. Refactor Tegra MC interconnect code to better represent actual
   hardware in multi-socket NUMA cases.

----------------------------------------------------------------
Ashish Mhetre (1):
      memory: tegra: Guard against NULL mc_regs in IRQ handler

Miles Krause (1):
      memory: jz4780-nemc: Use dev_err_probe() for clock error

Ruoyu Wang (1):
      memory: stm32_omm: initialize ret in stm32_omm_set_amcr

Sumit Gupta (1):
      memory: tegra: add multi-socket support to the memory interconnect

 drivers/memory/jz4780-nemc.c        |  7 ++--
 drivers/memory/stm32_omm.c          |  2 +-
 drivers/memory/tegra/mc.c           | 48 ++++++++++++++++++++-----
 drivers/memory/tegra/mc.h           | 37 +++++++++++++++++++
 drivers/memory/tegra/tegra186-emc.c | 71 ++++++++++++++++++++++++++++---------
 5 files changed, 135 insertions(+), 30 deletions(-)

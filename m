Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FF2F8EB0;
	Mon, 15 Jun 2026 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517010; cv=none; b=BrD0faO8a7xip3uYZqIIgfxo+V+LGQoQEVdxFV5tfu4eKyD4xY9DA5grlZDIj+t5F0PZaUgp4kXEfVTqWR7/Na5zrRuk38KGSNHjY5E/jU2bCLnzAjSNxNSI/XQHjVH286E+EI/rARcGx+sQeTcl5535RsPQndMaaMi2KR8Cjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517010; c=relaxed/simple;
	bh=dr3q5sjSKDeP0bUL3ZOqFcyLswRkiFw/H0KTCO5SpmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dreKGv6IVe5Rt2cAwwEvS5t7bN/+b59AqqbEh05Zyz2DW0FrerVOamEPCfs48dbY1e36mXDsEMPOdh4cnvGx7w6aEaN6e9Zwn3UjrdCo/rgLXqAuEMeGs79iOLmlT47UHFWUtU+P5BGhzLbp7xD7jg3eizmMNEeXxXV8sTUWeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+JzLXxk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+JzLXxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537051F000E9;
	Mon, 15 Jun 2026 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517009;
	bh=0I64NVOCk8Ewqn87CJ/oukz8M/zTaejLJNCZxe3f9aI=;
	h=From:To:Cc:Subject:Date;
	b=N+JzLXxkYVa/ZJ6ph0Ucb3sRwD9rvasfdnzQ6X2+FwXDkr5u9yL599BT8iWGP2gHc
	 itWhUSdRhIp6Di86VQsi3ahaCTB9W/ByjILacTHs9oDiz0SqQzMAf6dOB7Qr45Qxha
	 XcqqZkbmREzJ6SY/z12AYbQWnCenDvCvudGg9M1TGsRvJcwSdsPjuJ+gt6g1Lf8sNW
	 OlBZ7GOsAnR/9k9LIbEZ7SYnhL2sT9z7bNc1BjwoBp4D/HSDaLxEtFHIWd6He52wc2
	 1cK8SwA4BM6eFq9VxkXGDLWeVwquLiCkweALQ6SaJdwiKxYuQeJvyjH8gqXC9tNKS0
	 tcl5wx0Sj3Kkw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: late drivers for v7.2
Date: Mon, 15 Jun 2026 11:50:01 +0200
Message-ID: <20260615095001.83933-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430; i=krzk@kernel.org; h=from:subject; bh=dr3q5sjSKDeP0bUL3ZOqFcyLswRkiFw/H0KTCO5SpmA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqL8rJeygiifwXI9pUtRsB1FYaXIM/l8V9xKWdW tC+f8bKUb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCai/KyQAKCRDBN2bmhouD 19xAEACKN+vzTf04Z/SGFVBHcOu0DIuj2oS1Pb/8QYVYEYxBTejroJeyit0/FOPnjgXATLUTN6Z JTvnepuYqZ5Soiq3Wq3Pf3w5tVwGXuXuoiKK3R4BJoWuoVYEJ/qic3UXdh/mTzv6Q9pq5vaR182 zlpG79MCKzn1bAsbTntRsXLPp8+roBrTRHQbGcCu0YJCptD74f5sSUXJ5n6Z8Macd/Y8j2QptUV O4YSejZnShNz00hLmc0wHqXNQBvCI8SpcbBrzZtlfq9NROCg8MKiRbWDXk2bteS1dIRTbSzknpb EP2CvBeQQ7y6PlTJZgjdD9uSOfT99y4Je3KpT3ZPzdS+FQ2hwerZCiDvZyWMlyZZzgca16j3a2H m1MSkbVDyV2KMcnts3/uo1z95PlIyWd5NotSDZ2/4JVPP188hmGNu7rKMqiVNW3YWQJvbdNLxDH ljkEMEXTD5r2uW9TfHL84EcrShbsabuBlmiSBBaIRqPJYgeMOuehYtr6pnxWio2b+e44/6zUf/m nL2a87BH1y2kIu5BN1atEjNO1v3BzRj/orO8YydD6lsbqRqsXKuQfStwcbGNZ44TUR1pWvW20++ c7uOo+VFgjoShai7nsKK7qD+DxmbWFB+C/j2GR8zqe+06p9lgeSjZNxDZgZ9F1lubLI+q+CAd6r 0D0pClydSm+qPBA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

Late pull, on top of previous pull which was accepted.

These are two improvements and one fix for UBSAN report introduced back in 2023.

Best regards,
Krzysztof


The following changes since commit d530ed059dac445dc5b81d564adf1952b5c4adba:

  memory: tegra264: Add full set of MC clients (2026-05-27 14:50:19 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-7.2-2

for you to fetch changes up to b97f7dceb8adb2b05d556469afc6fb54947ef61c:

  memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate() (2026-06-09 17:00:30 +0200)

----------------------------------------------------------------
Memory controller drivers for v7.2, part two

A few improvements for Tegra Memory Controller drivers, including one
fix for UBSAN report for an older commit.

----------------------------------------------------------------
Sumit Gupta (3):
      memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
      memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
      memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()

 drivers/memory/tegra/tegra186-emc.c |  4 +---
 drivers/memory/tegra/tegra234.c     |  6 ++----
 drivers/memory/tegra/tegra264.c     | 17 +----------------
 3 files changed, 4 insertions(+), 23 deletions(-)

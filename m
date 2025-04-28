Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BBD530
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829777; cv=none; b=g5Jy5rnNcuUx+5xvhn9LmY3GlIRjdXt6m21X2/0fEJe/o6hNQXJC8Sd9yufcVE0UfxirWN5U4dIamP4RMSuRYmKmEGb9vk/AJdLdneg7ysQirxe7VM1qQIoFZe9gOCeajwFruqdeqoofAf7coZmjGi8c4xx2udSDF7REkN/ixSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829777; c=relaxed/simple;
	bh=OI5ZUFkKlZcdx4XCjlRyprfVIcbcTC+fNZppjc7+axs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ED9wUAc8lUzeLNH+34TBW165OUlinYvcqtRJp1Y1tovYso4oegai+hsM+WGFPuCKe7criN+aGUeaGAKjlunD7QIyWjs7h2t9UKkCvyqH22oOnL6pjUiOfIziWugHVm2wqYiGevyIsB4E4M6E/vD7S10kGH0gEz0VUSTeX+xiYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qbJT/6nX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qbJT/6nX"
Received: by smtp.kernel.org (Postfix)
	id AD8FCC4CEED; Mon, 28 Apr 2025 08:42:56 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2A59C4CEE4;
	Mon, 28 Apr 2025 08:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2A59C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4K3Qwsa6osT47RC+pxezJV4ZKGVwxR2f9TSemPDQ+RM=;
	b=qbJT/6nX6mSTCQCOCMYGvgyL6IwI2sY+D7ktj7c1vVNdgBMTucsfXvR6K3XRjs
	vRDzyVAMsX2o6BT0P2KQSBJZEFL0QAD/MLLmLqcTaCg6EZY7nLjeEYvw2Q6NiQZ0
	odel16PFErR6M7H8A5SaTyRkfPBwuSiti4uiuAVmFjP64=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3;
	Mon, 28 Apr 2025 16:42:38 +0800 (CST)
Date: Mon, 28 Apr 2025 16:42:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.15
Message-ID: <aA8/fFzh22s1Vtl1@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1xCr47JF4rKFyDWw48Zwb_yoW8uF4UpF
	y3CrnxGr48Jr1xZrnxt3Wqq345Jws5A3WYvF13X340yF15Ar18Xrs8W34FgryUAryIv3yY
	yFyxtr9rK3WrZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARk9ZWgPB4HeVgAAsp

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.15

for you to fetch changes up to 5591ce0069ddda97cdbbea596bed53e698f399c2:

  arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2 (2025-04-27 21:49:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.15:

- An i.MX8MP change from Ahmad Fatoum to fix the broken nominal device
  tree caused by commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
  GPU and NPU clocks to overdrive rate")
- A MAINTAINERS update from Michael Riesch to exclude Sony IMX image
  sensor drivers from i.MX entry
- A i.MX95 device tree change from Richard Zhu to correct the range of
  PCIe app-reg region
- An opos6ul device tree change from Sébastien Szymanski to fix
  an Ethernet regression caused by commit c7e73b5051d6 ("ARM: imx:
  mach-imx6ul: remove 14x14 EVK specific PHY fixup")
- An imx8mm-verdin device tree change from Wojciech Dubowik to fix
  a SD card regression caused by commit f5aab0438ef1 ("regulator:
  pca9450: Fix enable register for LDO5")

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks in nominal DTSI

Michael Riesch (1):
      MAINTAINERS: add exclude for dt-bindings to imx entry

Richard Zhu (1):
      arm64: dts: imx95: Correct the range of PCIe app-reg region

Sébastien Szymanski (1):
      ARM: dts: opos6ul: add ksz8081 phy properties

Wojciech Dubowik (1):
      arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2

 MAINTAINERS                                        |  1 +
 .../boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi   |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 25 ++++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  | 26 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  8 +++----
 5 files changed, 54 insertions(+), 9 deletions(-)


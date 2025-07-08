Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860329824E
	for <soc@lists.linux.dev>; Tue,  8 Jul 2025 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960969; cv=none; b=sVMVloVYM3G8c35mzBi8l4e0BOStBX5OC5wX2FJ2HFCZhDjRT7P6Ty6T113gT0PXe8+VKVzzBfameEJVIvrF4RJ5yNEUIM2LbaXsuHlQ2EOgqR09zoWL92XngkngbiYxRuJDgocjka5T5plDa/gWXd85en8qDm4FkRQmcHPr/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960969; c=relaxed/simple;
	bh=IJMN1sqs3Tru7AgnyhfhZso36RYZ+I0PaO5xH/w/vHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+sQQA2akST3ofRy62ZVL43Vc0k3Myu/4G59UYGgPKRbOivjNuhziVuQ5B7s4N7FV84i5cWykRegDD6ciBjRxT3wklR+lrdShAOMpXqNHPuqirRzOPEH6miuj+QcxJx3CGRKU1tXsWqnsFoYTAeXBmzBoq8k+yH4CYvGlNzCEfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CNaM7Y/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CNaM7Y/S"
Received: by smtp.kernel.org (Postfix)
	id 6CA32C4CEED; Tue,  8 Jul 2025 07:49:29 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2263C4CEF0;
	Tue,  8 Jul 2025 07:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2263C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kq+SB51IWx4bYSOte+h2bEHJqLVRzmFO3MooWcUuZaE=;
	b=CNaM7Y/SdBHvNuv3PZy9ah15cz/PUXZqtNyfTl0xaF4B/9JOQekha/EI2PV0ml
	0wEN1Cuk1ymEQdK6Fw/7TNdGEkoSOeWpkHVXVJYoDPmzoOjjJzp8t5HMmy4D20le
	LMkCJLdyLsU3FFSZNJggmS7jPVmJtyCyecsvkAIKAHTbo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHpsR5zWxowR9NAA--.48928S3;
	Tue, 08 Jul 2025 15:49:15 +0800 (CST)
Date: Tue, 8 Jul 2025 15:49:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.16
Message-ID: <aGzNeZ7KtsRsUkZT@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:Mc8vCgDHpsR5zWxowR9NAA--.48928S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1fGFyfKw18Gw4kAF47urg_yoW8tw1UpF
	43CrZFgr15Jrs5GrnxXrs7t3s8tw4rJF45Ar17Cry8KrW5ur9xXr15GryrWrZFvrWxuw4Y
	yF1kXryqg345XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc0eLUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRvGLGhszXt6qwAA3z

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.16

for you to fetch changes up to fbe94be09fa81343d623a86ec64a742759b669b3:

  arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on (2025-07-07 15:36:41 +0800)

----------------------------------------------------------------
i.MX fixes for 6.16:

- Keep LDO5 always on for imx8mm-verdin to fix broken Ethernet support
- Add big-endian property back for LS1046A watchdog, as the removal was
  an accident
- Fix DMA interrupter number of i.MX95 pcie0_ep device
- A set of changes from Tim Harvey to fix TPM SPI frequency on
  imx8mp-venice devices
- A couple of changes from Wei Fang to fix NETC overshoot issue on
  i.MX95 EVK boards

----------------------------------------------------------------
Francesco Dolcini (1):
      arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on

Meng Li (1):
      arm64: dts: add big-endian property back into watchdog node

Richard Zhu (1):
      arm64: dts: imx95: Correct the DMA interrupter number of pcie0_ep

Tim Harvey (4):
      arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw72xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw73xx: fix TPM SPI frequency
      arm64: dts: imx8mp-venice-gw74xx: fix TPM SPI frequency

Wei Fang (2):
      arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
      arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi       |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi     |  1 +
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi     |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts      |  2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts    | 20 ++++++++++----------
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts    | 12 ++++++------
 arch/arm64/boot/dts/freescale/imx95.dtsi             |  2 +-
 9 files changed, 24 insertions(+), 22 deletions(-)


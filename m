Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1A2DEA87
	for <soc@lists.linux.dev>; Sun, 16 Nov 2025 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299383; cv=none; b=sK6X/po/vopKynNPiQfTSrrW0/S54QJZPhZ52obEkhBXxB7PN858aVp4h5gRUaQeWlL9WpAPQdc2GZ3hQe4bnk8GfKzKAxbKtmkadruDCvAo9WpFBz6saeeQLGvpmaRnqA4n2tHh/Ezr6tRXCit6a93WbrOVY31FM7eqI8BZdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299383; c=relaxed/simple;
	bh=6I4cyNV0HSAE8orbsJnRXfFMajy8pAd/U7/NvJWKNGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gprVVOWFntzjalQDbEKtIiEAIZqqliyQAImRhpnUW43tRHld5eDYfKm/DRPJ9TXDHcoOmrawKbfUDLySVjb6VRUo/OUkxj83UiPe1mQX1X9qa9HIs0MJdd2sOfnF9D3dPibubxWYsL39jJJhFA6G7g19+uTJpk8hmGtGnVk8x3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=peEO2RQM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="peEO2RQM"
Received: by smtp.kernel.org (Postfix)
	id 411E8C4AF09; Sun, 16 Nov 2025 13:23:03 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5436FC4CEF1;
	Sun, 16 Nov 2025 13:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5436FC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UyWmX8lyk6Q6Z7q+BldQ+cSN+KVoYs+SIyHi5V2ZslY=;
	b=peEO2RQMFXaIluYeeud6gLbCDaDrueelwCG5Jbhm2uYPmZTns9jGPk1sD1Oi2J
	9nwb2+KfyRhfvwoE3/GpC3bFsVJhKS8QvJ32BrmWc7ZY9udfsm1hJf80PL5kX9Kw
	Kj4BVCned518h/+k/kn1Wx/Ve3AYzWt8xB8V80YwOIlHM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXPz0r0BlpBasYAg--.7967S3;
	Sun, 16 Nov 2025 21:22:53 +0800 (CST)
Date: Sun, 16 Nov 2025 21:22:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.18, 2nd round
Message-ID: <aRnQK0kiLvQZ9X-f@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:M88vCgCXPz0r0BlpBasYAg--.7967S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw47Xw15KF43XFW5ZFb_yoW8Xw47pF
	WSkw17Gr1fGF1rAF1DJa1v9a90yrn5JF15Gw4DG3y8trn8ZryUXrnxGrn5Wry5Kry7X3y5
	tF18Jr1DGw1kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBrWrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOA7fRWkZ0C6S-AAA3M

The following changes since commit 6504297872c7a5d0d06247970d32940eba26b8b3:

  arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18-2

for you to fetch changes up to e89ee35567d3d465ef0715953170be72f5ef1d4c:

  arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity (2025-11-16 21:10:06 +0800)

----------------------------------------------------------------
i.MX fixes for 6.18, 2nd round:

- Correct i.MX8DXL's pcie-ep interrupt number (Frank Li)
- Swap interrupt numbers of eqos for imx8dxl-ss-conn (Frank Li)
- Correct SAI3 interrupt line for i.MX6UL (Maarten Zanders)
- Correct mux-controller select/enable-gpios polarity for imx8qm-mek
  board (Xu Yang)

----------------------------------------------------------------
Frank Li (2):
      arm64: dts: imx8dxl: Correct pcie-ep interrupt number
      arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos

Maarten Zanders (1):
      ARM: dts: nxp: imx6ul: correct SAI3 interrupt line

Xu Yang (1):
      arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity

 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 4 ++--
 4 files changed, 10 insertions(+), 5 deletions(-)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3B634EC
	for <soc@lists.linux.dev>; Sat, 10 May 2025 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746838026; cv=none; b=MnKCzYrDfPI+P1FWBvYjV6MHk3hDgp9wzddvMiKPQG0i7es8+BTAWZPbXySsB7XP7HXiTf7V9+xPzayBhkslyI0ASO7XwUaY8p7pEHgXx2U6CRZsXyYrPt9uxvezX0eGkm999A3usplTCq61uNa8LvUGJ25oTxZcJUHxYdX1cN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746838026; c=relaxed/simple;
	bh=onXJkqf9B/dgI1onUvhrUUIygXzUBladJ1FPRg+XXqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j08QhoSzVvw1RcwNHo2a/xI3kODOufM5of344hsglyhaGFi5SzBtaJl1mrFn25EW4BamSGdD52AVEx77NSeh3e+rdQQDu6XZSrGIzTJC+/kEq761FxSslFVdXlcHkcRxI++XKUjSuofh/sMjKG1vEl+8JGRbaboWJ5RdaqpwUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eWducVhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eWducVhs"
Received: by smtp.kernel.org (Postfix)
	id 1D502C4CEED; Sat, 10 May 2025 00:47:06 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E64FC4CEE4;
	Sat, 10 May 2025 00:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E64FC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ygNenFQSlWZKHuaoFHsCRPZl844027GugW0JBaYx3TE=;
	b=eWducVhsMtl+BPa+5dmA1AnRPO73y7sQ/tAANPwwIjYRIWPbm4n9YOIQyShTO1
	FBozbGCKSyZI8c9IjmkUrDvFRufPvQnFrY0HE2pYRzO2IxW1CbSKcZr/RKXVTa0Z
	geTuyUeUptz5M73C6j/N+N0ea/1FSJduxByuijTpQJr+c=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3NyX_oR5oLaCwAA--.3659S3;
	Sat, 10 May 2025 08:46:57 +0800 (CST)
Date: Sat, 10 May 2025 08:46:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.15, 2nd round
Message-ID: <aB6h/woeyG1bSo12@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:Mc8vCgD3NyX_oR5oLaCwAA--.3659S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw45tFWfAF4fWw4fuFg_yoW8JFy7pF
	4akrZrJr1DJr47AFnrXr1DKF98tw48CF1UGr47Jry0kr1YyFy8XFn8Kr95GrW7J347Xw4r
	KF1UJryUKF15ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuT5LUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERdJZWgeoekASQAAsd

The following changes since commit 5591ce0069ddda97cdbbea596bed53e698f399c2:

  arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2 (2025-04-27 21:49:30 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.15-2

for you to fetch changes up to c6888983134e2ccc2db8ffd2720b0d4826d952e4:

  arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout (2025-05-09 22:48:35 +0800)

----------------------------------------------------------------
i.MX fixes for 6.15, 2nd round:

- One more i.MX8MP nominal drive mode DT fix from Ahmad Fatoum to use
  800MHz NoC OPP
- A imx8mp-var-som DT change from Himanshu Bhavani to fix SD card
  timeout caused by LDO5

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive mode

Himanshu Bhavani (1):
      arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout

 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi |  2 ++
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         |  6 ++++++
 3 files changed, 19 insertions(+), 1 deletion(-)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CEE31076D
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687018; cv=none; b=pzmeKmjHagLsjEofaMkSlv2NDALYJq+ab5C6YNcc3kPRJX21UxhGthej+ZoCWKvV9JdFNuHo9CpTnIflxgPaCaD/3p84dc++ywuPzM8MKF5fYyWpCfHExwV4N9fxbLSu8cYmwPHfLKF3gVeZ3EJnWpUQmUUMaEJViIyqE1qH9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687018; c=relaxed/simple;
	bh=u9ztNDW5/17nN5zlXKRxxHXvs9Mkpgv00TtHfFlr6HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPe3UYy+RvDZIwa4o4/O8SSVQNxF108Q1ZPhIrCtlMOK33UXwjCKwNxmmbglky7K42N+PVl15+/XTBf5akHCNQcrC4J3HOmaqyUB36BDOaaTWKpG6xe/ONnAEpT5wGiIRYXHaoQyFvdWmhYkMzG3QWOdKACIfnDXZ8Qk4Obdlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TEpx6NUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TEpx6NUW"
Received: by smtp.kernel.org (Postfix)
	id 4E731C4CEF5; Fri, 12 Sep 2025 14:23:38 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9EC8C4CEF1;
	Fri, 12 Sep 2025 14:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9EC8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Bh6lev1UNCESNw2mOnhwcMCgXQC7sNspGByTb4mN6ic=;
	b=TEpx6NUW7mChNKtapFhFOgQ5td4e+L9NbhQUbdE8iZdl3X5QEzkjJKCyBaD1EQ
	NLZvjDZh2gGzzJRKl01jS0HH1Wa8lIC0799/CHWcIgFYLMXfjIlQQm/ciQMD3zr9
	ExRcV72VqNv9ptvOlVkrE0VdadwPJtDXgIy61r2V+J/IQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHdtvbLMRoo6N0BA--.61488S3;
	Fri, 12 Sep 2025 22:23:24 +0800 (CST)
Date: Fri, 12 Sep 2025 22:23:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.17, round 2
Message-ID: <aMQs2zr4fYl2DYVr@dragon>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:Ms8vCgAHdtvbLMRoo6N0BA--.61488S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW7tw47tw1kCFWkZrW5ZFb_yoW8GF4rpF
	43Gry3Kr1UGryxJr93Jr40q3y5Gr1kJr4Utr47X348ZrW5A3WUJr1qyr1rWrWUJFy29r4Y
	9F1rXr1DKw1DAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBMKZUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNx2N8mjELN0kVQAA35

The following changes since commit 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:

  arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17-2

for you to fetch changes up to a50342f976d25aace73ff551845ce89406f48f35:

  arm64: dts: imx8mp: Correct thermal sensor index (2025-09-11 11:25:04 +0800)

----------------------------------------------------------------
i.MX fixes for 6.17, round 2:

- Fix mach-imx Kconfig to select the correct PIT timer option
  (Lukas Bulwahn)
- Correct thermal sensor index for i.MX8MP device tree (Peng Fan)
- Fix i.MX SCMI build error by adding stub API functions (Peng Fan)

----------------------------------------------------------------
Lukas Bulwahn (1):
      ARM: imx: Kconfig: Adjust select after renamed config option

Peng Fan (4):
      firmware: imx: Add stub functions for SCMI MISC API
      firmware: imx: Add stub functions for SCMI LMM API
      firmware: imx: Add stub functions for SCMI CPU API
      arm64: dts: imx8mp: Correct thermal sensor index

 arch/arm/mach-imx/Kconfig                 |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi |  4 +--
 include/linux/firmware/imx/sm.h           | 47 +++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 3 deletions(-)


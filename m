Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A41E78F26
	for <soc@lists.linux.dev>; Sun, 13 Jul 2025 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752386110; cv=none; b=doYreKT/ldy3aFGp96xpajlrOaNKy3nZz/7RZZ69yzBiX4ZHacQSKRdI2RUhmUo5Ez0240xY6xU5CeGSD8qoxjOuKPYYo1ZugYL8STcIZVASZDQwm00+9gJwhW283Hn4iNfrJ4IWxKwUoekuR1tUE4gP/XCDtr66vpEeBQMFF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752386110; c=relaxed/simple;
	bh=MYySRj2lFYH8FxlAtIGQEmVhZZB4bIViMUp5l3xasig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJ0ACJubz5QKExFxp7qQ7T38kFm0PifBrcZ5pM/YIGXaAmDXZOXcJnIlY2yII8HSnITwrnTZd2wK6HczYNpeBOIXrrUPVT8zcuDKzKWK7sEL/2e7q2mUKxfIj0RiywhnRKUBxyAtMN3LH0vbKR50Pfv55WyqEO4xArL+IeKRxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Aw4XVyOx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Aw4XVyOx"
Received: by smtp.kernel.org (Postfix)
	id 6D36DC4CEF6; Sun, 13 Jul 2025 05:55:10 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 170B9C4CEF7;
	Sun, 13 Jul 2025 05:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 170B9C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Od
	CN9ExQsnK4BnSMX1n+hFsAT2ihgoOQkhW+Yq1ot8A=; b=Aw4XVyOxMwu3Fu+ODm
	/N9eO+WH1OPdZEzcj6wsDKKkcTBbCd6NG333DmdIV9WgU5wcY/+4OH2FakXsB/fJ
	otlsmYGFCEvIpJMM2o9N+nMZcMHyhuL7dF7PsaaJ2xHrPWnZDviZIAcPdBe035YE
	824x+Z+RK/bCTcYt2EkH4lV+8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S2;
	Sun, 13 Jul 2025 13:54:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers change for 6.17
Date: Sun, 13 Jul 2025 13:54:30 +0800
Message-ID: <20250713055441.221235-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDXb50mSnNoHrt9AA--.3344S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZryxXw17ur4fGw48Ar1UKFg_yoW8JF13pF
	4Svr1fGr1UJr47Jrn3Kr4jyFyrJr18Jr1ayr17Zw1Fvr1DA3Z8Jr1DGr1rGrWDGryUGFW3
	tF1UAF1UKr1UXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnZ2-UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhSJZWhzRQkNTwAAs-

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.17

for you to fetch changes up to 5080cf6339d387720cb8def1001c61c779d9edcb:

  bus: imx-aipstz: allow creating pdevs for child buses (2025-07-11 16:32:08 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.17:

- A couple of MAINTAINERS updates
- A new bus driver for i.MX AIPSTZ bridge and a follow-up fix from
  Laurentiu Mihalcea

----------------------------------------------------------------
Ciprian Marian Costea (1):
      MAINTAINERS: add NXP S32G RTC driver

Laurentiu Mihalcea (2):
      bus: add driver for IMX AIPSTZ bridge
      bus: imx-aipstz: allow creating pdevs for child buses

Peng Fan (1):
      MAINTAINERS: Update i.MX entry

 MAINTAINERS              |   4 ++
 drivers/bus/Kconfig      |   6 +++
 drivers/bus/Makefile     |   1 +
 drivers/bus/imx-aipstz.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 drivers/bus/imx-aipstz.c


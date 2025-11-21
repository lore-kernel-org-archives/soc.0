Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF89239085
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735435; cv=none; b=q6JRk2aF4r21TE+hdsJgEN31YtppuJCw+XwCVVLkLJp3gwTLsqsxPl3oA5vlCrrqhJ1LxetLQDG8u4wiXQwof5oVZFV36UtBcixmfO1dPf9jNzDvTi24X/MqUjLn8C1JzgbsqdXz23cqjR2jj6jOvLWGFLHO2dawzQUYm3AKLVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735435; c=relaxed/simple;
	bh=iY6nxMmyjeOYh6NjhQa6c9dQOXl+wBVun4hbZxdQPcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l+XPtiyvznOpgJQcc3boEDaE7KlhKnVnEOxZwAo/Pd3OotmHvMHsXSenBQ5AeIEoVksp723QE58nxhclSGbshOixP794rvDuvC+lDitNE00u+7708mOw4I4gswme3/ThbPp1ZeD7zorna2hulfRsk8viaaNR9e+dl2j04v+TaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fpk4Q6Lj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fpk4Q6Lj"
Received: by smtp.kernel.org (Postfix)
	id B29F8C4CEF1; Fri, 21 Nov 2025 14:30:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 780A3C116D0
	for <soc@kernel.org>; Fri, 21 Nov 2025 14:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 780A3C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 55A191A1C60;
	Fri, 21 Nov 2025 14:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2498360719;
	Fri, 21 Nov 2025 14:30:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FB0C10371423;
	Fri, 21 Nov 2025 15:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763735423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Z+2FHPGQ8KaHgRzQ0SvKKUa0fA+0J0N8zKFskoR7lVE=;
	b=fpk4Q6LjG5CoMlbRdpEao0czinLXrrOXCQyFuF8KqtwsadIMZyV6DpUzA2Cy5YxuZmBZIH
	ggVdpdRa1+wEpq2efvNzV1EeqclYrZKvkiAfLkYqM+rg9suw9GHQUZiqmahP6ZN72dYZQM
	YgsV7YOccdBwSppoNXAnnnV4H9PG019ME/e8JHMhtQu0oJ2fmfD2BKlDiCOyk53zfHIcUL
	LZYxlAeaeGvFtdQRjVlEQnWRIo8quM8VF0WF3F/ZSpzQK292rGykhJNkDAclsx2S8ntERx
	h23iYXwqMvi1yD5gSG8HV53O8QpTpDPIYFk+F3I076dj/rQmK4ETjBxHL6Zzew==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.19 (#1)
Date: Fri, 21 Nov 2025 15:30:21 +0100
Message-ID: <87ikf3a26a.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt64 for mvebu for v6.19.

Gregory

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.19-1

for you to fetch changes up to f0e6bc0c3ef4b4afb299bd6912586cafd5d864e9:

  clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4 (=
2025-11-10 15:19:00 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.19 (part 1)

pinctrl node names cleanup from Rob on Marvell device tree files
Proper fix for pci errors on armada cp11x based platforms

----------------------------------------------------------------
Josua Mayer (2):
      Revert "arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 a=
nd x4 ports"
      clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_=
x4

Rob Herring (Arm) (1):
      arm64/arm: dts: marvell: Rename "nand-rb" pinctrl node names

 arch/arm/boot/dts/marvell/armada-38x.dtsi         |  2 +-
 arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi |  2 +-
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi        |  2 +-
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts   | 16 ++--------------
 drivers/clk/mvebu/cp110-system-controller.c       | 20 ++++++++++++++++++++
 7 files changed, 27 insertions(+), 19 deletions(-)
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

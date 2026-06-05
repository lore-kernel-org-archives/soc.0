Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC17376464
	for <soc@lists.linux.dev>; Fri,  5 Jun 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673287; cv=pass; b=CQ47S535IFlFu4Qr8L+yOWE6BgxillrnRHZ6KJkGfBm0pA46r1U05bzsNNgOtpdLXwfzCh8ZqBqwD0r3unMe3PnvJhpqlWWPvfSAHiktbukvri+boXwjcXNYA2pKkmOsDeQA0Glnalcyr1UoLXEEPiFZejYYXK2YtRyoM4jwUH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673287; c=relaxed/simple;
	bh=Nzc2IvXRJaAfYb8HuHzNZV4U1n7ICbsbHuDfJPbU3Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n4hFrcNCeRMMWugd2kzr7Fx0/N4dSp1rLE6OqUx0QerLL5z0z2xCueiQP+C6xkyO5IgWO6A7zqsuA+00Pjor5BQ+IVgamNIV/6irsFk4fy/yCDS16wR5DmTb1UifTX+Sspjzpuunjqc4xBq64waQCaG0RSUx9w03VpYlysYv3sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zy4URk/T; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zy4URk/T"
Received: by smtp.kernel.org (Postfix)
	id D328F1F00898; Fri,  5 Jun 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780673284;
	b=VS4460T0I8dZ0jcTcxzc+gsnsSS8lM4WAdH3E9KfxjC31EJIDhiXpMq7XqUTcgGU7DrD
	 vPAulkqUScKjZL0dS2t+tZLA2N0WHx1ZbCJGWfBJRB42WIUX5nNZhMBbCiFgBSKKOEzVG
	 1A+ndYuhMNKMx0MvH7bvebrPBuxLU0p1S0gWhAFKHppHCPvjAv34D977HBbPIHmafRzdq
	 ihRDXOMdIyW0kfjTQpJogYrXItx0iOX2Zk+hEluZ/j5oMfVqAun1V9Xn46ATXphohz4r0
	 v+zHKywPUpdhPIKagMB6tyxP/a5Wm4KwX3Fhf80Z8F5yLS2WYx8+/cFzgmvGkJwDiRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780673284;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 X-Last-TLS-Session-Version;
	bh=jkcwehCu+0OeNZKIbUXSujcXjfc/ESvUqTFvx/NqvIc=;
	b=ykqdJ1zqDT6is00E0gvO95Verolqq1Lw2osRfcEejmceRR+8Gfkq/6pjMXl6xdi5nDEW
	 8aH+Q/OIqEKf9Vc5yyADaWA8MZBGXFIrvsWItVt8HBU3RwpmCK9zbck4o7Yeo2g9YTcrl
	 MSIkAQMlNgmZqJFQq/fve1fsnXCtaeqwXqH41aTVWMm4rxlgin0m3/XexhJzlwdDBMsc6
	 dOApg3hklwoJgobzHyh7o15IwdwVzkn5zF/IdlnoHcJyty2vfnHCY1efTA3kUUK1SJIW8
	 xpe3f/0FXEo4dYjCEozBHkP+TRAH0Y1wV0UoU46f9xHXCay9uF+7oCIgbSJxe38OKuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Zy4URk/T";
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C47E1F00893
	for <soc@kernel.org>; Fri,  5 Jun 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Zy4URk/T
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8C47E1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A61ABC58476;
	Fri,  5 Jun 2026 15:28:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C34765FED1;
	Fri,  5 Jun 2026 15:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A2C9106A24F0;
	Fri,  5 Jun 2026 17:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780673281; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=jkcwehCu+0OeNZKIbUXSujcXjfc/ESvUqTFvx/NqvIc=;
	b=Zy4URk/TEcoKsonq8DbxWxdKGfHoZAZ0hMphy1u/HoI2P2ozmAyTXAIx+twIrPov+V+Vo6
	l4R5h1qguezCUIzagn2MriW7A7sLx6K9i7zLQvv9LRIt8iPvFw6EyNLjxzXkjjRIVnGNgX
	uCAW3UA4YSJjUps5y64nHe90Byizw9fch02AmW1zGuD+qG5Vuqf+pHJgJkaN/uhhstiuAg
	i9XjlBDZVXPstHyaNDhfXBtPH1hKXhIBxjnXAE9q6J/xv0bweFvmzrXIp6YGaC0mEvtsIG
	yuCA19oOyJOtkngx0/30o/zt/FNs3oyAMjjA2E4l5kYQ1IEa0Hyi7vWa8yzI2g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v7.2 (#1)
Date: Fri, 05 Jun 2026 17:27:59 +0200
Message-ID: <87zf19atxc.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for arm for mvebu for v7.2.

Gregory

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-7.2-1

for you to fetch changes up to bf4ad3be0679460585ab17dbcf298d085cf23429:

  ARM: orion5x: update board check in mss2_pci_init() to use the DT (2026-06-01 10:26:30 +0200)

----------------------------------------------------------------
mvebu arm for 7.2 (part 1)

Orion5x: Replace machine_is_mss2() with of_machine_is_compatible() in mss2_pci_init()

mvebu_v5_defconfig: Remove stale MACH_LINKSTATION_LSCHL reference

Armada 370: Simplify of_node_put calls and drop redundant NULL checks

----------------------------------------------------------------
Ethan Nelson-Moore (2):
      arm: mvebu_v5_defconfig: remove stale MACH_LINKSTATION_LSCHL reference
      ARM: orion5x: update board check in mss2_pci_init() to use the DT

Martin Kaiser (2):
      ARM: mvebu: drop unnecessary NULL check
      ARM: mvebu: simplify of_node_put calls

 arch/arm/configs/mvebu_v5_defconfig | 1 -
 arch/arm/mach-mvebu/coherency.c     | 9 ++-------
 arch/arm/mach-orion5x/board-mss2.c  | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

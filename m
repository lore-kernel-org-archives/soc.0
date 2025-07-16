Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DF2EA473
	for <soc@lists.linux.dev>; Wed, 16 Jul 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752657344; cv=none; b=Badze8y9s2xWJBX2C1vTcMUQNATOHoogMmd+Vt8y6y0qEGq49MbB5pfviRgUuJ+F9kwkOYSZcwzY7+n1naJbakmHDuqNawbODfwxWQQFAfdniuvSbkPdcFCcIKvqDxdA8ua1jlqW/wr13Lbo7dfbRgYNBhlD8gaH5JYfCarzh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752657344; c=relaxed/simple;
	bh=JWaMtePsbauiL1bx17+TOWMyVBEPr9djf22Eh0db+YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WrPTD9BZWoNeR/pH75TncQ5G2LkXBqY3FT3ANks5UgWJJTtFqR5v7NfAy3MPreSnynhnsuES1N7y8hBPP5HUiUNTAu6Ax2bPgYlA2QnLO+KCZD5JOxhjTqglYBQBiA3F0UW8CcEtGBiEwq2B1dmVFE/cFbPIKzZ22jl6KXaopSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fwo+84hi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fwo+84hi"
Received: by smtp.kernel.org (Postfix)
	id 5722DC4AF09; Wed, 16 Jul 2025 09:15:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EB26C4CEFA;
	Wed, 16 Jul 2025 09:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EB26C4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8FAE43910;
	Wed, 16 Jul 2025 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752657340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XKdPjGREMhHnPm2jzF6U9g4NxAEYWuR7203feVL7b+I=;
	b=fwo+84hiEy//cwSOvSatw5mHuBYtrqDF7qWkUdjGdCBlngiPm3iivjTK7KxIfzBBso0/g4
	L9W5vbs3BueM5L5G8CM6TJTm7sxEGS62JlURuMBdHraajnFLdJM/VcwB4mSd4vZoerNdKk
	gaRuy72r56zS8NyXQC7n5bm62zamnGwrMOSRI9WbS7y2ZVm1F9S7MWoZfscnJl+DYp9yXs
	cfuruP5hz/nKTVuXCYRMx7SgRVZudSLodeD9Jmt19sGrWmazb6JgQbHIaP9nPMx+iPBB5b
	wiuXH9AxAhoSYdZOnhQCl7Kah04LDe433eaW5E+g2j7bhQx3+iei3FXa3EGeWg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.17 (#1)
Date: Wed, 16 Jul 2025 11:15:39 +0200
Message-ID: <87ms94xzr8.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetveffjeetleekhfevteeuieeltefhkeeigfdvteevvedvlefgudeftdfgieegveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemlegvrgdvmeegudgsfeemudgvudejmegrieefjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.17.

Gregory

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.17-1

for you to fetch changes up to 28254bcf96bf93b9089540490c2f8081bf4e4d45:

  ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings (2025-07-07=
 16:58:42 +0200)

----------------------------------------------------------------
mvebu dt for 6.17 (part 1)

Use recent scl/sda gpio bindings on kirkwood boards (Keymile ones)

----------------------------------------------------------------
Wolfram Sang (1):
      ARM: dts: marvell: kirkwood: use recent scl/sda gpio bindings

 arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56860157493
	for <soc@lists.linux.dev>; Wed, 16 Jul 2025 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752657401; cv=none; b=WEI3b3yE3jEiwFbddRco9l/ZmJk5SFWp3Aagc20hQHWVaVy0eRzYdEPWwhLRbhEUt8aq6Ufi2jfmeUN6Sg1EVHuWUDnPMU5bcoYxPZMF5CS9R/sK8TsEUESaMZNUuU0236KAQAQ1ItQKoZeCBdxziN3WN+SMG646XIvm8gfYANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752657401; c=relaxed/simple;
	bh=+pVRVk51JXdM7vuc1FumP+dt3XGyFir4XYxGhjmfqvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jGWicLaF7oGMpM9sN9J/l5J8yLVBlX9zrYqz+Ag3OzSrw/aSZTM4KesyvcIyAJuhQxsU/aEFw4KShjYYUfw+DEHDxVZbFuBo0XXiWKBxOsuEbm4mHb7STt9lwiwXQ7r1X9yWZRh1EWd0GrtEgqrBclpxkTMSH7J1R1kttEBwCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lqRfvKRn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lqRfvKRn"
Received: by smtp.kernel.org (Postfix)
	id E0AF9C4CEF6; Wed, 16 Jul 2025 09:16:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 612B0C4CEF0;
	Wed, 16 Jul 2025 09:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 612B0C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8904439F6;
	Wed, 16 Jul 2025 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752657385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A2KxxqWr8JNX9hy2Bf9nMD05wlS7tKZsKHYvufU/tb0=;
	b=lqRfvKRn46rfX7ZYdAlc+ReKvOCdB7/io2VGMAmSz6p2BZxfdZqYg0hY4TwB22Ng7SsDZU
	/No+bSDoUObLmZ4lyn34bKSVFZQHN8gLHb53ylH+sBKADmw0FG4qId2VohADi00eY9CvQw
	9dEO9TD6Lp6vUD0QAccJ/upeKdG6YOblP4E9SJ66DY+In/PF4BgS48/Vq9pS2APa1quyDm
	W/0EGVGVeo518ugfcJ2uMcfTQCyCuj7TzKwA09w2BxGwsdhQgFx+a3MFj6T7mZYkiB4NdC
	pWx7a8gsp+v9ohzU1Wxg6dhqIM93bRwPAvwZId9J6ePP/idVPmbnB3SiMR7r5g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.17 (#1)
Date: Wed, 16 Jul 2025 11:16:24 +0200
Message-ID: <87jz48xzpz.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for arm for mvebu for v6.17.

Gregory

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-6.17-1

for you to fetch changes up to 90ec89d68ffaf36d7abfcc14908edd6e4803c4ea:

  arm: orion: use string choices helper (2025-07-07 16:56:04 +0200)

----------------------------------------------------------------
mvebu arm for 6.17 (part 1)

Use string choices helper in GPIO support code for legacy Orion based
platforms.

----------------------------------------------------------------
Kuninori Morimoto (1):
      arm: orion: use string choices helper

 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

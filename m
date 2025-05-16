Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AB9182D2
	for <soc@lists.linux.dev>; Fri, 16 May 2025 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405915; cv=none; b=F17NyyC5nWavNv6FHv7gM2U5OYdw7YJVw5ERwIXMKrJ+wOlyge4hmuIXuCqdAbpCa7cxhPW+PNMPDTVcC+9GjcwnIdW9c49pTvhCJeuMIV+NyIX+at7i2dPiZs1EdnObIcgZ9qQKAaSXjIVsjgIlIhqJY6WhGOGxpQmOsFJ4OTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405915; c=relaxed/simple;
	bh=EA3kgRIW/kXdotEASNSFBbWjcg5axE/TwNpcWRDM740=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G6qrWiyhJvaNECx4F3L4icD0D3uFSs9Dh9tnJZhLov382biWCKULU/VXrKjcbzyibFsM3q56ffmIcSu84v6qF7VBmENiTb5kwQHrL/kUeE0uIyw5LlLtVZBNtgaCe0YUJopeSe/uIlzboUraH4wdIFb6NUQGAtYJwnk7mZjrGUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pvloXY/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pvloXY/Y"
Received: by smtp.kernel.org (Postfix)
	id B6D84C4CEED; Fri, 16 May 2025 14:31:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B84F8C4CEE4;
	Fri, 16 May 2025 14:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B84F8C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23D0943B63;
	Fri, 16 May 2025 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747405905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7zJ0YMWeCxiz69RUpFjzpIYlW/9jMemkPNPbCPfYxVM=;
	b=pvloXY/Yhu5p/KpjsQCONOIYpbm13sppl0IsaNP03tYfcBA9SqkZpImFghVveO75vAAEfT
	8ivH6vk0Vm+F34axgEQBqCTqXfv8dx027EAVKRv8+RXayrmEJGH1Ks+XyjYewpsslQvHde
	JCn/Bj7yGVhFqc/mzZ+UZy2+qlfM0auB1IqH4ruWwPUg42c6x1IE1+u9gCahD9pZQycSdM
	+boJ2ftxNXzKwaL6Lu/TdkU3ypQG6Ek9XrRi7oBwnLTufMh1pBmh0pzMnk+Cn7oGcQGgz1
	jtWfe4Ugosfd45V4HP0Lm2vaaHUaNvEt1kJGSIhjxpsDK3ns5yg4MOKoy0f08Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.16 (#1)
Date: Fri, 16 May 2025 16:31:42 +0200
Message-ID: <87tt5kpqy9.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteevffejteelkefhveetueeileethfekiefgvdetveevvdelgfdufedtgfeigeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrfeehmeelleehtdemvggttdefmeeiudehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrgefheemleelhedtmegvtgdtfeemieduheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.16.

Gregory

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.16-1

for you to fetch changes up to 9179e4a26bf25722714afcdb6a1e632ad52e443b:

  arm64: dts: marvell: Drop unused "pinctrl-names" (2025-04-14 16:32:17 +02=
00)

----------------------------------------------------------------
mvebu dt64 for 6.16 (part 1)

Clean up unused pinctrl-names in pca9555 nodes

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: marvell: Drop unused "pinctrl-names"

 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
 3 files changed, 4 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

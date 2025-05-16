Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0490D182D2
	for <soc@lists.linux.dev>; Fri, 16 May 2025 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405834; cv=none; b=ADgKLrmOIA/yVz/dSYygTixwu2/GxQEw04M9s+gKu4nvTMB4v7C5TtrQmJdzkOPGZDCj9RaO9qm7rQZVB5apBeuBh2fhXh5cVle1Odurz7d2RMuIIg5NPkgl+v9IMDE6t9Tql2s/8/Fv6M+h1JZZIYvdaqVSbw6IXu7LsCesqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405834; c=relaxed/simple;
	bh=Ax6LIRlGxJctq/82yvAfKgTRQ6ieLCVJrdHdDzF9Rp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pNxxkRcVTFXbz3/0pY+wO0pn0uKkAQ/BuN3jLq56nwsAoCOXu+TdetyKPH+mGqZvYrLxX/wiR9YhKYXZm33HHkalz+l9Ww4XD/zemB28UtG84m+f5P2f8hubkCIfOdtwOmE8toczoQGewa4wdWf79M8ahL3FpiED2A4KBOAA+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f03CaVX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f03CaVX2"
Received: by smtp.kernel.org (Postfix)
	id DE629C4CEF0; Fri, 16 May 2025 14:30:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B9D5C4CEEF;
	Fri, 16 May 2025 14:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B9D5C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8180743A2A;
	Fri, 16 May 2025 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747405830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oG2Aeo3c/OWoq8RPRO4RI+cTpPcODlviTOgMp/5mgkc=;
	b=f03CaVX2Z7nQPOVdGZse2tIBjf6lW2DSl52r8br1aYmPIHdFH43WeL9gB4mEX+2tuQhO3k
	Gj4VTsFA7Uyh/4fG0dE4cj9JWaC/6MZWObI9EBEnF+G9cIf9vAwTsqjwbXGoULhenuqEEc
	j6WA9O6bno0ZXB7PaUR+4VUmAIlkgZpyXY7egH7jUkfkcwdnZSYCJ9VxCCX2zBs4i3bx2K
	/LkSxhKlPkElEI+2pXDwmBmQwkaJdbtO57GEg77kRlV62Il74P96HQZZFF9QKD5BuCsUC8
	2ghkiTHVAeesplGVLF4wtCQwM250L4rXDfOGeRU9dZX0qJD8lq3OEa+cZAmM6g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.15 (#1)
Date: Fri, 16 May 2025 16:30:29 +0200
Message-ID: <87wmagpr0a.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for fixes for mvebu for v6.15.

Gregory

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-6.15-1

for you to fetch changes up to b04f0d89e880bc2cca6a5c73cf287082c91878da:

  arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs (2025-05-1=
4 13:01:47 +0200)

----------------------------------------------------------------
mvebu fixes for 6.15 (part 1)

Fix uDPU board LEDs by correcting pinctrl state

----------------------------------------------------------------
Gabor Juhos (1):
      arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs

 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

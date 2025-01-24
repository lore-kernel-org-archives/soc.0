Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA186CDBA
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730988; cv=none; b=LTLNYe0OhPbL9EwKXyWi74AKvdhLD1bb3erpSHeId4PNoRIhrt/Z9db8KiCMndfyPcynX64tevieFU23A9GkWRrxHv/6uGRCTxSkCmN5O2e04dz/2pVW40yIFLaRKDPZMdU4ApsGwPNEjZ4JBte/nmxDcCKZvaoCt8NBKpLZ4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730988; c=relaxed/simple;
	bh=be1+89Jh89Rc79AdD8C3dhRf9clChboakPzPIAn7CVU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SsgTHlt5pBaILcAfLiXEGukEUoNopoRzMogn94E9FSLxYByqVFh0wRwyoTY3+EIY4Da9WBXsXcEsqDqfAsXrks5MrOEuFD/zsp+nEso5IpNvpnxj124o39YdlmU+twfbTglYACez58QhZg3cga2SPcvoFKjeruI/MugdbWHD4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JYqUo7Fu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DnY/p44H; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JYqUo7Fu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DnY/p44H"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id A129413801A3;
	Fri, 24 Jan 2025 10:03:05 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 24 Jan 2025 10:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737730985;
	 x=1737817385; bh=LUh9um2eddIv6RoQa/yQugoax8kk1TNal/OqEBhRHG0=; b=
	JYqUo7Fu6aCZFn9zAfN9uOiD2i5BeHmYVVE22PJlHgi3phhZ4p1hbZ94NyX/6c1R
	fsYEb7J0Yha2T5ahjOFf/21AZ3Z7oSabj6eBuUaIQu1bzTIPBO0F3Hnt+qCA0sek
	FALZWoNtiNepUZxR/OoxTNWdLgUpPBNxpRUL1lJSYPD8xmSOd5wOqFdIlaHEDFCz
	5ESzEUI1mC/tCqN1w5sJ+CRP1Okpp/ybtKkwmbH8HO5LNdj4SMcIFSSnJT0wWyXl
	LoDgL6Qmy0DOYaH9fCroF3BdXA6vbILYgo/YPP1ErolekGcnr3kvSs/sWt3lhY/C
	oRrzalSE4fSUy/W0vNZ5GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737730985; x=
	1737817385; bh=LUh9um2eddIv6RoQa/yQugoax8kk1TNal/OqEBhRHG0=; b=D
	nY/p44H0GzO8ROQvJ6SvYyj+qUdkMuZQkbEBGuJtTu18wJci06lSqWjO4p1IK44g
	hiMrPRf8pPuZjyhzgeUY+qOkAQKpwM9r50l0eN3HHRGeYLsf2oKwmspBZ4kjdkIh
	0jIFgoMxfD+o07hRFwbreY0o3WMTwxbvAeaoCxmG1kHiD2oTdehXcrFh94C3kHGV
	yDpI3OUDwWq0/t0LqRTn5huXyXEJXt+bwzPKAw+JWvbLtvFJD5aRTX9FggThJVWV
	zePMfqQwIJ5idxEXjUcIvdOJPOOHWU/xoHPhmNJ/N/6R2UDCBmkl/1gXO/7jIGJC
	aWbQn0L9jWGpX/py0GJ6Q==
X-ME-Sender: <xms:qauTZ7ekDiR9ZFzCjyDQRxghWndYaL4ONu4wV1ww3ttgkn_88sZv9g>
    <xme:qauTZxOo4lRS_kX4bd7LNaZH6t3URQKlBZgMNyT4iCFcLnIuN9EfzZ8bys-6Eri62
    po_zRCfG6JDIyJg7yI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghv
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:qauTZ0j6ZiprxH_UyOzgACdSNUQTGTPbOKTunV7NhSJRnXbb-KIo7g>
    <xmx:qauTZ8-s-AFRexwr7cp4Fz_tSLVLE_XHd784pKM53o6CqJHfWU9-ew>
    <xmx:qauTZ3tSO0_mDfC1PZeDZIW6IMOyfZ0peH4d3EZwrs6-nJDR0ddacg>
    <xmx:qauTZ7E8pzz-_oAnXU92_mQ7tbCf2hUurMVX8fsZxEV9L_ruk8GRXg>
    <xmx:qauTZ3InfkoIujHeyOl0XIHjbD2EW3APjxQIVuDNdr5mTINeja8vWwtq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E3382220075; Fri, 24 Jan 2025 10:03:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 16:02:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
In-Reply-To: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com>
Subject: [GIT PULL 1/5] soc: arm platform code for 6.14
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.14

for you to fetch changes up to 2fd7a3f27892f1ca4fca24591a7a82fd0437e080:

  Merge tag 'at91-soc-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm (2025-01-17 12:57:00 +0100)

----------------------------------------------------------------
soc: arm platform code for 6.14

The updates here add code for the Microchip SAMA7D65 SoC,
as well as minor bugfixes for OMAP.

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: omap1: Fix up the Retu IRQ on Nokia 770

Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable charger of TWL603X

Arnd Bergmann (2):
      Merge tag 'omap-for-v6.14/soc-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'at91-soc-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm

Christophe JAILLET (1):
      ARM: OMAP2+: Fix a typo

Javier Carrasco (1):
      soc: atmel: fix device_node release in atmel_soc_device_init()

Nicolas Ferre (1):
      ARM: at91: pm: change BU Power Switch to automatic mode

Ryan Wanner (1):
      ARM: at91: add new SoC sama7d65

 arch/arm/configs/omap2plus_defconfig |  1 +
 arch/arm/mach-at91/Kconfig           | 11 +++++++++++
 arch/arm/mach-at91/pm.c              | 31 ++++++++++++++++++++-----------
 arch/arm/mach-omap1/board-nokia770.c |  2 +-
 arch/arm/mach-omap2/powerdomain.c    |  2 +-
 drivers/soc/atmel/soc.c              |  2 +-
 6 files changed, 35 insertions(+), 14 deletions(-)

Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B371A0BF1
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132553; cv=none; b=oVRO9n2OQrajRY8Kt/C8SPscSELA8Pg2Zbjt92p4zM8HzkaTt3eBajVBdqepZe5mBIblfpNmHc+Qb4meJtE18K/YfSEa6YX+6cUygN6kKCigqUZuSleCquO55xHyxdESq5SvqRmdrqpfNwMyYPWorl0uJEFAtQZCPbPU/TWsis4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132553; c=relaxed/simple;
	bh=JOhJJonjYjhUkWYLiBW0eb9Ioo3sLVx6lRC3R5Q/Pac=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ds+/4DfrKovz8CmwREaiMscs/T1lz8Ef5J01/SV62iJPfQUoRKCjlkiikZqYAwBsl45g+w38P2HkEwfQvGAFtucYmUMPd1y5uTrujHYSZvv5jzlZpvc6l4LH/kbEoCqU1KX4h3jdpsJq9SHFddiuM0feJCjowrKZHQQ55apy9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JLE5xpt8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vOhOfoQa; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JLE5xpt8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vOhOfoQa"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id A2F891140215;
	Fri, 17 Jan 2025 11:49:09 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 17 Jan 2025 11:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737132549; x=1737218949; bh=CX
	LyQI6kaMX3IgzR2F4R+3bNoh5Bn8A/463KPWFiGpQ=; b=JLE5xpt8jIFYzYDl3G
	ovNWt0YurgcHhrqCHL+vPU0jXzuCTki+fjVumnDoiHqENnGV1H0sDUADqWboKECL
	yCf9blIP8X5uSG2KKzS51nF3/8mCytxP2vhQy70uNgi56E15NBZIBIcoNL/5n3yP
	G68Rerg6bzrsLgKYBovXQlYA+gCFmbvpGZgJZm9UThp9SkGA0PFgS0XAqmPZflHA
	I3E5DOnyyU/LVgHO6OGxi7D7kFQwn87r8+6cwiFvA3y7/ua3PBCWDnYgVS/0gbQC
	aRSJVZVXwHZLvRYYKL/LlUg9sP3T7O8hRcv84bYNhqQMl7du+cqqYCZI+JSGQsl/
	nBzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1737132549; x=1737218949; bh=CXLyQI6kaMX3IgzR2F4R+3bNoh5B
	n8A/463KPWFiGpQ=; b=vOhOfoQaX9ww/MCOpDvWWLoFfwilBvfP2ss0q+cxqJEV
	C3ICsz7zL7FKvrqLISiukDm5oR3x8/xbsHl8SUgt+vHdn0wC/uMGb1gz2LVYp1tz
	Es0WusqEvSBJ4zSETgVYqS9e1WQnDsZzV5VPL2kOSx/1YlUDJzYcyBarVCcROGPV
	jo53Xq4f2Rupl+ELjNmRmES5J2uw9XiJPtX+bw9tUEBiAeycPmj6FdPVvxt9vpEK
	HA5X3NKadIIAzAoKE0ZIJQuv9cYU7uSR3CqnbhAXCQnl2T2aLEjf9cusZybMn1dG
	g7Vcv2eiOhYU2YFMmpttBV0tNAo6HnT7d94oaq3x4Q==
X-ME-Sender: <xms:BYqKZ8hRMYhF8dZK5RW7MxJMS8sM-MeW7GzuyFLYl7yaguUJqKRfZQ>
    <xme:BYqKZ1Cez2igmVjJu2ZTL0LHbkA5U07oDHDC4ISYVphJ_0Vhr0DdUwRWo8Ct5Bu1P
    lIJSS_3O7vS6D12xNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepgefggefgieehieduffekieefheevteffueehgfehueet
    gfevteejkeehfedvtdehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphgvnhhguh
    htrhhonhhigidruggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BYqKZ0GgwnFsuxdtQL3yWnX3vEM68B2si1phxFFEEkk7u7EhTy5BHg>
    <xmx:BYqKZ9QNqKqodr6qGfpG3Ce-TIUGu6VbvSDWfomXl7y7eSXf1c5wZA>
    <xmx:BYqKZ5wfrnn3DUB7Ag4u-AJL7RR2I0O1IkeSGRvPidkBl9bbat4PVw>
    <xmx:BYqKZ745QCx0ugCRY4J23Ybs7U5d6zJ9UwoFvkiIrlNS6bgzjZd2-w>
    <xmx:BYqKZx_ZQtjn4cKbB3YixZdGK9pSv8HgbJ97TpA-Elu0XGifsjA4vWrq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2CA0B2220072; Fri, 17 Jan 2025 11:49:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 17:47:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4

for you to fetch changes up to 352bba6c19cdeac107e7fc1684548269e6b0f111:

  Merge tag 'ti-driver-soc-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes (2025-01-15 15:56:24 +0100)

----------------------------------------------------------------
soc: fixes for 6.13, part 4

Two last minute fixes: one build issue on TI soc drivers,
and a regression in the renesas reset controller driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'reset-fixes-for-v6.13' of git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'ti-driver-soc-for-v6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into arm/fixes

Claudiu Beznea (1):
      reset: rzg2l-usbphy-ctrl: Assign proper of node to the allocated device

MD Danish Anwar (1):
      soc: ti: pruss: Fix pruss APIs

 drivers/reset/reset-rzg2l-usbphy-ctrl.c |  1 +
 include/linux/pruss_driver.h            | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF11D9329
	for <soc@lists.linux.dev>; Sat, 21 Dec 2024 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734821448; cv=none; b=r2p5sYcFrcehhlp29Ahh6xbzVPRAICU9sXFAKyJo/+lNHYPTgY2aRIQWTL3ClJIABJ6WpGyoos6t62vDjJr3sV3+ud4mwKDEVtsb5ef7ivFs1zo23G2iB2jFVtdoTKBQhbpOcntILRpegRirvuVp+hU+uGzvvfzhu3tTb8/epvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734821448; c=relaxed/simple;
	bh=hNp4jF3+lPnArcRRXIqcIAfk2IHGdeT1RTI7KA2k6ok=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=P2A1WER3qNvVNaCa3wVs2Fq+k6bQQ6x3I7M7HiVz7RJWGiSLIL/SaT/YgD9O/CnbDo1keh1uwXAwtJXGV19esfIhaYr+A7wmx9b4DwcV5jpmqa282NzckFnJbsyhHnU7BAbUPSZR1xLUXFXG+IMxEGH2ZPObmUCgo2ONQbkHtMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Jp5k7Hn8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MF+LkH6s; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Jp5k7Hn8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MF+LkH6s"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0FE691380212;
	Sat, 21 Dec 2024 17:50:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sat, 21 Dec 2024 17:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1734821444; x=1734907844; bh=iw
	UK/DVtJwVBiDSKobZgyvCljH9xONjC8VYapDTg/W0=; b=Jp5k7Hn8Sb3IVNaJ9d
	hkCuXXB6xyK1MnDbvcWTtyRPSkgYcZRObl1E/2ngW/WKMtyQ6NAJ/jAxgJnpgFtT
	Us/49zLPNrr8clgTyMG1AD/Qu1XPQmwlgprVMO4ysesD6/EeMmE8dlOk0dsbMIeq
	c4z0ewbt/rdj++0Qm/VQ6kaAOEhnYCBVekzvRGsfKSf41pND5y1/gF6nrdIutTRL
	tSP7ByKY0s5x9rhuVtvbKETFVQ04Os0lMsrxyn0btXy/iiLRdfp2jAMMl/JrDQFB
	3T2NtlvJxQkiD2zMrS5e7UrJI74IrPeyOvam5YgmtrTttlaicMbg61NmgWpCS1Vc
	Slog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1734821444; x=1734907844; bh=iwUK/DVtJwVBiDSKobZgyvCljH9x
	ONjC8VYapDTg/W0=; b=MF+LkH6sOn1PZwdyR0AsfwjzBgykXKI9R6nwhiHcamgn
	t4bQZ5xtH24PLBElF6ReiyFE0e2SEqBEL+VmLigwSy5qAOC5QuhGLngUHk4H+uFR
	bG7/QgLms6B0iJMYUUpp5/wL4ufQlbvDynRC2rjmDe0CRaR2RUl6HuuvG6HTD1qd
	wZedo/U04+1sgRXjAlux6CojQ8E5LunWmxpqfHrra+ngJDK41tmIvbPAq68v8P2s
	urY9cKyvCxBFEyW1KDKR1SmqcTFoVaaKfSD5bmYgvYdtTATdZjU/wwaxJrSUCC9x
	edRuIIm5yGiVTLuAxvl1MAoOiDMRIHp0/QvJQ5XlSQ==
X-ME-Sender: <xms:Q0ZnZ63kY1LczpClWN9saq_C6QoSqrMe3q3BgZk6N4vWm0VOR272jw>
    <xme:Q0ZnZ9HnbfFwCcHNSnn6lXs1oo_KAS3lWsEL11cxnXQCcYwZtMaIrle5aXVrneOFi
    jVmzHFOxaB2jVpVDNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtiedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepudfgfeeuheelheehfeeigeeigeeiveevheelteelleei
    jeeikeekvddthfejieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Q0ZnZy7SHXSKZ-i5OgW7YLpTZtbOY6iiMeI3z6vH_B1jywywV8Wy2w>
    <xmx:Q0ZnZ7090ybxWLdrMZk2BmM7Y3lnNBs1RDZc-mKlPuZebttMVxw2ng>
    <xmx:Q0ZnZ9Hb6F2qjypJY0dNHdxZqJsXNY1v6SmqNP_oBPJV9LyNg6j0Rg>
    <xmx:Q0ZnZ0_6NZWWeMiqkTIY7Fqq2ST60I_d8JSI8xeqcQHL_7SaHhtGag>
    <xmx:REZnZ9C6f-YNiO8w8fpztwNBfxmThVruNCsh39zBXJdOzm-9ajA-6jEv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 96D132220072; Sat, 21 Dec 2024 17:50:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 21 Dec 2024 23:50:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.13, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit f578281000c50cae991c40e1f68b2fc0b1b9e60e:

  Merge tag 'ffa-fix-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2024-12-13 14:26:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2

for you to fetch changes up to a31ffd6ed5ee994e1c04dc794499a0c04618dc55:

  Merge tag 'arm-soc/for-6.13/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes (2024-12-20 18:02:27 +0100)

----------------------------------------------------------------
soc: fixes for 6.13, part 2

Two more small fixes, correcting the cacheline size on Raspberry Pi 5
and fixing a logic mistake in the microchip mpfs firmware driver.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'riscv-soc-fixes-for-v6.13-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'arm-soc/for-6.13/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes

Valentina Fernandez (1):
      firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()

Willow Cunningham (1):
      arm64: dts: broadcom: Fix L2 linesize for Raspberry Pi 5

 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 8 ++++----
 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

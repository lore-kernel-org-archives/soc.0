Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E923815B
	for <soc@lists.linux.dev>; Wed, 21 May 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818021; cv=none; b=Tf/KXeJ7ng0+aljWj7DJ29pHJ/hT33q0J+Xl3ML2x4vqujFOOkDrvqw9sDoddc9H1yK4OQTPBmXydLnw9hgO1iZIHIDd/qMF5lbO/ZGAshiSYp+Y21cfLBpQ4wybb2MdiE8x34cC1YNEs06eX8c8oX9Hs5KopZUp1IfG4+tKjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818021; c=relaxed/simple;
	bh=9q+hyRHXohHqDSLnLvFvFUAnzd0H8twh56Uq+QEEVLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6JHtf+ZT/EpcYjT+zhVujzdD5vX+C/RAPiXju1QncUXFpGw1zH6DSWkklajC8iXy7Td0P9wMapnD/i8KFjULv9bA4MPPosEjeIfcTA2YtQcTCz6/acy4ZOI8WoMVYdH0WRIoztTVxy5FpWdKejmX5L0nGPOpBhhrkwMi8Pe64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D0F87C4CEEF; Wed, 21 May 2025 09:00:20 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4E4DC4CEEA
	for <soc@kernel.org>; Wed, 21 May 2025 09:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4E4DC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2bba:d77b:9240:3c4e])
	by michel.telenet-ops.be with cmsmtp
	id rl0G2E0024GqtyW06l0GUC; Wed, 21 May 2025 11:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfIw-00000002i7H-3gyx;
	Wed, 21 May 2025 11:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfJA-00000002ch9-02Wf;
	Wed, 21 May 2025 11:00:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take four)
Date: Wed, 21 May 2025 11:00:13 +0200
Message-ID: <cover.1747817851.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my fourth pull request for the inclusion of Renesas SoC updates
for v6.16, containing just a fix.

The following changes since commit 1064013303c6dd59f1586656f853765c6e870f8b:

  riscv: dts: renesas: Add specific RZ/Five cache compatible (2025-05-14 13:30:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag4

for you to fetch changes up to 652eea251dd852f02cef6223f367220acb3d1867:

  arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups (2025-05-20 09:31:11 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take four)

  - Fix White Hawk ARD Audio breakage.

Thanks for pulling!

----------------------------------------------------------------
Thuan Nguyen (1):
      arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups

 arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

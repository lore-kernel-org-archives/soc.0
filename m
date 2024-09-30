Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BC7DA79
	for <soc@lists.linux.dev>; Mon, 30 Sep 2024 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727715464; cv=none; b=eJ2GAci+eIQ2gzCV9fMshY0bZ0XTQ2yL690T0yy3Om6k9Yj4+vKgtx6tnUeTU+hLM+S7uD276dsIgmR/LzcS4qYA6Vz3RpG3bZlvM1KaReHvQ3gKZQnikrvQZtl0/TIi4a3vVaBUSNpHwhp4nHg+124xzIie88kj5oImTQ+BFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727715464; c=relaxed/simple;
	bh=u5j0FAKmz3Gb3dAoqzZXtGx9YkzXe+BYKHuI7ZEL5M8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FLrkze5QzB7ZrymIu74wuvJcZF+9hAA095ROJPaomYBYylVDeA6kH1MzTpYnFueis3wLAAF4NtbvP+qbopcnyCA4A/du5CYb1yyF04Lsq3wLgI8ygOuCSP13Sxboxvu9rlQii9359/2sbnAdkFh/g4M49pCw0QZOc9UGGzcnv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C4DCBC4CECE; Mon, 30 Sep 2024 16:57:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05BB7C4CEC7
	for <soc@kernel.org>; Mon, 30 Sep 2024 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05BB7C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svJiP-0004VK-4r; Mon, 30 Sep 2024 18:57:41 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.12
Date: Mon, 30 Sep 2024 18:57:33 +0200
Message-Id: <20240930165733.1541936-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-fixes-for-v6.12

for you to fetch changes up to 2cf59663660799ce16f4dfbed97cdceac7a7fa11:

  reset: starfive: jh71x0: Fix accessing the empty member on JH7110 SoC (2024-09-30 14:24:37 +0200)

----------------------------------------------------------------
Reset controller fixes for v6.12

Fix a NULL pointer dereference in reset-starfive-jh71x0 and replace two
accidental commas at line endings with semicolons in reset-npcm.

----------------------------------------------------------------
Changhuang Liang (1):
      reset: starfive: jh71x0: Fix accessing the empty member on JH7110 SoC

Yan Zhen (1):
      reset: npcm: convert comma to semicolon

 drivers/reset/reset-npcm.c                     | 4 ++--
 drivers/reset/starfive/reset-starfive-jh71x0.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

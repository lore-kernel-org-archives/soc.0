Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A03370E8
	for <soc@lists.linux.dev>; Wed,  5 Nov 2025 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363014; cv=none; b=EefhZzYPQ5kbpXJpXs3fjHrN95VQQSdcK8Hl3NPaIrHlg26XvFH5BeHYSCV0pJy3MVDczhvuAtRPAqi6PtWaTHASgyE4RnU8muD9zIAHyLaDNq2vn/MXqkyeJszJlYZg5HKSx0VW7T5jKm6ygEniWmzdYZ1TVCNSxd5g3kHi2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363014; c=relaxed/simple;
	bh=gIsgkS18gdyT+egccIvR15QAxb8MAQlW0hvMbyKSQTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9aBQxmHtVgvoJ2X3bR2Ht4ko93xqAQ6O/ornZKipWr5GzUAlqh+3tAv5JZMjBAp2ixoOjV/fgtyGSjVGBo8GLtevXzBEGjXcGfKWAMdvzbbKyA8mGo7RXEHzv+XYej/KO2PPYpnf+ORSc6Hda2hZBJ7ph4fYjGtfKXz5akwGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 4AD64C116D0; Wed,  5 Nov 2025 17:16:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FED0C4CEF8
	for <soc@kernel.org>; Wed,  5 Nov 2025 17:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FED0C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGh7p-0006Dh-2X; Wed, 05 Nov 2025 18:16:49 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.18
Date: Wed,  5 Nov 2025 18:16:19 +0100
Message-ID: <20251105171619.3649345-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v6.18

for you to fetch changes up to 997c06330fd5c2e220b692f2a358986c6c8fd5a2:

  reset: imx8mp-audiomix: Fix bad mask values (2025-11-05 16:12:28 +0100)

----------------------------------------------------------------
Reset controller fixes for v6.18

* Fix incorrect EARC reset masks in the reset-imx8mp-audiomix driver,
  introduced in commit a83bc87cd30a.

----------------------------------------------------------------
Laurentiu Mihalcea (1):
      reset: imx8mp-audiomix: Fix bad mask values

 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

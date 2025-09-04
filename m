Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8BF2522A7
	for <soc@lists.linux.dev>; Thu,  4 Sep 2025 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000038; cv=none; b=GjsIjKGaxeVKpy2J09nn8kqcZ5YJFr5B0ZLF7QGSJBOPdYDh3nyBsVTLVkhBVigUIiZEUXyCtB4SP5ZJoL51ruajrwM0OlmtcUQzhrcY+XXVRH26Pt51rvUAUEXFa5nnkpff2lkPzpxBwLn4CAjS4G2S3BsDpyGArPzqQRjKa/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000038; c=relaxed/simple;
	bh=8Mn0Bqa/S93WvN7FTo9NTfYcWfymODH+SAw6GdAU1ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DqQZZBR+5kM2QZvGUFKjsSNHGVzWvdN9CHzidTWFdsj4LE9Xzh2MI84DIWHmunArEk4wiX3zxjl8WkBvA+inZDXoNNFbFSsHVaE0Sz7bnCUuvj6yAxbJVRaSy0smHXzTawr8raJVZCojScnPQH0PT81ZN7vXmNzhdra5MngUhy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 472B6C4CEF7; Thu,  4 Sep 2025 15:33:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24615C4CEF1
	for <soc@kernel.org>; Thu,  4 Sep 2025 15:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24615C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuBy8-0003Wb-0f; Thu, 04 Sep 2025 17:33:48 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v6.17
Date: Thu,  4 Sep 2025 17:33:45 +0200
Message-ID: <20250904153345.2374313-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.2
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v6.17

for you to fetch changes up to 9a52827a9bbbabb461e87bb41174a96a82c0e8ae:

  reset: eyeq: fix OF node leak (2025-08-27 16:40:13 +0200)

----------------------------------------------------------------
Reset controller fixes for v6.17

* Fix an OF node reference leak in the EyeQ reset controller driver.

----------------------------------------------------------------
Johan Hovold (1):
      reset: eyeq: fix OF node leak

 drivers/reset/reset-eyeq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

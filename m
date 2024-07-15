Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C7C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55FC4C4AF0F; Mon, 15 Jul 2024 11:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4C7C32782;
	Mon, 15 Jul 2024 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044757;
	bh=3gaZ9hZnz2ePFHwZmyev3FW7K3Cldgnw1RlM7TEVOFU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Z2FM+YgH2zlNOdirzicApJKvhugyOksBYuJ1kekM5Ohfa8lIVBFU2l5PQGwTzWR/2
	 bV1gNRmQbGo0T9HHLv165o2wMGvX/zmubF4l7CZj2N3sQh6s9H04Ac4yse8iwoWuS+
	 DwRavpvWRmEgbW1V98d4zshRW4TQX37DC9lWwXEqGpzKQU4hPRWV+7oPRYnaQFmL3B
	 9bZydaKGcn3FzbTazm7YqqvaNSJ01nKmhQmtK1Y1MZnRVx12w9tN2thN7ui4x9D3Ps
	 u7oFJ3wsMNOhjsdDK/n7Y4qSYOQwvliwIOg/yQIArQJXZJch7x8pTMruQi3bash8Ko
	 g4/Xa0UJjuFMw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/3] Fixes for turris-mox-rwtm driver
Date: Mon, 15 Jul 2024 13:59:09 +0200
Message-ID: <20240715115912.9507-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd,

as you requested I've split the 3 fix patches from the
  Updates for turris-mox-rwtm driver
series. I will send the rest once the merge window is closed.

Marek

Marek Behún (3):
  firmware: turris-mox-rwtm: Do not complete if there are no waiters
  firmware: turris-mox-rwtm: Fix checking return value of
    wait_for_completion_timeout()
  firmware: turris-mox-rwtm: Initialize completion before mailbox

 drivers/firmware/turris-mox-rwtm.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.44.2


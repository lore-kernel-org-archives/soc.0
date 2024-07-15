Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12252C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCC90C32782; Mon, 15 Jul 2024 10:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99272C4AF0B;
	Mon, 15 Jul 2024 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040448;
	bh=D/Pp9rdqJgkpZW0Q+8j07VxPvERZLU/LJml3EnLV8eI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=UU84WIYn3/yGgaWlcn8OaBwiax/Iy6Agdd9x5lgGDtCRg/21CmSOq52wriTUB/AVb
	 CiqC+GkelO+lrBAt2Kq6Zhz8yVnDIY1HoQb9f+P/3U8QIhViadQ0y8vnifEaaePIJH
	 wDaJ5MWe/KO99603RyKXlerC/PFdeVvVGuh51Mf4CnnjslN+UC5to3IQJYJypK9nH2
	 ONDofn7IzQPbaiZdgJgtIVu0D8LgvmfqrUJjXZGvKfcjwaiqFl6liK9iY9bhK3HUMa
	 zjiGJGOzk7J6KuiFWgChnyW0QLZFs78lC4Ls6vAnt2u59NrScNo4u5W3yX844rSxoN
	 8UGz3ZlCENRdg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 00/19] Updates for turris-mox-rwtm driver
Date: Mon, 15 Jul 2024 12:47:04 +0200
Message-ID: <20240715104723.17751-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd, Andy, Gregory et al.

this is v4 of series of fixes, refactors and cleanups for the
turris-mox-rwtm driver.

Changes since v3:
- addressed Andy's recommendations. Some of them resulted in 2 new
  patches (08/19 and 18/19). Im patch 10/19 I did not address Andy's
  comment
    "Actually you may do that without devm. There is a lookup method
     or so in debugfs APIs that can be used. Can be amended later on,
     though."
  since I do not see how to use the debugfs_lookup_and_remove()
  function without devm and get rid of the driver's .remove() method
  at the same time...

v1 - v3 can be found at:
  https://patchwork.kernel.org/project/linux-soc/list/?series=861215
  https://patchwork.kernel.org/project/linux-soc/list/?series=861716
  https://patchwork.kernel.org/project/linux-soc/list/?series=862643

Marek Behún (19):
  firmware: turris-mox-rwtm: Do not complete if there are no waiters
  firmware: turris-mox-rwtm: Fix checking return value of
    wait_for_completion_timeout()
  firmware: turris-mox-rwtm: Use macro constant instead of hardcoded
    4096
  firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
  firmware: turris-mox-rwtm: Use the boolean type where appropriate
  firmware: turris-mox-rwtm: Hide signature related constants behind
    macros
  firmware: turris-mox-rwtm: Fix driver includes
  firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
  firmware: turris-mox-rwtm: Don't create own kobject type
  firmware: turris-mox-rwtm: Simplify debugfs code
  firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of
    driver .remove()
  firmware: turris-mox-rwtm: Use dev_err_probe() where possible
  firmware: turris-mox-rwtm: Initialize completion before mailbox
  firmware: turris-mox-rwtm: Drop redundant device pointer
  firmware: turris-mox-rwtm: Use devm_mutex_init() instead of
    mutex_init()
  firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv
    member
  firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
  firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
  firmware: turris-mox-rwtm: Deduplicate command execution code

 drivers/firmware/turris-mox-rwtm.c | 389 ++++++++++++-----------------
 1 file changed, 157 insertions(+), 232 deletions(-)

-- 
2.44.2


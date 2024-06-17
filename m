Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E5C2BA15
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 325B0C4AF51; Mon, 17 Jun 2024 14:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D5CC2BD10;
	Mon, 17 Jun 2024 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635538;
	bh=q0e3z49jre01zqDw0s0VIlRYWWDjf51fRvROcgNDLyM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=nL3p5Nw1wMevfvympRtqMDKBrr5yU7ebMRPg/eD2HL6xseAvP7C6cAxVB9t/i3e0B
	 ikJS7VITO+vuVYTFd+c55l5wCjlxQNUedTpZ1TrL/uMcJFn98q3UKYVt0ck9p6Quag
	 lybrG8aT2QGTzWvTZGx9qwARJdBjNzvMFPlmiGbYaTBYjjPHqU2aA+Ssd5OkTDpH7m
	 xoQywR7JE0/14P5/HcMMVInLqOV8i1aBkX4HsISFEkJQr7pUgCxnncqUDkTpi6uR5P
	 /Oi6H3UY5hqry68KiA36+Vz56cccwl6770N0AdKBYvmIbDwMuu8RLdBwAu05keS73/
	 VzZc1AorF2wPg==
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
Subject: [PATCH v3 00/17] Updates for turris-mox-rwtm driver
Date: Mon, 17 Jun 2024 16:45:15 +0200
Message-ID: <20240617144532.17385-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gregory, Arnd, Andy et al.

this is v3 of series of fixes, refactors and cleanups for the
turris-mox-rwtm driver.

v1 and v2 can be found at:
  https://patchwork.kernel.org/project/linux-soc/list/?series=861215
  https://patchwork.kernel.org/project/linux-soc/list/?series=861716

Changes since v2:
- use SZ_4K instead of PAGE_SIZE for size of dma buffer
- other small fixes that Andy suggested, like:
  - use if(ret) instead of if(ret<0) if return value can't be positive
  - use max() from minmax.h
  - removed check for -EPROFE_DEFER, it is done by dev_err_probe()
    internally
  - ...

Marek

Marek Behún (17):
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
  firmware: turris-mox-rwtm: Deduplicate command execution code

 drivers/firmware/turris-mox-rwtm.c | 384 ++++++++++++-----------------
 1 file changed, 155 insertions(+), 229 deletions(-)

-- 
2.44.2


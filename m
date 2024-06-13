Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145C6C27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3DACC4AF1D; Thu, 13 Jun 2024 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9640C2BBFC;
	Thu, 13 Jun 2024 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295050;
	bh=/3N3O99g9BWMQ4Bo8bQzqr8OyyaJMNEgf4AChVpbsjM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ZZMm8/GiHnL/WFqze8O+LlMoYV7tderdj9FIk9j3Q7379T8Ax2E+kU2OHbqYhs8ee
	 AirlYvrbVVlH7yL5IeXeaRujz815+vZRoe9N7+gptb3bsDHkIrqUosR3yYZROPPTeM
	 JD8tdEx5hOFQ6yjzoHd/5X4L9D2VKDR/gGwnJEkV2uSZJg+pe7DcE1RQytgrlHPnYL
	 5C2bvV6xUe+315L3Re3tW520LlVJ1N/hpl44zUZT27Dc8Sm35T0NUom7e9/FyB7guz
	 dtPfFSgAR61oDkaUzdqXWEK5T0hmi07hV8bsPbeng2mtHMXdDHlWGIflNQ04McGs4/
	 K3+NSWLxDflHQ==
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
Subject: [PATCH v2 00/17] Updates for turris-mox-rwtm driver
Date: Thu, 13 Jun 2024 18:10:28 +0200
Message-ID: <20240613161045.29606-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gregory, Arnd, Andy et al.

this is v2 of series of fixes, refactors and cleanups for the
turris-mox-rwtm driver.

v1 can be found at:
  https://patchwork.kernel.org/project/linux-soc/list/?series=861215

Changes since v1:
- complete dropping of driver's own kobject type

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

 drivers/firmware/turris-mox-rwtm.c | 381 ++++++++++++-----------------
 1 file changed, 155 insertions(+), 226 deletions(-)

-- 
2.44.2


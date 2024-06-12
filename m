Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D4C27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B40ECC3277B; Wed, 12 Jun 2024 13:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95295C116B1;
	Wed, 12 Jun 2024 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200488;
	bh=zOlr+Lt3XvCe+LKBGjT5KnOA8pRHSnn60yRYnT+/Uh0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=W2uFTP21aZqdth60hqRV+I7kWBWftv8xiySzhlEE85Rwp+2LTxzOox48D383NsADu
	 4gKz725lBaa7brqr/f2RLdPR/oe0pUuoWMmYdWIh2frMWYjn2f6iABqQZKEAyX3+8R
	 9bmwOZGTFk8SJXQfVOfUCrvbmnPX1hsqmV6I7Zz9lxSLsGXXWjQ3OTwahPUUUmRVOY
	 7imWO/rjWlatlNN8Wtj05CM2KE8Ht/6dn7Ua6icO+pvDNJfFWr+NaD9zVGP2Kv5AtO
	 Pq+OCyCW7wVrqg2MAyz0mteT6HWfiMZ/Uroen86PPI1TR6+XcVRnPoUHgtIkwvEH2G
	 OZw3/ZRiC4kKA==
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
Subject: [PATCH 00/19] Updates for turris-mox-rwtm driver
Date: Wed, 12 Jun 2024 15:54:24 +0200
Message-ID: <20240612135443.30239-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gregory, Arnd, Andy et al.

this is a series of fixes, refactors and cleanups for the
turris-mox-rwtm driver.

Marek

Marek Behún (19):
  firmware: turris-mox-rwtm: Do not complete if there are no waiters
  firmware: turris-mox-rwtm: Fix checking return value of
    wait_for_completion_timeout()
  firmware: turris-mox-rwtm: Use PAGE_SIZE instead of hardcoded 4096
  firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
  firmware: turris-mox-rwtm: Use the boolean type where appropriate
  firmware: turris-mox-rwtm: Hide signature related constants behind
    macros
  firmware: turris-mox-rwtm: Fix driver includes
  firmware: turris-mox-rwtm: Use kobj_type's default_groups member for
    automatic sysfs files creation
  firmware: turris-mox-rwtm: Simplify debugfs code
  firmware: turris-mox-rwtm: Simplify driver kobject code
  firmware: turris-mox-rwtm: Return true error code if kobject_add()
    fails
  firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of
    driver .remove()
  firmware: turris-mox-rwtm: Use dev_err_probe() where possible
  firmware: turris-mox-rwtm: Rearrange probe calls
  firmware: turris-mox-rwtm: Drop redundant device pointer
  firmware: turris-mox-rwtm: Use devm_mutex_init() instead of
    mutex_init()
  firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv
    member
  firmware: turris-mox-rwtm: Deduplicate command execution code
  firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS

 drivers/firmware/turris-mox-rwtm.c | 390 +++++++++++++----------------
 1 file changed, 172 insertions(+), 218 deletions(-)

-- 
2.44.2


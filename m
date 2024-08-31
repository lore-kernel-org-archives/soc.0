Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CAECD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 545D1C4CEC5; Sat, 31 Aug 2024 09:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412EFC4CEC0;
	Sat, 31 Aug 2024 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096058;
	bh=e2qW98woVql76+Fvbe33IheolOdNNRlNL7mpmjhYTEA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DU+sLfDVIkMbVHw4Xw+GjzTcBLckiDGvoHj1JogCNZ9QGBSjEBpsd+s1spcDsx0Cz
	 9/6MzizBXTEp6FA+KdQZ7wjLUWNVisoHzX1Jq6rX2zhh3eNi1/5XAWfdyhogcBSgqC
	 11VCuekYzxBb9GF/4Vq8rV+qfWnqKI/f+AjOBqEHK7TEgs+Zb7inGwvDHIrR0y5iU0
	 zr94Zvzi9OpToyANGegLyWqDW8o22++vTPUBfCkJWTs6RamEQY2uhE6YM+ijstlHay
	 OPI+62J9uVO0gzpEGN2EqXX/VkwfMrIcQEjOiPZxsh8TryuALTIiIcu2E6uJ210ZlB
	 oc03nO5DZfagQ==
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
Subject: [PATCH v5 00/16] Updates for turris-mox-rwtm driver
Date: Sat, 31 Aug 2024 11:20:34 +0200
Message-ID: <20240831092050.23093-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd,

this is v5 of refactors and cleanups for the turris-mox-rwtm driver.
Back on 15th July [1] you said that I should separate bugfixes in
another series, which you already applied. I forgot to send the rest
once 6.11 merge window closed.

So here they are.

Marek

[1] https://lore.kernel.org/soc/4b4785ca-0fba-4227-8186-c5da08d38eb2@app.fastmail.com/

Marek Behún (16):
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
  firmware: turris-mox-rwtm: Drop redundant device pointer
  firmware: turris-mox-rwtm: Use devm_mutex_init() instead of
    mutex_init()
  firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv
    member
  firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
  firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
  firmware: turris-mox-rwtm: Deduplicate command execution code

 drivers/firmware/turris-mox-rwtm.c | 380 ++++++++++++-----------------
 1 file changed, 153 insertions(+), 227 deletions(-)

-- 
2.44.2


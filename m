Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B515EC3DA5D
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AC14C4AF0E; Fri, 19 Jul 2024 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C6BC32782;
	Fri, 19 Jul 2024 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721379481;
	bh=8n6PRbMIV5NzOpl/AUqICvjYRoDhbbjElZYV8WFIvps=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=lWQWG0mUEbPBP5R1q4I+8y6eNjyKE1D8nUGItaOgJKFEeCdUJNMqEeGWO9Z4TQbom
	 9uKH0S5siyuj1T5Yx3MkZrVtYw55h/8taKYnzVtEtXfFsDse+Mcimn2iHKyakOS3fP
	 qNfbjGYtvYXvUH01Q/eCowGDv1z5EJGquUZnyazdNwYgxXq5j0X9rXCBqjNA3eZtSq
	 Zge+4sUXRzEcwXNFVcozh65FQZNRXfu96iJYWpAYHj++fF5B0/qPn3Qe2sN00jjR+Q
	 2k2Sbx6ihL4LOfSfi2YbUCi7cF8mDakgaAznOS2new8Q0x3LRYZPqg5iSLycIqxu5L
	 lvH2Vrq8Ln62A==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/4] Make turris-omnia-mcu driver parts optional
Date: Fri, 19 Jul 2024 10:57:52 +0200
Message-ID: <20240719085756.30598-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd,

this series solves the Kconfig dependency issues of the turris-omnia-mcu
driver by making the GPIO, poweroff & wakeup, watchdog and TRNG parts of
the driver optional, under new Kconfig options. The dependencies to
subsystems are moved under these new options.

Marek

Marek Behún (4):
  platform: cznic: turris-omnia-mcu: Make watchdog code optional
  platform: cznic: turris-omnia-mcu: Make TRNG code optional
  platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code
    optional
  platform: cznic: turris-omnia-mcu: Make GPIO code optional

 drivers/platform/cznic/Kconfig                | 80 +++++++++++++------
 drivers/platform/cznic/Makefile               |  8 +-
 .../platform/cznic/turris-omnia-mcu-base.c    |  4 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 42 +++++++++-
 4 files changed, 103 insertions(+), 31 deletions(-)

-- 
2.44.2


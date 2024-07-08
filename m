Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7FC3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 11:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A366DC4AF0A; Mon,  8 Jul 2024 11:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3556CC4AF12;
	Mon,  8 Jul 2024 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720438806;
	bh=v0R4UYqSVqjnS7itQzH5PSvZPjuGZF1fvCUi6c7CHkA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=JQLuOkLH22UbFUJrfBvBJVvs/UUCl9fLLIz0AS89RCS8SJaC622wIBt73kjX/rjQ/
	 RnuRWfA2vfaHnyWhy/p6cKQyYraR5qSHZWOwo3E+weVf82iL3iWmqs2zA/YfX7KHR0
	 k1PPTWAKZQLN3WhLiEGVXeLedpISJSGhoRZOCz9NIEu1yRGzVbSBrhwsTuTz5oO2CI
	 D/6XCLYufcWJBgpnCJ/vrU8OBZAm1YoDQ1bz1nq4BnIl87ZVICs++eMu+bn/A4ZozE
	 QKE4/WRy//RKo3Woja1+ll3SuP6uFKoUeyCps//Qx91ki5WQVXMbI7JZxb2WyfK6H6
	 8S15HYb/ZS2GQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/2] Fixes for turris-omnia-mcu
Date: Mon,  8 Jul 2024 13:40:00 +0200
Message-ID: <20240708114002.4285-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd,

test robots noticed some bugs with the new turris-omnia-mcu driver while
doing randomized compilation tests.

Here come two fixes.

Marek Behún (2):
  platform: cznic: turris-omnia-mcu: Depend on OF
  platform: cznic: turris-omnia-mcu: Depend on WATCHDOG

 drivers/platform/cznic/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.2


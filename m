Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B47C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A0EAC4AF49; Mon, 17 Jun 2024 14:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE10C2BD10;
	Mon, 17 Jun 2024 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635572;
	bh=FYDQKufeAkmsjfLsNXBHdJptY6sZxFh8giyLiM5VDZo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0SsZXL5Vee749VWcTkCTirEntyNqIIXX6xM9N46lZyfMVrPKP9kctScre9dtNtud
	 pnNdLXOA7HKhJmIjieYo7oGlOd9vrXphB3NVHQol6+47CYz4ly371QP3mJDY7lvqSF
	 baZzy1A+nTSUS3LJZ4N+cE8cgNVIf/UGFrVRlLYB3QNPUdiw/z0w2XaJxiXg7S2XDh
	 /uyOO9Gxi7vpBFjfLCHjPG/2510N4es/EwadWJOc303DrszZwoh9Uz3D0m+61vKlXo
	 pQTbcLdYhq9FYXBtM98rzlVzcIBeUYFdR/BM5BwBHRdB9gdu0qQwKow/rsdkXgWoNN
	 GnEqT/ig4YZgw==
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
Subject: [PATCH v3 14/17] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
Date: Mon, 17 Jun 2024 16:45:29 +0200
Message-ID: <20240617144532.17385-15-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() instead of mutex_init(), to properly call
mutex_destroy() on probe failure / driver unbind.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 0b93040167b6..5a850dc27fe3 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -458,7 +458,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rwtm);
 
-	mutex_init(&rwtm->busy);
+	ret = devm_mutex_init(dev, &rwtm->busy);
+	if (ret)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
-- 
2.44.2


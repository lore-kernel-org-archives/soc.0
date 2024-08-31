Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC1CD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C4BBC4AF0C; Sat, 31 Aug 2024 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134F5C4CEC9;
	Sat, 31 Aug 2024 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096087;
	bh=Z85ohY/TriR5MifQgfR1EPcpJLeH2R08PF6O395cHGw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHGm+iFTWV/Fny3TiqAqZ8g87fEw0/wexXUQV3he3x4An/ftBou8XOO5YNwxaDs7w
	 sI6oA/lx+XbvxMuffGgdW8Q0R9ExRqffJNOgg+PpUBnbauRMUJmaPrGR2W7uJ2tFgw
	 +9QY3xcEHtBCAN7nU0gwY7RA9TDS7k339OkMP/7kkX8jRUVFrPfEe7dqyeXqEbYZzC
	 MBIGhfR44vrFWgxhu2iIr/XoDJa+piO/gtBs3mVAGUSRfDDH5qA9PuYsWMEKBe6bmz
	 Zz0xHT31kg+YZj3kg7jaRkNhSbif7lk+zkmtzwELlvCPIUYAH83OtDW6o3WMemW8rl
	 55GlXtGBAYqKg==
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
Subject: [PATCH v5 12/16] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
Date: Sat, 31 Aug 2024 11:20:46 +0200
Message-ID: <20240831092050.23093-13-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() instead of mutex_init(), to properly call
mutex_destroy() on probe failure / driver unbind.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index d12e29625022..9f6bda969943 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -456,7 +456,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
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


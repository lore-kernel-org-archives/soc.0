Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CDBC3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D1D3C4AF0F; Mon, 15 Jul 2024 10:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DFAC32782;
	Mon, 15 Jul 2024 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040481;
	bh=hprSq5KeOGdNJ4ELz5Ky/YfL795RHKD06ANsIyf3DF4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QJmK9sbJ7HcHBka7hfMmzPWUy1BAp7K42GSx6zSCkN6J80x7UpiQ0xqBTwjDB1Pwh
	 aHcrPhJUO8gssNo2+8Wu+sh1sv65bi2ahHT6hRj0WRSFoDE3FluZA0IfhkELlc3E9k
	 +iW0ccKzZ5D3hRs6nJC4UPtKUW/EYB/vZ4TgQSizEafh+y5Cn5BY0DAGm9rA4d46Wh
	 M4EKNEgD1RWvg2m7VYXZd4bLGiUz34LXBpNI8xwDpSWrj8nipIPtRBsWOOTC8XWH+4
	 jIfJG7CU9N4MZbTp7sAc2tdto21QWwPLxQ5l5+iKI9k5RuXdGccl7C9XsX4KCLDj0f
	 8EXU7tIHyNM+g==
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
Subject: [PATCH v4 13/19] firmware: turris-mox-rwtm: Initialize completion before mailbox
Date: Mon, 15 Jul 2024 12:47:17 +0200
Message-ID: <20240715104723.17751-14-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initialize the completion before the mailbox channel is requested.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 30c124e664d9..f291df9a72ff 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -453,6 +453,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
+	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
@@ -466,8 +467,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	init_completion(&rwtm->cmd_done);
-
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
-- 
2.44.2


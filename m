Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9DAC27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0040C32786; Thu, 13 Jun 2024 16:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E698C4AF1C;
	Thu, 13 Jun 2024 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295086;
	bh=QEGoB8CzMe7NS8dh1+fRNJrdwOf+prPSvjUFmajjOjA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJAKQ/Xh/mAYNdb07SzPBnOdcK7FDqBB7oHunfTer4em85RqlN09cUiSF05F433xw
	 DistD0NzeKbFdW3ktg7kswVbvkUOHK3OcmNifvO2KXGB5sRqa63nELbis5BiDHoiU+
	 3fG03Poz5wFO7KQSbTI8rrMnTM5yuEQ6knYKWuplCjFiptEycxjMBQMpZhCARUQpbV
	 gkc+Ejtc7MxsQrEmCOJ3k4s1zXUH5nXPFK3W0YEN1qRDbUkZJwFgjU6R0dWxcB3n19
	 zJiR3KEBpIWE6TFr6GxDy2iOdUmxZC1CGujQnj+zxbHFEw5bG0KK8K471ecx2CZlYy
	 RgS5PMBjGPe8Q==
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
Subject: [PATCH v2 14/17] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
Date: Thu, 13 Jun 2024 18:10:42 +0200
Message-ID: <20240613161045.29606-15-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
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
index e1142083186c..a9a3a189ea47 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -457,7 +457,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rwtm);
 
-	mutex_init(&rwtm->busy);
+	ret = devm_mutex_init(dev, &rwtm->busy);
+	if (ret < 0)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
-- 
2.44.2


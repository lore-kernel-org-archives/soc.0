Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690F1C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CF7FC116B1; Wed, 12 Jun 2024 13:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F5BC3277B;
	Wed, 12 Jun 2024 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200528;
	bh=wbxgZ6XcWbRj7bTCWwbRQkszGJRhY+DPR1wPfvpHI+c=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNK9D4vY6HoLt4R0h9NuqRTTf74Rya7WjO54A7wJz7oVEVWP+fsLP9c+1qSBFyZxF
	 c3S/dzFlM4B32Rxg5Loe/nt2xT6k9z1kULfglh4g8EYtY/l/tUw6+rfe3lNGRn6NJy
	 +WeevrE7SWlQBAgpqPrghPxn2gSQ030zU4SOMZ+7wXkg3XzI/ouylaUd6zHDGBqYrr
	 Nv6baxvcnzjMn+GLe4Hr10wWh5MdBzEFcL04mIVli2lkW1/w2rYUzgn2YZ4+A4RUg7
	 uWv4Ktouo555F4RQDzx8ZDsoftF3c23EjpXQtFZYkKamVikzfeu0ysahuWqxid2J56
	 uiFAbkuhc736Q==
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
Subject: [PATCH 16/19] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
Date: Wed, 12 Jun 2024 15:54:40 +0200
Message-ID: <20240612135443.30239-17-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
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
index 5f4dd919ce2e..f753e98f1ca7 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -486,7 +486,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
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


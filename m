Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0522AC27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7E2EC3277B; Wed, 12 Jun 2024 13:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8EDC4AF48;
	Wed, 12 Jun 2024 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200515;
	bh=OwbRGiEKG+M4Cmtg2E/rPrs8D2l6T0J6onStDDJ8v1U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPx+OM4Er8oTy9rT+lkBza/nnXSY2PWBGTusDXEHtSIJi8vykdr9Bsxi81nQCaPdG
	 jrSIpGN+adlsHqEor08Z0EcZ6b/CjYCCmd82cF/lBdvWDM1rsbYNvJXjc2S8en+7qz
	 YYjMKPKbTw65qIdWq/LYBTGEpJxzXmiIudekLJd7ZM7QmwQV7HHB3ZuXhx9IeIGcIT
	 pWOsiYz95thgk+rnAvyJXvGh4Q68cpo+kPbEcqV/tK7X5KMCTnxAyudQskYZAyAld7
	 nmI8CS9dAEsQ4q2SjyxdTPeJ7vlOEdItWEOa2F5T5PNyOPUWzewYv4p8STBGVzdB/U
	 wTWINjGv2gvWA==
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
Subject: [PATCH 11/19] firmware: turris-mox-rwtm: Return true error code if kobject_add() fails
Date: Wed, 12 Jun 2024 15:54:35 +0200
Message-ID: <20240612135443.30239-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Return the error code from kobject_add() if it fails, instead of -ENXIO.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 84ec72575c4d..cdbe244be694 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -142,14 +142,15 @@ static const struct kobj_type mox_kobj_ktype = {
 static int mox_kobj_create(struct mox_rwtm *rwtm)
 {
 	struct kobject *kobj = &rwtm->kobj;
+	int ret;
 
 	kobject_init(kobj, &mox_kobj_ktype);
-	if (kobject_add(kobj, firmware_kobj, "turris-mox-rwtm")) {
+
+	ret = kobject_add(kobj, firmware_kobj, "turris-mox-rwtm");
+	if (ret)
 		kobject_put(kobj);
-		return -ENXIO;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int mox_get_status(enum mbox_cmd cmd, u32 retval)
-- 
2.44.2


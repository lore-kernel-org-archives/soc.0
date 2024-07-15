Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13A3C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D341C4AF0E; Mon, 15 Jul 2024 10:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A093C4AF0B;
	Mon, 15 Jul 2024 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040468;
	bh=XfNjdgEJaHYxp2TbZvn6td3wk5uKTKb8zqMIkFPSr6o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ph9kmlYLuxHGLKrTwqnumcnixK+QcPJJMdvMxdW014LYzhp2AFjLCIVI4MElU0EQB
	 KUA1O5cyTHvZe15kMRWgfBlNN3Pvj6P1mNcY9lNIZOYADhskuksoL4NB++sZvla9us
	 7vZj0VVq4gUq8qMx3Hm4B2+lfUoJOp7dhI0q1qisrLsAVYymA25mvAVkB42ly+XzKm
	 JaZeioxRcxWtLxoDtiFen6u4txCiSFtpv+9RpVmZWfcgTTgWpLDJ11lv8b4MGGvaAn
	 7IhJ81OJrO3KO51gCv5kiaJIu2SPRyRqeduVxZQ+cmW4ToJL+L9QpzxBHAxIQ+zg6r
	 W0hoGAOpWx2tA==
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
Subject: [PATCH v4 08/19] firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
Date: Mon, 15 Jul 2024 12:47:12 +0200
Message-ID: <20240715104723.17751-9-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() in sysfs attribute .show()
method.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 0da40f55c750..e3e209247e68 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -151,7 +151,7 @@ name##_show(struct kobject *kobj, struct kobj_attribute *a,	\
 	struct mox_rwtm *rwtm = to_rwtm(kobj);	\
 	if (!rwtm->has_##cat)					\
 		return -ENODATA;				\
-	return sprintf(buf, format, rwtm->name);		\
+	return sysfs_emit(buf, format, rwtm->name);		\
 }								\
 static struct kobj_attribute mox_attr_##name = __ATTR_RO(name)
 
-- 
2.44.2


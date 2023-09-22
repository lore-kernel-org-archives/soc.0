Return-Path: <SRS0=uAer=FG=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26075CE7A86
	for <soc@archiver.kernel.org>; Fri, 22 Sep 2023 22:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8FECC433C7; Fri, 22 Sep 2023 22:34:18 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDE42C433C8
	for <soc@kernel.org>; Fri, 22 Sep 2023 22:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDE42C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B1DAD2A7;
	Fri, 22 Sep 2023 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1695422055;
	bh=SR6ct5+JL0dEXT4O5ECDzYTJHdV/6UCZxQ2VxnCoFyc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZpWXNwJysebO4YbhezPo4NePDVw0cGmN71HnyVyHijGzAmRwPGLCM9DrB2pD6Fsey
	 axp8JC3LWma82589HLLwwjpvjc7I91w1Fi7ExaTnhbwVJDyDlBKPV7l7Bz0SfqUFxz
	 X59H1z2kOksBEDSX404RR43d5LqsP8EvzgIzr8fs=
From: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-aspeed@lists.ozlabs.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] MAINTAINERS: aspeed: Update git tree URL
Date: Fri, 22 Sep 2023 15:34:06 -0700
Message-ID: <20230922223405.24717-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The description for joel/aspeed.git on git.kernel.org currently says:

    Old Aspeed tree. Please see joel/bmc.git

Let's update MAINTAINERS accordingly.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b8a9749cb0b..b54f2a42a898 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1968,7 +1968,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
-- 
2.42.0


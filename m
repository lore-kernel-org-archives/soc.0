Return-Path: <SRS0=rkfo=QP=maquefel.me=nikita.shubin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ADFCAC58D
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 16:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84199C4CEC7; Tue, 17 Sep 2024 16:34:20 +0000 (UTC)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59A1DC4CEC5
	for <soc@kernel.org>; Tue, 17 Sep 2024 16:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59A1DC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:3a92:0:640:6d97:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id D96F160E4C;
	Tue, 17 Sep 2024 19:34:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 4YPGSC4oJSw0-eUfSztTn;
	Tue, 17 Sep 2024 19:34:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1726590845; bh=tNvtQy4zqLNoVHoocAvSNAtslnts3O0YSk0ydjob6Zs=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ZZUD1ZTGryK9Ogn1ZWMemi4x5simG3vOcMVFoJWCEm8H0VScruirZQ9Rk0iwZoAnl
	 SzqmUMRqduAnVEXQlaOAUMkAW0Zeqi5Pev2y2fOlX5pUhuMMFs/mDmwubyezOV5M/e
	 kZvgJ0c2KnYDxW4AS9kPoMIKrUe3utgY58eMA3C0=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	Nikita Shubin <nikita.shubin@maquefel.me>
Subject: [PATCH] MAINTAINERS: Update EP93XX ARM ARCHITECTURE maintainer
Date: Tue, 17 Sep 2024 19:34:01 +0300
Message-ID: <20240917163401.6501-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of EP93XX ARCHITECTURE.

CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2cdd7cacec86..f9672f279a66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2272,6 +2272,7 @@ N:	clps711x
 ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
 M:	Hartley Sweeten <hsweeten@visionengravers.com>
 M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
+M:	Nikita Shubin <nikita.shubin@maquefel.me>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/cirrus,ep9301-adc.yaml
-- 
2.43.2


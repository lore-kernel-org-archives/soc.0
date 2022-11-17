Return-Path: <SRS0=WL5E=3R=dh-electronics.com=cniedermaier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56264C433FE
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 10:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C327C433D6; Thu, 17 Nov 2022 10:52:07 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	by smtp.kernel.org (Postfix) with ESMTP id D548AC433C1
	for <soc@kernel.org>; Thu, 17 Nov 2022 10:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D548AC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Received: from mail.dh-electronics.com (unknown [77.24.89.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx3.securetransport.de (Postfix) with ESMTPSA id A74175DC6B;
	Thu, 17 Nov 2022 11:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1668682310;
	bh=WzRXQrz6HmNFgkYpE8f7pj/XBXRsA4vhkWo52X7TjJ8=;
	h=From:To:CC:Subject:Date:From;
	b=bQ8DUiKlTwhRyU/GEz+I9488s3ZXlA6XP2lJ6JbYAwP5wxpfwIeS6+FlhhwZuCojJ
	 FcPdjpfM3VVqm9a/bLax3sQKtPI4bbt2usD0M8TeZ+tdmaAbV7o0/tHjXYNI/4J9+k
	 t2NZLOSvP+3486hJqegICT+c8ugpcOJJ7SKkA9hz6HW2dRJlAkPF7sOxom2wqXTFJu
	 5rgZlOa9Lt/D42JwrJhyQ5LZeTnj1eNiW7tfcUnrTl9rSbY3wKjsy1lJvHpJSnnAZg
	 pAGzaIouZ8Sir+QxgoWUXecD8z9NEPd9N+oL2g8Vr321Fyo+cQK+K9BeilK5NQ9Wgx
	 D8/oVvfDMb1Ww==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Thu, 17 Nov 2022 11:51:44 +0100
Received: from Stretch-CN.dh-electronics.org (10.64.6.116) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20 via Frontend Transport; Thu, 17 Nov 2022 11:51:44 +0100
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, <arnd@arndb.de>,
	<soc@kernel.org>, Marek Vasut <marex@denx.de>, <kernel@dh-electronics.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Add DHCOR to the DH electronic i.MX6 board support
Date: Thu, 17 Nov 2022 11:51:31 +0100
Message-ID: <20221117105131.7059-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain

Add DHCOR to the DH electronic i.MX6 board support to cover the
DHCOR i.MX6ULL SoM. It is a solderable SoM.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: arnd@arndb.de
Cc: soc@kernel.org
Cc: Marek Vasut <marex@denx.de>
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e4d61369bee..aaacc277136f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6069,11 +6069,12 @@ F:	include/net/devlink.h
 F:	include/uapi/linux/devlink.h
 F:	net/core/devlink.c
 
-DH ELECTRONICS IMX6 DHCOM BOARD SUPPORT
+DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
 L:	kernel@dh-electronics.com
 S:	Maintained
 F:	arch/arm/boot/dts/imx6*-dhcom-*
+F:	arch/arm/boot/dts/imx6*-dhcor-*
 
 DH ELECTRONICS STM32MP1 DHCOM/DHCOR BOARD SUPPORT
 M:	Marek Vasut <marex@denx.de>
-- 
2.11.0


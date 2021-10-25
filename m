Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A49C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 07:40:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D85360FD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D85360FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DJ9g5z1vjGNUYBDmoM92nEZsEbKvAiCsXBZneGTHDkw=; b=nNkVk/ntxEqfH6
	bmrjEKIjohvHVOLtEbP/yi80MVlJU1TaGV6ZuoepiWp9rh5X/Frw297m/aUse+3zksIX9u1UVWq3j
	4IGyuThLYqfKVfjvXysDX2/asi9lYmMAM9/xnGkgPRVKxFjvObq82+rqnY2Bjqez9Gpsye0rnqXoh
	K2SXjxnNnxDJdQiBrvkUpJjsr8C2X6K9d7q9MTp9MbR5a36101SA48sXF+zupIwzeIYgoHSYZCwcO
	EMbViRLD6YXn9lBE3nq4cgYwoqgA7TtpET9TcA8L+7Brkj8jyJwlrNxvWc3tuAVNhFBXcyGMlbNCZ
	Yd5KZZm3rOdzl8ZRGoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meuZM-00FeZ5-H0; Mon, 25 Oct 2021 07:38:56 +0000
Received: from mx2.securetransport.de ([188.68.39.254])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meuZH-00FeWP-7R
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 07:38:54 +0000
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.securetransport.de (Postfix) with ESMTPSA id 649E35E8AB;
 Mon, 25 Oct 2021 09:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1635147515;
 bh=kx1P8W4qyfT/TfaLi3bO415+yY1pKjzYldhhNRTAwpA=;
 h=From:To:CC:Subject:Date:From;
 b=r0ekW7zxhHfQTmzKE/8BFng4nCfwkD90GbkckK5i8IlFyhzV2aHAncyCIVCQ8Bh4a
 T/2bYE6xBC5ITIBED1i3mAsZ7W10JhQKk1gcGqqo0xgY4ywEKo3kdbuBVxUfLTtwhU
 XRXzDsU6dW5YvhFeOoIW7lzcdOEcMpYfb7bYHNFElAopX+Ro3lv+fQyD252IbJPJTk
 X0QbO4Lgx1fST581ud64kMwExa/8iPPWfgd1TK0B40313hhivU+eXXLdccsEQx20lO
 aHo1o/rlHZJ/kbBcV4mVJEewVPStqDvhG+xGuE9qPbeCiUyP7yuxARRdr18qnCkTnp
 HtuMuoEDJ4/wA==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) by
 DHPWEX01.DH-ELECTRONICS.ORG (2001:470:76a7:2::30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; 
 Mon, 25 Oct 2021 09:38:31 +0200
Received: from localhost.localdomain (172.16.51.18) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9
 via Frontend Transport; Mon, 25 Oct 2021 09:38:31 +0200
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@dh-electronics.com>,
 <arnd@arndb.de>
Subject: [PATCH V2] MAINTAINERS: Add maintainers for DHCOM i.MX6 and
 DHCOM/DHCOR STM32MP1
Date: Mon, 25 Oct 2021 09:37:06 +0200
Message-ID: <20211025073706.2794-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_003851_590704_1D79D7EC 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add maintainers for DH electronics DHCOM i.MX6
and DHCOM/DHCOR STM32MP1 boards.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com
Cc: arnd@arndb.de
To: soc@kernel.org
To: linux-kernel@vger.kernel.org
---
V2: - Rebase on next-20211022
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88fcc4e7ff37..affedd5585f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5506,6 +5506,19 @@ F:	include/net/devlink.h
 F:	include/uapi/linux/devlink.h
 F:	net/core/devlink.c
 
+DH ELECTRONICS IMX6 DHCOM BOARD SUPPORT
+M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
+L:	kernel@dh-electronics.com
+S:	Maintained
+F:	arch/arm/boot/dts/imx6*-dhcom-*
+
+DH ELECTRONICS STM32MP1 DHCOM/DHCOR BOARD SUPPORT
+M:	Marek Vasut <marex@denx.de>
+L:	kernel@dh-electronics.com
+S:	Maintained
+F:	arch/arm/boot/dts/stm32mp1*-dhcom-*
+F:	arch/arm/boot/dts/stm32mp1*-dhcor-*
+
 DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
 S:	Supported
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

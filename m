Return-Path: <SRS0=FQl8=SO=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9609C3526F
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 14:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD42FC340F0; Sun, 30 Jan 2022 14:51:39 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A6B3C340EB
	for <soc@kernel.org>; Sun, 30 Jan 2022 14:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A6B3C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3Vumq25WNP3Df0zlSA9vs0wGYkSiJD1gefdGJvPtB7I=; b=br3frG6Mce++quRfNbb4TTsSn1
	UOm2Ob/3U53NV36dMUOCBwE4Ux3LvWjVKIVC7xwfTd40wXy3IWjDt6KKyQ7uTR2l8aWfm24wFAuNc
	KemFDUqswL8rXMpzoFPK/nKTGyltFagwccpCH0z73APiyj+MDB/USjG8a3/yCbG1IQpk=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nEBY7-0002if-J6; Sun, 30 Jan 2022 15:51:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Russell King <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	john@phrozen.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/13] ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC
Date: Sun, 30 Jan 2022 15:51:07 +0100
Message-Id: <20220130145116.88406-5-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

This enables basic bootup support for the Airoha EN7523 SoC.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 1c2c3e9f0e05..3b413635f5bd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -34,6 +34,7 @@ CONFIG_MACH_BERLIN_BG2=y
 CONFIG_MACH_BERLIN_BG2CD=y
 CONFIG_MACH_BERLIN_BG2Q=y
 CONFIG_ARCH_DIGICOLOR=y
+CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
-- 
2.32.0 (Apple Git-132)


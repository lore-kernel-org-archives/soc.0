Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4B4C47096
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF1D608FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF1D608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsbc2nketyoI9mrKtL/u3R4oAW3RnijAbFZr7vM2wMk=; b=eTV+4U/NeTqVRz
	am1Zzv5PORUTOjJG+4MfVryCzjNg8AL9cdmwglLkdpegasx8osMNguJsNOyc83Qsp8mlFXaQ22z32
	qS3qzSZ5UNtNWcga7ZN9fulSimwtlbgy0dFlQRRdORUwqrXgWTay4M34OvMbryzUXmiu3O1zUffZG
	k2Xqevya604QMLACjnyiVmn5SeaxyzG1ayNeZQQS/oyZS0YUN3RzVZPV4MpT9qEGaRVtiB8jIZijn
	CB/iATPniC/dA1b5KwMCaXsEKVB9p6RAGLO5SMw7JAZTB0AREpXB1+OVUfrOTSygIX9tG4Ew8HfzL
	mps0HbVql4mdl5xRd7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lprjF-000EK1-9q; Sun, 06 Jun 2021 12:18:09 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri3-000E0m-PO; Sun, 06 Jun 2021 12:16:57 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4b5s-1lpJTP14fG-001gEM; Sun, 06 Jun 2021 14:16:37 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 7/7] arm64: dts: broadcom: Add reference to RPi 400
Date: Sun,  6 Jun 2021 14:16:17 +0200
Message-ID: <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:yQabTqkX47ibDNJg4fwGitdfVsJvfe3A8a/9Q17mnamUZCUWQD+
 7uuOMkf4ZjSUPT8dwp9Aevg2o4CVeCNByyza3MEmZ0kTixP4SB4kbSBeX88RQjpLRlGyjvf
 0eiSAXv816T4jzTXOzRsfYsbWvgTl9pJcusI3jqwQ/cxfwR14Np+9i48Mc0k7/F5lVmuiRm
 u79E49GcIYcyKP2hIQLYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:age9Y4juz4M=:xKIjLn2ZqpPYY+UCVH1snQ
 t/NYA5TLET0jglDSd1zF/3HJVjCx/nevPejwPXUI4uMhW9ka6S2Lv4I6PCIwlMV9CoFceHfKH
 i3Umf4GKUbahxwHLJkvJIR7Dhb/0LjKigIxzGZp9FIEg2bhbsEQF5yDbzSf8vjf3oxq7Dyn/a
 DQxDNaWu945l1u4epTAMXg2y5ISauvSJogks/g8GYPNV4IyhYEFPPNx2vQmVI4Qjmbk5SsYgr
 gFmYbpIu7lDJjYNs814GBDAGAl2/c5eaEl8fDfFGhhD3X3n0COokR/UCWIcBmqTrlZcgLQl5Z
 6Pyc+tEMGL/7LwgTGOMdkNec1RGEXYheo2Rm/rTUBtg/uOfBhY/jjKBWEGVR4C9epx6t80SQT
 c33B4zsGoz4uorHK6X2ds/2gFjwWRvxDMQWe6RVbHJh2TfYU/8dchXG4fxg1sQHvT/Nn/r2UI
 +mVqeBhqBXS8QJmb4X/YO1kIj+ByLHWxDkXPcV88CqYMGFW1TgQMYsw5EdtxUtPi8XfLizmga
 4OSPBR9RGY9z+zyEc1QBak=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051656_135983_D38AF54E 
X-CRM114-Status: GOOD (  14.29  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606121617.ob1zBYKoyx9sfhhKdkMLqHALkg0cgED8lACEBubEI7I@z>

This adds a reference to the dts of the Raspberry Pi 400,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 arch/arm64/boot/dts/broadcom/Makefile            | 3 ++-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 998e240..11eae3e 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b.dtb \
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
+			      bcm2711-rpi-4-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..b9000f5
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2711-rpi-400.dts"
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

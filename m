Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE6BC4743D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B1B608FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B1B608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTfdQNnvB1En+DwdxLVzHIYh5QziwVJWi3CSFLRsujg=; b=WnRQIpnlLTtdgW
	YKdFlojoKHq1V/t5uuqhy4SdbrodtE05ArxKh0GaSdsGTnPxuPxGCkrASh1g+6Zq48qj2/8xzpMlM
	j/5jfArHWT9xW6YNBYjSWvh6SSupGXe10L+PQkV4erKeGOwAuE12jWfcy38zbwyGOUnuJlqimLk8j
	CFp552VJ9U2F6YnTd76a5IHTVmVd7lZh9qansMbXQag8T8dCHaEHriTlAjqQwSPfTGrEna/v4Jvsn
	jn1p7UmiVCgv4CxIlGUcm9Mn8Jd2LJ+inrTo+ulJohgaojcPWubXUBBncattlyOVuE0eqaNNDkme6
	WSG3oR+0+ADimppYIqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpriS-000E5w-Sr; Sun, 06 Jun 2021 12:17:21 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri2-000Dzx-B5; Sun, 06 Jun 2021 12:16:56 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MhDAi-1lCfGy1a0A-00eIIg; Sun, 06 Jun 2021 14:16:34 +0200
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
Subject: [PATCH V2 2/7] watchdog: bcm2835_wdt: consider
 system-power-controller property
Date: Sun,  6 Jun 2021 14:16:12 +0200
Message-ID: <1622981777-5023-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:JLFyycZklyBchyUrgJGZAF2eo3x4PcQVRd297F7Spm5BBfxjS2b
 gjQ3mArwYloncUSL7Wakf6N97pDYIihP+p+IZRpTZ6GVFwbjG84Uk5eyVskJJjuZtvhaYEF
 yW+Z/8p1lNoT1PtutMj5SuvN9jDnrl/aRbNNMrckjiB6iQah0XzR9Cb3w23LnYGbcyqFK+N
 e0/OIc5dRKglnR3AxHdbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FaJCMb7rKRU=:VKCnjO8P/nMCBFiukRtEtK
 DJl2v8kSBKSY0KxrT+UpsTpRUGOf4davDQZYs8vYKl09ou7GSUftFKcpwXkyB8/pg1kuJxgtp
 GVYCzWPUfdGqo+4ofi9OuTawFP2Yy31wr7+Xl4UYIrS2TZmVMD3aPfPPZc5vwIPp1hY+s9wpI
 7tqbnO1CeFzbJFAXB8kRzZjAwv84Elh4lvyA9mvC3z7O+yQUuSWdZ3yvTkVo2O8ru9snBEC13
 H+nRKBzHpt3yCpbnrdrV7o0srqkvJJKjDJ2R+cPFTu9OQ9Vy3MsYx1fLfdv1krRXWltDUBD36
 6ALznBX1yxZuuNFg9/AxlpwVCi+aSdDPLKFILoyM01kb/4Vpx3HtFvpMLqv6Li619hES3OsYo
 A6I6L0IQWbTa8i5DQ151gFKX/4OPDJP+cM3Kq2iF80VWpy/f6m1/rqkqqQELjWtbJI6q/c09I
 0+9q50E3ajcqlb5wjtemqja9SHhNBqLChVRsUxXtwbd1jjWBmh3DjbWy2DOWbcMTcDBvfUwcu
 X8gIAL+Qq2KlA36r41NL8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051654_692653_8A5CCEF4 
X-CRM114-Status: GOOD (  14.16  )
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
Message-ID: <20210606121612.bnGOAtZUQToxbQTA7pTec0NLGvLLKAFgRdZF3VjxaJc@z>

Until now all Raspberry Pi boards used the power off function of the SoC.
But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
possibly cannot register the poweroff handler because the it's
already registered by this watchdog driver. So consider the
system-power-controller property for registering, which is already
defined in soc/bcm/brcm,bcm2835-pm.txt .

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index dec6ca0..9490717 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	if (pm_power_off == NULL) {
-		pm_power_off = bcm2835_power_off;
-		bcm2835_power_off_wdt = wdt;
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
+		if (!pm_power_off) {
+			pm_power_off = bcm2835_power_off;
+			bcm2835_power_off_wdt = wdt;
+		} else {
+			dev_info(dev, "Poweroff handler already present!\n");
+		}
 	}
 
 	dev_info(dev, "Broadcom BCM2835 watchdog timer");
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

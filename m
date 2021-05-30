Return-Path: <SRS0=k3Qe=KZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0281AC47089
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A1A61107
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 May 2021 09:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A1A61107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKprSrfYLxh282r4Zz0TcnfXkLu8CqMClPRSslry/Ts=; b=MUcp22evF98eSy
	imncBjjiqyyL8GVgi2oi4ZJxePJhba3YGaH4QSfIsJAEkfoM0i1wVelsvb4oiuRFDN/q6162xpyXi
	SkoVDuUsUnhy0pmAeZmAlq++viQ1uBiPhDBhhJYEoBaQJnuY8Kf6ZpcnmhTVQXXPbabHw0PZaLXOP
	nWjeMNnTPvcQOAwrOy7sLj2inXn3e9TjILIMuNXa+YmgLT1FVt+7TEQntzJZ3gp3FJSXtr/R+CRu5
	dH4Ji5HCKo/9kdAOfz7NP28bkLbG/xKNtDzibVHHOms4uPvT6fWMdiPf4jxMkcNzaUpziFlsi7FQU
	/y8AGUp+moYM8UHzOPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnHih-009NFs-Dp; Sun, 30 May 2021 09:26:55 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnHiS-009NCI-Nb; Sun, 30 May 2021 09:26:42 +0000
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4rHF-1lnYxU3Tdv-00237j; Sun, 30 May 2021 11:26:23 +0200
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
Subject: [PATCH 2/6] watchdog: bcm2835_wdt: consider system-power-controller
 property
Date: Sun, 30 May 2021 11:26:11 +0200
Message-ID: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:znMLKDa+F9vbUNC4d6v6cN23njiteUY11YM6VToN2SKxyQaAFDm
 iTgrXwtbB9aJUYqQrtheGOaIsy2rJbndQA38ZQPOG7Tqlz6Wa2IYlwgvkAGMh4QuL2Zf4AQ
 AIPJwB6oqF19LE7kXL9/jKRIeldK7EQ3hdUgLWJX9HkI+Mb72JOg0L0j1JqdqnrDMod+Huc
 /8uVLBTmlK9Jh6NwV9KpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nt1DezL2uzU=:726DgPyLW1LjrTWqlvHfkH
 M9eRW5E7YgdDh1RXYl2r2zezeRqNayb6YyWhLi5ffRFw/6ug9JO6SRayGEXkvoKRU3CJxawug
 wACu3WwADz3CueN+56f9ooKWxY2m/ZGKJeQPKBPX84uuAHwLm37ibNb6sdF9qixT3I6DseHMu
 88qCeG3lZaVFDRUnC/x6WCi4DNt/CiwPwBNUStR+B9y6+Z20xTXaaZr0SHjUg/2y/JS+Sp5ji
 nEuhMtVkaCIm9a2kg5apBYPgjQ9HBgUwhtL4LCVSzZyh6+TCpLFLWK9GbLyhrQczyfKXfrkPr
 qC2SyIRYMnG1vs2GbWSaKlM9iXoJhxEnSkyiq3lVfE7ISFzrjBOWqPVMaXNN2qbN1a+3o+XU5
 C4cZd7N5idCliwNztdjVsQaVOiAxXqco9Z9aDnEEu3QKMd19JMrvI4PvbE8ylDbe4ydMwtgNp
 Q+eYfvlc6eAExORK80rSxEnlSPy0XT9zFFE+FQi8qLgGyAJi28jz66AAAATKyXZT9gm5qYf4p
 Bszo+ubYLJQli38vRUs6dU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_022641_164384_16E895BD 
X-CRM114-Status: GOOD (  14.34  )
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
Message-ID: <20210530092611.0lJpGMkrWUtgE0I_EEoXK3jevJKHENdI6PTnErwFANU@z>

Until now all Raspberry Pi boards used the power off function of the SoC.
But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
possibly cannot register the poweroff handler because the it's
already registered by this watchdog driver. So consider the
system-power-controller property for registering, which is already
defined in soc/bcm/brcm,bcm2835-pm.txt .

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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

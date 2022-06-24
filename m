Return-Path: <SRS0=AAlf=W7=baikalelectronics.ru=Sergey.Semin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27103C43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 21:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D016CC341C0; Fri, 24 Jun 2022 21:12:52 +0000 (UTC)
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
	by smtp.kernel.org (Postfix) with ESMTP id C0A58C34114
	for <soc@kernel.org>; Fri, 24 Jun 2022 21:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0A58C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=baikalelectronics.ru
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baikalelectronics.ru
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 067CA16CC;
	Sat, 25 Jun 2022 00:14:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 067CA16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656105249;
	bh=1Kj5DDWyXfcYA8qLytKcBbBHBni5sL6qSb5CPzoNZjM=;
	h=From:To:CC:Subject:Date:From;
	b=NSo8WFb5bHVTmcVBPTh55op7x/KYzzSxzi93zkeFyGvNvh9MaTv7kjf6+3kyxVOih
	 SuGAKfvpezUL893uZIDMj/x0nXpvB3CpnxkRU8Zs38HE5QPz3TBYiSO0IooiovZEqk
	 X0DA+t+D1henb96fVY8J99laBH8R2EKrr3YVnPvk=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 25 Jun 2022 00:12:48 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
	<fancer.lancer@gmail.com>, Alexey Malahov
	<Alexey.Malahov@baikalelectronics.ru>, Pavel Parkhomenko
	<Pavel.Parkhomenko@baikalelectronics.ru>, <soc@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v3 1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
Date: Sat, 25 Jun 2022 00:12:32 +0300
Message-ID: <20220624211233.7529-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)

The Baikal-T1 APB bus driver correctly handles the deferred probe
situation, but still pollutes the system log with a misleading error
message. Let's fix that by using the dev_err_probe() method to print the
log message in case of the clocks/resets request errors.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Link: https://lore.kernel.org/lkml/20220610080103.10689-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Use the dev_err_probe() return value as the return status of the
  corresponding method. (@Philipp)

Link: https://lore.kernel.org/lkml/20220610104030.28399-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Just resend.
- Rebase onto the kernel v5.19-rcX.
---
 drivers/bus/bt1-apb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index b25ff941e7c7..63b1b4a76671 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -175,10 +175,9 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
 	int ret;
 
 	apb->prst = devm_reset_control_get_optional_exclusive(apb->dev, "prst");
-	if (IS_ERR(apb->prst)) {
-		dev_warn(apb->dev, "Couldn't get reset control line\n");
-		return PTR_ERR(apb->prst);
-	}
+	if (IS_ERR(apb->prst))
+		return dev_err_probe(apb->dev, PTR_ERR(apb->prst),
+				     "Couldn't get reset control line\n");
 
 	ret = reset_control_deassert(apb->prst);
 	if (ret)
@@ -199,10 +198,9 @@ static int bt1_apb_request_clk(struct bt1_apb *apb)
 	int ret;
 
 	apb->pclk = devm_clk_get(apb->dev, "pclk");
-	if (IS_ERR(apb->pclk)) {
-		dev_err(apb->dev, "Couldn't get APB clock descriptor\n");
-		return PTR_ERR(apb->pclk);
-	}
+	if (IS_ERR(apb->pclk))
+		return dev_err_probe(apb->dev, PTR_ERR(apb->pclk),
+				     "Couldn't get APB clock descriptor\n");
 
 	ret = clk_prepare_enable(apb->pclk);
 	if (ret) {
-- 
2.35.1


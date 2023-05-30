Return-Path: <SRS0=Ol/B=BT=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A9FC77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 17:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15D82C433A7; Tue, 30 May 2023 17:56:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAF79C433EF
	for <soc@kernel.org>; Tue, 30 May 2023 17:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAF79C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aB-0003Qf-6r; Tue, 30 May 2023 19:56:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43a9-003vWE-7r; Tue, 30 May 2023 19:56:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43a8-009ZpZ-Fr; Tue, 30 May 2023 19:56:28 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm*/dts: Enable symbols for rpi device trees
Date: Tue, 30 May 2023 19:56:22 +0200
Message-Id: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Zk/jmZbITz2FdUVHSyuNQXEnNQf2kiEiQna2swCm7Qg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdjjDbwpN2/rJK4zTnKGRISQXT6ht1Cbogt8le L57ba1swrGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHY4wwAKCRCPgPtYfRL+ TgeFB/0QUh4ckQxqOl75LHEvY7nwbsoQfPjz6i/vcM6zpA/OA/SQqsSsT+As2o34ndcWYXbmr7s wuwoqB5zHnJ1461XM33l8k9Mn7XInu3cSUR4v2mkOJqzDvahseUmHpYDZsTx+dCOx+BmTLWsHqI 8qJ+4z0TLpKwrQv3KlEvM2EUdKm7++dLPVrrOA2Oju93EabvtkJocPEKNWD5Cf/qjSq7dmpebmj Hi9koFHfgafk4hQZP6K1Ppdx4CHop3dpPOla86Eu2wRHf+/8W5B6AbiIfqD+EtnjBekWYifESGy v+aRp05khwHhs2/CuQiQ1RywsbJvjs2SiQQQlCSX7h19MqVU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Hello,

based on an earlier submission by Aurelien Jarno, I rebased and slightly
simplified the patches.

There was some related irc conversion in #armlinux. Quoting the relevant
parts:

1685078851< ukleinek> arnd, [florian]: Who would pick up https://lore.kernel.org/linux-arm-kernel/20220410225940.135744-1-aurelien@aurel32.net ?
1685078920< ukleinek> arnd, [florian]: If there is an agreement in general that this is a good idea, I can coordinate with Aurelien that for arm64 there is a v2 with the simpler approach I pointed out.
1685083481< arnd> ukleinek: I have no objections to this, if [florian] wants to pick it up and send me for 6.5.
1685083809< arnd> robher: any comments on this one?
1685466520 < [florian]> ukleinek: I was hoping we would get an Ack for robher before picking it up in the brcm soc tree, don't want to ruffle any feathers unnecessarily

So it seems to start a beneficial chain reaction, only Rob's Ack is
needed.

As these two changes would greatly simplify the application of dtbos for
rpi hats, I look forward to Rob agreeing to them.

Best regards
Uwe

Aurelien Jarno (2):
  arm64: dts: broadcom: Enable device-tree overlay support for RPi
    devices
  arm: dts: Enable device-tree overlay support for RPi devices

 arch/arm/boot/dts/Makefile            | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile |  4 ++++
 2 files changed, 22 insertions(+)

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2


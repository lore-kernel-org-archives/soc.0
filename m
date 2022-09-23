Return-Path: <SRS0=Vr61=Z2=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512C6C04A95
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 22:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23D96C433B5; Fri, 23 Sep 2022 22:11:30 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 317D8C433D6;
	Fri, 23 Sep 2022 22:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 317D8C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pfvJ513xEuv8iXDNoGYIRg2YAS3obpRNQdZvIOCM8eg=; b=o+Gkqdq4QWxrzQO/05DchGBbyl
	oo6f/Q2IWcIG8f9EujS6xysMoWGeZIgJs8VZe3bxWxZ3uqQr2YNR6Ukwp3qREsBBl4kDTvq9a3McU
	+VkNPaBGUpCQxbCTxTGBjncKtYHPIkvk62soprDu1EO55cKnrcn4pgT6PjhPiTMJfVjoU35jy08Tl
	TSDwI1KoW3tXisGQQ8K9Cze34ncq4uFFsAyRP7HxYyhc/0lwY7FgBv4qWq5S68ItmGIpllKfbcCeE
	9EStNx/62sfWvJ/n7gXpRH0jcZvE1PZuodfAsf8+0eNVUxDqZXQwG8tq4zfowpiWBmOXb96WK3Wy/
	IJF9Cm4g==;
Received: from p200300ccff0974001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff09:7400:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1obqt9-0004Jq-Lk; Sat, 24 Sep 2022 00:11:15 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1obqt9-0070ol-5h; Sat, 24 Sep 2022 00:11:15 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	marcel.ziswiler@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolecrivain@gmail.com,
	m.felsch@pengutronix.de
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/2] ARM: dts: add Kobo Aura 2
Date: Sat, 24 Sep 2022 00:11:10 +0200
Message-Id: <20220923221112.1671392-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a basic device tree for the Kobo Aura 2 Ebook reader.
It is equipped with an i.MX6SL SoC.

Andreas Kemnade (2):
  dt-bindings: arm: fsl: add compatible string for Kobo Aura 2
  ARM: dts: imx: Add devicetree for Kobo Aura 2

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/imx6sl-kobo-aura2.dts       | 556 ++++++++++++++++++
 3 files changed, 558 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6sl-kobo-aura2.dts

-- 
2.30.2


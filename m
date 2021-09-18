Return-Path: <SRS0=i4le=OI=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9BFC433EF
	for <soc@archiver.kernel.org>; Sat, 18 Sep 2021 14:55:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5EEE26128A; Sat, 18 Sep 2021 14:55:38 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A6561019;
	Sat, 18 Sep 2021 14:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19A6561019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pVMUuxlIP6jTGtPA9HirkcO62g0chCPvUE5SjO1ir58=; b=YmLPElUHDL74qD5Fmp0gPYTbVD
	kra1SoDI/+2AB6K5BKMtKMwTD9i0sWdNpcZR4h6NVe7mdQ0ybBf5zZmc7L7DalHrR6bzoo71niPNU
	lPCD/Nv2lEtoQcxwA7vbF6X98pFsyTI+MCs9AfHif1jMqqEyYon6myRLDjCsd7kC68Kg=;
Received: from p200300ccff3476001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff34:7600:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1mRb8r-0003mD-Nw; Sat, 18 Sep 2021 16:16:33 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1mRb8r-008zMd-2u; Sat, 18 Sep 2021 16:16:33 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	krzk@kernel.org,
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/4] ARM: dts: add E70K02 based eBook readers
Date: Sat, 18 Sep 2021 16:16:23 +0200
Message-ID: <20210918141627.2142457-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID: <20210918141623.f9j9Otp3NYPwH9kfdc_nCQciqW_PxO-lJPEBb4-BO-A@z>

Add devicetrees for E70K02 based ebook readers. 
Name on mainboard is: 37NB-E70K0M+6A3
Serials start with: E70K02 (a number also seen in vendor kernel
sources).

These boards are found in the Kobo Libra H2O with an i.MX6SLL and
in the Tolino Vision 5 with an i.MX6SL.

Work is based on code from the vendor kernel at
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-librah2o/kernel.tar.bz2
but things need to be heavily reworked due to
incompatible bindings

Andreas Kemnade (4):
  dt-bindings: arm: fsl: Add E70K02 based ebook readers
  ARM: dts: add Netronix E70K02 board common file
  ARM: dts: imx: add devicetree for Kobo Libra H2O
  ARM: dts: imx: add devicetree for Tolino Vision 5

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/Makefile                    |   4 +-
 arch/arm/boot/dts/e70k02.dtsi                 | 320 ++++++++++++++++
 arch/arm/boot/dts/imx6sl-tolino-vision5.dts   | 349 ++++++++++++++++++
 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts    | 339 +++++++++++++++++
 5 files changed, 1013 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/e70k02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision5.dts
 create mode 100644 arch/arm/boot/dts/imx6sll-kobo-librah2o.dts

-- 
2.30.2


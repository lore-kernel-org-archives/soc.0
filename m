Return-Path: <SRS0=658M=7J=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1645AC6FD1D
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 08:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C510FC4339C; Fri, 17 Mar 2023 08:16:35 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD2C1C433EF;
	Fri, 17 Mar 2023 08:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD2C1C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ShZIhxx3b2bmUH3tJxhB9VV6YIbZXgi+PEoctj65VYM=; b=GE+l9AJr8Pmkch8WJvie9/zXcZ
	jjCT+KodhsSroPp40/tD/SpE+zSy6aYbRYuuFMyquYX8AAWAGTCH4RER3zlg06ZROvJeVQSD8FU5m
	w92i34++XmimYl7jAK0kSyWprMhz6NGovgCXSU/HdE3uKQqLghJAUVDch9E0WF7s6GBIILytkDX0m
	8RwoyljsDIeqfDhQLSk2/7PM4HbC3+6Oi3VO4QUOp29tCnV3jfztzCcKgt0AvJFkNJKhSeFBjxpjl
	DVJCGZwSaeC8x388DsZ7t7ADv7mMmaAHMahZxpSJnbhPG1pogTJTHhGoKKu2/1EI0ECbkMDIPHlmn
	T7tIcuBQ==;
Received: from p200300ccff1235001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:3500:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pd5GA-00073H-3k; Fri, 17 Mar 2023 09:16:22 +0100
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pd5G9-00A15O-C6; Fri, 17 Mar 2023 09:16:21 +0100
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
	marex@denx.de,
	max.krummenacher@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/2] ARM: dts: Add Tolino Vision
Date: Fri, 17 Mar 2023 09:16:16 +0100
Message-Id: <20230317081618.2387407-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a basic device tree for the Tolino Vision Ebook reader.
It is equipped with an i.MX6SL SoC.

Andreas Kemnade (2):
  dt-bindings: arm: fsl: add compatible string for Tolino Vision
  ARM: dts: imx: Add devicetree for Tolino Vison

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/imx6sl-tolino-vision.dts    | 490 ++++++++++++++++++
 3 files changed, 492 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6sl-tolino-vision.dts

-- 
2.30.2


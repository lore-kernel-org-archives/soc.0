Return-Path: <SRS0=L7O9=7E=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C45CC6FD19
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 20:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F201EC433A1; Sun, 12 Mar 2023 20:52:57 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02360C433D2;
	Sun, 12 Mar 2023 20:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02360C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+ldZ+8Y1rRQahQ2rqeJ1K3l4pEYAY36FZ6Kt71VwB08=; b=bErJ4xytITMHvocg7k/1BzwyS5
	Q3hCMGTCFDWMqkCflu45Gb9atVBamo+jauCHIXj6ukcqvuU65ejGRJ4rXksCN25py/6EDCw/F34Wm
	kIcEt4ZEyyot2VGvu8yuZkLFmHNhh/QjsuJKkwsQ1NLbvaknp0iFbW+KivUE4wE971oooMMga7hrl
	DMdwgiGEs5LJvbF9G1YWrXn+g0Hv+/EaGchyzVUefKUvWhHLwpHrx21abOjcVsGqZadkOiBxpxHVj
	wY5bmu/4tkz/LkA2RKY+KMhwiBhk4RPlZOwiVEgMJoyJyJn8MKZiFjH+VwYlqAO2be8/PQZLUFEQw
	QwTJEizg==;
Received: from p200300ccff059e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff05:9e00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pbSgL-0003yt-DV; Sun, 12 Mar 2023 21:52:41 +0100
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pbSgK-009ZWh-Ph; Sun, 12 Mar 2023 21:52:40 +0100
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
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: Add Tolino Vision
Date: Sun, 12 Mar 2023 21:52:34 +0100
Message-Id: <20230312205236.2281466-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a basic device tree for the Tolino Vision Ebook reader.
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


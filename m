Return-Path: <SRS0=jpUF=QS=norik.com=andrej.picej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3395C433F5
	for <soc@archiver.kernel.org>; Wed,  1 Dec 2021 12:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A721C53FD5; Wed,  1 Dec 2021 12:53:39 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B897C53FAD;
	Wed,  1 Dec 2021 12:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B897C53FAD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wgaJIdZ4ppAVRuisvsatmk3QWXLdGiuz9pe0bVqnGEA=; b=KS8J+v2VZoGdQEAxZmykdEFuNv
	Or3xP75la6H6+ClRGaWnH7idsDSmGKjhlIekMop0ZAG4jZQnJ/Bi58BKJarqasfFo3LaLFBYGVd3g
	NyGU5inpkhweuEr2QAaDvNvoaaeeEs4hUmb4ZpUjTjPzHoqGxmbnT6WZegm94VITQHKFjJ+0MxBGA
	NcGnsZFW3+4NZDQOVw8Djj9L8K06eLVFaDJt/xEIT6fWwa1N7cD5Zjzge3xJYOZDy6F5GUgnl1Zxa
	+XD5/k6dbkf9YKp0rKvCpC7orVkXCVmOiTcr81W5a+1F6zkkUI6hHUZb3qUU53OuhV35YkJHw8Ex3
	17E0kFuw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37890 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1msP76-008Rde-1o; Wed, 01 Dec 2021 13:53:32 +0100
From: Andrej Picej <andrej.picej@norik.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: robh+dt@kernel.org,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	leoyang.li@nxp.com,
	krzysztof.kozlowski@canonical.com,
	linux@rempel-privat.de,
	festevam@gmail.com,
	arnd@arndb.de,
	linux-imx@nxp.com,
	andrej.picej@norik.com,
	y.bas@phytec.de
Subject: [PATCH 0/4] PHYTEC i.MX 6UL/ULL devicetree patches
Date: Wed,  1 Dec 2021 13:53:23 +0100
Message-Id: <20211201125327.3704500-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi all,

this patch series contains PHYTEC i.MX 6UL/ULL devicetree patches not
yet upstreamed.

First and second patch add devicetree for relatively new phyGATE
Tauri-S, which is based on i.MX 6ULL.

Third patch changes USB LDO voltage for i.MX 6UL/ULL phyCORE devices so
they match USB Full-speed compliance.

The fourth patch moves from using 2 pwm-cell to default 3 cell pwm
property.

Best regards,
Andrej

Alexander Bauer (1):
  ARM: dts: imx6ull: Add support for PHYTEC phyGATE-Tauri-S with i.MX
    6ULL

Andrej Picej (2):
  dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri i.MX6 ULL
  ARM: dts: imx6ul: peb-av-02: move to 3 cell pwm

Yunus Bas (1):
  ARM: dts: imx6ul: phycore: Change USB LDO voltage for usb compliance

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/Makefile                    |   2 +
 .../boot/dts/imx6ul-phytec-phycore-som.dtsi   |   5 +
 .../dts/imx6ul-phytec-segin-peb-av-02.dtsi    |   3 +-
 .../boot/dts/imx6ull-phytec-tauri-emmc.dts    |  20 +
 .../boot/dts/imx6ull-phytec-tauri-nand.dts    |  20 +
 arch/arm/boot/dts/imx6ull-phytec-tauri.dtsi   | 605 ++++++++++++++++++
 7 files changed, 662 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-tauri.dtsi

-- 
2.25.1


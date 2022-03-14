Return-Path: <SRS0=kJ9B=TZ=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5F8C43219
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 08:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B842C340FD; Mon, 14 Mar 2022 08:44:31 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F458C340EC
	for <soc@kernel.org>; Mon, 14 Mar 2022 08:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F458C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gEjIrVrHn3eb7KnLlR0Ulnx8nKpDWdumMEp3yGatCz0=; b=H46iA3i/OFVLt/jhYxzGisPS3a
	EGVtUGF06T7b+w2VkEtCnI+LK6fr5gh8Sael6Duu1xIMIzJ3upYbECEU5Wvfs/sAL+p6clJHUeuV3
	yLw6HrNb7ppzCChxEdZqt3k4AKnqTrYppts8/Kq9SBiID3G8gzZPBZlCR+claAr0TTV0=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nTgJO-0002UN-K8; Mon, 14 Mar 2022 09:44:18 +0100
From: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 0/6] Clock and PCIe support for Airoha EN7523 SoC
Date: Mon, 14 Mar 2022 09:44:02 +0100
Message-Id: <20220314084409.84394-1-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds the remaining patches needed from the last Airoha EN7523
SoC support series

Felix Fietkau (4):
  clk: en7523: Add clock driver for Airoha EN7523 SoC
  ARM: dts: add clock support for Airoha EN7523
  PCI: mediatek: Allow building for ARCH_AIROHA
  ARM: dts: Add PCIe support for Airoha EN7523

John Crispin (2):
  dt-bindings: Add en7523-scu device tree binding documentation
  dt-bindings: PCI: Add support for Airoha EN7532

 .../bindings/clock/airoha,en7523-scu.yaml     |  58 +++
 .../devicetree/bindings/pci/mediatek-pcie.txt |   1 +
 arch/arm/boot/dts/en7523-evb.dts              |   8 +
 arch/arm/boot/dts/en7523.dtsi                 |  66 ++++
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-en7523.c                      | 351 ++++++++++++++++++
 drivers/pci/controller/Kconfig                |   2 +-
 include/dt-bindings/clock/en7523-clk.h        |  17 +
 9 files changed, 512 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
 create mode 100644 drivers/clk/clk-en7523.c
 create mode 100644 include/dt-bindings/clock/en7523-clk.h

-- 
2.35.1


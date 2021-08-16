Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445FAC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04E5061A60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04E5061A60
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zhFmA+FdYS/r6HCkQMBbSwdN4tyXGTd1vROhjQ2tWL0=; b=SpjY5Vi9y8LIuF
	mWYVyDJ3O/L4c0w0LjtQoE3s2e8SYfORjYnJfSxmcI66OStIiuGWOYVs+VZN5wCLE2zplHwZfsfkc
	WZbxz5rTYw1+GrY6+YEdmxD9Pky27I9tG5g9N527FxMd602FjzZEQm204pqVsU6HPWO+zAMBrfA6H
	BiG+wYJg9bJw8qAIITtadr4HzeSWZenOxUxx/2LOQMzF5E7YOs/2pS2fUDSc5YknZ9TJ1Zy3QcasR
	CXE2AKNyLyjHSzpZMcxdhqhNrArM+UmiaeAq1AdRKTztEK3+jJNkMKUada4j4+5eafVGNgJWEXnet
	B1vG9DwEQLmvuaUkmyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWOG-00GGMW-Ap; Mon, 16 Aug 2021 06:46:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOA-00GGLZ-DI
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096386; x=1660632386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fa+HDUhrzM19UbPMgeqxqr6FMdoF3kvbbnJcNb1KEuo=;
 b=iB9wS1miywIRH0J5hK1ZvvLdjuiJjSzOgXOZIDPukeh+iwiTG9tP8QgB
 kWBvfUpmry+8cidChQJV3Qvr5nRSlS4UWXw4ZLmrpihdF83G8wKoYPcUR
 ykZKJ6BJCYHasmkzawlaMNJrxP9OcoTkRnIJb7OuDe2WvJfI+i4nLBj9K
 5K6zj5lXSG73QoYFiF028wFO7nVwhzJn5dHM2QoLlbXGljFqVReMmhbGk
 EbehpeBT9/Ly0rYk0328aKN6kD6l8vlHUxvAFlD/W4O4HIXqd7BWNLFSR
 YO25PNWUIeLuF+vM0IXRJ6FVR5bvs22uhdS56AgcwlqGbEJMOfg6jUYVB g==;
IronPort-SDR: RZG8+ZbFhaZfug3g9E+DwfbwypFrDJ3MQmF26e4kMUHT+dUzqmdZWyt1UlGJ8pDrU85WlibnCm
 Cs6cdGP9aH70WuvBQPz36drcfwHoTdGyeQtPUJ2At6yCANp4Bu94Vl25VJbbcn8d7epLaWpYP0
 2gECqFc91nvZqSleK6Ia97o1A0n4h6PChKqIBlZfdHSySIud07Bks797CbJxXzB69EwDy8FTjl
 mQHJmdf3u09j884D+xifrI2f/JEY95XQeAcCckhk3YN4MNneAS1fZYtD7yOuQLAuAG/uvq+BBT
 2O0rNERXRUCO77Rks1eXXhMj
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="128382240"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:23 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:19 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/7] ARM: dts: at91: add Exegin Q5xR5 and CalAmp LMU5000
Date: Mon, 16 Aug 2021 09:44:09 +0300
Message-ID: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234626_558821_21568AD7 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210816064409.JU1rkvTfKGsf0i3bjQVrj7jMkrzYs6wmdGZIIENsfSo@z>

Hi,

This series adds support for Exegin Q5xR5 and CalAmp LMU5000 boards
which were maintained up to this moment, separatelly, in OpenWrt tree.
With these patches the support for these boards will be included in
upstream kernel and there will be no need to forward port the proper
patches in OpenWrt every time the OpenWrt kernel version is changed.

Thank you,
Claudiu Beznea

Changes in v2:
- swapped commit message and diff b/w patches
  "dt-bindings: ARM: at91: document exegin q5xr5 board" and
  "dt-bindings: ARM: at91: document CalAmp LMU5000 board"
- re-ordered patches to accommodate the above swapping
- collected tags

Adam Porter (1):
  ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
  ARM: dts: at91: at91sam9260: add pinctrl label
  dt-bindings: add vendor prefix for calamp
  dt-bindings: ARM: at91: document CalAmp LMU5000 board
  dt-bindings: add vendor prefix for exegin
  dt-bindings: ARM: at91: document exegin q5xr5 board

Owen Kirby (1):
  ARM: dts: at91: add Exegin Q5xR5 board

 .../devicetree/bindings/arm/atmel-at91.yaml   |  12 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/at91-lmu5000.dts            | 148 +++++++++++++
 arch/arm/boot/dts/at91-q5xr5.dts              | 200 ++++++++++++++++++
 arch/arm/boot/dts/at91sam9260.dtsi            |   2 +-
 6 files changed, 367 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts

-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

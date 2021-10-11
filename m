Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27264C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 12:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E488060EFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 12:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E488060EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywgDNsjwdpni8IAAQciAeNODpe4dkFarzS33gGuy7Ag=; b=wSGxKF1E99kLB+
	LjUaHU+6Y5+JimOnQc3C0zmu6ju0RsE7+txMnWl/kJeyXLF13IJ7TxEdAKRCRSxwd0bYpf2ewjsGY
	pnKgPdK/gqui+7779ujeFL/pGZyt1Wy22K0JQfeFoAGaOTWbq3O6QRNmyAa3gJ/xQwVA4JjQcOial
	59K6JxZueOKBVMRDzjV/M4YbkuSf85zaxihz4weKoa4s09kBzLXxDIPhcc4Ei3Lk2jymtfjyZoFnn
	Vs0v6uqsXaZWwh5XzRnnXhXsPGy9LOk+ENcZVMpp2HoyQIJGHIiU/ntTHJME+LyJ5L3PMrao222bJ
	PhKFxa3pA/e+XMiqmPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZuhs-009Of3-Ii; Mon, 11 Oct 2021 12:47:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZuhm-009OdB-MS
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 12:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633956418; x=1665492418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jR4VLxh2n5xrvKbxAr/Rz+ZWsobmRxxPA6ztv3jzo5Y=;
 b=tFuxhPPQyyAkvQ+E/+COsA7u/MI+KENE4wtUr6B9CH8DgVPF5nVgCFgn
 HEGDfhUa2jxW0gDeoKLhQeAjtL2sggR6kSYbPVX3XBxgmmgXBj+8BSRQs
 h5xH/WTIbQtr0+JCcmuJyyDsxTxnvG+xIPSVmRQzOjdTr3O4lJYZmtMe1
 nIK8muBYsKVps9tvJd+nGXOQRTpzPYI89lcIkN1MVGDw/KElIOYe30zDn
 g+ZvELeiB25MAF6m6RzuDrs+wgeCpWGwXjqd7KWPeJhfzrC1J1dlzs9s3
 qLSYtuPX7f0Bd2NMJkuPkxeUj7RwATmvmdjtsnxJd5XvUGNoBLwwDw0MR Q==;
IronPort-SDR: X42KZZDPyQaa+T8ATntHjJcZxHb52QJuGuGjbsyKrSRRFVNbBTdE3QGejyswvNRYX43DXglH5j
 cM5PUXq2ceda7Svum7SfewApl+pA+C6w6ncQf8XGN3vdeM9Hs3g6eB+cE6kvXlkhoA276BBYCM
 oAUjJPfrebXWIk9ZE9YitXJbc0NY2FQx2E5BYFUMpf86nwu0lCRQUlRpPumI+onWAIT1mygVb8
 wH0YpHYNeSuKAytnc7B0DW+1uiUh4aDZ/ZE3fXz3fMFKPT71vXfyeDItVFOeasMtVAYiQVAhIF
 EJAaaHtU97W1iYZBe1vBsbRc
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="72502423"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Oct 2021 05:46:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 11 Oct 2021 05:46:56 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 11 Oct 2021 05:46:54 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: soc for 5.16
Date: Mon, 11 Oct 2021 14:46:50 +0200
Message-ID: <20211011124650.17218-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_054658_826598_345E233B 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kavyasree Kotagiri - I30978 <Kavyasree.Kotagiri@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211011124650.Xm4D9MXOvGMaU2u7Qp5RrsjOeEd9i5ab-2wH1MEyeQM@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the at91 soc changes for 5.16. We are really at the beginning for
lan966 family with an ongoing activity in the clock sub-system, for instance.

Thanks, best regards,
  Nicolas

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.16

for you to fetch changes up to 3efc443121180c2acc987929b3b7b86ca83e3ee5:

  ARM: at91: add basic support for new SoC family lan966 (2021-10-04 14:50:18 +0200)

----------------------------------------------------------------
AT91 SoC #1 for 5.16:

- Documentation for sama7g5 and lan966 families
- Kconfig entry for lan966 new SoC.

----------------------------------------------------------------
Kavyasree Kotagiri (3):
      ARM: at91: Documentation: add lan966 family
      dt-bindings: arm: at91: Document lan966 pcb8291 and pcb8290 boards
      ARM: at91: add basic support for new SoC family lan966

Nicolas Ferre (1):
      ARM: at91: Documentation: add sama7g5 family

 Documentation/arm/microchip.rst                      | 20 ++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-at91.yaml          | 12 ++++++++++++
 arch/arm/mach-at91/Kconfig                           |  9 +++++++++
 3 files changed, 41 insertions(+)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

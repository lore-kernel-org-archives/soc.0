Return-Path: <SRS0=V3rC=PN=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E618C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 16:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 62DF160FE8; Mon, 25 Oct 2021 16:34:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F204460FBF;
	Mon, 25 Oct 2021 16:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F204460FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635179675; x=1666715675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HtlEET3sshwSu3d9oyto6pYaMpqazwviYxoxvTQEnUo=;
  b=BU+q6UTh6eL2FXn05M7i2wdbD88XTD3hn4gjcivCZjhtwjHpNMv0FUEr
   aQfE7NAZIoOfBUVKJiIea1tFsuWdQKI8SfWTUC0Xm5hz72DPvyB8+A52R
   Zj4t1daLD98JNqbk/wBsScDFm3V6N3GhLtqHSsPRu+CFuk2AIsPNTIZkH
   cHnttb255sORXN9L4u1WUUuD9FBGWaW/0NiuOkQmFJEw2x3dzSJdxy1ks
   Dzmxzb1kFL/RkXvZl3f4b3APQrOYrZd7ZxDO2fNnNfUi12gAn+fiM+q1a
   n+lPcrf87hiEiZgnpoAqhUJP/vRWDW2rNMB8Yr02PaZ17uwpIigrPoL4N
   g==;
IronPort-SDR: NO1D6j8D/bwDSF62n9QxiKRX2BAcgsPw4rYw+Bk44fMyBEFHE7VcsGNjgRSxq+b7LKr4EpI10D
 Byyu3bE3VHUgmAwPrxD4KUogl1lsR8qJh/paxjWEQES2dxPPJyjF8CCf3wHiTV59lygmryovBF
 35UXXcmwk3cKeBeGwC0U5LHAG7nnt+Q+WOPVmlSXCe8KvWocTv2frm24wLXf0YQDczZNGZQO6V
 FrV8terSDfs/cAUcLuYskZR4/lcQke2FPut/81jj1Qh96lirpf7jflG1t4kXpRmUW03C/bTp1L
 EO31rMipyiAwnUrnJynDNmbE
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; 
   d="scan'208";a="74197464"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Oct 2021 09:34:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 25 Oct 2021 09:34:33 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 25 Oct 2021 09:34:31 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.16 #2
Date: Mon, 25 Oct 2021 18:34:28 +0200
Message-ID: <20211025163428.26285-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are a couple more dt changes for 5.16. As we are late in the
development cycle, you can surely postpone their inclusion for 5.17.
They are in linux-next for a handful of days.

Thanks, best regards,
  Nicolas

The following changes since commit 4c46b991bab640ee91f16967be2b0d00b7d5f992:

  ARM: at91: dts: sama5d29: Add dtsi file for sama5d29 (2021-09-21 12:37:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.16-2

for you to fetch changes up to f3c0366411d6893360be21a7544595bf275bc9b2:

  ARM: dts: at91: sama7g5-ek: use blocks 0 and 1 of TCB0 as cs and ce (2021-10-21 13:45:16 +0200)

----------------------------------------------------------------
AT91 DT #2 for 5.16:

- Add DT nodes for TCB and RTC blocks on SAMA7G5
- Add TCB0 for clocksource and clockevent functionality fallback only in
  case PIT64B will fail to probe and as a testbed for this feature on
  the Evaluation Kit.

----------------------------------------------------------------
Claudiu Beznea (2):
      ARM: dts: at91: sama7g5: add tcb nodes
      ARM: dts: at91: sama7g5-ek: use blocks 0 and 1 of TCB0 as cs and ce

Eugen Hristev (1):
      ARM: dts: at91: sama7g5: add rtc node

 arch/arm/boot/dts/at91-sama7g5ek.dts | 12 ++++++++++++
 arch/arm/boot/dts/sama7g5.dtsi       | 27 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
Nicolas Ferre

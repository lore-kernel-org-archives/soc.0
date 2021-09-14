Return-Path: <SRS0=vItm=OE=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C143AC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 16:23:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A759A610FB; Tue, 14 Sep 2021 16:23:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAFC60F9F;
	Tue, 14 Sep 2021 16:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CAFC60F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1631636617; x=1663172617;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z404bEPrvwr60WJ43wElB+2Jlcdg7Ky4eRj0OBYyGPw=;
  b=t6sU/uUmPU0ZyfE6BKVXnCBCjq026PHpX+gARN58c4XcC6EmCxs1BIG3
   mlCJRoUVND0a1MIJDOUxgfx3XD1qqrg/nEndIu3DXTsKiw/wKAan8Ku9e
   eE/hxUVBhEfZ/e9eQz+KU6/gMlJgkUXPHmFLQhlvr3xo6dkD4B5DwyKxc
   qf5zY/2ILXVIBH4hYqoORPGoXv369Nnqv9vl2aUil7bnRdJuoPC6rE8DQ
   8duipUyxv/CdA/TtW30Qw7aAoxkiB/kHteCNq+ctCpNoRYOMHggJ1dZte
   6l9nQSb/mB2SUQcEqUUf1MWZQGAFcPt9UapMp5e11dCsntBPh3Wpic61I
   g==;
IronPort-SDR: tSt0bZ4A5NvKb5e92OURoGkgcXEqpKmNoi8GsKtCqYvvkbwK09Va777CWYQqsoqT15SfVGNeYh
 W2Jkj7O7YckLbe73QmuL3kapvj3SaB4hEQtCA7l5pkX35xiMw2WUM/P5rOcCkb1Kc5gNvuAMh3
 hVhoLOjtXpQzY/dAftCFi3MVMdWWUDOPe5Nk906RB2x12MWjMu4qG4nYxZpi3CyNzMDJgP9KGK
 Gs9ykwYOV+G62qV0DSedJluLFTcuVjJmv9jbpYIvO78kNeJ4bhe4uadDKsFC378w38YYESW4Hx
 k+WCuNzdTAAfyFvCti5oMVuA
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="144068526"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Sep 2021 09:23:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 09:23:35 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 14 Sep 2021 09:23:33 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: fixes for 5.15
Date: Tue, 14 Sep 2021 18:23:14 +0200
Message-ID: <20210914162314.54347-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the first batch of fixes for 5.15. It is mostly targeted to our new
SAMA7G5 and fix the PM on this platform a fix and with elements that were
missing.
I queue a fix for another board which is not a regression but we are early in
the stabilization cyle.

Note that I've just updated my GPG keys and that I use a newly deployed
signature sub-key of my already known master key. Keys are deployed to the
kernel dev. keyring:
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Don't hesitate to tell me if I need to review some part of this process.

Thanks, best regards,
  Nicolas

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.15

for you to fetch changes up to 4348cc10da6377a86940beb20ad357933b8f91bb:

  ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default (2021-09-14 17:05:40 +0200)

----------------------------------------------------------------
AT91 fixes #1 for 5.15:

- Fixes for newly introduced SAMA7G5 and its Power Management code.
  Associated core peripherals need to be instantiated in DT for
  benefiting from best PM support like Backup mode with DDR in
  Self-Refresh.
- Add chip ID for SAMA7G5 for easing the kernel log identification.
- Avoid Camera Sensor probe error on sama5d27 som1 ek board.

----------------------------------------------------------------
Claudiu Beznea (6):
      ARM: at91: pm: do not panic if ram controllers are not enabled
      ARM: dts: at91: sama7g5: add ram controllers
      ARM: dts: at91: sama7g5: add securam node
      ARM: dts: at91: sama7g5: add shdwc node
      ARM: dts: at91: sama7g5: add chipid
      ARM: at91: pm: switch backup area to vbat in backup mode

Eugen Hristev (1):
      ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default

 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts |   1 -
 arch/arm/boot/dts/at91-sama7g5ek.dts        |   9 ++
 arch/arm/boot/dts/sama7g5.dtsi              |  39 +++++++++
 arch/arm/mach-at91/pm.c                     | 130 ++++++++++++++++++++++++----
 4 files changed, 162 insertions(+), 17 deletions(-)

-- 
Nicolas Ferre

Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6BCC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 16:35:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054D261381
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 16:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054D261381
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3kQdkcYv4CsLBpWghEiBuI/YWCSxkSjh+DfJhU74ptc=; b=ENWSUQCuOOOWzOPtrGlcWdVctk
	oM9kBJijBH85RHpEpvNfpwNO7fkrEBIiDdmYRgIzge3vRmUP53DA40dvaoQ+cexlX8Iw2YgiWr6sZ
	+edHs9Hyqw1r74rYudu8uIAswu4IfR3RR/bOQhBWUORjqyfzBRELWgHmPRGEmDE7+Rg0avkENdlzG
	Y4UwoTPAuJ5jqx+jaHTb/prz45v8M+aKDdtIrkU/w0143/hrW8X+7bQl6UbhjVKYrVhB/qUeITeBQ
	L+w5gj1fzgob5xZltF37n55UHgGS9Q7UtbJzGE71VRyCaw8ztYNyd9MsunE94j1ZPnCh8dGK3Ev5s
	GNFvZqBw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS0GG-00AKHp-JJ; Thu, 01 Apr 2021 16:33:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS09N-00AHo9-JZ
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 16:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617294389; x=1648830389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mPIkwjQD5YnDveLgKJWb0Q8rKtmMJ9ReFqXZsU3nKaU=;
 b=WqwJAuz2ht+x4YFb7Moo25h7ClvqniUy2DNJiOCtk70kPM+mulFAQ3kP
 exB0FZCj3kNXcyReGcNCWTGzOXd4xxaITfZxRfOGIjJA20sAV9n3dsrUL
 vmqeC6R1RKdlU/sIai91R68Nnu1/JiEoPp7Uczt3SCtE9JYycF9q+UPlu
 koKdyiE+AzZBguhh+4eK2jzvdaQOdX8Zxqo1zebnhGUcyYTAtIlUcP3Rc
 GbQunaHg6uLOYBmcgWatLw9VXbSZPOS567ocD6JTY2gcHZMmEHUbcnQMJ
 kihgW7u1OiD6agB8/MZlcutVjKfEi3uPD2WYCLhoQjJl1OzbX0+BpcUC3 w==;
IronPort-SDR: qhXlHQJy4oJtmkri0qncFVEdMT5iG+XH8L8JyrM+PXWaQDlsH3zzQVgdrv8oNOGk6s16oGs5fz
 Bk01o4eH/KjvfR4OnCBICd310G5Fc2vmsRV1Q2XKYa4k0xDe5BZkFYoczu4JU78D2y92NIh+gH
 ej7c8T18NtstEDan6vRRalQhaG2EZ1g8ira50fmwxWtCocfbfIc7PCrqT0UkG06ZB5YOS887Kz
 vvI6w8jVj7PJiMAgtIR942dOY16DjH2kkXyOX44U2BjLgxBzZhnWo50YeerIkppj2OYfbjLeQM
 lGQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; d="scan'208";a="109371184"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Apr 2021 09:26:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 09:26:23 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 09:26:21 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: defconfig for 5.13
Date: Thu, 1 Apr 2021 18:22:07 +0200
Message-ID: <20210401162207.29299-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_172630_228492_238AFB28 
X-CRM114-Status: UNSURE (   8.00  )
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210401162207.a6_S-ODvuk0L7OE8aRL_FdVHBI_9ldyZV3TirR5n_ac@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.13 which is bigger than usual for aligning
with options that we use frequently and some changes which will be beneficial
for CI.
There is an update with savedefconfig included, tell me if you prefer the PR
without this first patch of the series.

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.13

for you to fetch changes up to 4136c4443efce6f028eca74885870ac649981da1:

  ARM: configs: at91: Modernize UBI defconfig part (2021-03-29 11:27:14 +0200)

----------------------------------------------------------------
AT91 defconfig for 5.13:

- aligment with recent kernel for sama5_defconfig
- move of 2 options to built-in
- addition of useful modules for validation and CI
- addition of Hantro G1 VPU from staging

----------------------------------------------------------------
Codrin Ciubotariu (1):
      ARM: configs: at91: sama5: Add audio MIKROE PROTO board

Emil Velikov (2):
      ARM: configs: at91: sama5: update with savedefconfig
      ARM: configs: at91: sama5: enable the Hantro G1 engine

Nicolas Ferre (4):
      ARM: configs: at91: sama5: MCP16502 regulator as built-in
      ARM: configs: at91: Add mtd tests as modules
      ARM: configs: at91: Add USB Video webcam class
      ARM: configs: at91: Modernize UBI defconfig part

Razvan Stefanescu (2):
      ARM: configs: at91: sama5: PIOBU as built-in
      ARM: configs: at91: sama5: Enable LAN78XX as module

 arch/arm/configs/at91_dt_defconfig |  5 +++-
 arch/arm/configs/sama5_defconfig   | 51 ++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 23 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35207C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:13:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D004B64F9B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D004B64F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hihfbQCGyxYmsQHO9i/8DZwTVQCBIvPp3HkCPM3vzOo=; b=o/LbjUiYIwpiqfCxnJTslhKe0B
	+IiuIdcvAau/TRh2+ew4d0TzSJkzyXvXWaDccFdU7PubtuXaxL4fBiMfyh40Bquimll5tuD/j/ugW
	uHQz4IA8TFq7SiTjT8/3x060HaOv5BZE3bUFNO8ctZBPC2KZVSqeZ3RDZEH+SAVjkIQQDUNpQcmzr
	bxZOxKvFfmcxQCgWldFNJ01htDq2DHlZETenNSg0Q5j0JtE4G89DV9Q6DRggS8HjKbLpXeDJbTEzP
	o5VtxVFCBADVuB8ALhHwd1r9LiKH1Shf+tHAuyG5NmvcBSubALbIia7/QBVVp3TRqe2LnsaQ+eKxO
	dzFPmZPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1Ra-007Bqx-Gk; Wed, 10 Mar 2021 16:12:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1QJ-007BDK-SN
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 16:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615392659; x=1646928659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O5jeKypV2ExKtHu5QJ2ITrvif4oyKitUExTdelTu/Qo=;
 b=uex7h1SkohHsp63OJBkRHYn+WTBTXhleOcrZbixpnh+cXssN3t6CfTW4
 hU2vfMQ38u4h7oNopjF7EY+ZL9D2Y9ASiIHmg69rchxjmeEck9VseQc7m
 SFbOQc728OSLaho7JLL1/bPpMRay6g6aTR6FZOaUwZyQWwjY/Buk0olKw
 /AEYOuPxuvgEuqO+0XvEXRaCn4l3Ld4Zz0XiQcDwwsR2g9OqZyCD9FyEZ
 o3Kw3NCWSOCBdNCBYilNCqqOyA2aInuPSKhdIhxAeJKiiBK6Bwi++gvpt
 3tyTPeuxtifCnQUP02S6hOVV7SFt7HYO17hnVkeDOAAz5pZL1zd+Dnzli g==;
IronPort-SDR: nEaPGjPgYT3WDxBsCTOOdsRUMVINyPtJBcEgKTRUNDp9FEeYRZcDojqs1/h6MdrlEmC0BmQCOz
 gp3dxzKAy+omQxtr+rD/OgcSJ4MbdKHAPQnUzAuGSaP2JxRNi2EJ2djotDRutXic9la4Lf3bEY
 ULgI0r2JqdEjEpkWvHN/auHfDKLmO6KgBnp4cYoAAJTjIFHqcm5F8MOIlSPBPhYaQEyrPBrQ5e
 HTh4Ft5XMYDgQ5SyVjSz65qaCYeXsJDSK0Np+WG5etgvAyD58cB1MiBD+RK+0n+DKqVt97Ho3u
 e2w=
X-IronPort-AV: E=Sophos;i="5.81,237,1610434800"; d="scan'208";a="46983116"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Mar 2021 09:10:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 10 Mar 2021 09:10:56 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 10 Mar 2021 09:10:53 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: fixes for 5.12
Date: Wed, 10 Mar 2021 17:05:47 +0100
Message-ID: <20210310160547.55382-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_161100_307069_CF72CCBF 
X-CRM114-Status: GOOD (  10.93  )
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
Message-ID: <20210310160547.oJNC8BEavAQ1RiEjAjU7qSyk10AVJk3I7GZxn-ED15M@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are some fixes for 5.12. It's not regression vs. previous revision, this
is why I send them early in the cycle.
I based my branch on top of 5.12-rc2 because I noticed that your "master"
branch was pointing to it (and of course the "-dontuse" suffix from Linus).
Tell me if you prefer that I use a more usual "-rc1".

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.12

for you to fetch changes up to 2c69c8a1736eace8de491d480e6e577a27c2087c:

  ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet (2021-03-10 16:38:15 +0100)

----------------------------------------------------------------
AT91 fixes for 5.12:

- only DT changes
-- wrong phy address that blocks Ethernet use on boards with sama5d27 SoM1
-- restrictive PIN possibilities for sam9x60

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91-sama5d27_som1: fix phy address to 7

Federico Pellegrin (1):
      ARM: dts: at91: sam9x60: fix mux-mask for PA7 so it can be set to A, B and C

Nicolas Ferre (1):
      ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet

 arch/arm/boot/dts/at91-sam9x60ek.dts      | 8 --------
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi | 4 ++--
 arch/arm/boot/dts/sam9x60.dtsi            | 9 +++++++++
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7485C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 12:36:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7341D61278
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 12:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7341D61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jnt35koP0wMPrAE7ZZv/vGMEl+jHOEc/XcL6QZhSR3s=; b=abo1AANsTdYUDH
	OvuIoNaHmKoQlX7xgM6l9KIvxjKtVz6FMVUSgRbPPF3bt7NgglrxAhFbgrgG/2evAd3dxYfgFWKCv
	q5EvOoZZsKsZbOZukgCvbU0kH/BS2N/gQz4BotpsbcahFG8tvVOAe7obPokzaKsGqy6UOox2Wiwlp
	qmx/ayvoGqlUYl4K6Fv5FjKEO98MuzZSLPQFx7+mKu3/iEkoxvJoXEffvNPlnUpUK29ax+id1rYaN
	cfSarSxncVQuMRj80AuS8bKinGELpkAma9kOoymw9hHS9GxCD9lM1jQ7O+JGY8Qyj3Gc9zpiopOH2
	rLACg5KXdFmEoOhcIPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrgNO-005G7W-50; Fri, 11 Jun 2021 12:35:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrgNK-005G5t-07
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 12:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1623414901; x=1654950901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9oKOs6soBsf7r+2YKy8MGZXh0qlSUDGRKn5ybaBeEtg=;
 b=zQ+1Qw0l4q8t5OyMwZcPcfOa9Lbra+l7FpFxb0RYfQkMu+KInzC/8XdZ
 xtHdwM+f/oJQWGjaeMRpWGCfMpDKUQam5H5oZyKjc26INLJIJ1GxWNI4T
 FCbrmsIzi21rNXj+p5chA1AAtc6lwTqdt+f74emhaD5ileA1+Bs1IEY+X
 cEPybFJtZdtU+W3F8ZxOvvABTqXBQev6OCQmXIK6sCC2zdHKG7dolcnvL
 zD/LEXCLyuwAWLmO3f65vNEpHQEdjW8Yuz8zndgCq365mTGCu/QwqT58n
 i4ldyL/H8kulil7wWgmydAKzGJQpTNt2Ne5ykCs0EwLcFZJyXthyPl9+G g==;
IronPort-SDR: oveMVxy44jYHj0c1he8s0soS9zYYAD4Jryogra1xjJfITufBQN6yWKQ3+tgfWn6ZHgGFYLEWcf
 zWLkvfYfYrstG+D1aMA4NqxDSXOKzmmLhKZTO5z0Z4k8xDh5fDlkMDxB4qCKIPnv+NoGBm5v+f
 VRf7HezzAsMMjJqEkjeM98x4B7Qyuye9ucdFX7eKpNotYoG1qWlokOMi6qFWyCtW+u1i8Bctsk
 4zzHkk4ou5bM/+Zif/gJvAeJSpGLqjEyR/zVSLUJmeN4R/n8hMK+vm30JUY+FWTeqd7hP6sybs
 28A=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="118397800"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jun 2021 05:34:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:34:59 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 05:34:57 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.14
Date: Fri, 11 Jun 2021 14:34:46 +0200
Message-ID: <20210611123446.20510-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_053502_147447_E164110D 
X-CRM114-Status: UNSURE (   8.33  )
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
Message-ID: <20210611123446.3h9iHDHGi1vQzxNF6YoaL6lAVlfn4vBhmUN6_MPH2mY@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the first batch of dt changes for 5.14. Very small amount this time.

Thanks, best regards,
  Nicolas

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.14

for you to fetch changes up to 92e669017ff1616ba7d8ba3c65f5193bc2a7acbe:

  dt-bindings: i2c: at91: fix example for scl-gpios (2021-06-04 15:19:32 +0200)

----------------------------------------------------------------
AT91 dt for 5.14:

- A fix for sama5d4 gpio mux
- A trivial fix for DT documentation

----------------------------------------------------------------
Ludovic Desroches (1):
      ARM: dts: at91: sama5d4: fix pinctrl muxing

Nicolas Ferre (1):
      dt-bindings: i2c: at91: fix example for scl-gpios

 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

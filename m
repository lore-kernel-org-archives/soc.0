Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:27:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E83B164D9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E83B164D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=24vaAX2f1G4K0Vctnr5/06dindEDwhLSSOgyd9eFB90=; b=A/QWQ/KDl9AafcfKEfGHWGoaM/
	T4PLthmWrwLZcTx9f8g/8DBfd6Ybjs5eMZNN8UBkOwOiTyWXndNcRLiS8X2DniyxEfQWTsVHeKWv8
	xKVlnMIE+X6V8Atxm9AkZkbjFRlHevs8p3wB7/e/E2bIaPmkhy2w1Rj0qyWMpue5YDhmoeRmuhF1/
	+ofWJG5d9Ee0MTkXFTtu9M5V81pjBIL+HlePyrWNDLPmnyir+HnObXpwrV4OL0Y46rXlqDflYVkFt
	7TJ+fY/7x+pFVmMy64UKffTtmJyzz1zb5rMaajYWQpxqQnj+g86tO5nZ9sjNr/TAESMta1LRWBXDF
	oAZ7usKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6c1q-0000tL-Nd; Mon, 01 Feb 2021 16:26:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6c1n-0000sm-R2
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 16:26:16 +0000
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr
 [90.65.91.141]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B579A200006;
 Mon,  1 Feb 2021 16:26:11 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Subject: [GIT PULL] ARM: mvebu: dt for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:26:11 +0100
Message-ID: <87sg6fn49o.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_112615_987391_CFCD7AC0 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201162611._TBIUbHq5YwM9pjnySbKAhcttY468VOkxuKdpplEpxo@z>

Hi,

Here is the first pull request for dt for mvebu for v5.12.

Gregory

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.12-1

for you to fetch changes up to 46ecdfc1830eaa40a11d7f832089c82b0e67ea96:

  ARM: dts: armada388-helios4: assign pinctrl to each fan (2021-01-29 16:25:31 +0100)

----------------------------------------------------------------
mvebu dt for 5.12 (part 1)

Improve LED and fan support on Helios4 boad (Armada 388 based)
Add ECC configuration for Linksys board (Aramda 385 based)

----------------------------------------------------------------
Rosen Penev (3):
      ARM: dts: armada-385-linksys: fix usage with newer devices
      ARM: dts: armada388-helios4: assign pinctrl to LEDs
      ARM: dts: armada388-helios4: assign pinctrl to each fan

 arch/arm/boot/dts/armada-385-linksys.dtsi |  2 ++
 arch/arm/boot/dts/armada-388-helios4.dts  | 28 ++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

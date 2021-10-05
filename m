Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF21C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 06:06:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2D260F43
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 06:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D2D260F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoqU5i2wwYhHzXy1s6vhft/fVlg2UPBPsa8RskZdg4w=; b=JKhLZcfhkTB6rz
	pn+aaSLFpi4aMCm7k7r/Q1eck4ptln9U1Q62Ygqr5pgi2SZ/i8ig1r64DzqEA564fkkw95nujyDsB
	7x5FQXu3IpdyhJ30YIt+dTnPQ8dv1xdcPNtSUQ40RXWyEvlzqC2C99sGVIwwhwsIz0AKLSd72a0cw
	0Ij3RjpIGLlqvqGJImpzTU+KkTsp634cOgqJ00QWSwPm6vo/R/yg58FgZq4WPFxnEYudC7xR71eQI
	g3plUki9J39a6wwW4+aI2ct+AfA/PFH1ASknxIW1pOlc6MUPImgPVB8XEGrvlCkfdRGOBLHwgGuzU
	3QNEBNWnnXjs1hZm1Mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXdZD-0094Yk-3W; Tue, 05 Oct 2021 06:04:43 +0000
Received: from mout.perfora.net ([74.208.4.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXdYV-0094ID-Ia
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 06:04:01 +0000
Received: from toolbox.soleil.gust ([63.147.84.106]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0M3i1X-1mokrY1IIb-00rHkS; 
 Tue, 05 Oct 2021 08:03:45 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcel Ziswiler <marcel@ziswiler.com>,
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, soc@kernel.org
Subject: [PATCH v1 0/4] ARM: prepare and add netgear gs110emx support
Date: Tue,  5 Oct 2021 08:03:30 +0200
Message-ID: <20211005060334.203818-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:PHZoUWbg+wewrRDzZRFpkPO+la0hiffCSnS48JQgyvbfQBxdxal
 p+9TtNNMHp6vTPS36lRHMte5osoJBw7cEr1nEdexu0OX0tNpeD6ibRG9wpuBBgsqeWfPegL
 MaLNPyzVvZWN62Bkio9WP8W7UC2dkVa2lVjoJb1SGXRCw6EDoZhTmVajRsiqlzUfMx3MIbx
 Wp4tj2rNCuMDsevU7xfkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TCXgmKTrsOg=:HkEzz4khVLTBJfI+EmcSJC
 F+3Qrah5ofmBt0yP04evSgdAMrpyM8V92TSqYpLAwgZSiDoB1+TcuZIle0Ru2fPvv5CAtP86D
 lVxEALw7xkq+Krc2Mad6iB77RQq3XWSK9V/VhS81535F1B5NeSZYQzKhDhjRcdfJcFuLhsR2/
 UwShkj7SFm5NQ40TQQ6m9zMOBgESjwnoCqi0N2LRRMIy7uOh6vkSCenMZAQo3OC9Co7st0Jk4
 hZk8LSqV8eHciMyZLFEdWGBC+or5SnT5yY0GV6jjFdnWmxetB27Ckvp5FCaI6Ts0PxlXiM/hw
 +pjxYYS7ii1E2NSrNS8SgkUdI9vteezup2Zymc4X4YU8z7WiYsHtyq1XMMi/HgZ1qjX72xoUh
 U3lFkmUjZVqqeJf9z+GeE1YptiC+3/RhQsVfQLc3cSgz/ASqmQBnWt5g1P4ROcQ5JbSUn+jMQ
 KplXkfwF52lfBP1B3QrDIgt28Vs0lofsXVrWn4yHPhPqP1pL7/LOO85p0K+7jqLiCJkzeAUr3
 PRs1mgcvgjxwEw85o8HkfhnsRKUpz5yuSgIJ2DMn+0Y7kFgetLbiEyFI4xWl1QlIbznjpxoMp
 t/wJC8HUgKS/9OrSz1q24iJNQ21L5goMV3l30P78pTGmlPoS/DLhJfrHMBRv6OJS8xK2uLCPM
 2ows0/TnholAQAGpXRjZudYGBFAulan4TgwHprS1Es2YJqPCdfPEOpyPzpaJVu2D/HqKOgA6q
 bNsfjuv7yuEeT8AaEK9Ea9SFc9ic3FyvlRAkqg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_230359_726171_D4AE9E43 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211005060330.3Fy-IQvHn02Us0MQ0Ze_4PYvcx0u-b0HswODr5iug84@z>


Cleanup mvebu_v7_defconfig and then add support for the Netgear
GS110EMX which is an 8 port Gigabit switch with two additional
Multi-Gig ports. An 88E6390X switch sits at its core connecting to two
88X3310P 10G PHYs while the control plane is handled by an 88F6811
Armada 381 SoC.


Marcel Ziswiler (4):
  dt-bindings: net: dsa: marvell: fix compatible in example
  ARM: mvebu_v7_defconfig: enable mtd physmap
  ARM: mvebu_v7_defconfig: rebuild default configuration
  ARM: dts: mvebu: add device tree for netgear gs110emx switch

 .../devicetree/bindings/net/dsa/marvell.txt   |   2 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/armada-381-netgear-gs110emx.dts  | 293 ++++++++++++++++++
 arch/arm/configs/mvebu_v7_defconfig           |  18 +-
 4 files changed, 303 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

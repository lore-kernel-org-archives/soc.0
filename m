Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8542EC4332F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 06:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C3B611C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 06:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57C3B611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wS8t66WovAjd39KsH243hr6iDQBRbNv0Gt0dtmKIEeI=; b=gOR+JRo31uQ6BX
	whn3sm8rQCPghFXo43oyxe5s+wBFJABMn2Xi6kxk8xN5ihIvkIo4+afSylMnb4n4qpF+qM8fxugZ0
	qwrX3MrksnKcFBgRtioNcCwkXULaH0cBIV20rC3bnUcuQJOoWZDjm/YT2pTVP6VP2b9GqumtX0ijo
	ly/m3/xrEGe9kohFahBfxcobSaHM9TdYmpygotZcZJWMZkrs93lhRYqrxqsSQszcI3hne7mjIDCRb
	vfZsE5j7qrgCJQM6/cW3eVB8Kejfw3bBDQb1Rg98MrSXXE1DvJp2bXwkr0PqvGYlZPUCdQ3j4K//X
	Ak0cxLi80vK+RkM1Oggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY0VK-00D1wc-Hj; Wed, 06 Oct 2021 06:34:14 +0000
Received: from mout.perfora.net ([74.208.4.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY0Uq-00D1qq-IV
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 06:33:45 +0000
Received: from toolbox.soleil.gust ([63.147.84.106]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1My3lb-1miHH7447z-00zY9b; 
 Wed, 06 Oct 2021 08:33:27 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcel Ziswiler <marcel@ziswiler.com>,
 Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, soc@kernel.org
Subject: [PATCH v2 0/3] ARM: prepare and add netgear gs110emx support
Date: Wed,  6 Oct 2021 08:33:18 +0200
Message-ID: <20211006063321.351882-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:hmW7MF2vajFGU/X/yOR0Cd/HvuhYIAaNMwzrXLPtlmGF79dfqnu
 0wyBcp57XefRrZiWEu0MgDBsGhWYtI1zU323B7oJQgpbe8OX0VpFNBgooRPMeIuHV2KGkOJ
 dtMRW2/jm2JjCAzswLYxEdw5UXgJo9TEtCxG5ljuZO+hYPh8hTLacdP6sDF8QxSmbd8UiC1
 ZWVrxo6HHmmGGxRAXfQRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/7a2Cx/miA=:44IQoihidPLacuItTznkB7
 bk/Af1wcou0W23Ft19p6TMj9EZM4VSPxqkY/OAc9Qp4ascDrJiOaIGSIblEXg44ZjhSKHcRk8
 UzTG8EkZ1E52985fYsyTHrXBgOKPAr/p3LVwUzOG4d/w+/bJNsHFoP86m7ctKtobJAVhGOwjo
 cy23l99rN/IaINE+L9S+qrdKUbysOeucDwmwq/QBRpPnV8OihnoXmEew2znlDx+7MI0V2gGB6
 X3KVCMnUEhulKpSiqXdWbsOr/4ryQxuJbnGL4F6QdiWNf0ibUqZ6FKIjLuWpBfjonfLvoxrSl
 2DA4LKAvIgt+9stnNVl1IRZLT80HE4chCUJW7Sa9yma7LfSWuuG3BiWsBVppGNL8LZ419EtV2
 9xoFoqsF/J4161PTH6tjEVKL2gjSN0deuKo1kOb2IewVlljzZ5Q8ip7gFQUjXv+H+EZLiKQVX
 UBUpqn7xHptrH1TqQm1LroWrp1TqDDrZVK+81k9QimTcM8dhUU/URW3GsGsd8ikEMvOhrBTna
 +Sj2FNVnlC1fT8wCFS7jmNrkokVognyi0Sb7PSj+EvbYkWRslNGfmrZlE197hFcYGJcwwasjV
 qstZ04cx0FvkEjluvvUZgV55c8DlNcqtGqL06PEXkXi03u+eRGIeVpa3iwrgJkaJ2fYnNHBzE
 VM5YC381natQaplNbCX48d2JjEqiEky89INnOtypTcGHKWlCgkv6YVhhDmxrlT7hqF5AyXFXx
 sHVlWXsPCVAFtxUe/khXkQyAmEjP/xT3EXFF+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_233344_706918_3C9A6455 
X-CRM114-Status: UNSURE (   9.60  )
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
Message-ID: <20211006063318.c2jqKhHhZzuJ-UxTBn8pPvTQGCy5fT6oVH66j4W1BHc@z>


Cleanup mvebu_v7_defconfig and then add support for the Netgear
GS110EMX which is an 8 port Gigabit switch with two additional
Multi-Gig ports. An 88E6390X switch sits at its core connecting to two
88X3310P 10G PHYs while the control plane is handled by an 88F6811
Armada 381 SoC.

Changes in v2:
- Send previous first patch separately to netdev mailing list as
  suggested by Andrew.
- Add Andrew's reviewed-by tags.
- Fix numbering of the PHY labels as suggested by Andrew.

Marcel Ziswiler (3):
  ARM: mvebu_v7_defconfig: enable mtd physmap
  ARM: mvebu_v7_defconfig: rebuild default configuration
  ARM: dts: mvebu: add device tree for netgear gs110emx switch

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/armada-381-netgear-gs110emx.dts  | 293 ++++++++++++++++++
 arch/arm/configs/mvebu_v7_defconfig           |  18 +-
 3 files changed, 302 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

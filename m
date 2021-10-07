Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B84AC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 20:59:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AF566120D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 20:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AF566120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xSibohNYqSgONnjnLlJJY4FsVVYxjEgl5HzMgdtUmMQ=; b=C/vcioTt8Q9Acn
	6m1+fCViDuy2LE7UWYzDXjWReDIII5O4HYIiRyvQv+fLmJzIDHbgLs1K3ION/O+GbunTadMOrUSKm
	SueG40xaif/FefNvHkW2gVZFyM/ROEw1na3tYncydIz1xmr3DPMq6RESk9aOMjfws9Fe5vfIj6Qhg
	SDybm+wMletzWCKb0qTQvUVwuTROKJgk9FQLBW7sqmXFEm1KhypRm2kC1GnmnDJR1x4jKnNs/4NiC
	OJHPELQEl5Ji8Cp4swlli5Rftvt77V7iaxdfY/XsrfX90q+TqKXOhyK5ladlY42o8NVTRKLVs7RSJ
	N1In8jCxEbCwbImHVDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYaSA-000jzP-AK; Thu, 07 Oct 2021 20:57:22 +0000
Received: from mout.perfora.net ([74.208.4.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYaS6-000jxf-Ht
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 20:57:20 +0000
Received: from toolbox.toradex.int ([66.171.181.186]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MguSE-1mCVEJ1KOu-00M8Ep; 
 Thu, 07 Oct 2021 22:57:07 +0200
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
Subject: [PATCH v3 0/3] ARM: prepare and add netgear gs110emx support
Date: Thu,  7 Oct 2021 22:56:56 +0200
Message-ID: <20211007205659.702842-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:wC5wm0mPAeNe1wIF4WhaqPOVApseydOu9oOLt6jiKS+6mv8Xcjv
 vmAkDwkW68k7Vbk3gZQgHRnbOeNQL/qjK1p3roYGv9AJr67tWtB+5iKDNxx/JNCdOFOJCNw
 KNicIBXyjzbT2rIjS0rDjmOsozhKl/Gow7Bs4ZdbRUYZk6Cv7iMFYy8lh2eQMFmtDTPPY0j
 5mkqqW5MGLZsGPLliAaxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gf+53WuWJkU=:43aiSZeva3r6WLZ4yE/fIl
 uQxl/QQrKnD2glPjnEfaZcUdoK+rAWbBjtry+tzoh2aTz4JjS22QXm/ep+Ax6Z/tFw8Crj4wE
 QIPXo5rRfuJ3G4fTbzF3RBk1H1/murYFfQ0Qte3lEZAd4V2B/ihERA4lsTgzgc0Akya/AnOQc
 k4XPUtSI3SFR1Ve6CGte/qz1m6h9JjeqDCOBn9TiQ7rwTMmE79MuoQA+7uUqVebM1DvypRo8V
 GsmXe1TSb13W7feDTE3OPjI5rqMz65peGXSlQqFZFA5Ue53lUJjqhuPpKIxw6WFWwprCRVAg1
 HQJuMfDWgPs2xsPetPXVucPSIFRdO6hTc8UuI9bcFg2t6L8T+hYPaA2O9zJ5DAbemQt7NrtyN
 bErCKTgbwiOWlx2363OPXysK9yhNyVnbwy0XjgitLKcUbSKx0NMuMhCG0PURE1UqE6oPHNMia
 uW9bDxdVHnPUYnKDiqTsUrrCBVUMBIFuQWVV95Z0B07hqc/X0FrRfyLPqnmpPIuo+SGoxlVp8
 B1h51hx2qnV66GgkcDHHPoGNIfGpAoFvTE7cSXVC4zZouWsoPBgX5h303Pa8TN4snGu1se6j6
 M5MMx5WyvxqlZHuNwKYF3ampb57RDFR9WdTQlXQ6hQumoOum4gowTqJ+gdl+tPQTKAibbAXs5
 6ZAa0WvyetXnjrvka8+P8UJtnFppm0uw8ea7awzDcDiTSZjum3KUi73yB9jskZrN1nhxqAvMf
 T1zLUo/sT0+/bB0C8caBl+ZKoUrw9beotwrq3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_135718_702250_80403394 
X-CRM114-Status: UNSURE (   9.23  )
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
Message-ID: <20211007205656.9A8e6yUsx_D1n7EnQIccyu5uaiwZ8Vqcr3GTZmoD1hY@z>


Cleanup mvebu_v7_defconfig and then add support for the Netgear
GS110EMX which is an 8 port Gigabit switch with two additional
Multi-Gig ports. An 88E6390X switch sits at its core connecting to two
88X3310P 10G PHYs while the control plane is handled by an 88F6811
Armada 381 SoC.

Changes in v3:
- Got rid of unused 3.3 volt regulator as suggested by Andrew.
- Got rid of partitioning comment.
- Added switch interrupt GPIO configuration.

Changes in v2:
- Add Andrew's reviewed-by tag.
- Add Andrew's reviewed-by tag.
- Send previous first patch separately to netdev mailing list as
  suggested by Andrew.
- Fix numbering of the PHY labels as suggested by Andrew.

Marcel Ziswiler (3):
  ARM: mvebu_v7_defconfig: enable mtd physmap
  ARM: mvebu_v7_defconfig: rebuild default configuration
  ARM: dts: mvebu: add device tree for netgear gs110emx switch

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/armada-381-netgear-gs110emx.dts  | 295 ++++++++++++++++++
 arch/arm/configs/mvebu_v7_defconfig           |  18 +-
 3 files changed, 304 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

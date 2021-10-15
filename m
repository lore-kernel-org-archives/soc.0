Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CC1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 06:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26FE610E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 06:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D26FE610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/kxfJeJh+TiCLmesyKljudk9WfeVprsbWLA1zvYqfLU=; b=k/JjKHRAl8TTkU
	WuKHBctdTeObhbFu2JItRbe7XGaSGu8DLc+HOfvLl93pbVIt4aHVk19TdR/SMdEf5SgU1mK3slgY7
	7eI0/6GiVoHKkcVf0Ig44hXpI6bGeGfsRpQhQQW1b11VO1Mvksd5nAP2F9lhXecRRkpmsBkxp+yQS
	HXNXThs5esOn++qdY4vhKhDIsET+ATy2+cglz/d1Rn4JqxPLOCIDHKCmTGl/7N8v3/f7+Ao9D9CoW
	a4/gZenBpnptR2X2p3EVji8YjR8mOp/xXhaOD3h9AXvDXZycAf2HbHZGohoPR05Rj/Fg5WjYQSUth
	tyj3DJNp40CbGwC+i07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbGy4-005aL8-7B; Fri, 15 Oct 2021 06:45:24 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbGxz-005aKY-W1
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 06:45:21 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 9905A80F1;
 Fri, 15 Oct 2021 06:45:48 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] GPMC changes for omaps for v5.16
Date: Fri, 15 Oct 2021 09:45:14 +0300
Message-ID: <pull-1634280279-284035@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_234520_104982_5A90EDCF 
X-CRM114-Status: UNSURE (   9.20  )
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
Message-ID: <20211015064514.Q9yk7EjuhxaJHydYzMPoGSFUoCrOiIrkPlvo4j0sCPw@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/gpmc-signed

for you to fetch changes up to 51b9e22ffd3c4c56cbb7caae9750f70e55ffa603:

  ARM: dts: omap: fix gpmc,mux-add-data type (2021-10-11 12:31:54 +0300)

----------------------------------------------------------------
Changes for omap gpmc bindings and devicetree files for v5.16

A series of changes to update the gpmc related bindings to yaml
format, and a few non-urgent dts fixes.

----------------------------------------------------------------
Roger Quadros (8):
      dt-bindings: mtd: Remove gpmc-nor.txt
      dt-bindings: net: Remove gpmc-eth.txt
      dt-bindings: memory-controllers: Introduce ti,gpmc-child
      dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
      dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
      dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
      ARM: dts: omap: Fix boolean properties gpmc,cycle2cycle-{same|diff}csen
      ARM: dts: omap: fix gpmc,mux-add-data type

 .../bindings/memory-controllers/omap-gpmc.txt      | 157 -------------
 .../bindings/memory-controllers/ti,gpmc-child.yaml | 245 +++++++++++++++++++++
 .../bindings/memory-controllers/ti,gpmc.yaml       | 172 +++++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt          | 147 -------------
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |  98 ---------
 .../devicetree/bindings/mtd/gpmc-onenand.txt       |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml      | 121 ++++++++++
 .../devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |  81 +++++++
 Documentation/devicetree/bindings/net/gpmc-eth.txt |  97 --------
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi          |   4 +-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi          |   2 +-
 arch/arm/boot/dts/omap-zoom-common.dtsi            |   4 +-
 arch/arm/boot/dts/omap2430-sdp.dts                 |   4 +-
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi     |   4 +-
 arch/arm/boot/dts/omap3-overo-tobiduo-common.dtsi  |   2 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi                |   4 +-
 16 files changed, 631 insertions(+), 559 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D687C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 07:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A29460F11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 07:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A29460F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5vh58UQbsnFEQ9bdQVVxmDRZcG4oOFQ6rSqoPj1a1dg=; b=Qd5w+PFP+da5IX
	JXMU5kUF1aQUzOG+Vq7ZYjWpziDiCAAvlHZ+d3O9a4KM2E18I6ojH1gMeBTO58g7npAKll/qUwu+R
	D5PuNs/Vfo7uQv5bMJNo5D8YqhcOpSAPmOTaglAWowhnsD+CaN7xlPcD+V33yNrFNFUfsC5aroL5g
	ffBvYNF2KamceZhUhiGWCxDpWS6+f+qsSr2Ykz7ecl/oYOTWpKxXjQRcYSuxfR9jUlQxYdW6qZ0Yk
	xkWjTRUa4GyC9qaGHPRqTaKL0sV8f/Br86XE9NkdGWc6rbAc988zkNVdu6SfpuKSBHCsyyW6FHHy+
	XU6PyLCE1e8r5VlJkzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtwj-001R3p-Kj; Tue, 17 Aug 2021 07:55:41 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFttH-001PbL-O5
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 07:52:11 +0000
Received: by mail-qt1-x836.google.com with SMTP id b1so16479368qtx.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 17 Aug 2021 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
 b=WTQvyBhSFaH0kQ9XuClZSoEzRDenz7OtNePSY1feYXSOiMhWE2Gux6tItSCNdsIqlb
 RRt5k3y2zkMKlOUbnPvL9JrtNG9D3vFfcYPrV/eEONn3dLgoHQlO2Y+XKZn3Tkyuk00n
 ADBEO8LK3V4w39Slu2yfTdkl+di5UEF26Uauw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sYsUG/NPZIBujIh9hacdzMbIEijzFzCoj/G7iIt4alA=;
 b=TcYpwb04Buu64gofv8NFkjkXpomdstUatuafsVA2f5CkfwjCAYZxJtWkb/MY5gWZO9
 rbc5gSeQHl0zPUZOFr4mBFe+B/Hz9u3t08lh0GhVtjVtIpqoNbWx53CbHtVCj37du6Jp
 +g6BrRDto25tdxrRw8z3Z3K+GYZt2X+1gVFQvOJjOSN9NL9lrOag0uq957V0BYJdNmxy
 Y7ztYerw+6XkUXM6juUt3VeZT8j6/5+nb8lBTDdRmWHsoYrLxztcUQGKE2jLILsVaJG+
 LeEaorrHoeLIkACLj5PSVUkY6H8AlDEJFNUf5DOAVH0NhA2uzt5oMkDcxAifKyhqOb1D
 Kn+w==
X-Gm-Message-State: AOAM530wVJH63eGlxWgiivvo3dJ0hnkf0t6zzRcQcIbGSFOI2lhKjiws
 dmwfYHbCKGicgivo7LhLrolAUKiw510ECdGnXhg=
X-Google-Smtp-Source: ABdhPJw8feCldLj7Vhc6iKE3JJaHj+my9WkV2PsvQhwYUggdZ9tUjdGKV0GGDotySpd7kIReJnHO1FO9/bXwb6aGkEY=
X-Received: by 2002:ac8:5bcc:: with SMTP id b12mr1879604qtb.176.1629186725533; 
 Tue, 17 Aug 2021 00:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 07:51:54 +0000
Message-ID: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_005208_109522_327B5DFA 
X-CRM114-Status: GOOD (  13.57  )
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
Message-ID: <20210817075154.HZI1d4yY4bUwctcivUCofmqGrEbQCMTAe6oRs0rw3GI@z>

Hello Soc maintainers,

Here are the aspeed changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-devicetree

for you to fetch changes up to 6b8b31269898b8891f1f3a95578ceeb109393e23:

  ARM: dts: aspeed: p10bmc: Add power control pins (2021-08-17 13:52:46 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines

  * Facebook's Cloudripper
  * Facebook's Elbert
  * Facebook's Fuji

  All three carry the description of "Facebook's next generation switch
  platform with an AST2600 BMC integrated for health monitoring
  purpose."

  They share a 128 MB SPI NOR flash layout that is also used by some
  older platforms.

  * Inspur's NF5280M6, an x86 platform server with an AST2500-based BMC

 - SGPIO updates including AST2600 support

 - GPIO descriptions for the IBM AST2600 machines

 - Pinctrl fix

 - Updates to Facebook's AST2500 based machines

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: everest: Add phase corrections for eMMC

Dylan Hung (1):
      ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi

Jim Wright (1):
      ARM: dts: aspeed: p10bmc: Add power control pins

Joel Stanley (3):
      ARM: dts: rainier, everest: Add TPM reset GPIO
      ARM: dts: aspeed: tacoma: Add TPM reset GPIO
      ARM: dts: aspeed: ast2500evb: Enable built in RTC

Ping Guo (1):
      ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine

Steven Lee (4):
      dt-bindings: aspeed-sgpio: Convert txt bindings to yaml.
      dt-bindings: aspeed-sgpio: Add ast2600 sgpio
      ARM: dts: aspeed-g6: Add SGPIO node.
      ARM: dts: aspeed-g5: Remove ngpios from sgpio node.

Tao Ren (12):
      ARM: dts: aspeed: Enable ADC in Facebook AST2400 common dtsi
      ARM: dts: aspeed: wedge40: Remove redundant ADC device
      ARM: dts: aspeed: galaxy100: Remove redundant ADC device
      ARM: dts: aspeed: wedge100: Enable ADC channels
      ARM: dts: Add Facebook BMC 128MB flash layout
      ARM: dts: aspeed: wedge400: Use common flash layout
      ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
      ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
      ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
      ARM: dts: aspeed: minipack: Update flash partition table
      ARM: dts: aspeed: cloudripper: Add comments for "mdio1"

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   77 ++
 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   46 -
 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    4 +
 .../boot/dts/aspeed-bmc-facebook-cloudripper.dts   |  544 +++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts     | 1251 ++++++++++++++++++++
 .../arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts |    8 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts |    5 +
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts  |    4 -
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       |    4 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts   |  691 +++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 -
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |    4 +-
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   28 +
 .../boot/dts/ast2400-facebook-netbmc-common.dtsi   |    4 +
 .../boot/dts/ast2600-facebook-netbmc-common.dtsi   |  169 +++
 .../boot/dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 22 files changed, 3033 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsilin

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

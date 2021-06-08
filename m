Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2138FC47094
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 02:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B8D61208
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 02:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B8D61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dtXnFhCXJg/b4mFbf/Ukg7lXe/nC5hoSBwsp1zMwA0s=; b=FuyoyQHKtPEomc
	EKZv5dZEq7J2rz/eQpNuy3aTLQnARQTYTHo2kvK2SuLnoUH0RkjPbh8R2mfzB5g/b5XO5GeCJfiFM
	ItrSkA62cvZfIsF9b4vyCEmsSvWTsLPb4fbcQeN67XyJCA2q4fC49OxCokEKOZD/jR8DmmKPawJXo
	Cnf3/Anc28jwF0FmQUZJZGOIGTGS9dd5lj53eeCylVqnJoZoTWtJbyhBWDST/+74syQ0VqHP5pxXs
	YiRRH8MhjoUaSREId45mjK1aGSsx+RH+eH8n9u/tsxpKcXb2GFEOwHQvstwh/AbAxIg5lkElVYSDa
	yfxLkY9yeJBsUbk4jfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqRXn-0062oR-6O; Tue, 08 Jun 2021 02:32:44 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqRXd-0062l5-Ie
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Jun 2021 02:32:37 +0000
Received: by mail-qv1-f45.google.com with SMTP id t6so4161981qvp.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Jun 2021 19:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
 b=dqdPDJkDCuEZ1Ah4vxQrDsiTr1jeFn6P/47b9G4+fG+MLusPHgEkYcvdJv+Hy86dEu
 CSopIaCtJPCXLk0V8I/Z1KHKez+5U9UW5zhc9Xfdmpb0+Zj0jYe7qsMcDKVSbBMYeT5U
 0Jhzg+CKm3wSGZDmC56mF8Ci2uDqS/oPXXEuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X8PuT0wByoowhTlCtWl1lnUG0e3GVawCK0aUaYszsuo=;
 b=MXw52X+oKh9to5wfLi4s0WAD3nzxX1yT4H6kSpKBf9snvMyk61hB4W0b6bv08DDRqZ
 mDROjqglh5biNNeFPuCZhcT+6GxaCucUh83uDgvA9eKIAvdjhU76WdK3XOE1Nu3hxJ84
 C8hyi8+XA/h/+a/Exkez/UFFjxfHSMBbyAvufQ0aHUUbJDzwNUKEOA3Z713EeK61mG7A
 atdp9N8F9yEd2zwfh49EWALGqqJv4TRi8yUnus/a5vr46m58eGUzGjaJHU7uLy11TO5l
 V0wmLuMikhtUZqk6W/hG20uvEjlsVJe2JuTJ2Vj4fTDndGZtponTCgRMC7sLAYnXAIKa
 8Ibg==
X-Gm-Message-State: AOAM531aLDtwlYS6FSVSiaXN2x3iiSu1T3EUCK1UQeP3yqjEnguooTFg
 axOExgY+8EUj/J7q+0h3Pm8a+TgSBRgS0ckPt80=
X-Google-Smtp-Source: ABdhPJzhXY/SJseg0VPNHlw2tkO3JkY6p7RIGqOsi5vobBUn+f6MbbHLg2B78ZJxHCzP4QGFMNWGkgF2DhTAh+9rrsE=
X-Received: by 2002:ad4:4513:: with SMTP id k19mr5251381qvu.10.1623119491048; 
 Mon, 07 Jun 2021 19:31:31 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jun 2021 02:31:19 +0000
Message-ID: <CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Andrew Jeffery <andrewrjeffery@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_193233_717651_45D85AB3 
X-CRM114-Status: GOOD (  12.40  )
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
Message-ID: <20210608023119.jeNL8pm9hbXVjMTg-g5PkV0C4PLvgKCVah76S5Dw8Lw@z>

Hello Soc maintainers,

A normal looking Aspeed pull request for the next merge window.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.14-devicetree

for you to fetch changes up to dd87684c7c9b82ad450cf063c58b4131074ad8f2:

  ARM: dts: aspeed: everest: Add pcie cable card indicator leds
(2021-06-07 13:38:55 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 5.14

 - IBM Rainier and Everest LED descriptions. These systems have a large
   number of LEDs attached via expanders.

 - Ampere Mt Jade updates, as OpenBMC bringup continues for this
   machine.

 - Updated 64MB flash layout for systems using OpenBMC on NOR root file
   systems.

 - Support for HS200 MMC on AST2600 EVB. This is only supported from A2,
   so a new device tree is added to support A0 and A1.

 - Update all command lines for early serial output.

----------------------------------------------------------------
Eddie James (1):
      ARM: dts: aspeed: Rainier 4U: Remove fan updates

Joel Stanley (2):
      ARM: dts: aspeed: Set earlycon boot argument
      ARM: dts: aspeed-g5: Add SCU phandle to GFX node

Quan Nguyen (3):
      ARM: dts: aspeed: mtjade: Enable OCP card support via NC-SI
      ARM: dts: aspeed: mtjade: Add PSU support
      ARM: dts: aspeed: mtjade: switch to 64MB flash layout

Santosh Puranik (1):
      ARM: dts: aspeed: Everest: Fix cable card PCA chips

Steven Lee (4):
      ARM: dts: aspeed: ast2600evb: Add sdhci node and gpio regulator
for A2 evb.
      ARM: dts: aspeed: ast2600evb: Add phase correction for emmc controller.
      ARM: dts: aspeed: ast2600evb: Add dts file for A1 and A0
      ARM: dts: aspeed-g6: Add pinctrl settings

Troy Lee (1):
      ARM: dts: aspeed: Grow u-boot partition 64MiB OpenBMC flash layout

Vishwanatha Subbanna (7):
      ARM: dts: aspeed: Everest: Add directly controlled LEDs
      ARM: dts: aspeed: everest: Add system level indicator leds
      ARM: dts: aspeed: everest: Add nvme and fan indicator leds
      ARM: dts: aspeed: everest: Add pcie slot indicator leds
      ARM: dts: aspeed: everest: Add dimm indicator leds
      ARM: dts: aspeed: everest: Add vrm and other indicator leds
      ARM: dts: aspeed: everest: Add pcie cable card indicator leds

 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |    2 +-
 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts        |   15 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts           |  119 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     |   59 +-
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    |    2 +-
 .../dts/aspeed-bmc-arm-stardragon4800-rep2.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      |    2 +-
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 2060 ++++++++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   30 -
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts     |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |    2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |    2 +-
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  |    2 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |    2 +-
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts |    2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    1 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |   10 +
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi     |   18 +-
 37 files changed, 2116 insertions(+), 253 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb-a1.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

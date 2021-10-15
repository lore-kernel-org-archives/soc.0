Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB84C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 04:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C680610D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 04:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C680610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rc0xuh3YtSEufgVBOl5l1fF45ndqPqdkKmGKKrOt/jo=; b=scE+y6yBCt1uz6
	1qTjnVKcMYAdWcmK+GBjSPpEXHEhfF46E/kFXEfUG+Jgbxd+IKgzJ5JPBzk1Z5fclLB8e6weT7ie2
	JyoWlQkh8MF20phiUvCEL9ef2I8WIg4iMpmgaJH8Hv4ldSs7JjKRMnm/PoKado12HkStllxVevjTy
	bAlsAYQ04o+9hq3jWi/ZubLKOMfIIjJmKFU9Efta3Z0q61Eelgo7E7swwy+7CXnOC0ubXqvUaDR6V
	YTiNraCOdzySjN6cJ9EJdiMzvLUxT5fx41j71kEiRgrZGEzQ/tALu/Tdyc4O+e2wDzSSXr7XMpZwe
	v9bT60G2yhqc8cLXiT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbEPn-005Mm2-Av; Fri, 15 Oct 2021 04:01:51 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbEPj-005MlB-Gi
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 04:01:49 +0000
Received: by mail-qt1-x831.google.com with SMTP id y11so7686621qtn.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 14 Oct 2021 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
 b=gIXasXOqP3ZyNyTBXLwyCySfZifxVIYOiEQJmV+nxk/PHLSxGrhrIGcgesEMSwYtbw
 rzulIvfb37aOBwzkHvO/2jsQxTxGQCaJN3hoFAMCgszHfdGgpZNds6+SChBW9PRQorza
 /pZ8u0n1z1AHojts8kU0xMlPWIGuBgf7+oBjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ECBOEkwsFwUl/LQLvdaX8K1iYZNdAdzVqfvemry/2Js=;
 b=fmQKllr7dp4/UvMfH5fsHROOFdV+cB00ZvEqGNI6We5LwsAKurycqYB8WGxjhljq+W
 RpK1wFT7ergVd/ZFJxtNG8KSdJTJF0C8phHdyIWEEUqBHx82/tEf4ugaeLjOfuLzvl0k
 EQA3jDzfBAUN0qR4HE/MZG58EjAtmYZ6+yCmtx41Vl7S329lWKFn3eZfC839QF/us2B5
 C1m9SKSiucbhW2P36keDAxVa1Rxx8j/tpNcDytP3eLeHZ0kpfTWTO7JEZVCsCEVeww5G
 3COHD54odmxl1Kw9KeMs7EpDZFJ6/ELh8W+h/wCbNmBg4R7rkYl04TWILgIoKRl7smgq
 srkA==
X-Gm-Message-State: AOAM533zZ/NNPHCBOfIXlL7UpTy4YeSckFZ1FJQp/gg8bn+7odbVLeMU
 MLGWsUIuWFitz/UwFtHjR74hhsQMnSJls9LgdPI=
X-Google-Smtp-Source: ABdhPJz5ihCwKgESTZKbaaX82wih0wrKU9fUlqSYcBkxd2H4K+BVYtLy0hdfzMJuRZWu1v78+2JJaDVjGuxV09hydak=
X-Received: by 2002:a05:622a:1451:: with SMTP id
 v17mr11094292qtx.25.1634270501310; 
 Thu, 14 Oct 2021 21:01:41 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Oct 2021 04:01:30 +0000
Message-ID: <CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrewrjeffery@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_210147_806407_645224FB 
X-CRM114-Status: GOOD (  11.08  )
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
Message-ID: <20211015040130.3u3VU8oFQFgpRrZJQ080-FHNeYIEeoeUSLcNuIqDwbg@z>

Hello Soc maintainers,

Here are the aspeed device tree changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-devicetree

for you to fetch changes up to 4eb7fe3333a021c8d0f35bcb5cd7c4e42800df62:

  ARM: dts: aspeed: fp5280g2: Use the 64M layout (2021-10-14 18:25:17 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.15

 - New machines:

  * TYAN S7106 BMC, a x86 server from about four years ago

 - Descriptions for the AST2600 ADC, which now has an upstream driver

 - Lots of GPIO line names. The OpenBMC project has adopted a scheme for
   naming the lines, and new additions will follow this guide

 - New I2C devices for Rainier, Everest, EthanolX, Mt Jade

 - Fixes for fp5280g2 which has seen some recent development, including
   the addtion of a QEmu machine for testing

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: dts: aspeed: rainier: Add power-config-full-load gpio

Ben Tyner (3):
      ARM: dts: rainier: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line Q2
      ARM: dts: everest: Define name for gpio line B6

Eddie James (3):
      ARM: dts: aspeed: rainier: Add system LEDs
      ARM: dts: aspeed: everest: Add I2C bus 15 muxes
      ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Everest

George Liu (1):
      ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding

Isaac Kurth (1):
      ARM: dts: everest: Add 'factory-reset-toggle' as GPIOF6

Joel Stanley (1):
      ARM: dts: aspeed: p10bmc: Define secure boot gpio

John Wang (1):
      ARM: dts: aspeed: fp5280g2: Use the 64M layout

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Add FRU EEPROM

Oskar Senft (1):
      ARM: dts: aspeed: Add TYAN S7106 BMC machine

Quan Nguyen (1):
      ARM: dts: aspeed: mtjade: Add some gpios

 arch/arm/boot/dts/Makefile                       |    3 +-
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts    |    5 +
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts   |   21 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts     |  182 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts     | 1571 +++++++++++++++++++---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts |    9 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts      |  488 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi                 |   20 +
 8 files changed, 2075 insertions(+), 224 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

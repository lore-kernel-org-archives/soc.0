Return-Path: <SRS0=0nsL=JR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C974C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 07:16:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7BC61154
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Apr 2021 07:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7BC61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/fx1pwBWgp669I/lQf7rJ82WDgGr371C1k9qx3MB08=; b=A791rcqRiZiEFED+d9grbiNj3y
	lgOxg/G9OoiB7FPgJpBf8jA0UnQlJdnAQQbFgAtxqUy8hHvZPCsPRLImfqxrolPfOVVFYWlTh/lhR
	6aHX5GbvhF1bqxI8+BHHOKrmR0JaoF7BYRvrCqhFKiNq7rBHVJ9cIENbHVI0YS4w6cNNKsUEw4Oe4
	IUs4BHiC7DjMJBy9Yyjr9WnJXkgqbPtxvpICUVF8Fv5jatYdXqupNzuQWwtFMkGN5zP6kwMu//ASH
	t6u8b31m9RCkybwcj4aMOmgkSKnH+ibLX2eNc4NFwNTx1UMsNF0wa7yYvzq7OOD9lw/Xop1ax2KPa
	9V+60poQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYkab-00BQOZ-9k; Tue, 20 Apr 2021 07:14:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkaY-00BQOE-5u
 for linux-arm-kernel@desiato.infradead.org; Tue, 20 Apr 2021 07:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=; b=DBLAzZEdGxHtWIHTCSIwnquPs1
 jbPO67l3ztHtimebOEU0dqxKlDVgawjVoP4DptE8V39F4LUwjVlzcBDGocjZFEvLaarOM8UxViUvV
 vjftlpGz2ZsuIN1D/dx7ik+ZAa9Rwvv1DVQKc5+9fBvilqNdxWxPMV0h9UtsY0CD/S7oOukmiCA36
 2nuMlWGMBJF8AAVpsq1vMesCMgPhcdqD1YDV9UKX9C5mTx9/LSohyxteYjETp2LiWfRVqHTemdCdj
 cxfkRkHxvuRSTcyraqSeO4G9l48nOZNQe/ezmnYn8cOHwxh7IQGFyhW1Zenzqq7m9+yjo1YE2GrZD
 D/yMj8rA==;
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYkaS-00Bs1x-RZ
 for linux-arm-kernel@lists.infradead.org; Tue, 20 Apr 2021 07:14:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id ef17so12467977qvb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 20 Apr 2021 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
 b=epN9bBJkCDeaCFZK4qljnKoh/ZCer6Rl808fLEaqfAI61COv6SK8+5txip0nKWOV2T
 8YivqJwZJji6p5MTPqJcsIxSzaIMmefZbS36FWMBs4iDJ9zVmLm7d0VaONZU01tSTrH8
 KXFE/4cldW0e4ppsjxfhrGpVyFeb/Q6Kk5b9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Q0PEKAL00lh2HdvWmuae23ebc0u44/mLh1vdqQvcbYA=;
 b=lZzO6Ofes9uQaiomGbOOds4tgad1XBTPxSz/nwGbyfeq3z7RUUS+RfTyexjYTomhry
 +rOgLDqVTKfZiO0v06/W0sFMoslr4HHilI8erhmKaVoiaWeQXoQryFGdMVz7KHWrfwuh
 X3jhIJf0lqJFbqk1KVN3FG7OCeH6LN8vEm67qD3qd9kog9HPkDmMiNdW9atZd4xsXJP2
 NkJqQk3y96DSxrnkXKLXbQSYeTiUWxTz3K5BQk2V6wwvrafxf9ruCc6u98+gxkyFS6ug
 q3ih+uuvSQugk5Nw16Jp1LnURP7XpXfb/cmpMtItK7EfgbEot+wrm7BbQDugfQYvGei8
 UJFA==
X-Gm-Message-State: AOAM532ZjSX06tyW7EUnda6OwYIM6kCJeTR+KyR04C4TK72Ehe8CCyiq
 5PLy7vL4FVdI89Pj7T5jEqOgJfKzq1UpAikEmdk=
X-Google-Smtp-Source: ABdhPJzifDtmp1KOcVZM5c1KCJUCPffdbs83Eym8asAMyev9EXi87+eBIcYJ56aJG0CRxMAUN9hKeYSoXSxnjqXJPt0=
X-Received: by 2002:a0c:e950:: with SMTP id n16mr25332659qvo.43.1618902858747; 
 Tue, 20 Apr 2021 00:14:18 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:14:07 +0000
Message-ID: <CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com>
Subject: [RESEND GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_001420_910617_D4819C76 
X-CRM114-Status: UNSURE (   9.44  )
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
Message-ID: <20210420071407.pktXQq4k7syYLKT8k-sUvkc_CNChZmJfphPPfASEAaw@z>

Hello Arnd,

Here we go! The second try at a second set of changes for v5.13. I
think I've sorted out the gremlins, thank you for your patience.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller

 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts      |  30 ++
 .../arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts |   5 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 306 +++++++++++----------
 4 files changed, 201 insertions(+), 142 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

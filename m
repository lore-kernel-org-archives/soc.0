Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39DDC4708F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 11:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9760E61287
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 11:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9760E61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G6InxyJIQh0R18MtRb3snvMo7KW70noClNQW2A7jN7I=; b=m/qL0AcJGtnP27
	gPA9/0WD+fvOWSrdIWLnZwWmG/iWehMIRRb3rT52+7bRIc2QzEJCK6833kCF2xKy9ZjE+o75Xaft0
	31oEyP8sqoK6fRAL9NfoFSl/7q+EyQIcmIEkZLfdGhD6z1HedpHRtSXei0BratXwYO8hsojv70xI5
	q8JBXV4cfMPcYiLU9nGcaL52Y23rcV9P/DYAqDGhHQNJG6YNav4SjHCaj+Jh8YwmQREyDjR6iGzXL
	NQNJpuP87MjlZXeH1XUnCrbexhsnbSZEo4gDgQ6gGryElw0Fa2sTY5vVkAMA3R9VBbZbygK7Ku+cg
	ej29afMdiQAOOYF1Anlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo2iq-00GDYB-7I; Tue, 01 Jun 2021 11:38:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo2il-00GDWD-Uc
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Jun 2021 11:38:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id s25so18716645ljo.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Jun 2021 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yRcMVunyo933FsJtW1JBN3016xuLkbBPp3vmdlU2ybA=;
 b=Smxc3ZShYoaRgG6i8oM38E4C2V7TbTmdSHeGMh8jRLPqGqXdUDjDoSwYWZdBK7KJT/
 u4oLT4er/9HLTQTBuFWdi9KPWH/5jvBIBojLiY95jzQRxZKBAh9OYxljNUDJkvtZv+oB
 gVarVMXkggXPrwMBqkFHsjDOj4FDq6ReRwaluwRIUAD0rU4obDhE3YjcWFrq0kjq+n8K
 w1I0hQTzCLLd0db6Xve1LyHak8huNughrA/kfkZa+a+RtnI8erxAYrGFbBTk1Kqib7Q+
 gykVXsBDXh+Y6wGXvuhoEpx9xK/f6ke01sIB2v64phEkgZanD0TYX5cl7gcqkhcGXHaP
 WoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yRcMVunyo933FsJtW1JBN3016xuLkbBPp3vmdlU2ybA=;
 b=Aa2abFJFbK5Qx407Z5luZHvFOMVOX5itmZ1msP+Jt/wGjFTueopOmyFLkGFLs8sIll
 GAlhTa/lC2xUFBfZsdXzSIYcZltLbqnvjEm8s3pRIf15S+yLiAqcMaHa0udxkFx8R23y
 jlrCcbni1pt8y6udd3cXOLbnWlwJ5YAFsQ5PLc/ijjnrNCd42nLE8LRr21ebKSS3gPjn
 LRqa+tsBZ2GBklo0/aw5Vh0cmA99El9xUwqVvL7hC40iiL+Zw+zv3Q8Ia1NCvYMgCf5W
 ihLKIECyUN9JgfZSZnTGlgqAgsR1azwcpeysKuS4XrF1WudXsZjaiCa/O9jBjiv/NIzL
 PcGg==
X-Gm-Message-State: AOAM532QtDjr2zpdzNFd6Hu6bndqvP5fvG5doKgyUSBjhebkgdMRUaPj
 8Dv/JG9pP1NfrkRtYs6N4ua2UppW1AyZ5drOZoMViQ==
X-Google-Smtp-Source: ABdhPJykCbPYjM0GTBMeUtAxmGTRVUlYqHEzVDb4GqY/v94XbmV5Z/2M/kaj55Maq292hDm5OPO37OxhBmeJwPxHSgU=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr21028842lji.326.1622547485151; 
 Tue, 01 Jun 2021 04:38:05 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 13:37:54 +0200
Message-ID: <CACRpkdbmRjGW7vpr7hG+jiRTqNMZAyKZNhtvzj=SqhZmb1+F6A@mail.gmail.com>
Subject: [GIT PULL] ixp4xx DTS changes for v5.14 take 1
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Corentin Labbe <clabbe@baylibre.com>, Zoltan HERPAI <wigyori@uid0.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_043808_008369_A639D173 
X-CRM114-Status: GOOD (  11.57  )
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
Message-ID: <20210601113754.Uy8jDIPJbTYmoxL94IgtlluR2wVUTh36tRw2nIF8sHk@z>

Hi SoC maintainers,

this is a stack of IXP4xx DTS changes for v5.14, adding
PCI and ethernet and some other changes.

The PCI bindings have been reviewed by Rob Herring
and are pending merge through the PCI tree.

We have more going on, like crypto accelerator and
hw_random, but we need more review on that before
we merge those changes. A second pull request may
arrive before the merge window, but let's start with
this.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-v5.14-1

for you to fetch changes up to e33f8fd9fda9730f5a0f27d1a56c69e1228ed907:

  ARM: dts: Fix up the IXP4xx ethernet nodes (2021-05-21 21:29:07 +0200)

----------------------------------------------------------------
IXP4xx DTS updates for the v5.14 kernel:
- Add ethernet to the boards
- Add PCI hosts to the boards
- Create an expansion bus around the flash memory
- Add the beeper to NSLU2 completing the NSLU2 DTS

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ixp4xx: Add ethernet
      ARM: dts: ixp4xx: Add PCI hosts
      ARM: dts: ixp4xx: Create a proper expansion bus
      ARM: dts: ixp4xx: Add beeper to the NSLU2
      ARM: dts: Fix up the IXP4xx ethernet nodes

 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts   |  79 +++++++++++++---
 arch/arm/boot/dts/intel-ixp42x.dtsi                |   4 +
 .../arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts | 104 ++++++++++++++++++---
 arch/arm/boot/dts/intel-ixp43x.dtsi                |   4 +
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi         |  33 +++++++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |  84 ++++++++++++++++-
 6 files changed, 280 insertions(+), 28 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

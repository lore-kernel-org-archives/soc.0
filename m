Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF46C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:51:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC40B610C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC40B610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7SnWCsr5UPZr9aZS9HbZrQUkac4gzUSV0c5sBxrbphg=; b=DT7xowM3KPFau26FNDmwIYl0Pg
	wkRtsGs/lTQ+eL0qh7mDjG7eEDRokJbq/nki7vzRl/lBZxIKp5XtuFb1+Qzol6PrVuuXmeyR2/AIC
	tU+1wvbF4B0thRccKz4kez7pOzK01qIwPAF1LJmmCy8BD7et4zyFrzg9lPcchNGsIAkQWOdLEunOQ
	d0A9foQbgO/LzydRxvFjQB9Y5xWQrSQnkwWeVrLl5vVsxKqBuLHFRi0kl5GPFX0hndoF2ppB7lqCm
	BfsTldTN3RQeULfus+SCoMU6cMr1oXR++/kL2m7LY9ldh87oHkFb0g23sxaxlxwaXkzyF8svnPhnH
	gpVAiALw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUkxb-00AK82-EQ; Fri, 09 Apr 2021 06:49:49 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUkeb-00AJ2j-KJ
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 06:30:23 +0000
Received: by mail-qk1-x730.google.com with SMTP id 7so4843108qka.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 23:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
 b=PXJMuB/sRtry0TFRSRVSvL9b1Obex34q0EYuMI0KevjzaahGxSYOdPJj3p7uQMktf/
 SmDk9QgSUPq+OoXavw9h2kYvWLge9VXenmNjZbO+kUFE75AhlFQGG35rCT128ILSFQJa
 hfO1qs7pyU+lY9CFAMh9YRXev0ZMrHy0InAZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=t6sfaiKhpJzm6PSIf/ddHU0ldz4ZXvQKkmw7oDKOIyg=;
 b=t2nAYKCHxNqIZLBbr3zWPeVp8CiJ9bqXbX0Svmc7fo87sXKS3a/cQl7wKwzTaGN4It
 lqarDU2n4y5KJ/3FjnK6ywXPt6m7kWCkQ7z2Nx5eVh3i+fuO1kmJLE2eYjbVCFOQQfx/
 BdAWt55E+MwhTrPdWLM3tTwi1Ytf5ZFRA5arqMJdz9E4+y32zr/yGbeQnmo3zduVHUA9
 R7v8QhZvyBsZEDhPs8iN/4VFHTRk4pz2aEuiY2dE3DfK6Hc6RSWNH9bed275kjokp0GQ
 5C/Ax/7dDkTc0aIYlUbWT9chZY3SVrz3HM2THf2w/MuHq5ljvLANYtELDtX0ER/huSf8
 HN0g==
X-Gm-Message-State: AOAM533j86ET3GZE2s8duTLud1VWJyrXOOOn+5D/zENB8n6ha5XvRvO/
 lLs5OP7ShdW/zihpu7oFDHGupTVBoJ7GmeldxH8=
X-Google-Smtp-Source: ABdhPJxgu3cBHKkUKgRIxfjzhkmIIhaArUkzZ7ELQ+REDApTFFkya83HBLiA9F2iqAllfdJfMfC0rTiuwzYTrj86UsY=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12472020qki.487.1617949804254; 
 Thu, 08 Apr 2021 23:30:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:29:52 +0000
Message-ID: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: lpc changes for 5.13
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_073022_045076_F8F71285 
X-CRM114-Status: GOOD (  10.06  )
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
Message-ID: <20210409062952.9Xkzkfa2s_qoEpjryVpxj0EJ_-j-txzvln_CrGT1jVg@z>

Hello Soc maintainers,

This is a pull request containing a slightly messy device tree and
associated driver changes for the ASPEED systems. It corrects some
design decisions made when first mainlining support for the BMC
devices on the LPC bus that have stopped us from being able to write
drivers for eg. KCS.

Andrew has worked with Chai-Wei from ASPEED on this process. These set
of changes have acks from the maintainers, and allow Andrew to go
ahead with fixing the KCS drivers in the future. The branch should
apply with no conflicts no matter which order it is merged.

If you would like to handle this another way then let me know.

The following changes since commit 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.13-lpc

for you to fetch changes up to 489774ff5db943642751f4f0fdac9033239208c6:

  soc: aspeed: Adapt to new LPC device tree layout (2021-04-09 13:39:22 +0930)

----------------------------------------------------------------
ASPEED LPC updates for 5.13

These patches fix the ASPEED LPC bindings and LPC-related device drivers
so in the future the KCS driver can properly use the hardware.

----------------------------------------------------------------
Chia-Wei, Wang (5):
      dt-bindings: aspeed-lpc: Remove LPC partitioning
      ARM: dts: Remove LPC BMC and Host partitions
      ipmi: kcs: aspeed: Adapt to new LPC DTS layout
      pinctrl: aspeed-g5: Adapt to new LPC device tree layout
      soc: aspeed: Adapt to new LPC device tree layout

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

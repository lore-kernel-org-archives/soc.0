Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8504C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A430320691
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A430320691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=azONQue57Kz2VKlCwT+6n8LzNLs4g3/fwmpUPM5bg9c=; b=x09WFxBw5e/q4+0VtYszAoDHi
	SyuGgysVY/4h66zldYu/u13zEPuUxg2d1cn8JPQkLokT48R6vabViHjkZLCB4kACLEu4dRi6bx1z/
	3by7wddbmHfp9BgeMbsT552+H9NOBbhytrs302fC9gSG8qI243nadethrnhKjpi4QIfw6dW7ydHju
	FUT2+c6et+mhmqj5RSY8hsLScKYIVCT/vLOTPhfskXCQpFe1JHQ41vrcyotchU4wyK6axR/M0z/oZ
	Nb2TxEAkCYBYsWP1SVLDHL17kSGat/chesKoxUL9BmY1H8Ry/fR1e4P2sa6mshzEAxazWU8G8vHKp
	JC1L/nHuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SrD-0005nd-I9; Fri, 15 Jan 2021 17:25:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SqC-0005SL-W7
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:24:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A33BB23877;
 Fri, 15 Jan 2021 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731491;
 bh=1b62CfmuOHWLq8meTgGv+ji63sjNsNopr3xpQCEBj5Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n4HGgspm72ZsliyG91UExiAbksjoZeCcpIAZ3WQv3rEnplSZAQMMcsRL9/n1WCwNk
 noRe3xjQwDGhjf78H9QwFwwTxudbG9FGNVab4rxd0vTzPRKo9EUasp7g1EQBPrxJot
 3HAwLyU53XRyvfuUDg7yem+iNAN51TitDZVyZyKOWUkUc0QXPzcUDkn2eVHzH4mQhW
 vSK6vLhiHLK5IfLjpN0QLc+583HPD1FO1jZIHiWOh9WIYbiOUR46mgl9rRSNYhc/mg
 qXplRRjw7qSz0F5sMBzQk92R0lYYpge9kkAiQ/ab3I5so5BOlwL8a5rCfgaSTLzoyc
 lYd90qtlTzd/g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, soc@kernel.org
Subject: Re: [GIT PULL] berlin dts64 changes for 5.11
Date: Fri, 15 Jan 2021 18:24:40 +0100
Message-ID: <161073140360.707311.14001450832858422143.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100235.2b0b795b@xhacker.debian>
References: <20201211100235.2b0b795b@xhacker.debian>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122453_179383_3BEB818B 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172440.u0qNkleYpxkTEs7WmaVTLr8DtP_YK49U3tf1cLJ21Ns@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 11 Dec 2020 10:02:35 +0800, Jisheng Zhang wrote:
> pull pull the following patches to your tree.
> 
> Thanks.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

These two came a little late for the merge window and did not seem
urgent enough for the bugfix branch.

Merged into arm/dt, thanks!

merge commit: 35d09d1ad45160101733f116d1283907d8a28ee2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

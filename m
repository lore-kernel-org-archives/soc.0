Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC65C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25ECC6125F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25ECC6125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4DfMEKebUMAq5wCHnJgRdSFkNqLCwQ9W9LSQEjif3w=; b=h/Novoh0tJ1Tpz
	BbwJ2QqnIpsGYP51xoaGGR2DqrfYI+SxgS35jbCdDAr+6JCsOO7BB+q9M4TCi2Gw/q2zRvhETwAvf
	RYGU1I/aIp0SW/MYMLOCxeSGvZ0+vYxZWYRtldxu3LSB6UiZznpF9c0WgIRUMhIrjVNx5K1CtYimV
	23yoKtOfvbqWy8X0yJz50giNAfGn/OHm3cbh63hsLTLSKy3Sp9bDILe0aqnbLUezpnbUEpXm2fsGP
	2vV0YxJZhgWUbd+Bh73alaGhSlTdDVMtZFY5BCD/BKLfTiKuWV7Wij+z2ERMsFrjF0L9BwiweEgQG
	LjawpCpsQIhNvE7+yPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQNf-0079IY-Iw; Thu, 04 Nov 2021 00:13:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQN6-0079CC-LD
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 00:12:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D1D6611EE;
 Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635984767;
 bh=z+N47r+LBFBJXvKtn9imcJQr8bFCHHZu94SoTLgODSk=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=FabuyV49sRotAQxDtF5uSj9jT8M/5qQP/K/CMKIwhneCql5yJYm3A5Vb2T4F5322Z
 EV1maXKN3uFkRdsDfY9C+hyG0HwwUWFM7L4gIOu6XnCLI5I/ZwXOswyHYnNgqm4vj3
 SIuYr2tuZUD7YRGjS+rvSWaCHL9pPZaqk9VlVEDhJVqZC8+FJjvkTpFvmwpZjgbw37
 x2fQvjNGo90uIrdwtfV9Ym7sUe6dd4ENWQycAoBTxwlnTaArbQxKbiqfzvm5bBtjSi
 ZEJZB4ThCAjXWB5J/0ptbRuqc1TRsv3wGqYdj6BUpxXnDmN6kqHVLaGsvfTiG5DfaR
 SfokVxP6lHOfg==
Subject: Re: [GIT PULL 4/4] ARM: defconfig updates for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
 <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16
X-PR-Tracked-Commit-Id: fa348938dbfccc1df1dc902f6bcb76d4f05029e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce840177930f591a181f55515fc6ac9e1f56b84a
Message-ID: <163598476748.32364.6098473002148821789.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_171248_746827_D63D8AC6 
X-CRM114-Status: UNSURE (   5.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211104001247.C_Uc-IgeQ3lcZQkzn_o6kh3gajEKRzttQkd4P5qzsAU@z>

The pull request you sent on Wed, 3 Nov 2021 23:56:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce840177930f591a181f55515fc6ac9e1f56b84a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

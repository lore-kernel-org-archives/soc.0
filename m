Return-Path: <SRS0=GF4P=IY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4457C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 18:50:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4C961A10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Mar 2021 18:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4C961A10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uO6GhrKwmw5fhC/lp+Cig7C07Wn7cORBNSvkP3R3Mx8=; b=S+Fj5qbhKTtMmZ94KdCGYQLUCC
	VRWu3U4SVxico+2Ag7aHoU8+1ubn2mPH0PCzBzjP0nesLZpzBFDTlHj1/JaxkxJikDLOvQx9Mgc5s
	fRiy0OVYwtLaL6jwcbTCvqvOE/6s55qBrVhcfVtxpc1xMTz7KjbpMu4jDcFsfKm3EaNvVtA4k4e8A
	B/D4jYGg/eNfIs4oBE6PVsHY3TyKnqqe1iIrSbL5VxSSOUCo6bO3NpiGogDG0+un9wqvF8OMmfEQr
	TAffZJquAKJw+bSDvP580/3FCKhfn4bG24SZfAEuKRgjiYdPVQFk2mBMecVxjlKb6vQclz5Aeq16F
	Fc7olomA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPrVY-0049zj-1M; Fri, 26 Mar 2021 18:48:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPrVT-0049zM-MK
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Mar 2021 18:48:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EC6A361A26;
 Fri, 26 Mar 2021 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616784505;
 bh=8auveAHTI0hptiEIDh5p9n46G+ek7E3F9Vv49Po7mDs=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=s3phOLWRWO3E7rDRMJ2XmNtWA0iFyC75t1DYTX4ERlJn6fvUF4MdpVwZ/LlDfMCE4
 Zxpc1Ai1LBPiL0r98NRgAQj3J1b2Z/4RtzbMmJG0sMbIWLu5cJDGSK2s6EGaMCdf/Z
 s/98hYU/Zj4wZ+wkwvSwcZprAklzZ8rFlQvO+wza84f0Py1+l+04rq8F8bXWXi+oDP
 GizOySXi8J2h+2BRGeyMckSC3TmPB47xbyuK0tK9qBEw3qekSb8FRHddCsgx0tEOcz
 ImXFzd7VhbVw3FRvSJtbqj6c9qs4OAtfMxOv+PhWAGJpj2smjH9jsx4Jltfs9b1LE0
 rx83+yi505x3w==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
References: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.12
X-PR-Tracked-Commit-Id: 67335b8d28cd2ee279d6ab3c72856b76411ba48a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb3991ef2c0ebb7dc49c260e12ae1575d1e153b2
Message-ID: <161678450484.8437.9581033383916056038.pr-tracker-bot@kernel.org>
Date: Fri, 26 Mar 2021 18:48:24 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_184827_968409_1632C674 
X-CRM114-Status: UNSURE (   3.41  )
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
Message-ID: <20210326184824.EjG14F4X-LsKdJkT2I7Pr_Rt0tSur-o7bqZlL00mafU@z>

The pull request you sent on Fri, 26 Mar 2021 17:02:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb3991ef2c0ebb7dc49c260e12ae1575d1e153b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF559C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 22:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B91C20725
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 22:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdKGSskV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qBSfxuEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B91C20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bi/K3BjmGc4aGdk/svK7XvQ4nKCNQUpFwrxiZR/NVfE=; b=bdKGSskVG0dxvJsuS72glWs01
	qUo983+rMfxIpJJoD+Bv3L/9qcVy85Qe0FxNinOVObtp5CqzagJN4Su1ndBWT9TxP2yKwA/n4VGk5
	iVIe9pj9V4Nvvfs6x64ojgc562IfkxgTiSKYTjMZ+oE10tPPsXQka2DXaR6TBfwZ/FKRBXXRbRbsj
	ji46p88mUnBEHmvVl1HZ/4iBJRTZnQJLnSHM0L9fg9rCnjLSSbQu2LYNqYlqtZ33D2tj2A4j7JHRF
	GXCXxLdWvT+VdYggeaDwLcU6DHCztKVT4poa+AbCxwwdd1UszR2M3Pxzwc4DbB+0M40g7Xp9pHF04
	1nr6LoyCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjs4Y-00079k-6A; Mon, 30 Nov 2020 22:55:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjs4V-00079K-Ga
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 22:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEehqEG1a1gUdHMKaEzZ631DuoSmxOdN1LmfoAyBjQc=; b=qBSfxuEsqEYHROB6wvqwA4hgO
 EH2hU26Pr7z9GnAYVIIn9mZLTPMgCr80jon+Fr0Wc9uwnXJezF0D7E086/eiUchvt5UY7NycIpwWC
 Untb1/3t8bDJt8i89ETNPxwwpmPOSSePmCN8OS6styfdvVLvio7JDgg3rXmO4R3X/O0i/tdSpSFUP
 FiRgdUeiGh61K1S5OEcBXo9DNtwZclHGar/+lEZHvMdGrofmgdkt369aTppCIGFU88/2aFW1oQwT2
 1kaFMSCn04TZahWY79POLyVmeGthGE6VQIZ2MDyX9X/7NgUS2VKKavDhVNKqO8PGnTDvrSqIkZO3o
 yW14xwt6g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38174)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kjs4S-0007hl-FI; Mon, 30 Nov 2020 22:55:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kjs4R-0005Ol-Ns; Mon, 30 Nov 2020 22:54:59 +0000
Date: Mon, 30 Nov 2020 22:54:59 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
Message-ID: <20201130225459.GB1551@shell.armlinux.org.uk>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_175503_602394_F43CCA7E 
X-CRM114-Status: GOOD (  17.96  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130225459.bz2Z1aXG5NYeKhPewhPNtlBY9IzMZbLankKL21uCHQM@z>

On Mon, Nov 30, 2020 at 10:22:58AM -0800, Linus Torvalds wrote:
> > I guess the question is: why is static assignment of numbers not an
> > acceptable solution to the problem?  It gives us the desired fixed
> > numbers and automatically avoids all weird probe ordering / dependency
> > problems.
> 
> I think that if this had been done originally, it would probably be fine.

It was not done originally, because the original structure of the MMC
bus was:

host controller ---+--- card 1
                   +--- card 2
		   +--- card 3
		   ...

So one host controller could be connected to multiple different cards,
and the bus has a way to detect each card individually. This means we
had no idea how many cards would be connected to any one controller,
and it was entirely sensible to allocate MMC block devices in the order
we discovered the cards.

The SD specification, this became limited to just one card per
controller to allow for faster speeds.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

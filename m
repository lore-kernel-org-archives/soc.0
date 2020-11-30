Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E45C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:08:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF1620691
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 19:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="okK4Jz/q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wR1+J7Qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF1620691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NKHCPjdTZvbTuBunlAa78UAIYhunzqcjfM3/WXm3w04=; b=okK4Jz/qGwbZnuM4mlROJ0ZYj
	5xXEHsiC0a0B79aVmT/Y3pvf4IPRLPMnD60B4KstWJyj/FpuCmIpEq0ipJ67iJVqis+MlAWw25ijm
	znGBawTQq6Gp2La+jZaFoCeyqVOWtkauqZ2PlESnovs/0g5nUdgaPyIbmGG1q9A0VuUP31V0VmuUI
	DPjpDD0eVdzytnVG4kx7GRc/if9eEpyWilGfx+8SJsbUQFLczpRewucEMZ1n2cSOi2JAKDN80sh2k
	LhTY0JS5ZuwN7TImMBQVLRujhGho++TTVfb2tsGIuBL/SNC9jylj7y8tCE8NAkE+t0Ty485wdbIwi
	ZV1Mo1fWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjoVY-0000fg-Jx; Mon, 30 Nov 2020 19:06:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjoVU-0000eK-Ga
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 19:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mdWSD+1qCx9Ml65+hGn0IHNvQjAC2TF2iTY3oj4yxVk=; b=wR1+J7QmI9WZnC8kywHggy+Es
 CCTeKBgC1N2bHWhrkOmq1nU7SJds4gsnKnfNb+bxEv1Uw2YNlIbJxspgRniYOM7Q48Tc5SZ69b1k3
 1E/wulnROKRozX5Kms9EiFEkqXYTD43EiMQ6TSb8TOt3+FM7OYd7lDxaGpzyWQNSagWaItan4XMdF
 lc6pMkDYkBFpD5um0bLVhXCZQx/WZnj4j+9nWA4Bkthor07NY0M4p1D7VpGGnct0Wu42qibiyRT2i
 LBmeMABu2MbdnSKB73/ywRm9KHR3M9qpcm79G2HFZYDKZ3OXJCqv+GrXjBzFkfraAQZQ8SzD6A6Im
 GU6wa9+9Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38106)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kjoVO-0007S1-Vw; Mon, 30 Nov 2020 19:06:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kjoVO-0005FN-Bf; Mon, 30 Nov 2020 19:06:34 +0000
Date: Mon, 30 Nov 2020 19:06:34 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
Message-ID: <20201130190634.GA1551@shell.armlinux.org.uk>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <20201130180523.GZ1551@shell.armlinux.org.uk>
 <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_140640_620624_D693F4D1 
X-CRM114-Status: GOOD (  32.26  )
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
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130190634.pR4pwmwl8DntFdOAZ50rhQkFRT1B7GvTMFINqE144Cc@z>

On Mon, Nov 30, 2020 at 10:15:29AM -0800, Linus Torvalds wrote:
> On Mon, Nov 30, 2020 at 10:05 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > If you think that /dev/sda for example is always the machine's internal
> > HDD, that is wrong.
> 
> Yes. See the whole part about
> 
>  "Note that it really is only the internal devices that matter. Once you
>   start plugging in an external USB hug and random devices, ordering
>   clearly won't be reliable.
> 
>   So this is not a "everything must be ordered". But people who think
>   that that then means "everythinbg can be random" are wrong"
> 
> in my email.
> 
> And the key word here is:
> 
> > I have a HP Pavilion laptop with its internal HDD with a Windows
> > installation. Because I didn't want to destroy that in any way, I
> > bought an external USB3 SATA enclosure and SSD, and installed Debian
> > Stable on there.
> 
> .. but it will still generally be stable with the same hardware
> configuration, and not fluctuate randomly from boot to boot when the
> hardware is the same.
> 
> Is it a guarantee? No. External plugged in hardware can change things.
> In fact, when you have things like Thunderbolt involved, since it just
> looks like PCI, even the PCI probing order won't be the same with or
> without the plugged-in device.
> 
> But again: avoid randomness. The difference between non-random and
> random is that one is predictable and one is not.
> 
> Predictability is good. It's not necessariyl always achievable, but
> it's very much something we should strive for VERY HARD.
> 
> Predictability and reproducibility help debugging enormously. It means
> that things like "git bisect" work a lot better. It makes user reports
> much more understandable when two users with identical hardware see
> identical issues.
> 
> Seriously. Anybody who argues against reproducibility is so far out to
> lunch that it's not even funny.
> 
> You seem to argue on a complete technicality.

Yes, I fully agree - but the problem is that how people read your
"avoid randomness".

Randomness as in "doesn't change if I change kernel configuration"
or "doesn't change order on reboot to a similar kernel".

People who have complained about mmc in the past have done so from
the point of view of "I changed something, now my mmc block devices
are different".

It is my understanding that mmc behaves in the same way as exactly
what I see on my HP laptop. The device numbering is stable provided
the hardware (and indeed software) configuration is stable.

If I decide to rebuild the Debian kernel for my HP laptop, and build
in the drivers necessary for all its hardware, the internal HDD will
switch to being /dev/sda instead of /dev/sdb as it is now... which
doesn't seem to be any different from complaints like "I've changed
some code in the kernel now my MMC devices have changed order."

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

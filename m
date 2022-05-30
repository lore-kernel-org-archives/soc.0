Return-Path: <SRS0=7Qnv=WG=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE90C433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 16:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C959C3411C; Mon, 30 May 2022 16:54:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FF8BC385B8
	for <soc@kernel.org>; Mon, 30 May 2022 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FF8BC385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MgAIfXuZbnO66UplqyXtbnNG1M1uphwmPAPlMZl/NsM=; b=tSh9PSln6DPu8EU2UgGJUTJM7k
	M9mcUReU4aaRVJosOtdMc3v5aI9sfFmp1rEG6L2u3E7wDYf4yTINLVhRhXVN/EqYlfaid9d7MEO8t
	xXMWRQmLev64HwjQ6W0X5Y65b66Z2MGU8EQxvD+Zap2oMEARGlqnSc/PfOy6QHglj/tadSYTvVniP
	AO4yP505lrU+L21yItjbZX64YqiJWOejR0Nsh8qobpuSMtwDybfi3gkkXOKwVuU8PJ3NwIMDkHBNK
	sjUWVQwNuk3+i5NgulP5F54Q4R0CFOfj3tLSSJrCtiq8L3R4nCCkZru8Zxm2xrsD3JQv379w5s5yl
	b3AdTxTA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60884)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nvieX-00045f-Ar; Mon, 30 May 2022 17:54:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nvieL-0001ZQ-Um; Mon, 30 May 2022 17:53:49 +0100
Date: Mon, 30 May 2022 17:53:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jani Nikula <jani.nikula@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpT2neim6b49Shky@shell.armlinux.org.uk>
References: <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com>
 <877d63tleq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d63tleq.fsf@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, May 30, 2022 at 12:33:17PM +0300, Jani Nikula wrote:
> On Mon, 30 May 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Sat, 28 May 2022, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >> On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>>
> >>> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
> >>> option, you the kernel is built for the old 'OABI' that forces all non-packed
> >>> struct members to be at least 16-bit aligned.
> >>
> >> Looks like forced word (32 bit) alignment to me.
> >>
> >> I wonder how many other structures that messes up, but I committed the
> >> EDID fix for now.
> >
> > Thanks for the fix, and the thorough commit message!
> >
> >> This has presumably been broken for a long time, but maybe the
> >> affected targets don't typically use EDID and kernel modesetting, and
> >> only use some fixed display setup instead.
> >>
> >> Those structure definitions go back a _loong_ time (from a quick 'git
> >> blame' I see November 2008).
> >>
> >> But despite that, I did not mark my fix 'cc:stable' because I don't
> >> know if any of those machines affected by this bad arm ABI issue could
> >> possibly care.
> >>
> >> At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
> >> that uncovered this.
> >
> > Indeed the bug is ancient. I just threw in the BUILD_BUG_ON() on a whim
> > as an extra sanity check when doing pointer arithmetics on struct edid
> > *.
> >
> > If there are affected machines, buffer overflows are the real danger due
> > to edid->extensions indicating the number of extensions.
> 
> That is, for EDID. Makes you wonder about all the other packed structs
> with enum members across the kernel.

enum should not be used in structures if the layout of the struct
matters. ISTR there was a proposal for EABI to make enums just about
big enough to hold their enumerated constants - so you'd end up with
8-bit, 16-bit etc according to the largest enumerated value that the
compiler thinks it could hold.

That's a latent disaster when enums get used in structs where the
layout matters, __packed or not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

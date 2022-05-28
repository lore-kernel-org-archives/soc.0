Return-Path: <SRS0=09n4=WE=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1DDC433EF
	for <soc@archiver.kernel.org>; Sat, 28 May 2022 20:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32BABC3411A; Sat, 28 May 2022 20:32:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2E6DC34119
	for <soc@kernel.org>; Sat, 28 May 2022 20:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2E6DC34119
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sVwMCmxLWsbsfDuisFxMS45pxNxsdph6vk/Q4MCnxVs=; b=svLxRgQOL9LJ6eX13vc1DeR5AC
	7C0eYQF9MVCNok8ATdfWn8yWwjY9ZDAWnPd3UhJLNgQG/kcMhy4N7hynylYbmgz+cMNuuSEBYozlV
	Gusv3XEcuLGJHOQvlAKD0cJ87v8vDUBCneaD1tmgDaFuA7lXYtbeyD9eRNgEOdL4Z2xiN0tJW+YRf
	QW3HUhR3meFNqGRY9fbbGwgvkkVutHvzAn0D7uFK1ss3hdwf/9xvSsJEOqeny70pbjREu3VbjWxN2
	mVS8zjMtfnnKll17XAbcdpAo6crx/N8mMno0Mc6ShDm3dM/TaDVEr/pLYkUjQRG3kDx4jMwgXyfS3
	+K+q/2Kg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60864)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nv36j-0001eB-5u; Sat, 28 May 2022 21:32:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nv36Z-0008Aq-Ix; Sat, 28 May 2022 21:32:11 +0100
Date: Sat, 28 May 2022 21:32:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
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
Message-ID: <YpKGy1YTT3+wWzDI@shell.armlinux.org.uk>
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, May 28, 2022 at 11:08:48AM -0700, Linus Torvalds wrote:
> This smells like a compiler bug triggered by "there's a 16-bit member
> field in that gtf2 structure, and despite it being packed and aligned
> to 1, we somehow still align the size to 2".

It's an age old thing, it's no compiler bug, and it's completely
compliant with the C standards. Implementations are permitted by the
C standard to pad structures and unions how they see fit - and some
do if it makes sense for performance.

The mistake is that people forget this detail, and they expect
structs and unions to be laid out a certain way - because it doesn't
matter to the same extent on x86.

However, as older ARM CPUs could not do unaligned loads, ensuring
that things were naturally aligned made complete sense, even if it
meant that people who assume the world is x86 got tripped up - the
only way around that would be to make every load very expensive.

It's not "align to size of 2" in OABI, it tends to be align to a
multiple of 4, because the underlying architecture is 32-bit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

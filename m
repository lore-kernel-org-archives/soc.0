Return-Path: <SRS0=7Qnv=WG=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E16AC433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26E07C3411A; Mon, 30 May 2022 16:56:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F7A4C385B8
	for <soc@kernel.org>; Mon, 30 May 2022 16:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F7A4C385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UykJ1IPICNFbfEo420X6Xx726q411APwSMuLoQTgdDo=; b=dMiLt0/Fv3cJXwMowD9p3ULFzI
	yzsGHXFL2yUq6S8ZTXuMQ0q5JZbcQCSd0umLh+lXFdY+97OggxB2MlCPgF2OGicJDAlFkuKajONDY
	7UabLE+JTBG7aSarulxeIHWW2YauCNc6f6OoUmSXPZ9O92BuzFPDy0TIlHKNeF4B8TXuTHhWhaIOa
	C5Q6WtENs7aXBgbZ9GsEGMB8VcQFpRC2QTuoOiHATWKJ4YFeJYTdEJ8hFpCzcnhj1NgETylwtSF22
	BO7HJuet5IcF7H3lHpcNaikDEhnof+/f0rcBweFI5o3ekb7Mhp24t9sAjod4cTd84zXRRX/Efe0GZ
	rYesoOEA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60890)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nvigZ-00046W-AO; Mon, 30 May 2022 17:56:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nvigY-0001Ze-Lg; Mon, 30 May 2022 17:56:06 +0100
Date: Mon, 30 May 2022 17:56:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <YpT3JlLc7vEfFu8F@shell.armlinux.org.uk>
References: <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com>
 <877d63tleq.fsf@intel.com>
 <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com>
 <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, May 30, 2022 at 03:35:28PM +0200, Arnd Bergmann wrote:
> The annotations for edid are completely correct and necessary. However
> other driver authors just slap __packed annotations on any structure
> even if the layout is not fixed at all like:
> 
> struct my_driver_priv {
>        struct device dev;
>        u8 causes_misalignment;
>        spinlock_t lock;
>        atomic_t counter;
> } __packed; /* this annotation is harmful because it breaks the atomics */
> 
> or if the annotation does not change the layout like
> 
> struct my_dma_descriptor {
>      __le64 address;
>      __le64 length;
> } __packed; /* does not change layout but makes access slow on some
> architectures */

Sounds like we need a howto document for people to ignore and continue
doing their own thing. :P

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

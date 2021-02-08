Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B110C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:12:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB47D64E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB47D64E6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WMmd67twoowAQuiC3DrWAUus/fjkaURjL3O1NLMsny4=; b=hTqAXNURgOE56AB+DS5xL0qQD
	bGfiF2AeV+uqWWOWuqgmlCJvEFfxcrddVTmrbYI4tY18O0C/dAgA4Ym79H2Umbje05IiNcELOkR5/
	tuPkQlJHrwz0Zwlxt1qm/MCvfM8qdtpd/f+8yemN/eWG1ZO/avIvN1zqx9jB1KLt/jH9JqtwYO0VH
	gjqoJlaZoukXoMeHjtYiBw7uO6y2VM8t+AMrONB7gIDvzPl1PU2MzlWflEK5aolFubC/2a72Xq3MD
	//Txbkq1PJbOh6MhfOxDKzGKFydzH9X5sTXYjW+v8UT1L8rGKmLbEavxAyHr1Bnt8/DokyBOXH1Kt
	bykbKzjMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Fg8-0001Cv-Gc; Mon, 08 Feb 2021 23:10:48 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Fg5-0001CP-JR
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 23:10:46 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5895FE0005;
 Mon,  8 Feb 2021 23:10:40 +0000 (UTC)
Date: Tue, 9 Feb 2021 00:10:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210208231040.GF351084@piout.net>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
 <20210208184230.onhlioflyylkx6xo@kozik-lap>
 <CAK8P3a3bsw8p2Geyo-vh1AJUfMQCCf3kpa_YB+tKmcvWHqRcEw@mail.gmail.com>
 <20210208213537.GA351084@piout.net>
 <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0QRcQM4rH9HgVMOHa_eATXsjRbGDXuMO7FgnA8OgPk0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_181045_853475_51FA266E 
X-CRM114-Status: GOOD (  48.66  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208231040.Qk6ZeWbFyUtanLvVBaCDR-BILSBTSB1M309GdQ6iiOY@z>

On 08/02/2021 23:14:02+0100, Arnd Bergmann wrote:
> On Mon, Feb 8, 2021 at 10:35 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 08/02/2021 20:52:37+0100, Arnd Bergmann wrote:
> > > On Mon, Feb 8, 2021 at 7:42 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > Let me steer the discussion to original topic - it's about old kernel
> > > > and new DTB, assuming that mainline kernel bisectability is not
> > > > affected.
> > > >
> > > > Flow looks like this:
> > > >
> > > > 0. You have existing bidings and drivers.
> > > > 1. Patch changing bindings (with new compatible) and drivers gets
> > > >    accepted by maintainer.
> > > > 2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
> > > > 3. Patch changing in-tree DTS to new compatible gets accepted by
> > > >    maintainer and it is sent as v5.12-rc1 material to SoC maintainers.
> > > >
> > > > So again: old kernel, using old bindings, new DTB.
> > > >
> >
> > I don't think forward compatibility was ever considered. I've seen it
> > being mentioned a few times on #armlinux but honestly this simply can't
> > be achieved. This would mean being able to write complete DT bindings
> > for a particular SoC at day 0 which will realistically never happen. You
> > may noteven have a complete datasheet and even if you have a datasheet,
> > it may not be complete or it may be missing hw errata that are
> > discovered later on and need a new binding to handle.
> 
> You do not have to write the correct DT for this, the only requirement
> is that any changes to a node are backward-compatible, which is
> typically the case if you add properties or compatible strings without
> removing the old one. A bugfix in this case is also backward-compatible.
> 
> The part that can not happen instead is to write a DT that can expose
> features that any future kernel will use.
> 

But I think we are speaking about the other way around were you would be
e.g. removing properties or splitting a node is multiple different
nodes following a different understanding of the hardware.
And in this case, any rework of the bindings will be forbidden, like
32b7cfbd4bb2 ("ARM: dts: at91: remove deprecated ADC properties") will
break older kernels trying to use the new dtb.
761f6ed85417 ("ARM: dts: at91: sama5d4: use correct rtc compatible") is
an other case.
I'm not sure want to keep the older properties or the older compatible
string as a fallback for this use case.

> > > However, once the firmware is updated, it may no longer be possible to
> > > go back to the old kernel in case the new one is busted.
> > >
> >
> > Any serious update strategy will update both the kernel and device tree
> > at the same time, exactly like you already have to update the initramfs
> > with the kernel as soon as it is including kernel modules.
> > I would expect any embedded platform to actually use a container format,
> > like a FIT image that will ship the kernel, DT and intiramfs in a single
> > image and will allow to sign all parts.
> 
> Embedded systems that do this have no requirement for backward
> or forward compatibility at all, the only requirement for these is bisectability
> of git commits.
> 

Yes and I can't see any drawbacks in this approach.

> > > A similar problem can happen with the EBBR boot flow that relies on
> > > a uefi-enabled firmware such as a u-boot, while using grub2 as the
> > > actual boot loader. This is commonly supported across distros. While
> > > grub2 can load a matching set of kernel+initrd+dtb from disk and run
> > > that, this often fails in practice because u-boot needs to fill a
> > > board specific set of DT properties (bootargs, detected memory,
> > > mac address, ...). The usual way this gets handled is that u-boot loads
> > > grub2 and the dtb from disk and then passes the modified dtb to grub,
> > > which picks only kernel+initrd from disk and boots this with the dtb.
> > >
> > > The result is similar to case with dtb built into the firmware: after
> > > upgrading the dtb that gets loaded by u-boot, grub can still pick
> > > old kernels but they may not work as they did in the past. There are
> > > obviously ways to work around it, but it does lead to user frustration.
> > >
> >
> > Are there really any platforms with the dtb built into the firmware?
> > I feel like this is a mythical creature used to scare people into keeping
> > the DTB ABI stable. Aren't all the distribution already able to cope
> > with keeping DTB and kernel in sync?
> 
> I think most traditional PowerPC systems fall into this category, most

My understanding was that the traditional PPC systems had a small device
tree and usually are not affected by driver changes but I may be wrong.

> systems that boot using UEFI+grub (as I explained), and anyone who
> uses a distro kernel on custom hardware with their own dtb.
> 

Aren't the ones using a distro kernel with a custom dtb more concerned
by backward compatibility (i.e. new kernel with old dtb) rather than old
kernel on new dtb? If they have an old dtb, an old kernel, and update to
a new kernel, backward compatibility will ensure this continues to work.
If then they work on updating their dtb, they still have the old one and
can make the distribution match dtb and kernel. This is already handled
properly by debian and I guess the other distributions as it is anyway
already matching kernel and initramfs.

This is what I have on my NAS:

$ ls /boot
config-4.12.0-1-marvell  initrd.img-4.12.0-1-marvell  uImage.bak
config-4.13.0-1-marvell  initrd.img-4.13.0-1-marvell  uInitrd
dtb                      initrd.img.old               uInitrd.bak
dtb-4.12.0-1-marvell     lost+found                   vmlinuz
dtb-4.13.0-1-marvell     System.map-4.12.0-1-marvell  vmlinuz-4.12.0-1-marvell
dtbs                     System.map-4.13.0-1-marvell  vmlinuz-4.13.0-1-marvell
initrd.img               uImage                       vmlinuz.old

So dtbs and kernels are already matching even when the dtbs didn't
change between 4.9 and 4.13.

I don't have any solution for the UEFI+grub use case but I will also
question the sanity of doing that ;)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

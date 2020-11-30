Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE8BC63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:06:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB69A2067C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLAK+E+y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="JsQVEEQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB69A2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t7B/RQQ3QOhZPvrjTVKd2wqChjoeo2DzssNo/GNPXc0=; b=lLAK+E+yde6159Fq+hLLneGRj
	uBzqE2aE/vBLPpISo6zgHv8Zxol9F8eerhDzTx2BAL1hznrMGsobz1alIzGo+nn9YMD+CfZxw4tHk
	dQvQ8mbRLG8upqAywGEKHAJIc4vhjtZDjXQ1LenuT4+jECh4BpnVsYXMBAEeS5PibJBgyzP+8W4fD
	TcEo2ltb1gSChoKOXb2xkeXSgPV8bWZYlmH/NqJlLEnI9GgsPEj9NT6dcrI5caMJpxlPzUsj48tUp
	IlGTsHanKxzd1+LmBH1LpQUPKR+wEnv9lrjAOy2y+VFOJSzgWz+vsKzjbzvlhdGxMKLk+nHRo3sSp
	TpN05guFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjnYL-0008QI-K1; Mon, 30 Nov 2020 18:05:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjnYI-0008PW-QL
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 18:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U/dq4XBKLjIj8o+Y1ijdonAPuVA02wsCQ9Xrid3YVv8=; b=JsQVEEQ7J0mZEkLPjCIxwK5WW
 wc9G9f4ifbWp8TKDAgLPZOOe3Fb2OsOhiyfEYgZ7fO1TnaSagY37SkpCMGxKDyrLHjIkPHHn3SG6s
 0teQKL/DneiDNSVZZaWQ1o2hWrJ17+u1s1DDaP/OTOg0ud8a1NZaqy7i6al7ORzC3YikovIimbbyg
 D6tRbmWabLpSKuPC89FzKRThltwZm69SGfjXmuwZRwI8N3vfypSjcMCTI/qVlSpf5uOqCDs92oqzW
 0UWuvjUF4fGBKiUuXC0BsEFdHj7/GnIEURUWr9dQnDCYPkaWC+s+KQIIrGUnWavbNQeAiFGQJBLHB
 7k8mkew0Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38084)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kjnYD-0007Lg-SN; Mon, 30 Nov 2020 18:05:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kjnYC-0005Cs-RS; Mon, 30 Nov 2020 18:05:25 +0000
Date: Mon, 30 Nov 2020 18:05:24 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
Message-ID: <20201130180523.GZ1551@shell.armlinux.org.uk>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_130530_870233_5C6D4CA8 
X-CRM114-Status: GOOD (  20.37  )
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
Message-ID: <20201130180524.nd8RE49EOD0U-x8aTOB0lRzvjfNdXdYik1Ur_ok0qYQ@z>

On Mon, Nov 30, 2020 at 09:44:03AM -0800, Linus Torvalds wrote:
> On Mon, Nov 30, 2020 at 9:04 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Without static assignment, maybe we could do numbering of MMC devices
> > in some type of a pre-probe routine?  Is that what you're suggesting?
> 
> Yes.
> 
> So basically, the way the async probing works for say SCSI is that we
> have multiple "layers of asynchroniety". We have the usual "init calls
> done asynchronously", but then within the init calls themselves you
> can start sub-scans asynchronously.
> 
> In order to get reliable ordering between multiple controllers, the
> PCI bus is probed in order in pci_init() (or whatever), so each SCSI
> controller gets called in a fixed order.
> 
> That then gets to scsi_scan_host() does that async_schedule() thing to
> actually scan the SCSI buses on that host.

I'm afraid that you don't get stable device numbering on x86. You get
something that _looks_ like stable device numbering, but it really
isn't.

If you think that /dev/sda for example is always the machine's internal
HDD, that is wrong.

I have a HP Pavilion laptop with its internal HDD with a Windows
installation. Because I didn't want to destroy that in any way, I
bought an external USB3 SATA enclosure and SSD, and installed Debian
Stable on there.

When I installed Debian stable, the HDD was /dev/sda and the SSD was
/dev/sdb. When I boot Debian, the SSD is /dev/sda and the internal
HDD is /dev/sdb.

Maybe /dev/sda through /dev/sdd should be reserved for internal
motherboard drives?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

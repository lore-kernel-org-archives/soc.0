Return-Path: <SRS0=Xujq=TI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8CAC433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 872B7C340F2; Fri, 25 Feb 2022 17:42:31 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51B6CC340F0;
	Fri, 25 Feb 2022 17:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51B6CC340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nNebr-0002OR-2y; Fri, 25 Feb 2022 18:42:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Rockchip driver changes for 5.18 #1
Date: Fri, 25 Feb 2022 18:42:25 +0100
Message-ID: <1871162.kSRBfm7Lxi@phil>
In-Reply-To: <CAK8P3a2=-wg_LFtOoeN47EoxnAhG+39sgFsVvH+mvNQpKvrOww@mail.gmail.com>
References: <9977257.a15B8eIVjX@phil> <CAK8P3a2=-wg_LFtOoeN47EoxnAhG+39sgFsVvH+mvNQpKvrOww@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 25. Februar 2022, 17:53:51 CET schrieb Arnd Bergmann:
> On Fri, Feb 25, 2022 at 12:20 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> >
> >   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-drivers-1
> >
> > for you to fetch changes up to 7dbb47d64acf4aac131a2aaade726913aa62abe7:
> >
> >   dt-bindings: soc: rockchip: add rk3568-usb2phy-grf (2022-01-23 13:35:06 +0100)
> >
> > ----------------------------------------------------------------
> > Compatible for the rk3568-usb2phy-grf.
> >
> > ----------------------------------------------------------------
> > Peter Geis (1):
> >       dt-bindings: soc: rockchip: add rk3568-usb2phy-grf
> >
> >  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> I've merged this into the arm/dt branch along with the dts changes.
> Generally speaking, any binding changes can go through either
> the driver or dts branches, or both. In this case putting it into the
> dt64 branch would have been easier.

Originally I was expecting more driver-changes that didn't
materialize.

But sure, I'll just put the bindings into the dts branches to
minimize branches the next time.


Heiko



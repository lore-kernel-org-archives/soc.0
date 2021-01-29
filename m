Return-Path: <SRS0=t3Mk=HA=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F8C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 22:12:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D4AF64DEC; Fri, 29 Jan 2021 22:12:13 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9819064DE9;
	Fri, 29 Jan 2021 22:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9819064DE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 6FADEE0B4F;
	Fri, 29 Jan 2021 22:08:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WVW95jXP8lLx; Fri, 29 Jan 2021 22:08:02 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 90B8DE0B4C;
	Fri, 29 Jan 2021 22:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SBoZVgSkdasp; Fri, 29 Jan 2021 22:08:01 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 3BAA3DF932;
	Fri, 29 Jan 2021 22:08:01 +0000 (UTC)
Date: Fri, 29 Jan 2021 23:12:07 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ARM: dts: mmp devicetree updates
Message-ID: <20210129221207.GA77366@demiurge.local>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>

On Fri, Jan 22, 2021 at 03:09:14PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > Hi,
> >
> > chained to this message is a handful of patches related to MMP device
> > trees and bindings. Please take a look and consider queueing them for
> > for 5.12.
> 
> These all look good to me, but I notice that a lot of them seem to be
> bugfixes, so please have another look and decide if any of them should
> go into v5.11 and perhaps backported to stable kernels as well.

I'm not sure any of these are worth backporting to stable. I believe
actually only these two are bugfixes:

  [PATCH 06/12] ARM: dts: mmp3: Extend the MPMU reg range
  [PATCH 12/12] ARM: dts: mmp3: Fix the CCIC interrupts

The first one only affects the audio, but the MMP I2S driver doesn't
work on MMP3 yet. The second one affects the camera, but the only board
DTS shipped at this point doesn't have one. Therefore both are somewhat
inconequential for older kernels.

> 
>        Arnd

Thanks
Lubo

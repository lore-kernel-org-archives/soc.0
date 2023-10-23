Return-Path: <jszhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1025C25B47
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 17:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AA28C433CA; Mon, 23 Oct 2023 17:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C51C433C7;
	Mon, 23 Oct 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698080420;
	bh=g1G7yWysf4/vpcAzIOKI3rb5OX5zd6qjlbvDZhuGXes=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nUG2xBJdy02m9wKb22uypTnntGmEen+0EJfuFCoOsj/4Acln1BlcNEIB/1UxxJIDg
	 PX9LJ2sBxbFexhQebotRRXHCTOegkIL/s+/tsD2jer3WwBA0ZEoAJpp5z8/cGOMPgK
	 1KLgWe5gqKwBr4zNqPjYKzONmgTlJGc7+J/Pd+Dg3QO1rsQEpirlR4lMQNfb09Z94t
	 zlXZJltllVB02/W5Bio2LXmxyKS0y0BtcOrbNNiQVN5p0IWczY0z+PlwAia2BrzIwn
	 qQVmcBS0x3pUBugC9is8ZTorbMjsSlBdTXPC6mHw1iXtFPt2o5xn1TclSvBvOvMUK2
	 kD66lhz5Ee1Kw==
Date: Tue, 24 Oct 2023 00:48:07 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <ZTajxzpNbPF9WS0X@xhacker>
References: <20231022154135.3746-1-jszhang@kernel.org>
 <20231023-factor-unashamed-2fd76c2ad02b@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023-factor-unashamed-2fd76c2ad02b@spud>

On Mon, Oct 23, 2023 at 09:27:07AM +0100, Conor Dooley wrote:
> On Sun, Oct 22, 2023 at 11:41:35PM +0800, Jisheng Zhang wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Convert the th1520 devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> > 
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > 
> > Hi Arnd,
> > 
> > This is the only one thead patch for v6.7, could you please apply it
> > directly?
> 
> FYI, this is missing your signoff, since you are resending my patch.
> 

Hi Conor,

Today I noticed that Arnd has tagged for-next for 6.7, so I guess I
missed the 6.7 PR, sorry. And I also noticed that Arnd has queued the
thead dma-noncoherent patch for 6.7(which is expected in rc7 :) because
I didn't explictly mark the target. I will take care this kind of
PR/directly_merge target in future.

I expected a large dt and driver changes in the comming development window,
for example, usb/eth/emmc and so on, so I'll queue your patch into my
for-next tree once linux6.7-rc1 is released.

Thanks

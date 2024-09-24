Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FDF1A7AF9
	for <soc@lists.linux.dev>; Tue, 24 Sep 2024 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187903; cv=none; b=QtHa1UAPBtFkS7ZpBT+yN68WOLqLhcmIuDDZ8NeBnZSg6UnNA1F/qs90A2z2PgXNP8PFzcrFZLBMZNYNipuJbeGfADH4P5fN3UTe2AUoKORSE8h+GPvOh5c50GVUpV9jJkUiVLCFyK5o7jedWiVeH8wHVas6foTVl/s5nOmq2bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187903; c=relaxed/simple;
	bh=rk7FmCDodVhivpLjEq2TizaviGndpr3Fv775eI3dOVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae/W0WCVsnPmg66yt0inldf41WuhC5ju2NQvDybqd00MV1kgjSdXkQp5wAt94i7QFfEPH26lDhmfblkZ/g6HzN9K1pB/t51TH9JOfEkzIH8uNgcsIjhXAld+0nw5JHXyjxW0RA8J0P1Y0t5MUqn2kQCHvyaePx1lqPxiOQh1ULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JDponQNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JDponQNy"
Received: by smtp.kernel.org (Postfix)
	id 8D807C4CECF; Tue, 24 Sep 2024 14:25:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F020AC4CEC4;
	Tue, 24 Sep 2024 14:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F020AC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E50271C0007;
	Tue, 24 Sep 2024 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727187899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mR9/cPvvURrlyDoi05y4N41HwJG8n7DvdK0KXQ4XvU8=;
	b=JDponQNytT70FawGOi+j5YNsJHmEAzATx0d3e8IMlIA80rcs98vEdOhXchdwEhKgIN3yeJ
	fYiR/aXhFhmv1LkipGrKHXCea0X8yGDflQiB161AmtJKvKj26YSaeWMhXefqldzQ0JuVBB
	0hWQWu3MNA9PCnzO3Mv39MS+AgjPV1Wm53/x9TFoYF0JSIcF60tOwPClFnIBqVq7sJA8JK
	x4zSTf3jgMCPuERhESjZ25QsV48NdZxRJuVbul2JJXByPLcdRdBvVJF/5BRo499BqULAKh
	/uQq5wZpV4oPrTORc/q1HClKtPbOIZsGS+OQLG873uNU+dwwB8jpbDg6SH52sg==
Date: Tue, 24 Sep 2024 16:24:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
Subject: Re: microchip soc maintainance change proposal
Message-ID: <202409241424582a8b426d@mail.local>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
> On 24/09/2024 at 13:46, Conor Dooley wrote:
> > Hey folks,
> > 
> > I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
> > that, but I would like to propose some changes to how the Microchip soc
> > support is maintained - mostly affecting the riscv side of things that
> > I've been maintaining in my personal tree, alongside other platforms.
> > I'd like to propose moving those from my tree, into the at91 tree.
> 
> I don't know if the "at91" naming will remain a right designation of what
> we're doing in the future, but well, let's stick to it for now.
> Some find it a little too much tight to the old Atmel brand...
> 

We could take this opportunity to rename the tree microchip or mchp. 

> > While the dts bits for the arm and riscv platforms have no overlap
> > and nothing is particularly gained from me moving which tree
> > location they're in, I'm far more interested in disambiguating the tree
> > that soc and/or firmware bindings and drivers end up in.
> > 
> > I was going to add the bindings/soc/microchip directory to the
> > maintainers entry I have for drivers/soc/microchip, but while doing
> > that, I noticed that there have been recent patches for sam and sparx5
> 
> FYI: and we have the older drivers/soc/atmel directory (which is caught by
> "ARM/Microchip (AT91) SoC support" entry).
> 
> > bits that have added files to that bindings directory that went via at91
> > and I figure it's almost certain that there'll be drivers added before
> > too long. Having a single location, like we do at the moment for clocks,
> > would make the route upstream for things a bit clearer - and I figured
> > that while moving one thing, might as well move the firmware and dts
> > stuff too.
> > 
> > My assumption is that the riscv dts bits would retain their own branch,
> > and that I'd still send the PRs for them and for the firmware stuff given
> > that there's no !riscv soc content in that directory yet - and I don't
> > want to saddle Claudiu with more work for devices he probably doesn't
> > care about...
> > 
> > Seem reasonable?
> 
> That's fine with me Conor. It makes a lot of sense as we're working on more
> and more topics together.

Looks good to me.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

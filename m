Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3253E49D
	for <soc@lists.linux.dev>; Wed, 25 Sep 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727287202; cv=none; b=mfxcAGA6qMthavyzE69AcOgDmxCYoNwdkRR34d+QmMkUPWiNmlfqnhj6pvmkMTu8ZyMqkRJ5D20NqxJKPOm1HK5a1Vzd92eCDQIcpdM0+PtA1NSPg8WqkG1gqC64mIqk8wbjBc2b2OCeVFlalkqUYkoGPKWvea5oXa33Fp+4s3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727287202; c=relaxed/simple;
	bh=cUd79tPAULeAAiZXzjfuxI51yQaHbOzAAxSW3djWd0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0ziCWiL+EpkXHRHKSvhdDjhkL1pTR0Ejjjzmj2HkP02wGDGZXcRs9XTnV87ZeBPM+ANwpLCOwqhWAqfSUdg1FmhzYhiPJcFGHFUgLqs09vsQzcXKkxlsm2nd5E5btDA6NDHnptYOSbnsMBy9mKymZgi6VQfkjEIbovt6oIG4Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yv2j9yTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yv2j9yTd"
Received: by smtp.kernel.org (Postfix)
	id BF309C4CEC6; Wed, 25 Sep 2024 18:00:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75EADC4CEC3;
	Wed, 25 Sep 2024 17:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75EADC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EE76240004;
	Wed, 25 Sep 2024 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727287192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYHzDl9a5nN7rzCT3bmvtkTBk4EsY6sAXT9t7x+utyI=;
	b=Yv2j9yTdFYiRDNPu51ACo3Ujg5DZbB2l6f6zltX3WMUiWSMLGWzUvPMV2c0AlH0C4Nzkrx
	eO1sN3hhsVN/4akB/Wbx5KFT1aAFwgQZousDAqJY1yHVXegvMSytHEVO4r50+FffN0ePdY
	rMYV8RW9x3hlbbK+u/jAUrfvhPIPt/ui4W/QAKmocCN8s3TdptroWjoS2dWu/iU06Q4AJR
	7AXfy4n3DkxEQ0aeMVhiBfWFel4w5u0kdGlP6oadan6q8KvilszHHftn31wxOFE1/GLG4D
	eoxDQFQF5SsR+p1u9kEf9nyhfUVI3Kz/JUC6GbK99Ng6ytfHQtefJ620h1Zs9g==
Date: Wed, 25 Sep 2024 19:59:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, soc@kernel.org
Subject: Re: microchip soc maintainance change proposal
Message-ID: <20240925175952d2737996@mail.local>
References: <20240924-overtime-entourage-bcf3d6ff8c80@spud>
 <6d6ab21d-44fa-491c-98f7-8a2d8ab86c62@microchip.com>
 <202409241424582a8b426d@mail.local>
 <70f1981a-5956-4abb-afd2-4321f4b21e8b@tuxon.dev>
 <20240925-absolute-jockey-1518cceb2884@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-absolute-jockey-1518cceb2884@spud>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 25/09/2024 17:16:10+0100, Conor Dooley wrote:
> On Wed, Sep 25, 2024 at 10:34:10AM +0300, claudiu beznea wrote:
> > 
> > 
> > On 24.09.2024 17:24, Alexandre Belloni wrote:
> > > On 24/09/2024 16:05:45+0200, Nicolas Ferre wrote:
> > >> On 24/09/2024 at 13:46, Conor Dooley wrote:
> > >>> Hey folks,
> > >>>
> > >>> I mentioned this to Arnd and Alexandre at LPC, and to Nicolas before
> > >>> that, but I would like to propose some changes to how the Microchip soc
> > >>> support is maintained - mostly affecting the riscv side of things that
> > >>> I've been maintaining in my personal tree, alongside other platforms.
> > >>> I'd like to propose moving those from my tree, into the at91 tree.
> > >>
> > >> I don't know if the "at91" naming will remain a right designation of what
> > >> we're doing in the future, but well, let's stick to it for now.
> > >> Some find it a little too much tight to the old Atmel brand...
> > >>
> > > 
> > > We could take this opportunity to rename the tree microchip or mchp. 
> > 
> > +1
> 
> I personally don't care at all about the tree being called at91 or w/e,
> but I wouldn't object to a rename to either. I can whip up a mail to the
> helpdesk if yous like.

Yeah, I guess you can ask for the rename and be added to the list of
users that can push to the repo. At the same time, you can send a patch
to update the MAINTAINER entry so we can ack it.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

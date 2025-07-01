Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C51E570D
	for <soc@lists.linux.dev>; Tue,  1 Jul 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364594; cv=none; b=O9+Z+QHfRnS4P7ENzp2NX4e4gTjgYM9I2eYRQEKHd+bvh67cy4elY3ILEJwud2FZm6OaDUOrlfCCEvJ+jjSWt2hbjHsOAkOs3FHKNHevwS5AVlDSmNYqfSC+aKFJ8ep3m2JUg7G7KT32p8aegGr33qVYTqDnllnWdlIR3OF50Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364594; c=relaxed/simple;
	bh=Cbfhi2o4B52xB+aA7uINQ6awuZbTtBGF8/IuZqnSvDU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGreVoWnDwhJWxluNOjSEibp0gG1gDumQKDhG52YXxmBnWsSf5LXR2qOei39dmnd9sZdbAabKWDMkwgTgDj66YL57meoyndGO9DFzIdMSXyXeaMxPT6JtoRplTSCOQF4D4Kd9bQBk7X87/4iAgXn67nsG2BpYygFh1o+XkUebYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EsHg+zOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EsHg+zOp"
Received: by smtp.kernel.org (Postfix)
	id 6FEC9C4CEEE; Tue,  1 Jul 2025 10:09:54 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 037C1C4CEEF
	for <soc@kernel.org>; Tue,  1 Jul 2025 10:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 037C1C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so537666166b.0
        for <soc@kernel.org>; Tue, 01 Jul 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751364591; x=1751969391; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIyJztbyxqEjqjaJ1LnowEcyz0vyDwt8msPH6jo2mH8=;
        b=EsHg+zOpHiwJoDnzuuJKcPrt5kbDyzyEG508gTC6hnwpcLY20If1D0sf2pLG2nzvHG
         CDtCv8RrYolaswIKSXej+R68u3kiaUVaZO6t9vyhK5C5YLn1UNwOzdpWodsbL54xoRt1
         IfNKehPtXBpv2H3beOloY8uxF8dxb+jqeY0Gi1xXfg1Z3199GOMYK5/4jE9EW/YLafyU
         Aj275JqWm6Lab0+CRXXjanF/QbExVO3+tf4gk1Zx0UEWGzmvZ1YEB4madDOcaCuZ/uoX
         HSEEdi6fQESbZl/Pkxt25lgruijsPteVdp/rBGMzw9e6XfenWgBnGX+WdpCARwWZEP0n
         S4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364591; x=1751969391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIyJztbyxqEjqjaJ1LnowEcyz0vyDwt8msPH6jo2mH8=;
        b=aTP3d9ynlG4OQTwDXRcYbH2GBkFER3IBvFl1ltXHyHy6Hbrx8ewjwmqc3s0puGjw/j
         FiQ/id8ED9gVqiMg+PxnzUanEBDSKmG0zCl0SHJHEJbjdfdjLekuyjT8rAOouHUvW5in
         lvHuKQebyY5kvz6YAWBdlDgwL45jsvnAwVtZaRwql0Qpacq1V8PntOmB6L+zuHD3hGHR
         zPSAKRX5uOLGHOrB9eRP6k0/BL3mVywi8eg1oPRMRkJ6B7ATpz2bJuiCfLIh8iSnC7dc
         wgrLMz6skC/Jklo4RmUIVNmP/j1vC4e6IKhu0hUHMejzglRKs9yviW5dxHVzPmgMnxET
         GJOw==
X-Forwarded-Encrypted: i=1; AJvYcCUWMp7ZKxlemGnpYQGKsOiGlrqvEeKZ8wSyg+OsQR1gda/70GOqcsDfU+HYG7qHh+K/dcQ=@kernel.org
X-Gm-Message-State: AOJu0YwHTGKeu/MMWHF28sXt2VhpIVNTH3/FqGzmy4hbtleCJ7ke9L2g
	g/p05008RoLRlE2Qwd2jjsqdl5Ab/fkkhTiwgte6t8cDzzk6nEJu7ZhmkrD3inJ4iXMd+e0DvhX
	NA4lgStGRcQ==
X-Gm-Gg: ASbGncv+jg/OzOuZtEFPZtZOF3Bim4YVZWiyAy1JlTR8mg9uOZnIf53e/V/BoiF36PR
	FAMZg+yKhLsisMNApPOKkzk5f+aERsW62GMsrjFLkxG0AOAKpGQyWgGY1J4iWt1WSquKMuEtRF8
	ycDY808I5t2Rzx0Tna5Gz4p/f0uU0a8mseB64vZ3mev1fsOtl5Vne1Q2OqhHUe32cNI39Sg8U3L
	K118m7+Au6DTC/NJ47rVlI0rXz/bPEMloY+3BIi1BWvAj5N8nZZAuLLskCSl9EHwWMEyNJIMUTB
	U8yCaGHBgM7Y3X0HKrWScpNvw61p6xxbTMINjRl9gZxRnfUKPJRivJuq7SK/h8zw5I1wRbd/YPy
	oNRrvGp0uhpJfV5oAs8SZy6/BnmwaMX5J
X-Google-Smtp-Source: AGHT+IFn6H76sBBBJXNtbulb+i6N1Dt1i4Alu/bsEVENZjt+XOBzm1/zPvGmfUSPvMdlEPKO4mGdaQ==
X-Received: by 2002:a17:907:9495:b0:ad2:43b6:dd75 with SMTP id a640c23a62f3a-ae34fcf4123mr1573289466b.10.1751364591035;
        Tue, 01 Jul 2025 03:09:51 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm838578966b.34.2025.07.01.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:09:50 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 1 Jul 2025 12:11:31 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, soc@kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com, Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Message-ID: <aGO0U5yuEZkIZev0@apocalypse>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <20250630190216.1518354-4-florian.fainelli@broadcom.com>
 <2025070139-garnish-leotard-9824@gregkh>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070139-garnish-leotard-9824@gregkh>

Hi Greg,

On 07:11 Tue 01 Jul     , Greg Kroah-Hartman wrote:
> On Mon, Jun 30, 2025 at 12:02:15PM -0700, Florian Fainelli wrote:
> > The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> > 
> >   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers
> > 
> > for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:
> > 
> >   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> > 
> > ----------------------------------------------------------------
> > This pull request contains Broadcom SoCs drivers updates for 6.17,
> > please pull the following:
> > 
> > - Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
> >   bind them all
> > 
> > ----------------------------------------------------------------
> > Andrea della Porta (5):
> >       dt-bindings: clock: Add RaspberryPi RP1 clock bindings
> >       clk: rp1: Add support for clocks provided by RP1
> >       pinctrl: rp1: Implement RaspberryPi RP1 gpio support
> >       misc: rp1: RaspberryPi RP1 misc driver
> >       pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support
> > 
> >  .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
> >  drivers/clk/Kconfig                                |    9 +
> >  drivers/clk/Makefile                               |    1 +
> >  drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
> >  drivers/misc/Kconfig                               |    1 +
> >  drivers/misc/Makefile                              |    1 +
> >  drivers/misc/rp1/Kconfig                           |   20 +
> >  drivers/misc/rp1/Makefile                          |    3 +
> >  drivers/misc/rp1/rp1-pci.dtso                      |   25 +
> >  drivers/misc/rp1/rp1_pci.c                         |  333 ++++
> 
> Any chance to actually review this code before you throw it under a
> different maintainer's responsibility?
> 
> And what's wrong with patches, why a pull request here?

Since the patchset is spanning several subsystems and some file
dependencies were shared between maintainers, Florian was so kind
to funnell all patches through the Broadcom tree, as the following
mail explains:

https://lore.kernel.org/all/0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com/

Let me summarize the patch history here below:

dt-bindings: clock: Add RaspberryPi RP1 clock bindings - 
	Reviewed-by: Krzysztof and Florian [1,2]

clk: rp1: Add support for clocks provided by RP1 - 
	Stephen: [3]

pinctrl: rp1: Implement RaspberryPi RP1 gpio support - 
	Reviewed-by: Linus W. and Stefan W. [4,5]

misc: rp1: RaspberryPi RP1 misc driver -
	Acked-by: Bjorn H. and Greg [6,7]

pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support -
	Acked-by: Linus W. [8]

Regarding the testing phase, I and some colleagues at SUSE have tested
the patchset from quite some time now.

Links:
[1] - https://lore.kernel.org/all/leeeqocyjme2sbjbwsw6whisyu6aeq7vfypdi4arktpowzxvek@ejjyxx4iliap/
[2] - https://lore.kernel.org/all/a70e8c45-97a8-4fb6-9b27-4f9ed020211c@broadcom.com/
[3] - https://lore.kernel.org/all/8513c30f597f757a199e4f9a565b0bf5@kernel.org/
[4] - https://lore.kernel.org/all/CACRpkdZCbvNY=B05e9wGqNr5b4t8GrDVsr01C3xd5E-WWwPyMQ@mail.gmail.com/
[5] - https://lore.kernel.org/all/0c6fa2cc-3a7e-4db2-bbad-7c19a876937e@gmx.net/
[6] - https://lore.kernel.org/all/20250416193152.GA78446@bhelgaas/
[7] - https://lore.kernel.org/all/2025042551-agency-boozy-dc3b@gregkh/
[8] - https://lore.kernel.org/all/CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com/

Many thanks,
Andrea

> 
> thanks,
> 
> greg k-h

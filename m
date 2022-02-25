Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BCFC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 10:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60E72C340F2; Fri, 25 Feb 2022 10:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC738C340E7;
	Fri, 25 Feb 2022 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645786289;
	bh=RS/k+wRBAJ5qPtedjtTa37vIPkAlwStp54rw0F/Qs7k=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=zQsE1KHMtu6kVlW3omnarojHwWmSLAhGavzhvW8Fe8Pd3u5LXVbhcHcv0NwMQCEgy
	 RnttiDlJ2FYvEIjPz76bFoJ2nru1Rw1nJedt8EbDSmbkdVRYdjeRUPGP6vvv8+ZhWU
	 bj6kEkHbEByT/+QvHa2iYYm1GmJbTzDvnaHsLgo0=
Date: Fri, 25 Feb 2022 11:51:26 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: "jirislaby@kernel.org" <jirislaby@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] soc: fujitsu: Add A64FX diagnostic interrupt driver
Message-ID: <Yhi0rrkSR63ZhjX1@kroah.com>
References: <20220218092010.1327309-1-hasegawa-hitomi@fujitsu.com>
 <CAK8P3a027OWYrRDm3r930pYo+He7bqVSEpQKjM9od1W8ciamyw@mail.gmail.com>
 <OSZPR01MB70508B35657B539FF4FA28F6EB3B9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7050EF799D97D05A8C4597E7EB3E9@OSZPR01MB7050.jpnprd01.prod.outlook.com>

On Fri, Feb 25, 2022 at 10:35:10AM +0000, hasegawa-hitomi@fujitsu.com wrote:
> Hi Greg and Jiri,
> 
> I'm trying to implement a feature for A64FX that will panic when
> a diagnostic interrupt is received.
> Arnd suggested that handle_sysrq() should be used
> but I'm wonderingif it's ok to call it in NMI.
> Would you please let me know if we can call handle_sysrq() in NMI?

I doubt it, but try it and see!

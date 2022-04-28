Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33001C433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 05:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8650C385AE; Thu, 28 Apr 2022 05:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BFCC385A9;
	Thu, 28 Apr 2022 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651124734;
	bh=A3XvUYr/VhPRon0+LWzgmvQmq2CIOL0bUGl/5SAld5g=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=XrWyUQGig/e8RHE8UiuZDaw2PjI5Tla8Tt/fO/NGoMwUGgkLbemXNtVK8R2B7BFIU
	 2RBFWDaY3DT+oseiFGHr+Kc1VfMw4vR5KcB4eVTIlfzJSxBAcqKDRoqWu+7aPYi7Nd
	 s+3NvpTcwer4un31kiDfb0sFWpnhi7Zjg0BNvbpM=
Date: Thu, 28 Apr 2022 07:45:26 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Doug Anderson <dianders@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Travis <mike.travis@hpe.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Message-ID: <Ymop9jwBWGioF0Da@kroah.com>
References: <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
 <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>

On Thu, Apr 28, 2022 at 02:15:52AM +0000, hasegawa-hitomi@fujitsu.com wrote:
> Hi Greg, Arnd, and Daniel,
> 
> > I understand that it is not appropriate to hardcode c.
> > How about using __setup() to add a new kernel parameter and allow the admin
> > to specify the sysrq command when booting?
> 
> I have received a lot of advice regarding sysrq, but after some consideration,
> I would like to change to calling panic() directly as in v1 instead of sysrq.

panic() seems good to me!


Return-Path: <SRS0=jJfL=N7=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F5AC27C4F
	for <soc@archiver.kernel.org>; Sat, 29 Jun 2024 15:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 284CDC2BD10; Sat, 29 Jun 2024 15:11:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DA731C2BBFC;
	Sat, 29 Jun 2024 15:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA731C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5F3339;
	Sat, 29 Jun 2024 08:12:04 -0700 (PDT)
Received: from bogus (unknown [10.57.81.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D6663F766;
	Sat, 29 Jun 2024 08:11:39 -0700 (PDT)
Date: Sat, 29 Jun 2024 16:11:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, soc@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
Message-ID: <20240629151139.ahr7ikxt3joikvk3@bogus>
References: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
 <CAL_JsqJFrSyxjHQMF7gtgU0jZ_m2hNx_jrLxY29HE0VXOh4Ggg@mail.gmail.com>
 <CACRpkdYq92ZzUjb-Fne5th_hNv5xhsQ0Otf9ud+u_JLaMSiXqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYq92ZzUjb-Fne5th_hNv5xhsQ0Otf9ud+u_JLaMSiXqQ@mail.gmail.com>

On Fri, Jun 28, 2024 at 11:51:02PM +0200, Linus Walleij wrote:
> On Fri, Jun 28, 2024 at 4:38 PM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Jun 27, 2024 at 1:57 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > From: "Rob Herring (Arm)" <robh@kernel.org>
> > >
> > > There's not much reason to have multiple fixed-factor-clock instances
> > > which are all the same factor and clock input. Drop the nodes, but keep
> > > the labels to minimize the changes and keep some distinction of the
> > > different clocks.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Link: https://lore.kernel.org/20240528191536.1444649-1-robh@kernel.org
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > > SoC maintainers: please apply this directly for v6.11.
> >
> > Maybe not. This is a dependency for patch 2 in the series[1].
> 
> Aha sorry for missing that :(
> 
> Sudeep, are you fine with patch 2/2? Then I can send that
> the same way so Arnd can pick it up and pile it on top.
> 

I didn't send 1/2 as well as I didn't hear back from Rob. Either we can
ask Arnd to pick both directly or either of us can a PR. Let me know if
you want me send a PR. I have added my review tag on 1/2 IIRC.

Sorry Rob, next time I will just pick to avoid any confusion.

--
Regards,
Sudeep

Return-Path: <SRS0=2qXS=US=linaro.org=daniel.thompson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DF7C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 15:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44ECBC385A8; Fri,  8 Apr 2022 15:02:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40C87C385A1
	for <soc@kernel.org>; Fri,  8 Apr 2022 15:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40C87C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id m41-20020a05600c3b2900b0038eab72923aso520827wms.0
        for <soc@kernel.org>; Fri, 08 Apr 2022 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=;
        b=y9ibWseywVkczs7jv5ix8tRuxiKUjgfy4DezaUm/nwfvBNH2KSmqMIZdDbd9Mxvv7Q
         7d6lbxe8qJxKshaiQTWrOHkXpVrOESzVp7N88yLH8SVEFx/tMn+C5FvL9SQuW4Ay3+Yg
         kSi8XOTA4wjkMuNLadheSj28sSDK5z38Ee1DcrcVQbj2Tp4RAw4jX4mO4u8u3PotdWP+
         4rwzqeiKpc/NRLnCjb7gzfPM5Xo+lIiaadoAqFt2SGcXiW6HFApmYmbg1YR/aTboB9b0
         pvDHwdri2n3mKhUfpnyIMM/KIZc/KMielcqidnee3d1WMhqUTDnXHyblKRaaoaI47zkA
         ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=;
        b=eTSYDCa3znenFQUyCroY9WAn16eughMU8s8YZhlgQW2NfGKq/NIgUw41TZlkunV3aQ
         xqKREUMRnYwyNvHellT3xfBh+Vu4v4WxUFvNtMeVc1iin6W6WBcBiBLBb2V3z80p4hph
         a7g+xScwvVBByfycbcshFI9PecA1g80OyZcozMinP7CrHLTwmOhZX0qEuVBjV8IoV1b5
         Hg+iVwaiR18IJKJ8M4664ji8Cp/4bSp5t+YHf3tLK1Icx/i5JHvRBTWDeTU2gqs+RtAU
         SY5o1rTBfPIf/EzkbS/nD5UeX8x275UV9R7wnzR4DpZMb4Yx3NVhFY1J923CXI78rkWj
         f+Kg==
X-Gm-Message-State: AOAM530S22OqBhSqclOj0sDF7ncwhxNzgJQ3ZJpm4/GNTKehD99jqDN4
	huN1hJPOXCxWGEpNX4qNA4cSIg==
X-Google-Smtp-Source: ABdhPJySCidxaQPfz8lG3tCiCVWv3xpUiU9+LN8RUHhf594sVG3Xhb9svnvuZsqc2c0PWxIs36RpWA==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id q4-20020a7bce84000000b0037c52fea3ffmr17153661wmj.48.1649430125474;
        Fri, 08 Apr 2022 08:02:05 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d64cd000000b0020787751295sm4287477wri.35.2022.04.08.08.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 08:02:04 -0700 (PDT)
Date: Fri, 8 Apr 2022 16:02:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	SoC Team <soc@kernel.org>,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>, Olof Johansson <olof@lixom.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Doug Anderson <dianders@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kgdb-bugreport@lists.sourceforge.net,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Travis <mike.travis@hpe.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Message-ID: <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>

On Fri, Apr 08, 2022 at 04:49:31PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > > >
> > > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > > kernel. The corresponding driver offers a range of actions using a
> > > > module parameter:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > > >
> > > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > > it is just obfuscation. However it is certainly seems attractive to be
> > > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> > >
> > > How about a module parameter that allows picking a sysrq character then?
> >
> > Module parameters are so 1990, as this is a platform device, why not get
> > it from DT?
> 
> This machine doesn't use DT. I suppose the same could be done with an EFI
> variable, but with a module parameter you get the added benefit of having both
> a boot time kernel command line argument, and the option to override it at
> run time.

Pushing the decision on what action to take into firmware (whether that
is DT or ACPI) implies that the firmware is well positioned to make a
decision.  I don't think that is true here.

To me, it seems more like an admin choice... and admins are conditioned
to use kernel arguments.

If these type of diagnostics request were more common then perhaps we'd
be looking at a sysctl and call to handle_diagnostic_sysrq().


Daniel.

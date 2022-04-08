Return-Path: <SRS0=2qXS=US=linaro.org=daniel.thompson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD8C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7CCDC385A8; Fri,  8 Apr 2022 13:32:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73D93C385A9
	for <soc@kernel.org>; Fri,  8 Apr 2022 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73D93C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so7564137wmb.4
        for <soc@kernel.org>; Fri, 08 Apr 2022 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=;
        b=jmrr9ES2B8XWO03NQZzQI4F2KKQwsDwVsKRsbWp63khlAKSkmi9C+eilQOfzSCKath
         b3no7GA5N4PEoy7SBC5oRO6EjCTlned/SX99tuyEsBpExUCpvQy48bLQ5u/Ei8+f7+70
         JjoSwIq3ChdypUMSjHJMZXtPDo6LBN4VWGLzEibGOseVKZTsmd8rOjKDQID9fcDLqQLJ
         NDZUZYPMPUPPbnyc0e1+Kc+f3IMnC7PXOXkmbrtOHF4HITAHh0MbxX93nNvzfRQLYfBj
         JRUU1LkEyrPi6gVeOgj1vX501pObHoK8SRG8vDH2evWMkgLQFKGNabXNKtnXXbfryVtb
         7B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDC9L0lcr1QHf8qfh13ooZQp7CHb5z3+opmiIbCpO5g=;
        b=4VdgIMRxDMixp35EqmOwMP17HfxhQv9z43g9stfA/5ijtYLQOAZdSOocsg6i2BU5Ik
         Cp8Fijv67J4DQsu99IPD1GfjmbnBa4MwNKoOeXoePZRdUyz5rxGRKI/FJfsYANoNAffK
         7XGdAZ/LNSrAwQaxZpSb2+pCD5yD7Vs58et1ye0X6PG1IEVEprhADw1R8V5v53+IdZUC
         Kekr66rqy31zqtjc0zbvGTb895VO6VS5pEWd/uV/aRPF5lgG9DzR5e5xLM38rO8aeiCk
         U+KMDvIsvF2a7cYXeUJkkE1Ioers4jIk7F6ue3axM787jfst1A2qwmjLAYeMNqDyVQwD
         Fxzg==
X-Gm-Message-State: AOAM5302Sn9c2AHL29vWttMuB7pha0bS5xiz0Cy/TP/w/kL1vWMPTmBk
	ARWy2Z8yR9aZJxaPTj593cmTqg==
X-Google-Smtp-Source: ABdhPJyeiw4bwAQfXU133L8POlyN9oSdy3Td0K/5lQO2DSbqQQ73iq/K4PM/64Hhgx/RD0NCcuI3hQ==
X-Received: by 2002:a05:600c:34c5:b0:38c:30e3:1e6c with SMTP id d5-20020a05600c34c500b0038c30e31e6cmr17255479wmq.144.1649424768622;
        Fri, 08 Apr 2022 06:32:48 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id v26-20020a1cf71a000000b0038ea373273bsm1707695wmh.47.2022.04.08.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 06:32:48 -0700 (PDT)
Date: Fri, 8 Apr 2022 14:32:46 +0100
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
Message-ID: <20220408133246.fyw5554lgli4olvg@maple.lan>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>

On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 31, 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > +
> > > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> > > +{
> > > +     handle_sysrq('c');
> >
> >
> > Why is this calling this sysrq call?  From an interrupt?  Why?
> >
> > And you are hard-coding "c", are you sure?
> 
> This is an actual sysrq driver in the traditional sense, where you can send
> a single interrupt to the machine from the outside over a side channel.
> 
> I suggested sysrq instead of just panic() to make it a bit more flexible.
> Unfortunately there is no additional data, so it comes down to always
> sending the same character.
> 
> It would be possible to make that character configurable with a module
> parameter or something like that, but I'm not sure that is an improvement.
> Maybe you have another idea for this.

Given the interrupt can be dismissed then offering non-fatal actions in
response the chassis command seems reasonable.

There is some prior art for this sort of feature. AFAICT SGI UV has a
similar mechanism that can send an NMI-with-no-side-channel to the
kernel. The corresponding driver offers a range of actions using a
module parameter:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180

I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
it is just obfuscation. However it is certainly seems attractive to be
able to reuse handle_sysrq() to provide a more powerful set of actions.


Daniel.

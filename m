Return-Path: <SRS0=nd60=UK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2B1C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 15:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73B8EC340F3; Thu, 31 Mar 2022 15:45:15 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1978C340ED;
	Thu, 31 Mar 2022 15:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1978C340ED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVdUQ-1nQ0qh3yZI-00RbSv; Thu, 31 Mar 2022 17:45:11 +0200
Received: by mail-wr1-f45.google.com with SMTP id u3so377223wrg.3;
        Thu, 31 Mar 2022 08:45:11 -0700 (PDT)
X-Gm-Message-State: AOAM533E70FpnFf2KHR00M8j0T8ey2HpXo9amJvwm2tJsfG4CBI/VcxZ
	uattDKFrQr+oVFUTOziu/INxc997LilVHJe2BHY=
X-Google-Smtp-Source: ABdhPJyINqj20BgrqMVql8P0dLX86b0MRGwI7ZaFK1fyvU3QQ0XJBE7cU28CP6wHHSEMpvM8IDEW2Jl0QfL2BRdivwU=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr4338853wru.317.1648741511582; Thu, 31
 Mar 2022 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com> <YkWVTEG5oFO82GPL@kroah.com>
In-Reply-To: <YkWVTEG5oFO82GPL@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 17:44:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
Message-ID: <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+rUB+YF5tuXOYB1zK5zBnDJbJDWOSVYXtZf2WQy+BDOAvwRV5xQ
 N8neDJTYBamu90X6ijYSFlue+szHtsN9s9Hi3LTknjx1T8lP2wsXeriMC1++rmkcTK8Kf2f
 BXCYqrOxcz2U2cU1Yo3sHB14oxOc9NHSkaxo2g11YEajJvgb1u9W1cprAn1SlgrbtY5HxJK
 zUnrvUQ0FEVbfTUM/Uqwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:07hlcLDETAQ=:sVY1GpmU2tv7RQUkyyIoUp
 IFIVtG989rLoUuJP2FUtTo6lfyPPDb23OWT+gyfVKxgpOhTJhh0154C4+UYvjMiVl3+aBIzeM
 63tcPthIIMWaGJKs+oq7PuTa3kdTanIjpWeFglBVLlMycVoatvnN9GQk1VAn0VI/114RK//wf
 my/etREQ881vCbB6HLaod5KfcQcQNrsdbaW3fUyFBC6G/bojqeCfqGxnx79XMZiHtCoKSQQkZ
 qus1CjbZW9R0NqYQyUou71MDpAZBjbgOj+fBXy6ASqjub/oQmDJuOBc83IWL+C4LM0HgDbwkM
 KnU94yYhbulkg9bIfoDyV1GLG0GPtWmSvh7ZBC2A5ofcJ/tn/C6naEjj1wv8uyoYEUMT227+1
 hcUvAocxY++SNZwM7Cin2g4ayR1qIimz8oFZYTMWfnHucrPoVVXw1Hv0dojKK49oPR0iNU17A
 l0dPFTE9bW+RgRa97+rthL6o4eZI3VMqQLwFagCceaL7WZD6K3sEqf4lrRfnQ4VBzC1m+T+7D
 z1BoiMAOsYaLMdoQFMJ9+b/Sbqlfvepr8wzsRq4XOxPsuAmrdZB0MxfU9QmMXktR09gXoOW/V
 qTj1NKp2QVqY0VDYoMyoN23ynBLbaSBOvGDHYd9p+vGJdTqbh3AbN7oUkhybEnzQkbF+qN0tf
 Wax4SY6UvXquCsNVzQDs6dAqhNxpEQRq3onFbNRZ2cxjKl9xCwhQswuJKn6wgpT1TJ68fXt+q
 MSVxA1BfhqWfTJHhdzhBw1AWm8tdB9VOpIMKyEXktRKzGd6k5ovkS0qQ4j1dYX8VQnY7L+Bu6
 YHpRTLvPUAyj0CIQowgufuoIa+6OliMVKQQjGINxXDpIdoRfCQ=

On Thu, Mar 31, 2022 at 1:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > +
> > +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> > +{
> > +     handle_sysrq('c');
>
>
> Why is this calling this sysrq call?  From an interrupt?  Why?
>
> And you are hard-coding "c", are you sure?

This is an actual sysrq driver in the traditional sense, where you can send
a single interrupt to the machine from the outside over a side channel.

I suggested sysrq instead of just panic() to make it a bit more flexible.
Unfortunately there is no additional data, so it comes down to always
sending the same character.

It would be possible to make that character configurable with a module
parameter or something like that, but I'm not sure that is an improvement.
Maybe you have another idea for this.

> > +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> > +{
> > +     u32 mmsc;
> > +     const void __iomem *diag_status_reg_addr;
> > +
> > +     diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> > +     mmsc = readl(diag_status_reg_addr);
> > +     if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> > +             writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
>
> No need to wait for the write to complete?
>
> You shouldn't have to cast diag_status_reg_addr, right?

I think the cast is needed because the declaration of
'diag_status_reg_addr' incorrectly
marks it as 'const'. However, this should still trigger a 'make C=1'
warning with sparse
because it is now missing the __iomem annotation.

The correct solution of course is to remove both the cast and the 'const'.

       Arnd

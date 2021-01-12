Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BB8C433E0
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 14:22:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A06802312F; Tue, 12 Jan 2021 14:22:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70CFA23121;
	Tue, 12 Jan 2021 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610461349;
	bh=sbcVEreyAHJc4XzED40GfBd949GtVSfU3yOJPMjTYj4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tbFjEmz6CLRU7KqPvmnGb9hwb6EeROefF+AkMXUa0/qwqNhRsz2eomYw+8Q0ypxdi
	 l1N6bjvWQe5IcOUp3gJXC1JHP9ENQTPJhI1shUbZIZ0v7lsKDu1uPuT54XuXO7jduO
	 FUvd3xMnFHGjP/tCZRhxWw0co5ZMoZtGbze/AnkcJoFIVnc5uGSC+2CmMNmU/6ED/N
	 dPJQXckYnRKtijTfPGDcnNQAHrdVjCTPO7CBFWl+QDsyJZrhUxyxn4mwe6oS+xWMdw
	 s1Bx0DthrJmi61xppnlr39OSBgTT8DPPmqx/JLgO8nkSwcxVvXt67CK/BIccqPPRUK
	 FZeNIs4+0n/uw==
Received: by mail-ot1-f44.google.com with SMTP id q25so2358531otn.10;
        Tue, 12 Jan 2021 06:22:29 -0800 (PST)
X-Gm-Message-State: AOAM5315Y9NQSOFu07l2w40RG9QD6HqQMBhDtFYJwzgZ5EqN0YNZIDc7
	cdZNnqiH9gAi30+9IHFGyCgCiSpbx3Vix4VorS4=
X-Google-Smtp-Source: ABdhPJzGo0hy6hCYMeL+4I4ME57o0HLNQY2qNINNCP6cHdeI7PPNdeSLe3YuwwYOxDK0O9P8ZbAkdOD1PZ4fKiteo+U=
X-Received: by 2002:a05:6830:2413:: with SMTP id j19mr3036404ots.251.1610461348653;
 Tue, 12 Jan 2021 06:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local> <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 12 Jan 2021 15:22:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
Message-ID: <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 11:24 AM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> > On Fri, Jan 8, 2021 at 1:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
> However, I don't know any other processors having similar
> features at this point and it is hard to provide common abstraction interface.
> I would appreciate should anyone have any information.

The specification you pointed to mentions the SPARC64 XIfx, so
at a minimum, a user interface should be designed to also work on
whatever register-level interface that provides.

> > > Secondly, the intended usage model appears to expose this to EL0 for
> > > direct access, and the code seems to depend on threads being pinned, but
> > > AFAICT this is not enforced and there is no provision for
> > > context-switch, thread migration, or interaction with ptrace. I fear
> > > this is going to be very fragile in practice, and that extending that
> > > support in future will require much more complexity than is currently
> > > apparent, with potentially invasive changes to arch code.
> >
> > Right, this is the main problem I see, too. I had not even realized
> > that this will have to tie in with user space threads in some form, but
> > you are right that once this has to interact with the CPU scheduler,
> > it all breaks down.
>
> This observation is right. I thought adding context switch etc. support for
> implementation defined registers requires core arch code changes and
> it is far less acceptable. So, I tried to confine code change in a module with
> these restrictions.

My feeling is that having the code separate from where it would belong
in an operating system that was designed specifically for this feature
ends up being no better than rewriting the core scheduling code.

As Mark said, it may well be that neither approach would be sufficient
for an upstream merge. On the other hand, keeping the code in a
separate loadable module does make most sense if we end up
not merging it at all, in which case this is the easiest to port
between kernel versions.

> Regarding direct access from EL0, it is necessary for realizing fast synchronization
> as this enables synchronization logic in user application check if all threads have
> reached at synchronization point without switching to kernel.

Ok, I see.

> Also, It is common usage that each running thread is bound to one PE in
> multi-threaded HPC applications.

I think the expectation that all threads are bound to a physical CPU
makes sense for using this feature, but I think it would be necessary
to enforce that, e.g. by allowing only threads to enable it after they
are isolated to a non-shared CPU, and automatically disabling it
if the CPU isolation is changed.

For the user space interface, something based on process IDs
seems to make more sense to me than something based on CPU
numbers. All of the above does require some level of integration
with the core kernel of course.

I think the next step would be to try to come up with a high-level
user interface design that has a chance to get merged, rather than
addressing the review comments for the current implementation.

Aside from the user interface question, it would be good to
understand the performance impact of the feature.
As I understand it, the entire purpose is to make things faster, so
to put it in perspective compared to the burden of adding an
interface, there should be some numbers: What are the kinds of
applications that would use it in practice, and how much faster are
they compared to not having it?

       Arnd

Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425C2C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Mar 2021 11:07:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D380564F15; Tue,  2 Mar 2021 11:07:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4AED64F0B;
	Tue,  2 Mar 2021 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614683235;
	bh=JXsntDomzvvp35KqPtyck4SYOcKp8C4CKAHwX45dSbk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KtChTbLobWxE790ocN6tY6pzK8us82tmSNZzHL0pjxAF1zvqb2b4lE/TH2q3Rtz5p
	 tWRAk/mT0xENLL2LzwfWbH6pSyi+Aiw2pqAeDc8v4ecyikzgY/aCl8c6PGP27BsG3J
	 wqpfga9299ZfCFQgLl/VZFxLjUjG+SFJqDQth1SYd0M+oEjoJMFTMsQ2N0gzbiMfOn
	 0IkDiQKvyWKNAetPBYrwb1qwLbMrfJAloknLJkKF6KLkNoLjoQmxF4J3NOz3JN5BjV
	 EnaETFLFMCbYyBzRH10h8dlIkYlUPcSX0ENWHEnOiPw2H1RoxQcSJE3fdQkNSAVq06
	 POo9NPkAg6g7g==
Received: by mail-ot1-f53.google.com with SMTP id h22so19578848otr.6;
        Tue, 02 Mar 2021 03:07:15 -0800 (PST)
X-Gm-Message-State: AOAM532OZkmrxik3nxBTme5Up7X798XhLi8DgGcDJyBQBpiLXIgQf5GA
	xSW1+8648S6ZW8LhZqM0o7g23GfkswPg98fxKfI=
X-Google-Smtp-Source: ABdhPJxhU9eCujXvv4W27bbuQrN4TqJbps/AVuDpVM+qdE75c882pb9q50Qcmq/ml0VnXFoQJVtbrz+VtQpfjeZra24=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr18038402otq.251.1614683234751;
 Tue, 02 Mar 2021 03:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local> <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com> <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Mar 2021 12:06:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
Message-ID: <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 18, 2021 at 10:49 AM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
>
> > > > > Also, It is common usage that each running thread is bound to one PE in
> > > > > multi-threaded HPC applications.
> > > >
> > > > I think the expectation that all threads are bound to a physical CPU
> > > > makes sense for using this feature, but I think it would be necessary
> > > > to enforce that, e.g. by allowing only threads to enable it after they
> > > > are isolated to a non-shared CPU, and automatically disabling it
> > > > if the CPU isolation is changed.
> > > >
> > > > For the user space interface, something based on process IDs
> > > > seems to make more sense to me than something based on CPU
> > > > numbers. All of the above does require some level of integration
> > > > with the core kernel of course.
> > > >
> > > > I think the next step would be to try to come up with a high-level
> > > > user interface design that has a chance to get merged, rather than
> > > > addressing the review comments for the current implementation.
>
> Hello,
>
> Sorry for late response but while thinking new approaches, I come up with
> some different idea and want to hear your opinions. How about offload
> all control to user space while the driver just offers read/write access
> to the needed registers? Let me explain in detail.
>
> Although I searched similar functions in other products, I could not find
> it. Also, this hardware barrier performs intra-numa synchronization and
> it is hard to be used for general inter-process barrier. So I think
> generalizing this feature in kernel does not go well.

Ok, thank you for taking a look.

> As I said this is mainly for HPC application. In the usual situations, the
> user has full control of the PC nodes when running HPC application and
> thus the user has full responsibility of running processes on the machine.
> Offloading all controls to these registers to the user is acceptable in that
> case (i.e. the driver just offers access to the registers and does not control it).
> This is the safe for the kernel operation as manipulating barrier related
> registers just affects user application.
>
> In this approach we could remove ioctls or control logic in the driver but
> we need some way to access the needed registers. I firstly think if I can
> use x86's MSR driver like approach but I know the idea is rejected
> recently for security concerns:
>  https://lore.kernel.org/linux-arm-kernel/20201130174833.41315-1-rongwei.wang@linux.alibaba.com/
>
> Based on these observations, I have two ideas currently:
>  1) make the driver to only expose sysfs interface for reading/writing
>    A64FX's barrier registers
> or
>  2) generalizing (1) in some way; To make some mechanism to expose
>    CPU defined registers which can be safely accessed from user space
>
> Are these idea acceptable ways to explore to get merged in upstream?
> I'd appreciate any criticism/comments.

I'm also running out of ideas here. I don't think a sysfs interface would
be any different to your earlier ioctl interface or the the /dev/msr approach,
they all share the same problem that they expose low-level access to
platform specific registers in a way that is neither portable nor safe to
use for general-purpose applications outside the very narrow scope
of running highly optimized HPC applications.

You can of course continue using the module you have as an external
module that gets built outside of the kernel itself, and shipped along
with the application or library using it, rather than with the kernel.
Obviously this is not something I would generally recommend either,
but this may be the last resort to fall back to when everything else
fails.

      Arnd

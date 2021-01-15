Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3B5C433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 12:25:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E30B3238A1; Fri, 15 Jan 2021 12:25:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC6C92371F;
	Fri, 15 Jan 2021 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610713500;
	bh=/IpNCV8YI9pkl+MFJ7alq6YV8W+cOJxbklCxk3O173o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YMWV2Z6Gqb2n3EpARZAPp6N5HEsJ5mMkolz89xHM6apcz78IwxthADtUgqniw5k/a
	 K7X77dNp0vnQtVofaqbVvUyX9TPf1JWys9LqwVFatsp0dVp+U9czO8NnP3Gz6qrH+Z
	 H0gJ+QRC82WdbP3aXgfmvpcLQN4vvhoAICrKveTRNvKaqnujVUd28kRdsSqi4c0qvU
	 jl2uQzqfIbjT8daOKWYAYFFxe+BrNfEmK5iQOos6JrGcNNgkPNUlO6HwZgv7bkphMB
	 sItbrR0pfM3JEL94ZtmNRdfC+717r/hZPWIwhJhxvvnxaSemap6b3xIwECXmwrUtxX
	 yV2CGL8/ZkUnA==
Received: by mail-oo1-f46.google.com with SMTP id k9so2140771oop.6;
        Fri, 15 Jan 2021 04:25:00 -0800 (PST)
X-Gm-Message-State: AOAM531NEJVBRAYXT6M5vz3ryiRX571rLvs8XqWjBDCfoy07ilFcuO+E
	EEeyAaeaJdnZTyKvhqsX8zHhES1pu3BOXEz5U0M=
X-Google-Smtp-Source: ABdhPJxDN2beoohD9wNjeMD+PLZKH5mnAKtog/sxKIbb7GQpBAcusrTk3CnAtgnshM1v1kKgrGsRDB4oHCSCwQx7mSo=
X-Received: by 2002:a4a:2cc9:: with SMTP id o192mr8063179ooo.66.1610713500094;
 Fri, 15 Jan 2021 04:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local> <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com> <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 13:24:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Message-ID: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 12:10 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> > On Tue, Jan 12, 2021 at 11:24 AM misono.tomohiro@fujitsu.com <misono.tomohiro@fujitsu.com> wrote:

> > > Also, It is common usage that each running thread is bound to one PE in
> > > multi-threaded HPC applications.
> >
> > I think the expectation that all threads are bound to a physical CPU
> > makes sense for using this feature, but I think it would be necessary
> > to enforce that, e.g. by allowing only threads to enable it after they
> > are isolated to a non-shared CPU, and automatically disabling it
> > if the CPU isolation is changed.
> >
> > For the user space interface, something based on process IDs
> > seems to make more sense to me than something based on CPU
> > numbers. All of the above does require some level of integration
> > with the core kernel of course.
> >
> > I think the next step would be to try to come up with a high-level
> > user interface design that has a chance to get merged, rather than
> > addressing the review comments for the current implementation.
>
> Understood. One question is that high-level interface such as process
> based control could solve several problems (i.e. access control/force binding),
> I cannot eliminate access to IMP-DEF registers from EL0 as I explained
> above. Is it acceptable in your sense?

I think you will get different answers for that depending on who you ask ;-)

I'm generally ok with it, given that it will only affect a very small
number of specialized applications that are already built for
a specific microarchitecture for performance reasons. E.g. when
using an arm64 BLAS library, you would use different versions
of the same functions depending on CPU support for NEON,
SVE, SVE2, Apple AMX (which also uses imp-def instructions),
ARMv8.6 GEMM extensions, and likely a hand-optimized
version for the A64FX pipeline. Having a version for A64FX with
hardware barriers adds (at most) one more code path but hopefully
does not add complexity to the common code.

> > Aside from the user interface question, it would be good to
> > understand the performance impact of the feature.
> > As I understand it, the entire purpose is to make things faster, so
> > to put it in perspective compared to the burden of adding an
> > interface, there should be some numbers: What are the kinds of
> > applications that would use it in practice, and how much faster are
> > they compared to not having it?
>
> Microbenchmark shows it takes around 250ns for 1 synchronization for
> 12 PEs with hardware barrier and it is multiple times faster than software
> barrier (only measuring core synchronization logic and excluding setup time).
> I don't have application results at this point and will share when I could get some.

Thanks. That will be helpful indeed. Please also include information
about what you are comparing against for the software barrier. E.g.
Is that based on a futex() system call, or completely implemented
in user space?

      Arnd

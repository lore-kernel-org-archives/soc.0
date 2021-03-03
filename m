Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FF0C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 13:33:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C48F264EE8; Wed,  3 Mar 2021 13:33:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B19A64E87;
	Wed,  3 Mar 2021 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614778407;
	bh=BZYBZXYWmo2dKv8wyho+LMkEkeOqULwa2LYgfaB47ao=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NqBQUSlok/yAIgXYky25zEnz2L5xUJJ/PRNmXIH2WaSrk73yvg5fJytBftRQnpGV7
	 pQxdKT+E82xhEMy+X3nQGFJRe2azwj/2UdWc4uNjr2ggt9sFJXV4xP+L0Ntbosdt/K
	 jkjeWzhhLSQKm6iy3zhFkp29Erzs70iNAt+qbCe9hAnlf/DYZzqGDWfJACEqYqOcsj
	 weg7yphZaAkVLcSsqfBO++AamTuXXRJyrAGyxCwTTbFer0w9SxMZVgBUXRzTJLypgL
	 4VNk5NN2Tb/eS+/C5XKwQ9Y2cf/GyjcMSVeawvU93aD9GfVxhOMReSUEjGk66Dt6Gp
	 l7TasrpXMFXTg==
Received: by mail-oi1-f180.google.com with SMTP id l133so25928779oib.4;
        Wed, 03 Mar 2021 05:33:27 -0800 (PST)
X-Gm-Message-State: AOAM533SJIy+DKtu9goXqKi4llVYm0eOe8w9P2tjbDnSKHI+6WqAyG+N
	Uh2q0wcZKSz2O9smeQwhHvKkbZCGhYTGqkpFwy8=
X-Google-Smtp-Source: ABdhPJwwV2gnP5NFzQWkEiGAvINhXSCPNf6IDELJwNFQmFLhB2+/gtvCfNL0h2bWqoby58huOSZSdMHK2xdxydqyThE=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr1620792oie.4.1614778406768;
 Wed, 03 Mar 2021 05:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local> <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a3dBnSMmOgXHeycwpXJo3O2oq1e3Ue0XzgP=q68ZxMzvg@mail.gmail.com> <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB458224BBD6E110002DEA7085E5989@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Mar 2021 14:33:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Message-ID: <CAK8P3a3CwCSXyXuj9NGcyowTUYdUgAJdH8ue=R_aXYX+SO6Uew@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 3, 2021 at 12:20 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> On Thu, Feb 18, 2021 at 10:49 AM misono.tomohiro@fujitsu.com <misono.tomohiro@fujitsu.com> wrote:
>
> > I'm also running out of ideas here. I don't think a sysfs interface would
> > be any different to your earlier ioctl interface or the the /dev/msr approach,
> > they all share the same problem that they expose low-level access to
> > platform specific registers in a way that is neither portable nor safe to
> > use for general-purpose applications outside the very narrow scope
> > of running highly optimized HPC applications.
>
> Ok, but ARM architecture permits implementation defined registers at the
> first place. So can we provide some method/interface to access them as
> CPU feature if these registers do not at least affect kernel operations (like
> this barrier) and only root can access them? Library could offer portable way
> for user applications (under root permission) to access them.

The kernel is meant to provide an abstraction for any differences between the
CPUs, including implementation defined registers. While any such abstraction
will be leaky, just passing through the raw registers is generally not a helpful
abstraction at all, as seen from the x86 MSR discussion you pointed to.

One problem with having a root-only register level interface is that this
can break the boundary between kernel mode and root user space, and
this is something that a lot of people would like to strengthen for security
reasons (e.g. a root user should not be able to break secure boot).

Another problem is that exposing the raw registers from kernel space
creates an ABI, and if it turns out to be a bad idea later on, this is hard to
take back without breaking existing applications. Not breaking things that
used to work is the primary rule for the Linux kernel.

In order to merge anything into the mainline kernel, I think the requirement
would be that it does provide a sensible abstraction inside of the kernel
that can directly be used from applications without having to go through
another library that abstracts it, and that has a good chance of being
supportable forever.

      Arnd

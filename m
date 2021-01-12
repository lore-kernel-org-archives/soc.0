Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3761C433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 12:34:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CC25322228; Tue, 12 Jan 2021 12:34:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A53112222B;
	Tue, 12 Jan 2021 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610454882;
	bh=g3IrvRu89s7lfs/2hqzw7ocFewgDpWXpXEOpINnAdzk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AvBGWYVFpDxDlTqMTHxc5IZ7lPZ5ZMaQlr6V6B3pMFO6MKx+5UNJVEfH8JMVfCgf9
	 nqmQmPALnblK+vd3hNTbHnBpT/tHE54zK9qUH9ZfPmnCRMY27qd4fbFkGtLwD9QhOU
	 eIEwlgzkiKiLUzcllc4eOHLN+sp0ktb8B8PZ8tMUzykVfgBVDun8vlmr/Z/8fZ3Vum
	 X1w7jwOD47Hg9/2fmh0RNecJ4d9ySOqritHf8YOnTWOLGj+Nkcs7ht3yRzYJLMKyKA
	 P4srdqlC40lsu3ewyKoV8m0O7lLWyU8HwILHnhbg9EyNt9amfTbujJ+4EnYx2RzH2M
	 J03gIUFGxmDiw==
Received: by mail-ot1-f47.google.com with SMTP id a109so2110020otc.1;
        Tue, 12 Jan 2021 04:34:42 -0800 (PST)
X-Gm-Message-State: AOAM531Kj5i+cXWWRyUr+LseGE0V/513cPmKNib7l5LMBQa6UHohJedD
	O+LRkLHP3C+bq6wB9Z2k1L23oOp79Vy2ONDOSR4=
X-Google-Smtp-Source: ABdhPJxAxO9YMRZ8cVHtUw+FEsUXGZaHiNxtXuSB9jTtZ5GjpLFHXlMFbSOsKNGsE7bGI0UhdO/FdFstMA8zh17bsG0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2597610otm.305.1610454882061;
 Tue, 12 Jan 2021 04:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com> <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
 <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 12 Jan 2021 13:34:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NkyThRA5YYGb=8DczksE7V5uPhfqO1O6TEmdiJ28ZJw@mail.gmail.com>
Message-ID: <CAK8P3a0NkyThRA5YYGb=8DczksE7V5uPhfqO1O6TEmdiJ28ZJw@mail.gmail.com>
Subject: Re: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 12:02 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> > On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
> > <misono.tomohiro@jp.fujitsu.com> wrote:
> >> >
> > I think this could be simplified into a single write_sysreg_s() with the
> > register number calculated based on sync_args->bb, rather than duplicating
> > the same three lines six times.
>
> I think msr/mrs instructions needs register names at compile time so
> it cannot be calculate dynamically. Or am I misunderstood?

You are correct, I didn't realize it was implemented using a string
concatenation macro and that an inline function version would be
tricky.

> > > @@ -164,6 +386,7 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
> > >  static const struct file_operations fujitsu_hwb_dev_fops = {
> > >         .owner          = THIS_MODULE,
> > >         .open           = fujitsu_hwb_dev_open,
> > > +       .unlocked_ioctl = fujitsu_hwb_dev_ioctl,
> > >  };
> >
> > All drivers with an ioctl interface should work in compat mode as well,
> > so please add a
> >
> >        .compat_ioctl = compat_ptr_ioctl;
>
>
> A64FX does not support 32-bit mode (aarch32 state).
> So I think unlockd_ioctl is enough or is it better to use compat_ioctl anyway?

It's a good point that this is not supported, but I would suggest adding
it anyway out of principle. It's better to always write code in a portable
way even if you do not expect to need the portability.

       Arnd

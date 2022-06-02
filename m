Return-Path: <ardb@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD0C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 13:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6FC4C36AE2; Thu,  2 Jun 2022 13:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD866C341CB;
	Thu,  2 Jun 2022 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654175933;
	bh=5/p8dmgrGPA2ZsIPjOx4+AwbHaan9APIR7Tpm6W6rt8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FN2sF6HvAolkidDJaqp2kZlxWl/5afYy7jUO3bSP1tdy+L526ThqL/pS27x+FrJDA
	 SmKkgAp4m00bXerO1FnHQt/wFsb19k/SqeFx1xfkg5YJOtdpj0D3GxMxFlWg6jMEse
	 HJW9guV61r1wyjaesbsOnCX582BFnbZNSFHrqj7Rf961HL2LR2m63+1LYfDeSXy3zz
	 +WT/auDdOu7jjfjigjBEbAAUtivYxdIDK7v5P8LE7GbPlQDjgKU+ji5l2g1uaXlkAZ
	 tomIrihsV1zujUUc8BU/FxDh9LbYjkyxSqjBQwe8YrRyl6DX+h5CWxOXgVWgJtmETZ
	 RY/gRE3GQRUrQ==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-f3381207a5so6709430fac.4;
        Thu, 02 Jun 2022 06:18:53 -0700 (PDT)
X-Gm-Message-State: AOAM530xT1K+eIZVHYMY3ulb44AIZdLe1qVodvgwMdlabX9Xv+qf15de
	GAfrhPgqlmZikhV8kmzxtGBapUY7htpaiERb5tg=
X-Google-Smtp-Source: ABdhPJxFsJGO81CYc3f6E0d03J50Q4I8OunsbzbdfEYFCQFSEMWBIauQWtSYSJc3LAxbTKbbs0GWECI//BU8uzok/GA=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr20546037oap.228.1654175932711; Thu, 02
 Jun 2022 06:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr> <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr> <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
 <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
 <74bed19a-713f-1a25-8142-cf32984beada@I-love.SAKURA.ne.jp> <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
In-Reply-To: <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Jun 2022 15:18:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGJCuJtgW9q-Dv_VcE9W1OFJHcO7bhL=Yz1oz_+gA_VrA@mail.gmail.com>
Message-ID: <CAMj1kXGJCuJtgW9q-Dv_VcE9W1OFJHcO7bhL=Yz1oz_+gA_VrA@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, 
	Rohit Maheshwari <rohitm@chelsio.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Jani Nikula <jani.nikula@intel.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jun 2022 at 14:12, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jun 2, 2022 at 1:21 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > On 2022/06/02 16:38, Arnd Bergmann wrote:
> > >> But let's cc the tomoyo and chelsio people.
> > >
> > > I think both of them work because the structures are always
> > > embedded inside of larger structures that have at least word
> > > alignment. This is the thing I was looking for, and the
> > > __packed attribute was added in error, most likely copied
> > > from somewhere else.
> >
> > The __packed in "struct tomoyo_shared_acl_head" is to embed next
> > naturally-aligned member of a larger struct into the bytes that
> > would have been wasted if __packed is not specified. For example,
> >
> > struct tomoyo_shared_acl_head {
> >         struct list_head list;
> >         atomic_t users;
> > } __packed;
> >
> > struct tomoyo_condition {
> >         struct tomoyo_shared_acl_head head;
> >         u32 size; /* Memory size allocated for this entry. */
> >         (...snipped...)
> > };
> >
> > saves 4 bytes on 64 bits build.
> >
> > If the next naturally-aligned member of a larger struct is larger than
> > the bytes that was saved by __packed, the saved bytes will be unused.
>
> Ok, got it. I think as gcc should still be able to always figure out the
> alignment when accessing the atomic, without ever falling back
> to byte access on an atomic_get() or atomic_set().
>
> To be on the safe side, I would still either move the __packed attribute
> to the 'list' member, or make the structure '__aligned(4)'.
>

The tomoyo code generates lots of byte size accesses when built for
ARMv5, but interestingly, the atomic_t accesses are emitted normally,
probably due to the fact that the C api (atomic_read, atomic_set, etc)
takes atomic_t pointers, and so GCC assumes natural alignment, even
when inlining. But ordinary accesses of multi-byte fields in the
structs in question are emitted as sequences of LDRB instructions.

I understand the reason for these annotations, but I think we should
drop them anyway, and just let the compiler organize the structs.

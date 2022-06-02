Return-Path: <SRS0=2b8X=WJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C35DC43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 12:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8904C385A5; Thu,  2 Jun 2022 12:11:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0A7FC3411D;
	Thu,  2 Jun 2022 12:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0A7FC3411D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWzbr-1oGqwk2H17-00XLKm; Thu, 02 Jun 2022 14:11:31 +0200
Received: by mail-yb1-f182.google.com with SMTP id v106so8011785ybi.0;
        Thu, 02 Jun 2022 05:11:31 -0700 (PDT)
X-Gm-Message-State: AOAM532ij+UESfdVT4RwavuhER/g0mLh/CQVHSqPAej4ZjmNmB1PrihB
	7m+0j4MF3wSBO5flfOjwDxxLT40rzNkZYSTwS84=
X-Google-Smtp-Source: ABdhPJxdzkEsdk/cr6/xiJljnwPhNiCbf+6LHxcrbl85hSAm1vRzepzJQWXT9pLy21Z0VxV9G2hS1yUr8gN67lDPmso=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr4808103ybf.106.1654171890125; Thu, 02
 Jun 2022 05:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr> <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr> <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
 <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com> <74bed19a-713f-1a25-8142-cf32984beada@I-love.SAKURA.ne.jp>
In-Reply-To: <74bed19a-713f-1a25-8142-cf32984beada@I-love.SAKURA.ne.jp>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jun 2022 14:11:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
Message-ID: <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
X-Provags-ID: V03:K1:JUGKb81ZNEqiDqbIgs84k69qSGeklRGuo/e9y/keJC5maLWEZNK
 cD4jJ3oWiCiTVpiSDoTx2MZC3gTlZYPTrPYJwL3yfWN9jJ2fxS+rE+c8HOhNPKeU4xWzFOz
 ezabmT/gmIjoqSDGT39uY8isFt6RfEs8srebk9dmoAjc6kXsQVgjbaShRfDxJRtHKN+u0Uq
 XkDYvWrqr2/WYXtf0uM2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BTpem8bWFmI=:79r4t1OeRO004dDiSoA6HI
 Yzr/RQOc9cLQP4OCmirl989euFIjIECWieLIhFtW/XNM52T6dpR/bPI/Ii12/L6AEWVYHJIeC
 6LZms3tFHUVxg1mNhMNFl0tBOje2WB/t1WYWzkFEojiHbUbXWoV++NspHehFRSYghqUjYkJng
 cI4JVR8H+cH31KgPN4kEuyW/Jy/kJ1wo7y6xN1OCcA5ubRy+6yf96RKuuob6ae1OsX1LjvkIk
 /WE1FdozDeAfdnq/Xmv5Vpw+/9ZPGbM50ttmle8dwnMmQ8jm9HCBVuE4G0PR1Ms6tWYZgueaU
 iGKWUSqu7nM0BjN9FB+89r8MqA2+nOppt6bvnKlSfXU/Bk6FLZI/ADP/EPdW08vt21a5dpnFg
 EdlH2RV++7gjE62VCG23+kkbB1BC4idz4jhub3NfjMBDVoXaTC05Lr0qT5tm0vCKHFro8xG7q
 oLFxpsmSm7SkwA3vH2fN8YsWlwH+14WSMXMEgoEV6p6x+sL8w76nstBmL3z9ygcxe1MuFLPpl
 GJo+oV7ag7uOwwZl+keZ0kMgYqdgJ9HspXA0OPy3bpI+9hPatxQsRyvGFzbod8Un/G9ingo7d
 m0LlM3AstYSt7JrmFrQ/5sC+rvqFS5cwiDT47t3ftIsRgG5Q4R44QHzBFXulthXWqenUW+WTb
 rWon5O9umrggsTykc1GL6N84WLvh4ZRbPkn6aZ621l8dEyDJYpnHVnbJROhO/RnoBXKZMlRNm
 oJJJMDdwg4Ze/nhcWo+FJvmP6xYEh2HwH3Ufjw==

On Thu, Jun 2, 2022 at 1:21 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2022/06/02 16:38, Arnd Bergmann wrote:
> >> But let's cc the tomoyo and chelsio people.
> >
> > I think both of them work because the structures are always
> > embedded inside of larger structures that have at least word
> > alignment. This is the thing I was looking for, and the
> > __packed attribute was added in error, most likely copied
> > from somewhere else.
>
> The __packed in "struct tomoyo_shared_acl_head" is to embed next
> naturally-aligned member of a larger struct into the bytes that
> would have been wasted if __packed is not specified. For example,
>
> struct tomoyo_shared_acl_head {
>         struct list_head list;
>         atomic_t users;
> } __packed;
>
> struct tomoyo_condition {
>         struct tomoyo_shared_acl_head head;
>         u32 size; /* Memory size allocated for this entry. */
>         (...snipped...)
> };
>
> saves 4 bytes on 64 bits build.
>
> If the next naturally-aligned member of a larger struct is larger than
> the bytes that was saved by __packed, the saved bytes will be unused.

Ok, got it. I think as gcc should still be able to always figure out the
alignment when accessing the atomic, without ever falling back
to byte access on an atomic_get() or atomic_set().

To be on the safe side, I would still either move the __packed attribute
to the 'list' member, or make the structure '__aligned(4)'.

       Arnd

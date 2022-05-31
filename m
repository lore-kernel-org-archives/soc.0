Return-Path: <SRS0=Oqyp=WH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68CC433F5
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 08:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98374C3411F; Tue, 31 May 2022 08:04:41 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8CD9C3411D;
	Tue, 31 May 2022 08:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8CD9C3411D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MyNoa-1naqfx2bgi-00ygNz; Tue, 31 May 2022 10:04:37 +0200
Received: by mail-yb1-f171.google.com with SMTP id t31so9667058ybi.2;
        Tue, 31 May 2022 01:04:37 -0700 (PDT)
X-Gm-Message-State: AOAM5327aE9tun/hYgFdCPlzUDqqNzplk28tVXYCblkeXldi0RDUrWi5
	Yt+X6FomxoaTB9H+hDyFa5MFJD4xkgvIIO8Ye5I=
X-Google-Smtp-Source: ABdhPJzullwHURqjYFLuUbj5z3ZAXSH5S2TTm7eQzxfj3C4Cw8NUJrDyWWQCTyWhoCHKYMFfEK0FxV85gP8hLdTej/I=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr8172776ybc.394.1653984276242; Tue, 31
 May 2022 01:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
In-Reply-To: <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 May 2022 10:04:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
Message-ID: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Julia Lawall <Julia.Lawall@inria.fr>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lVf/iRLj3GyzyL9nhxNqtqg68UK1tltwexXj0vLgdMYqJC4vLeH
 aQS5Q66RBX3lqKRuTTUmqv7ceoYvUMxhcnnCf/qP/UY7G4mq6OvdZJdvyL4Xsvmt3YbF9A2
 SQxG0SAhJOiX/ynTcxkAt6ASbPMnS5CdsF228TxCBa9pAinaqB2xlc45m+9AoQg9eH7ThaO
 hJCeeV28v79ssoValVqHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lHtyjOABTvk=:RGi7l39Frrw/dhAOvsGwLF
 nzbfcUDBxPl5lj+A3o2gogSDDOO4oDaEl3z+ysG5drooCqVBI+6oNV3tPk1Uy3ZOtEFb+iJIx
 srVIeFbn5cr5Mf3P7eHTPdEuxitxKI7CnfWz/gqE4jSEoEeRMEcxirPs8YzErJunvX1YjSUYK
 GupkOQwwrU/87Bd9W40d+ZQ4t7X4Awf0+b3/nYZ+1l+fcGMzAnpwjhNktl5b1rX6SpqyDzQGT
 vkd1yFz7RzbhzRLPtrcP+rldP3gBUK+61MHMGMV/Wz5cns0dg4v2dUNNMrYR1ZIQRacCYZB0n
 1B9so5qHw7Dq/ADFFstJ/my4j8GlF74KLOKdVcCFlbHXLJxQOsS452O41ijDO0RKWz0/Rs8Ku
 yKFd8csXKawZXE/cTuxPMgeaJn/fsZxci8PjItMnQpNn7M6tkBNYekCWjzeTM6zZmoTQSr20H
 ZXcczPZ/rXla30ff3+HqEbD+h2DrYm4oOonYFimr8a+KR7VqpDhh9ec1ZYK6Nw+vpHEBFIaHD
 qxxA9BZYaMhVvl+6aO/T/gk3F0RVzXoN2gTszQUy2QbW3pdKckRJ4l2jPpA4CGK8Wfh50Uh48
 8PrX5xhzD9w5UzMRjJTNQkSf3J7pEd2Tl7nc0K5e+lY57sKJMqFYWb1GSydAAicQk7jyO3W12
 5TLJXQGiHipNd/53a+8LXBon5JKQ+YBq+rIFYXjRAxbzUawOpY35M27mIII280COI+8hlyTv4
 KsRGwxGIzcQGk3UcQZ3N5uiD4oZQqh+MZeKFDg==

On Tue, May 31, 2022 at 8:26 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
> > On 30 May 2022, at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
> > =EF=BB=BFOn Mon, May 30, 2022 at 4:08 PM Jani Nikula <jani.nikula@intel=
.com> wrote:
> >>> On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> >>> struct my_driver_priv {
> >>>       struct device dev;
> >>>       u8 causes_misalignment;
> >>>       spinlock_t lock;
> >>>       atomic_t counter;
> >>> } __packed; /* this annotation is harmful because it breaks the atomi=
cs */
> >>
> >> I wonder if this is something that could be caught with coccinelle. Or
> >> sparse. Are there any cases where this combo is necessary? (I can't
> >> think of any, but it's a low bar. ;)
> >>
...
> >>> or if the annotation does not change the layout like
> >>>
> >>> struct my_dma_descriptor {
> >>>     __le64 address;
> >>>     __le64 length;
> >>> } __packed; /* does not change layout but makes access slow on some
> >>> architectures */
> >>
> >> Why is this the case, though? I'd imagine the compiler could figure th=
is
> >> out.
> >
> > When you annotate the entire structure as __packed without an
> > extra __aligned() annotation, the compiler has to assume that the
> > structure itself is unaligned as well. On many of the older architectur=
es,
> > this will result in accessing the values one byte at a time. Marking
> > the structure as "__packed __aligned(8)" instead would be harmless.
> >
> > When I have a structure with a few misaligned members, I generally
> > prefer to only annotate the members that are not naturally aligned,
> > but this approach is not very common.
>
> Searching for specific types in a packed structure would be easy.

As an experiment: what kind of results would we get when looking
for packed structures and unions that contain any of these:

- spinlock_t
- atomic_t
- dma_addr_t
- phys_addr_t
- size_t
- any pointer
- any enum
- struct mutex
- struct device

This is just a list of common data types that are used in a lot of
structures but that one should never find in hardware specific
types. If the output from coccinelle is 90% actual bugs, this would
be really helpful. OTOH if there is no output at all, or all
false-positives, we don't need to look for additional types.

> Coccinelle could duplicate the structure without the packed and see if
> any offsets change, using build bug on, but that would be architecture
> specific so maybe not useful.

I would consider this a separate issue. The first one above is for identify=
ing
structures that are marked as packed but should not be packed at
all, regardless of whether that changes the layout.

       Arnd

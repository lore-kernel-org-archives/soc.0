Return-Path: <SRS0=vHxv=WG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF5AC433F5
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 14:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A4FDC3411E; Mon, 30 May 2022 14:27:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C35DC385B8;
	Mon, 30 May 2022 14:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C35DC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MiIhU-1nHNWV3YwQ-00fQjt; Mon, 30 May 2022 16:27:02 +0200
Received: by mail-yb1-f180.google.com with SMTP id p13so7740625ybm.1;
        Mon, 30 May 2022 07:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM532nfH+GZbT02PSnlZ15PqjgJwtkItO5iKv/tfMenc3qAmEjsOSE
	Or0RpFdKxyQjhIhbCM0TfTvYZnHPpnHCOcl0kPc=
X-Google-Smtp-Source: ABdhPJx5T8sAy2mpNYpXUMEEXXq3paGLe37RJlBPWUL37w/VrSqmqA+dX26yPRFsA+fHHAhbaULTIG1qF0gAbTdb1Dw=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr43544693ybb.134.1653920820404; Mon, 30
 May 2022 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com> <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com> <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
 <874k17ru44.fsf@intel.com>
In-Reply-To: <874k17ru44.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 16:26:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
Message-ID: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Jani Nikula <jani.nikula@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rfH16rC6e3OCXx0c19E9pxmA7WpvhUPudm7QFSBJEC8EwICWgZ2
 hrn/9HfO9yBrYV3pAb7FVLXkznxq2H1JKVevhmBVLn8xSEI0ihD3aXEHay3xHdfOggZjs3d
 yApCvWn0CrB41t5ZEwtwUq3nIBODZb2Szs2zinh3Qo0A/RBh6ntcrxt3P7xdf2YLWIvGRxL
 EtoakXag2thndofYiCLHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6mn2n7KO/Vk=:B225vYpzGrxhLfk5pyCsVC
 glXawebVhgdUrTPe5v7JzUeUC3TAnbSbsRoELmF5PZ+VhkiOtgajdYYeve5SxpzAIM47qgu4A
 FYaD/a0wMz0jLd/XOEEXQc6kM5lQMWIPuFJPpJQEsg5oQ7GS20iKu5Y5+AGppFO05Wuig9euM
 FnPni7bxkEBIfbGxh8KhqFW5gkP2ZxrjNka63ba+JMtFc03CApz1dE5H9ztMg/Pqctn4gn4p8
 RtB+ScDumK47Xo2Qt2OlPfTVLKAlkhnumWfDZxjBylN51OMQqtoZbQUHqL9EMgUz9FsD5tJQy
 mCXTZmzXDuE+GKqGDZ6QxGjaBaBNj6NCYIlVNkBht1cTOBiv62kPHhfiTudPbHjz4uUpCrqx8
 DUtHCYp6aBfpKvlYvdRWWvbguDfqqVQb+gZKiXNIlT4XH2901dAA54VqKUiPZMgQwR+NfUV5g
 MYGPghxuZm5cjAnsqcUUtM5CfgaUgLkB1JIJKk4qh552v+Uwk53fFgmLPnpkUIRbbSoViNxlS
 UX7vMNNPmf+VTZx5RCjoG87h80Of0O/jHEzSMX54WgXyxWIddTBd1QdWRmR3aIkB3l+/ni436
 MgBjY8TVzjBcZ/lNBvXDotSEkYkgu5M4B8aLlLCRZpoNkgZlhvpi8tq2njE0C4vr6ECGmwOyj
 jRsCY1zHz7ufsFxbBpSil/k5hT5j6vqDBnwJtBN4CBRDsO86UkULxU608KhoMiPg5lXPKUG8e
 QMENWetbZoo1TztgoWYwAuQ6F8gmJ+s/JcxqG5D8syE71RoplTQfuqqpxWrOAn1sJM8LHp9HP
 cduR6BUpJYH6tjb6vZsnRej8u4LmgVRKhwr7RY8xKSfYOolmA/BcRzIU5GV5TyYvp4RPVGySJ
 cNiRv1j2LWlOxE6uBJ/cRTVVi4+EyqTarcfq7gwzM=

On Mon, May 30, 2022 at 4:08 PM Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> > struct my_driver_priv {
> >        struct device dev;
> >        u8 causes_misalignment;
> >        spinlock_t lock;
> >        atomic_t counter;
> > } __packed; /* this annotation is harmful because it breaks the atomics */
>
> I wonder if this is something that could be caught with coccinelle. Or
> sparse. Are there any cases where this combo is necessary? (I can't
> think of any, but it's a low bar. ;)
>
> Cc: Julia.

I think one would first have to make a list of data types that are not
meant to be in a packed structure. It could be a good start to
search for any packed aggregates with a pointer, atomic_t or spinlock_t
in them, but there are of course many more types that you won't
find in hardware structures.

> > or if the annotation does not change the layout like
> >
> > struct my_dma_descriptor {
> >      __le64 address;
> >      __le64 length;
> > } __packed; /* does not change layout but makes access slow on some
> > architectures */
>
> Why is this the case, though? I'd imagine the compiler could figure this
> out.

When you annotate the entire structure as __packed without an
extra __aligned() annotation, the compiler has to assume that the
structure itself is unaligned as well. On many of the older architectures,
this will result in accessing the values one byte at a time. Marking
the structure as "__packed __aligned(8)" instead would be harmless.

When I have a structure with a few misaligned members, I generally
prefer to only annotate the members that are not naturally aligned,
but this approach is not very common.

         Arnd

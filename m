Return-Path: <SRS0=vHxv=WG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A0CC4332F
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 13:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58D99C36AEA; Mon, 30 May 2022 13:35:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCA5AC3411C;
	Mon, 30 May 2022 13:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCA5AC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNyA-1nSydO20Ns-00oqro; Mon, 30 May 2022 15:35:46 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2ef5380669cso110038247b3.9;
        Mon, 30 May 2022 06:35:46 -0700 (PDT)
X-Gm-Message-State: AOAM530J/waE99pMbD7ScmGOC7o7wSNWiOVRargUWbRIgi9tf96WeDxZ
	yCV462YpwDkeBlQ+w9XWEH2qD2xS2Me6cw3LW4Y=
X-Google-Smtp-Source: ABdhPJxqcrHm9DJ9xalPcS1XKzKpoD6pOtVW3V1SFSsljiXnSICipI3F6JSFJRR63xqJBfk3V3It/sMFGGDe8RlARWQ=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr59829800ywk.209.1653917745100; Mon, 30
 May 2022 06:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com> <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com>
In-Reply-To: <87czfvrwsv.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 15:35:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
Message-ID: <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
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
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CsmxFwaw+d1iIW4MHfCCN6szho+CDYuNUe//F73CM30O4A+r73G
 tZaUZLjwv5Z/PpNKrQVgSXQoK/vY02uy9bgN4wf4D1IwbaRzpv30rlqQvfQNw4gbwSFFAhS
 UzJPVPkE9tJD5WmNxOuHbZbNnD/tTXnVMTJb4kXi/RUxnF/wfqnIGQBrYSvWiM0bXif0U8X
 HPkbeYMVw23Iu3dw9gDtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xFpx6AwoIN4=:AMF7eRhspVd9pas3cNrE9Y
 NiqFCDASQHnC9Mu0H2tqkqSwKpbajIVD2Mz5fW1iNOS6izY6MmVH2jZkpX9gXppI0JEbAOXeD
 IA77Km6jB17AOyefsJCZaGY9KsKAatP9NuAtCr/Vnk5Bf9IyOLKw6FKxkFzTRRzO5VyyA5FHL
 6fV+SFPY/RjsSjy/5lGUHJ0s7HdkhWWA5nH9wvKvn/fYHKtmfHnTedqzz09tvs6zKr60GuSoX
 SwTNL1IhajzdJ3RT9gGUQbRn/NfBQ8K3dDynISOm5Ed0M1+BSMhpTliY2HjWZ5drWWqC1WxPg
 ZBLa+Dfcud4xt7IV70Yzakos0ORoivzGjJliZDw4MnuRt7ZM+nTF3I61ctZsKQ18aCMvEAxJO
 dEbXRulAQwRJB/4MKw29vPXwLenLU4PmaflE9Hxn8frLpEJ+2Naw7ExaKL8+mb2OwJbS9iFoj
 H38vM5mhnXeEhfsEn8WtkJYXrynjjjHx/FL6EiUDAaBo2dVdBf1gjGzcp/DucvT5FP1Q0B0tX
 xFl7YGWTl78ek9Fgsyqdb23LrllULM4EsDcvt5/E/mhCmNIHki3nOIaXRA9ApP7oKutoXGa7v
 5a8HiC11EUY4IImFN8qEzSeAlPrUOgP7BWcevmBv2uGPjzkSIVfM9n5+Q2HWScfpoaBfWUPtx
 fRSIjUtruk6AWW0qe/+stlWYeKN7IcCIKVlFyr90XOCQTLqew1kOqWhSXleRFsOZxrj5UpZWa
 gHW0xz++T3XOkRUHchkK8I2n6rocDJSppVuDGo6ip6G/1HgrVz1kOf2+t+/t2u7xmeGSoRozI
 8hz/tlMIb5+gElhQuaEyOnzRqbcDBdZQXXJu4dE5INnOjna4zFVRzPF4Y/NFfNqGA0ttNfMnm
 Ka3ZRaMijUYrMCY8gJvWqlZMZ3gh9F5pv7nR6z2Uk=

On Mon, May 30, 2022 at 3:10 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >
> > I think in general, most __packed annotations we have in the kernel are
> > completely pointless because they do not change the structure layout on
> > any architecture but instead just make member access slower on
>
> Please explain.
>
> They are used quite a bit for parsing blob data, or
> serialization/deserialization, like in the EDID case at hand. Try
> removing __attribute__((packed)) from include/drm/drm_edid.h and see the
> sizeof(struct edid) on any architecture.

The annotations for edid are completely correct and necessary. However
other driver authors just slap __packed annotations on any structure
even if the layout is not fixed at all like:

struct my_driver_priv {
       struct device dev;
       u8 causes_misalignment;
       spinlock_t lock;
       atomic_t counter;
} __packed; /* this annotation is harmful because it breaks the atomics */

or if the annotation does not change the layout like

struct my_dma_descriptor {
     __le64 address;
     __le64 length;
} __packed; /* does not change layout but makes access slow on some
architectures */

       Arnd

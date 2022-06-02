Return-Path: <SRS0=2b8X=WJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D83C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 07:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DC54C3411C; Thu,  2 Jun 2022 07:39:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95273C385A5;
	Thu,  2 Jun 2022 07:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95273C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3omW-1nnu1z1Ayu-00zkfR; Thu, 02 Jun 2022 09:39:15 +0200
Received: by mail-yb1-f176.google.com with SMTP id l204so6903225ybf.10;
        Thu, 02 Jun 2022 00:39:14 -0700 (PDT)
X-Gm-Message-State: AOAM530kQGvRW+oVzTKO88C6ktYtTkEvTRP4MeIWjCzjy5qjgix6rCbk
	lL6KdOctUWUljBYekw2sNfZCPW2Ven7+gk0zwgk=
X-Google-Smtp-Source: ABdhPJxVfhxEh2sV1U0/oHXedOW7Ij9SWgaqXnw+k1hmmKvq9A8gu2wmdTH5eNlILVHHm3z97S0Z2Co5/rXDXyJX6t0=
X-Received: by 2002:a25:1209:0:b0:65d:63f9:e10a with SMTP id
 9-20020a251209000000b0065d63f9e10amr3777324ybs.480.1654155553742; Thu, 02 Jun
 2022 00:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr> <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr> <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
In-Reply-To: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jun 2022 09:38:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
Message-ID: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Keisuke Nishimura <keisuke.nishimura@inria.fr>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>, 
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
X-Provags-ID: V03:K1:e4j647snQWOHMjeti4IZWr+zBjDwD0mcIPoGUz4K4AboAY9Im5Q
 ua/5Mx7noq7d4dj9iSflXJYhcmEiKaU5f3c/yqjSVqET7QsZU5f8AyEWE/AI8Q9j/QWf0sB
 quFaZu/kCtaqIZY6AAsobTwftsHqxPyYArOaRBN2CvyeuTjyWHWu08eYW+L154g11pdwKBI
 AyedyAxXcxPoHzFSV8tTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fMW7sgixFNU=:j4jwE1iv8z7Lvj72N1aAnG
 Mw8/gIv2M9gdmhW1+o+45lWboDy2NKyL6CriER+GGECJhTmBjj0kagHID+rTja1horKhlAKgo
 ry8Yti7Mq3MHvKvFuzMK4ToKv8jh5OSFycLWrJL4R1FFv/wJYp2r/6wWtNZ5R54W3SxjamM1p
 3tF7HJy18kRsiDKI5bHhv8vwF+l9GnN3ZzBkEQ7q85Vb5hXb5By1VtPOfVlUAp4vV0gVZTG6y
 g1LeTE14gvMmYse0WNBU0+C60dMXIpMjK+7oTvxwqCIo/QW5Yba6Zc7G2loNp48lzndy+2f+r
 F2gvbiHbz+zPi47YBgkkpQVCWtM52rQ2WY0A1bTS3bcmWTDdeOQm70jMPLWIMpIaA3FS8a6Sa
 zc9stq438DSO6tLCOtXS1ufQyAbnIURa0ck0hrAIz+di/VTtJl6ITCDW6PdYNPk5uT8RGrOEZ
 AVrbkPJZzPxBRCLgoByjl+6GpohDNrX5ve3gzgckc9InHrLatKm/vgHf1wIgkubXBt0T+dYP+
 LVK2jDuzNM+tU1owSEhecv+bgMnB4gNEkSNmUV7rSnjxw9CjHgEi1xS427vcWmoPw7IfLcDEh
 Hyv7W/fiV6NIIoLd0/QAoHYJSJm5uknZ51jw8M5WcKcBkzZ/Gsgf3kUzBZy/bJFUpDJ6GMBiV
 eVMJFIp14R0wrHdAY/zGRqyjEw5w0QcdTgfXH8p2m0XllKmsbCymnfKD38qhQiPwdVm1SPc8i
 lvpsAWEsyV+DOjINrZP6VwWly+UvegSIVJK+MnJCM4ODUOz3dh8B0lgAYjWRBJWqIl+nWUX7I
 aLHvlW1HAQExrwGl9wo4MTWpG3CixM8+b1NlxlHh/P/i5hLm1kASKH/61kKr2YS7HFdctIAZ3
 tzVGaMlYLqv3Ec9lFQiNjjz8bhrQcHqkv2+IE4Ft0=

On Thu, Jun 2, 2022 at 3:08 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Jun 1, 2022 at 3:28 PM Keisuke Nishimura
> <keisuke.nishimura@inria.fr> wrote:
> >
> >
> > I found 13 definitions of packed structure that contains:
> >  > - spinlock_t
> >  > - atomic_t
> >  > - dma_addr_t
> >  > - phys_addr_t
> >  > - size_t
> >  > - struct mutex
> >  > - struct device
> >
> > - raw_spinlock_t
>
> Ok, so I don't think dma_addr_t/phys_addr_t/size_t are problematic,
> they are just regular integers.
>
> And 'struct device' is problematic only as it then contains any of the
> atomic types (which it does)
is
I suggested this list because they are problematic for different reasons:

- any atomics are clearly broken here

- dma_addr_t/phys_addr_t are sometimes put into hardware data
  structures in coherent DMA allocations. This is broken because these
  types are variably-sized depending on the architecture, and annotating
  structures in uncached memory as __packed is also broken on
  architectures that have neither coherent DMA nor unaligned access
  (most 32-bit mips and armv5), where this will result in a series of
  expensive one-byte uncached load/store instructions.

- having any complex kernel data structure embedded in a __packed
  struct is a red flag, because there should not be a need to mark
  it packed for compatibility with either hardware or user space.
  If the structure is actually misaligned, passing a pointer for the
  embedded struct into an interface that expects an aligned pointer
  is undefined behavior in C, and gcc may decide to do something
  bad here even on architectures that can access unaligned
  pointers.

> > security/tomoyo/common.h: atomic_t in tomoyo_shared_acl_head
> > drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in key_map
> > arch/s390/include/asm/kvm_host.h: atomic_t in kvm_s390_sie_block
>
> So these do look problematic.
>
> I'm not actually clear on why tomoyo_shared_acl_head would be packed.
> That makes no sense to me.
>
> Same goes for key_map, it's not clear what the reason for that
> __packed is, and it's clearly bogus. It might work, almost by mistake,
> but it's wrong to try to pack that spinlock_t.
>
> The s390 kvm use actually looks fine: the structure is packed, but
> it's also aligned, and the spin-lock is at the beginning, so the
> "packing" part is about the other members, not the first one.

Right, I think the coccinelle script should nor report structures
that are both packed and aligned.

> The two that look wrong look like they will probably work anyway
> (they'll presumably be effectively word-aligned, and that's sufficient
> for spinlocks in practice).
>
> But let's cc the tomoyo and chelsio people.

I think both of them work because the structures are always
embedded inside of larger structures that have at least word
alignment. This is the thing I was looking for, and the
__packed attribute was added in error, most likely copied
from somewhere else.

Looking at the other ones:

include/linux/ti-emif-sram.h: phys_addr_t in ti_emif_pm_data

No misalignment because of the __aligned(8), but this
might go wrong if the emif firmware relies on the structure
layout to have a 32-bit phys_addr_t.

drivers/scsi/wd719x.h: dma_addr_t in wd719x_scb

This one is correct, as the structure has 64 bytes of
hardware data and a few members that are only accessed
by the kernel. There should still be an __aligned(8)
for efficiency.

drivers/net/wireless/intel/ipw2x00/ipw2200.h: dma_addr_t in clx2_queue

Al marked the incorrect __packed annotations in 2008,
see 83f7d57c37e8 ("ipw2200 annotations and fixes").
Mostly harmless but the __packed should just get removed here.

> drivers/infiniband/hw/irdma/osdep.h: dma_addr_t in irdma_dma_mem
> drivers/infiniband/core/mad_priv.h: size_t in ib_mad_private

Same here: harmless but __packed should be removed, possibly
while reordering members by size.

> drivers/crypto/qat/qat_common/qat_asym_algs.c:
> - dma_addr_t in qat_rsa_ctx
> - dma_addr_t in qat_dh_ctx

Probably harmless because the structure is __aligned(64), but I'm
completely puzzled by what the author was actually trying to
achieve here. There are also 'bool' members in the packed struct,
which is probably something we want to look for as well.

> drivers/atm/idt77252.h: dma_addr_t in idt77252_skb_prv

This is a bug on architectures with 64-bit dma_addr_t, it should
be an __le32, and the structure should be __aligned() as a DMA
descriptor.

> drivers/net/wireless/ath/ath10k/core.h: dma_addr_t in ath10k_skb_cb
> drivers/net/wireless/ath/ath11k/core.h: dma_addr_t in ath10k_skb_cb

Should almost certainly not be __packed, fixing these will
likely improve performance on mips32 routers using ath10k

> drivers/crypto/ccp/ccp-dev.h: dma_addr_t in ccp_dma_info

This looks ok, the "__packed __aligned(4)" here can save
a bit of stack space as intended.

I think that SmPL script worked great, almost every instance is
something that ought to be changed, as long as it stops reporting
those structures that are also __aligned(). I would extend it to
also report structures with 'bool', 'enum', or any pointer, but that
could give more false-positives. Maybe have a separate script
for those instances embedding atomics or spinlocks (very broken)
vs the other members (causes more harm than good or might
need alignment).

       Arnd

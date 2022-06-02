Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BB9C43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 01:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11AA2C34119; Thu,  2 Jun 2022 01:08:44 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CB3EC385B8
	for <soc@kernel.org>; Thu,  2 Jun 2022 01:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CB3EC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id fd25so4363920edb.3
        for <soc@kernel.org>; Wed, 01 Jun 2022 18:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AMLk7uMNCtOe4gy9/LZgkLZRBX0ALCzfWfzDBXHnFo8=;
        b=OYbmFRcqjOukBt1QgTghY6i5XSE1P4Lt88ABmn7yr1figRBOYiE95+mswItMYHSdNG
         lviOuM27J5QIIeBwiLSJpAbPnwuY91jc54iyDcuCVAnICvUgcOifKGuJEsuhq8aGrj2A
         h1gTJ/7WWYaX/+zmQRNAu0O5nZCrZo4IJc/ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AMLk7uMNCtOe4gy9/LZgkLZRBX0ALCzfWfzDBXHnFo8=;
        b=uSZWMACY+snMycs47Xnk0PvbGLr6acQEDCqxDF/TWunUITrw+Uf8MrTX/Eey1iAQxc
         MpFODasohIquGPumxSCXIWSJNbhi8HWqitnYcetPC1bAXkDh+uHI3IzpV+jPuzEX+kI0
         0k57d6R/g0N7EopjSK0bs/EJXDZISWrnFu2FUPrTApipY++Fm+qMwTAUF4Gzf7SJHDqQ
         v57M7Z740k4lkJOms+IaclObrOXZHsaWvVHDU8K4A19kCEu6iC0YJd/riFQ87qHLc9zr
         1EBEja9MY+EGcAeGd0mEZ6q98i742+IC6fWAiAO9T75Iu8i1mmf+7cvlSr2Gf6MhtJQ/
         5F4Q==
X-Gm-Message-State: AOAM531IVLYrtge4jsb9auAEZLJ2/oD/L3bVjZCfYGW3Xn0dm5bmnHy0
	T9rxY459HERlrIz7kCve2GKTQf7Iwi3BBc7e
X-Google-Smtp-Source: ABdhPJzHLJpFUMSIoxgpVByUtLpbLviQuBuCWU60wVKrAIQgJ/yQreAc90AOohbR9JoaItx8DRwL0A==
X-Received: by 2002:a05:6402:3224:b0:42d:e68c:2fd with SMTP id g36-20020a056402322400b0042de68c02fdmr2666854eda.282.1654132121165;
        Wed, 01 Jun 2022 18:08:41 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id lo27-20020a170906fa1b00b006fe9209a9edsm1202392ejb.128.2022.06.01.18.08.40
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 18:08:40 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso1966229wmr.5
        for <soc@kernel.org>; Wed, 01 Jun 2022 18:08:40 -0700 (PDT)
X-Received: by 2002:a7b:cb91:0:b0:397:3225:244 with SMTP id
 m17-20020a7bcb91000000b0039732250244mr30980346wmi.68.1654132109585; Wed, 01
 Jun 2022 18:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr> <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com> <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
In-Reply-To: <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Jun 2022 18:08:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
Message-ID: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ayush Sawal <ayush.sawal@chelsio.com>, 
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>
List-Id: <soc.lore.kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>, 
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

On Wed, Jun 1, 2022 at 3:28 PM Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
>
> I found 13 definitions of packed structure that contains:
>  > - spinlock_t
>  > - atomic_t
>  > - dma_addr_t
>  > - phys_addr_t
>  > - size_t
>  > - struct mutex
>  > - struct device
>
> - raw_spinlock_t

Ok, so I don't think dma_addr_t/phys_addr_t/size_t are problematic,
they are just regular integers.

And 'struct device' is problematic only as it then contains any of the
atomic types (which it does)

> security/tomoyo/common.h: atomic_t in tomoyo_shared_acl_head
> drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in key_map
> arch/s390/include/asm/kvm_host.h: atomic_t in kvm_s390_sie_block

So these do look problematic.

I'm not actually clear on why tomoyo_shared_acl_head would be packed.
That makes no sense to me.

Same goes for key_map, it's not clear what the reason for that
__packed is, and it's clearly bogus. It might work, almost by mistake,
but it's wrong to try to pack that spinlock_t.

The s390 kvm use actually looks fine: the structure is packed, but
it's also aligned, and the spin-lock is at the beginning, so the
"packing" part is about the other members, not the first one.

The two that look wrong look like they will probably work anyway
(they'll presumably be effectively word-aligned, and that's sufficient
for spinlocks in practice).

But let's cc the tomoyo and chelsio people.

                 Linus

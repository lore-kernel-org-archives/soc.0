Return-Path: <SRS0=vHxv=WG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C85C433F5
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 12:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94646C3411A; Mon, 30 May 2022 12:44:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 181EBC385B8;
	Mon, 30 May 2022 12:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 181EBC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1My6xz-1nbUIm2Uxj-00zVQ7; Mon, 30 May 2022 14:44:03 +0200
Received: by mail-yb1-f176.google.com with SMTP id a64so8583833ybg.11;
        Mon, 30 May 2022 05:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM532Uv0hpe+yoh/FFmYyHePvmiDYarIK0QnmwSS++5Vsn18HtzTlN
	dx15ZvqlVFOK1ElQSNDGafSieyzg6eDUwb9r9Zw=
X-Google-Smtp-Source: ABdhPJwGhDH7TTQEFtfKClpkV8v6MgE6/PlkkdchHiAR2sctlXWrlvyx8XgWbwbNazMHWQ8TgK10FAziIIsvzr+V4hc=
X-Received: by 2002:a25:9b89:0:b0:655:8454:dc92 with SMTP id
 v9-20020a259b89000000b006558454dc92mr25317431ybo.550.1653914642134; Mon, 30
 May 2022 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
In-Reply-To: <877d63tleq.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 14:43:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
Message-ID: <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Jani Nikula <jani.nikula@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dpD3ZsYY1OsV5vrsnWlBQSIXp+LnKO27QFblgf9tWU3L6/1VQN1
 vpVVC0uGd9On5a72XIUPVreyqqg1hMpnry/3Q7WnGOqjfbsAA2/+ZEj2Ma0kNSLhvmqhDbF
 qOvzGxr+I88TjKpDl+bshmkGljEylixZvCb0nmeUbTmEcCzCAYa1Cc1vgOnMgMBjq+/f7al
 HGW6ZynflOatjqaUTxwEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qsaauFMN/m8=:gc6ft9ct6Vhm37uDI2VbkX
 iiY5dXW+r7NHfMunFRQIuA+jHRtjKIFqcYXkOUhGu9bGeplhWwfCWA6tQNdsQ0pZfAMXrr8zE
 9RroS35Q8Jnh0HBYEXbvtIZXaBBGXAY54+rRDzZyAFIwNxctYpjL0EK7bcTx7u42gT/VoXrND
 6tCzv3jOs5Eu/A5WwxSdeQyZXu1A0RRQHNMFfVFXovg0X2hn/Fi7EktLCuumIQRQcFiqXtNsL
 E+mCGEdTa9Kp2ceQEt864lF5D2vp/Vdze1yZtle8Uy37G1tZldwZjLDfk/HF7Kt+fpTxNe41V
 jKIgVu/rj8j6T6l+mcIidvd1K3xp0phiXCx92+Rdtn2AaOnnoMhk/b78f/xhMV79UUFk4QzqA
 LL9fHZnCFVnFJn8USS94djCE3Lz2hUTDokhY/YghxB4Zqg+7VMq61pOKgyW/lEaGraMtu6LAe
 Hoyo4SleAmqUJQ58/Kj/sP38vf2Qj2MgHH75XeraDtGGKtygAKUINe+oRdw0CLKKKTiT20sHp
 SxTTc8OguSkolUyKiSBGeYh4Tu9v7Bd0ywYoVF5I2+F9TkKFbajHTIh6bi5ZSRUnQplBb/H1T
 hIbgeXx7h4BREc7o+QKDLZkOyAMuaU7b5GrXzh+m7BVrIgvNz5O290prNH0WuCBFFwU+bt0aM
 wpZcD5ljFXA9gNgM2guqAbyjI8c1SqvFIDYPLiNGJ3fU0/QB1Ct+5u1icFKDKGwhRyYWb8kFF
 w0bmzEKkSHY2ExhXUt0nKzx0o+Fprt6ibbU/4Vm1cp88XdiQUUd/M1yCgOwh7ZiZ28eGTbQGa
 zW+oTon7m2J3Kv7vTp/8HDOljBxyNUI6KFDufBG9SVDpsPjRc/F5ozX9VVXJF9ZGkUwIunCMF
 /cX0G6leGl9vTGO5d0uQ==

On Mon, May 30, 2022 at 11:33 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> That is, for EDID. Makes you wonder about all the other packed structs
> with enum members across the kernel.

It is not the 'enum' that is special here, it's the 'union' having
unpacked members,
and the same thing happens when you have nested structs: both the inner
and the outer aggregate need to be packed, either with __packed at the
end, or on each individual member that is not fully aligned to
max(sizeof(member), 4)).

I think in general, most __packed annotations we have in the kernel are
completely pointless because they do not change the structure layout on
any architecture but instead just make member access slower on
architectures that lack unaligned load/store instructions. There have
definitely been other cases though where a __packed annotation is
not needed on any sane architecture but is needed for OABI ARM.

Overall I'm not that worried because the only machines running OABI
kernels would be on really old hardware that runs a limited set of
driver code.

A completely different matter are the extraneous __packed annotations
that lead to possible problems when accessed through a misaligned
pointer. We ignore -Waddress-of-packed-member and -Wcast-align
in the kernel, so these never get caught at build time, but we have
seen bugs from gcc making incorrect assumptions about alignment
even on architectures that have unaligned load/store instructions.

      Arnd

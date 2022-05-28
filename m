Return-Path: <SRS0=L8HZ=WE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D11C433EF
	for <soc@archiver.kernel.org>; Sat, 28 May 2022 18:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94860C34118; Sat, 28 May 2022 18:59:21 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BADB8C34100;
	Sat, 28 May 2022 18:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BADB8C34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MqJuP-1nQ2ZK2AJ1-00nSzb; Sat, 28 May 2022 20:59:17 +0200
Received: by mail-yb1-f173.google.com with SMTP id x137so13001054ybg.5;
        Sat, 28 May 2022 11:59:17 -0700 (PDT)
X-Gm-Message-State: AOAM5309SarBLh0afzUAVaBcFBa8mh4mxYgeSGNb2xOoNV2bJ5/OLMjf
	/ZYLOltztHYLVconKBr8nF5yu2fyECbk9iIBd0s=
X-Google-Smtp-Source: ABdhPJx2zeBqlc7izpQrrVjwF/YZ2kHUCwcBggRscS5P/bQsa9aebzHk1lh9EW0TvmxFzizAFsLT6XOMLriNEeOtaNI=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr45525900ybx.472.1653764356125; Sat, 28
 May 2022 11:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian> <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian> <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
In-Reply-To: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 28 May 2022 20:58:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
Message-ID: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:B9I+AkldOljdYDwnQKLrp/tz4iKYz/nO4ByLqkjCWqmUbwPIdme
 gvfFZFZ9oDstr665gtu+IXKj4+sYsg65Kk6h1oVRKCj3M1lJ7Sj4/3TcS6j61qlbhUAIoQp
 kAR13YkeiYMmstWcVFZY01DGhNg4jiHj32xSrT7NTRPdbzzCzbLsFjAm/Dw/xAT33VrTa2Q
 /jmBY8PqicixhzX3YOjGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8/lB5kAUQqQ=:w209+VLGORczo4Sp752vyq
 X7abWGv67G4AW40zZOtFY5wdNWmLNrOBNLxoR4bDOUzhUKrqwo/MD1/hZ9n3Hz6jiiTVzc4Om
 sF9Z/su69wkUt7st2649KHYPxUrvt/CyubUURrQnbQoeMdiFx5PrpW059VCgDgiaaGhDcWFdV
 6qYEN5MIJX36ZFh5r3u1+2NkLh9Zb5uWR0H4Ll4AQF3jvx122rbbn+9aC1RkSCV1rkH7JM//5
 U2kfPCayjEDlwOlQNydFBxw6GlzUpRcA2Iq+mYBNpDwSq1DdSuBm5DxJ9luV76bqrR3NUkVa1
 UUOOTnUpsknm92dAwJrugMHK1skBVu61ve6fsH7vsq9pSOy1DD086Hjsby7Rup/FdykIWgjJh
 hfAudynhPAbMFxbPCIZ3K1WZ6sMKO7UCQcJ03TPqG3+73ZWP+F5jRzWXUplKl1DN/XWhtyziB
 UsVaBodvjFTgrtw7shqndOPLthe7HGgl0LGD2/uKaAtU3hvc4iGyCZ6zIKhMUV2M1QN24dQLz
 228DIIn311dON5isFgd5T7fInzkfs2OxgP5hhH6OQ3QXd9HkJ/fVhZjbVP7elZNaVdTj6FeRU
 XFkIQfM70GeStATYr4XTpUAEt6ReHF4rTl8v4Jjr99dkgPMleNxjExueymq8nl5KjZL/GTs09
 FErR8q6mfUTCYgAU8w63OAQfcQjfgL4x1aeTmiVcEvQYXVAHCeBzC+8u4wY6Zfp7ah00kDfzw
 tWJsysTPfNfX77xDVj1epa2z2CAbneoS6CWM7w==

On Sat, May 28, 2022 at 8:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Not very much tested, and I have no idea what it is that triggers this
> only on spear3xx_defconfig.
>
> Some ARM ABI issue that is triggered by some very particular ARM
> compiler flag enabled by that config?

It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
option, you the kernel is built for the old 'OABI' that forces all non-packed
struct members to be at least 16-bit aligned.

I think Russell still uses OABI kernels on his oldest machines, but it is
incompatible with all modern user space and should probably not be
in the defconfig.

Your patch looks like the correct solution to me.

      Arnd

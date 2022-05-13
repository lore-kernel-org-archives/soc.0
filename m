Return-Path: <SRS0=kMA2=VV=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A48C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 21:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C165C34113; Fri, 13 May 2022 21:08:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B2FEC34100;
	Fri, 13 May 2022 21:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B2FEC34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N7iKq-1ntJhb2Ply-014oUf; Fri, 13 May 2022 23:08:49 +0200
Received: by mail-yb1-f171.google.com with SMTP id i11so17304684ybq.9;
        Fri, 13 May 2022 14:08:49 -0700 (PDT)
X-Gm-Message-State: AOAM531ZdDFwQKO1atdxOCQtK3XNc7Dy1Hgh9ZbOFKj7hHW0Q7FxfmGc
	TJkgdZPQp7hwG7O9A5LmqAGnviM8dwyud6lNOxc=
X-Google-Smtp-Source: ABdhPJxGsYcgRxijDnAxnaZBV41piMiw2krrZa+hZlLUYVk0W4WHqmiRXBg7o8Dt3FWJGLxvwNMsBXyok0kIZoLSF2c=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr6794203ybf.394.1652476128026; Fri, 13
 May 2022 14:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
 <CAK8P3a0iFq3X6PrLggc=Av9GdWnJU=US659jaUXqH+X4GnbYTA@mail.gmail.com> <942eb0ea-3376-f891-e8b2-a57123ddccd7@gmail.com>
In-Reply-To: <942eb0ea-3376-f891-e8b2-a57123ddccd7@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 23:08:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3-zN3Dn8LeWTDMszGdh0ogAt+t45Z4vyVqi2csFJWaEA@mail.gmail.com>
Message-ID: <CAK8P3a3-zN3Dn8LeWTDMszGdh0ogAt+t45Z4vyVqi2csFJWaEA@mail.gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT updates for v5.19
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yong Wu <yong.wu@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Evan Green <evgreen@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LEEnKBKEae0p70J4qXG0v2+JjDLb30kLQuTGcc7meyUp75F6Tq2
 qaRkyZqPb6Flj2xVw0rIMBKnoMGjMB0OkX+Nw/HC3JSUIVCz9Mg9JwCoPnLjItJDE/MkJ7z
 fVK6fiLmsggMFvqCnXPZBH2Cn/KpUym+Btb8c1MlguY9i9Tu6uWks0fMfGNh2KgQR+hclxp
 LaAdW3DErFI3eJzYjxJgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FEbB13WE69w=:QHo9dWDjm/0ArbXyRBFTAl
 mueR98gH0geydIdZbEMsHNejxY+rNlu2b0KCIDZO3AEMmR7nUf5hgedvhdLnsktfCPcQ+T6rA
 FtIU5b5zeJuc3jtVngEnlfExc0ZgUz9xV0p+YC2UYY2cxWqmjWp66OIhn1Pw8UD+VpocX94aO
 ajI1ZPcXUd/6+l+Jt8F5yMzzfJvo7cMcYYnnuhGrTmyiA4UKr/tL7Qtvpt7kAt+6s0/yP8KNQ
 vrMWCBA+LxezDkiUQBXmaqjdT6P7J93UoM6vBUh1eso9mx+zR2vpGfGYgw+CXVm7hCmBJwpiE
 +gKqS7B4acF60wZublyiWZ8TVRVV/qNW73bW5CuLxyq7HLJ0XOaV3ZPVW9HMsVDAbrfgvwOUJ
 ZvkbL0did08j9dcVgf4jrPC+vd+7KyxEv5SAFew4p6ocNPcAHOoPfPGnqYcBdclW+CoxZ9rQn
 w1SzIdJO7M7wI1BRyzHuupNHPFs2tBgWaHW4ylzHDd2pCLCqDsreQ5n5wV+DmZEqppcHeE5s3
 GrV0kqBWJU67f7iURXfObxcziTK/Cbc13R+9pyZx42vHQmaVJysStrgBRgboirxybWKAZNzST
 IpLf7HNyYp9iuDfUj03uExh9Y2MQrX21MCwF/RnVihc4uBCErYvyEO09fSbXrApt6g242KcAs
 ELYV/snFs+KGbYhydEQY9cE8wcvqpGidHw00I+I9BpZunARg2Fx/DypDBpOHr8N38UeVpQnSW
 w1NQIfQOqgXv3aoK47L4/CwgO6S4VgQpCnvPrR1KDfF5wXeGluKh4KQtkEIIYYjZl8lcI3Jzj
 4Agco7CI5ZsFo4y32t4pvA/gin4HBoAsZA+TNRXcm0ilpXkcSM=

On Fri, May 13, 2022 at 6:06 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 13/05/2022 14:11, Arnd Bergmann wrote:
> > On Fri, May 13, 2022 at 1:21 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >> Please have a look on the below 32 bit DT updates for v5.19. Apologies for the
> >> late pull request but I got sick and needed my time to recover.
> >
> >> Yong Wu (1):
> >>         arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
> >
> > Can you clarify what this means for backwards compatibility? I see old kernels
> > used to parse these properties, does that mean that the updated DT is no
> > longer compatible with them?
> >
>
> My understanding is, that backwards compatibility is given when using older DT
> with newer kernel. This should be the common case, normally you update your
> software but nearly never your FW. No compatibility is given when using older
> kernel with newer DT.
>
> I think that's an ongoing debate if we should provide backwards compatibility
> for both kernel and DT.

I agree that the case of old dt with new kernel is more important, but I still
want to hear about it when the other case (new dt on old kernel) breaks,
and why it's done.  There are clearly use cases for both forms of compatibility,
and there are reasons for ignoring them, the key is to communicate it clearly.

> > If you break compatibility, this should only be done for exceptional reasons,
> > and explain the tradeoffs. What is the oldest kernel that is still compatible
> > with the updated DT files, and why can't we just keep the properties around?
> >
>
> First kernel version that does not work with the old DT will be v5.18. This
> patch is the outcome of a change in the yaml file [1] which has a Acked-by from
> Rob. I double checked and I wasn't able to find the mail where Rob did give his
> Acked-by... Yong, can you provide a link to that email? I can see you added the
> Acked-by in v2 of the series.
>
> One thing that comes to mind, that we mark the larb phandle as deprecated in the
> yaml file, instead of deleting it. Then we could keep that in the DT files,
> although newer kernels won't work with that. Another option is, to add the code
> deleted by
> ba3cd6714aed ("media: mtk-jpeg: Get rid of mtk_smi_larb_get/put")
>
> back as fallback for older DTs. Although I fear there is much more things to fix
> in a lot of drivers. DRM, mdp and memory/mtk-smi.c are some that I found in a
> 'quick' look at the problem.
>
> Taking into account that and the fact that we are talking mainly about
> chromebooks and the Bananapi R2 as public available HW, I think we can live with
> the compatibility breakage of newer DTs not working with older kernels.

I'm less worried about the dts files that ship with the kernel than I am about
others that have custom dtbs built into the boot loader but are able to
run mainline kernels. Upgrading kernel and bootloader together is painful
here when you have limited compatibility with older versions, in particular
when you cannot dual-boot multiple kernel versions with the same dtb.

> Anyway as you can see, this patch is just the tip of the ice-berg. So if you
> feel that's something unacceptable we will need to chase people to fix backward
> compatibility.

After some more clarification on IRC, I found that this series has been
in progress since 2019 [2], and as you said, the changes to break compatibility
with pre-5.18 DTB files are getting merged through other trees, so I suppose
also breaking compatibility with old kernels isn't making it much worse.

I'll try to capture this in the merge log.

> [1]
> https://lore.kernel.org/linux-mediatek/20220117070510.17642-2-yong.wu@mediatek.com/

[2] https://lore.kernel.org/lkml/1546318276-18993-2-git-send-email-yong.wu@mediatek.com/

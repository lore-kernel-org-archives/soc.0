Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9344EC433F5
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 07:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B66DC385A5; Wed,  1 Jun 2022 07:41:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D30EC3411D
	for <soc@kernel.org>; Wed,  1 Jun 2022 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D30EC3411D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f83983782fso9244127b3.6
        for <soc@kernel.org>; Wed, 01 Jun 2022 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9rheSKGCTBtpKVSuVWbfcC85G3s1vKpAYLbNOEGXq2w=;
        b=E9sAJi+xs2Mm03yGA6s/AoSrSPevJMqIGT2BQTUevPEAEGTCsIxg0a/Iuc+b0bBBwY
         2vlAWzqS5LyF/jTeTR1Uq2qqIhOt/UX8kSVWTx7ZwHWH+f4CClYERQzkOilRpQWjco8S
         /sPjedyjBxMLf79M6ixkpwryNB/ul+E7heP3Mgrqe0t3QcOQNywRp644FUBDU0stO3no
         ex63/anNFl6HSZkzeOQXZPPjvBhXCupe/xz/vZOrKFEE8ZSjwb/+odbCYE0LJu73dJVm
         dzP1Pd9gSGm9sf8HqAyyoaoNrhxN6NuexXeYCYx376Z1oNH2LQhLOGNAK9HXVs5FTOlt
         9siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9rheSKGCTBtpKVSuVWbfcC85G3s1vKpAYLbNOEGXq2w=;
        b=zKrNiwdWdQm2xfxdMrEpOuTTSFQy1Zl2GO73MvWYIp30LPFmT08saainyN8dNFNvAF
         5oVCevjV2DGwo2beyVHJQMjwZG08WRkYuqk7hCsq2GKBG8z6j/y1tWAsrEJ59jdNoGzM
         GLB4yf8Exx8MOcuRBFYi2R8f9hFl2wVcB65URNjTbj+r5Uncyr+7yuiztU+AqRxWcK0h
         Y0fRqsvIZL+w7s0MO7aiJAr7peFhMoZUGEQCTV1+zXF/Y5b2byO4fuLzl3Q6rrJ2eBGJ
         ZLwavUa4geZTigI0kHnQtmGT6GxBOsqXZ2B07v+J5/IvBpbmUPkwjHc013TopEh59ypj
         5bqg==
X-Gm-Message-State: AOAM530CZUyMcrNiPxJayvUoeCYr2HwkDpGo5c8MaAOWG3xHeicNFY7q
	VwqkMJvC9KNSbnBErvBokG0D8JkeeoXTG51t73SpjA==
X-Google-Smtp-Source: ABdhPJywjnPzsFmV/WK0FsafZUCcTQrgNC9tqpaPDxQlkXD7h5p3xgdDtJADfFFI/ozFpTRFKWaAlbcq4ep/jBhN7yg=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr39945959ywd.231.1654069264520; Wed, 01
 Jun 2022 00:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220530130839.120710-1-pan@semihalf.com> <20220530130839.120710-3-pan@semihalf.com>
 <f789afb2-33c5-2b28-5ade-0c76ebb7206f@linaro.org> <CAHNYxRw00QraVW0085xO-qzgGJdZ2joukuSYzBQo+yjLnkD=Tw@mail.gmail.com>
 <e4ef2056-c990-b308-a9d5-98f11ac0ba51@linaro.org> <CAF9_jYR=sjP9wYW9wyfbrVYO4PDYTfMhjvyyh53U3a3+2Zyw=g@mail.gmail.com>
 <b8a770fc-d72d-efd2-a7a0-8bfd44308576@linaro.org>
In-Reply-To: <b8a770fc-d72d-efd2-a7a0-8bfd44308576@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 1 Jun 2022 09:40:53 +0200
Message-ID: <CAF9_jYTdDuaCFcD33wL5m7AXU+xOgwP14himAqiJoxemd1ESyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dts: socfpga: Add Google Chameleon v3 devicetree
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexandru M Stan <amstan@chromium.org>, SoC Team <soc@kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 5:36 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/05/2022 16:47, Pawe=C5=82 Anikiel wrote:
> > On Tue, May 31, 2022 at 11:11 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 31/05/2022 03:20, Alexandru M Stan wrote:
> >>> Hello Krzysztof
> >>>
> >>> On Mon, May 30, 2022 at 11:56 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 30/05/2022 15:08, Pawe=C5=82 Anikiel wrote:
> >>>>> Add devicetree for the Google Chameleon v3 board.
> >>>>>
> >>>>> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> >>>>> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> >>>>
> >>>> Your SoB chain looks odd. Who did what here?
> >>>
> >>> Sorry about this.
> >>>
> >>> It was mainly Pawel but I did some small changes at some point before
> >>> it landed in our tree (particularly the GPIOs).
> >>
> >> Then usually Pawe=C5=82 should be the owner of the patch, not you.
> >> Alternatively it could be also co-developed.
> >>
> >>>
> >>>>
> >>>>> ---
> >>>>>  arch/arm/boot/dts/Makefile                    |  1 +
> >>>>>  .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++=
++++
> >>>>>  2 files changed, 91 insertions(+)
> >>>>>  create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.d=
ts
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
> >>>>> index 023c8b4ba45c..9417106d3289 100644
> >>>>> --- a/arch/arm/boot/dts/Makefile
> >>>>> +++ b/arch/arm/boot/dts/Makefile
> >>>>> @@ -1146,6 +1146,7 @@ dtb-$(CONFIG_ARCH_S5PV210) +=3D \
> >>>>>       s5pv210-torbreck.dtb
> >>>>>  dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D \
> >>>>>       socfpga_arria5_socdk.dtb \
> >>>>> +     socfpga_arria10_chameleonv3.dtb \
> >>>>>       socfpga_arria10_socdk_nand.dtb \
> >>>>>       socfpga_arria10_socdk_qspi.dtb \
> >>>>>       socfpga_arria10_socdk_sdmmc.dtb \
> >>>>> diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/ar=
ch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >>>>> new file mode 100644
> >>>>> index 000000000000..988cc445438e
> >>>>> --- /dev/null
> >>>>> +++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
> >>>>> @@ -0,0 +1,90 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>> +/*
> >>>>> + * Copyright 2022 Google LLC
> >>>>> + */
> >>>>> +/dts-v1/;
> >>>>> +#include "socfpga_arria10_mercury_aa1.dtsi"
> >>>>> +
> >>>>> +/ {
> >>>>> +     model =3D "Google Chameleon V3";
> >>>>> +     compatible =3D "google,chameleon-v3",
> >>>>
> >>>> You miss here enclustra compatible.
> >>>
> >>> Does this make sense? I don't expect this device tree to boot/work on
> >>> an enclustra motherboard. It's only really compatible with a
> >>> "chameleon-v3".
> >>
> >> You also do not expect it to boot on altr,socfpga, do you?
> >>
> >> If I understood correctly, this board has physically Mercury AA1 SoM, =
so
> >> that compatible should be there.
> >
> > Yes, you understood correctly.
> > I looked at a similar device - the Cyclone V MCV (SoM) and the MCVEVK
> > (base board):
> > arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi
>
> This one is clearly incorrect, so using it as example is wrong.
>
> > arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts
>
> Since it is based on wrong MCV, then no wonder it's the same.
>
> > And there is no denx,mcv compatible anywhere, only denx,mcvevk.
> > Also, devicetree bindings documentation lists denx,mcvevk under
> > "Cyclone 5 boards", and, unless you consider the MCV to be a board,
> > there isn't a good place to put denx,mcv (same story with mercury+
> > aa1/chameleon).
>
> socfpga are not the best example... upstreaming looks incomplete or even
> incorrect, like this case of Enclustra SOM. Much better examples are
> FSL-based SoMs. Although some of them are also not in the best shape.
>
> Still someone might prefer to skip SoM compatible arguing that it cannot
> be a separate final product. Sure, but also SoC cannot be a separate
> product. Having SoM compatible allows to match against it and find
> common hardware parts.

Ok, I understand. Thanks for the explanation, I will add the SoM compatible=
.

>
> In any case you want to remove here parts of bindings (so affect ABI),
> to which I do not agree.
>
> >> Let me clarify - please use generic node names, as asked by Devicetree
> >> specification (2.2.1. Node Name Requirements). There is also list of
> >> some examples in the spec, but you can use some other generic node nam=
e.
> >>
> >> Several bindings also require it.
> >
> > Do you mean something like this?
> > ssm2603: audio-codec@1a {
> > u80: gpio@21 {
>
> Yes.
>
>
> Best regards,
> Krzysztof

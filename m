Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E18C43462
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 16:07:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A6ECA61382; Wed,  7 Apr 2021 16:07:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0247361154;
	Wed,  7 Apr 2021 16:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0247361154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwxRN-1lo1530xrP-00yOxh; Wed, 07 Apr 2021 18:07:02 +0200
Received: by mail-ot1-f49.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso18627970otp.0;
        Wed, 07 Apr 2021 09:07:01 -0700 (PDT)
X-Gm-Message-State: AOAM531kPXg4hcWV97WdppdyJyBQIOsU7hFrRhH76NT2A8iyydvC+QhG
	83T07LEcjWRdgrIWIGRpAc0JSZ19kcRBWfMWVqQ=
X-Google-Smtp-Source: ABdhPJymSQJTahzo74k3DCXqZLabZ7pj1oDnsEr/iW3XDliuXTMvQkoUagOIuZhBUsyHUIVKVPi0LMKTb9enlCKqF4I=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3544860otv.210.1617811620677;
 Wed, 07 Apr 2021 09:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
In-Reply-To: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 18:06:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
Message-ID: <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>, 
	Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bjKm2gmMAadtOOhW4FZA3s/aXGZFiyuNkb7CBScp65MeTvHZXTI
 GtmoTFMwqLaSY9M4BX4pmfsdpwbNQHF+JBt8yh0pSOglWQ54zqRg21goNYHT8arTTqpQDB2
 pB05YyO1P5jck0vtVH/5zZmBljA9AHBsfE9D8MSaQnPFNn3Gzx9OlPy44w2UCMcPYhq5E4Y
 /jZb0IAYWS5g4vsBsRXgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxdWfbg4Mho=:JcuvFp0ftlqR6oqPmHHqku
 p2cCsn47mFVVA88W00dm8dJVQf6oJqiwz7p69uU18ndNidzSrSyoIvKyZ0/8meHnzI3B1MjRK
 HVi+NfKaYT7RKhJQ3Dv9Ras22kIXmXZ8BBT5wNmNorFuUrdDKIBMmgDS6j8LY1Xj1lgOBJs17
 ujVjvNdvQTbYVjrOnhOvWpoAY6GF1TKaRCA7eOJ+vLwf9gElthbViM+NfN64ZVQLydY05bsKQ
 ywzPBuDE5aF8MnKUPVLW7Ayn54qq6zLDvB2qDATUnJhyc4h2XBO2oZzp/TyvnFdNcmzv+hMK1
 3kO46zwk2/ar3hMHxX6Tf+8XHp8WmH24vlwlvavC0GNXxcX15lu76ilFNWvXgpi+awGAuyGLu
 cCeDxJWZJOrcyNOJF8hcvGu3DrYV2ZE5cCuCxv7fZhBAP+EsdgqCIJp1RdpYaB7eyHYy3PsYM
 WeBB1sPpTpzu6U0OLYI3ha+Nw3D0jHU=

On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Olof and Arnd,
>
> Here comes the second round of arm64 DT patches. Hope I'm not too late.
> Basically we add several node to MT8167.
> ----------------------------------------------------------------
> Fabien Parent (6):

>       arm64: dts: mediatek: mt8167: add some DRM nodes

I stumbled over this patch adding a lot of aliases:

+       aliases {
+               aal0 = &aal;
+               ccorr0 = &ccorr;
+               color0 = &color;
+               dither0 = &dither;
+               dsi0 = &dsi;
+               ovl0 = &ovl0;
+               pwm0 = &disp_pwm;
+               rdma0 = &rdma0;
+               rdma1 = &rdma1;
+               wdma0 = &wdma;
+       };


Something doesn't quite feel right about this, and I checked with Rob,
who also thinks this looks wrong. I suppose we need to have a set of
well documented alias types rather than just having drivers make up
new ones on the spot.

I also noticed that some of the referenced nodes are missing a DT
binding file, so those need to be added and reviewed as well.

At this point, I'd prefer to drop the entire branch for v5.13 and have
you work it out for the next release.

       Arnd

Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD56C4332F
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Sep 2021 13:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B80016112E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Sep 2021 13:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbhINNzk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Sep 2021 09:55:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59021 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbhINNzk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Sep 2021 09:55:40 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIKs0-1meQe10PJs-00EPiX; Tue, 14 Sep 2021 15:54:21 +0200
Received: by mail-wm1-f51.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso2167310wms.3;
        Tue, 14 Sep 2021 06:54:21 -0700 (PDT)
X-Gm-Message-State: AOAM5339GGfVI54LJs1caBSiGYG1khp5UI5T3+Dch1O7IQLX2kwtm0Kv
        8PV1Pj/+4B54C9I3DtyB8b6UbJ9AgrsJADcknRQ=
X-Google-Smtp-Source: ABdhPJzfYT9N1FW1riy+N/kpM3JaauBvGO+lf0r+4PKV8dK91NMoj2dnMEb7hSJi/AoxQAwHMqJzn9JWuELlwpKaDNo=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr2356251wmp.173.1631627660743;
 Tue, 14 Sep 2021 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com> <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
In-Reply-To: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 14 Sep 2021 15:54:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers
To:     Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc:     Romain Perier <romain.perier@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:37CR7+fnRwArzmWcbT/2Dmeczil2SoxB7I+W6cPAQ1eACbHISaU
 St2xHbNyDNVGJIoT+9Qg3miicp+R9Byvchps3c02EvVQtANDLaXxoNUISvJqgKpGZT6lPQ0
 78n9Py8VzK8WdA27KvAFglgM2LrZzbVdqEJNpgkKPBzxp41RBK081+YB6LK2l/8d5bSmP/K
 q+s7QXrtu4f9GWe9EiXjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OA359SMSxoM=:m7lO6T0hrrIXBNCONzqS1h
 bO94nRd2iCkscdj8lNFUzjH9T01uclRTvX4VoQZWssmOYpvl7Kj/vTB6M1UqWAI5skqHYGaje
 KKzj+h42efo8nTXKL3FEky7b19QuxLti2X2KptcnA77r7rCX2+QG8HSRk7wcXeG7YgBVWuaaJ
 nzaEnpHUgfWe1BhSZWQ2cMzh4HVaeJjwHQ1cXWIca7FwKBDnZLBvorFRGdtYzU1SdKQcOcKeU
 ptoSIyC8VmH4GBeoroiNj2V6cj8s4B//Mkwp6MiIRtRVJesrX5AldN410Z9ylI4iuRukt7/Z6
 +sPKjjLOOjyg/fRfCWNHjkBJ7EmbQsaYy7alIFcmjnE4FL4J0Rl26FleGMA8unz8UAx9Rf4pn
 YVgbdXSCIlcvuSVZQnb2Pbbk2YGREEXk2oKYCbc89YsFX6sXeIOPbfh8KctRwSynT/BZyRp0w
 7/yof+jpNS3fnGZwQ/sFW2P3uTD30zaj2d2Iq96RYGBYLX1T0IOMoRPP9M4hOvcogG/5MyVeg
 Yba79OLIi6hNyDmfVe1GeT12ihWedNbcHMy+XC3yk5ivuBvLDqVG6fY49kwb7hZ1qVpV+qwGz
 cxTROHX0aiIP0sTl/Y1jSjeaPsFhQUwSj/SI76H5PpG484kXhlH2PUcszjbB7ZQE1B4XTTCQ0
 9f0hoKit1BFGZkLxw9BId6IJkjgAj8GHSqHONSbZswqXatOoWA6t7fGKX61m4lKlDe8lCXzT1
 wYNbK8mlLpcKY7QBr/ZeACRYJ5LcwF0GlVOfnlbYcmz1BvnpomZaKwrVsLEkC01xsBxCRxS0T
 O4YEW7u5zZlvPqgc0UPHVzRFeednBtidZffUymhVo5Fi+clZeWRc3la9N8e8Zamn46U0Yn4df
 92G0hb4OD8cNX4LHvSCg==
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210914135404.GeBs5KXTMZRApwCRDO2BeEE-eIPwaB0uHmQibSim1O0@z>

On Sat, Sep 11, 2021 at 4:57 AM Daniel Palmer <daniel@0x0f.com> wrote:
> On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
> >
> > As proposed by Daniel, I am going to help him to maintain the platform,
> > so add myself as co-maintainer.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a9a7cbf9456..ad1a0e5a5425 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2231,6 +2231,7 @@ F:        arch/arm/mach-pxa/mioa701.c
> >
> >  ARM/MStar/Sigmastar Armv7 SoC support
> >  M:     Daniel Palmer <daniel@thingy.jp>
> > +M:     Romain Perier <romain.perier@gmail.com>
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:     Maintained
> >  W:     http://linux-chenxing.org/
> > --
> > 2.33.0
> >
>
> Acked-by: Daniel Palmer <daniel@thingy.jp>
>
> For everyone else: For MStar/SigmaStar I have a ~350 commit backlog
> that makes almost everything work on these machines.
> It's impossible for me to finish up working out the hardware and clean
> up and push patches without the whole process taking years.
> Romain stepped up to help out and has been pulling out patches,
> cleaning them up and pushing them. He deserves to be listed as a
> maintainer.

Sounds good to me.

One process issue though: These emails were sent 'cc:soc@kernel.org', so
they end up in patchwork, but I'm guessing they were not actually meant
for us to apply from there. I'm happy to take merge these patches (or
a future version of the series) directly from patchwork if that's what you
both had in mind, but for clarity please either

a) drop soc@kernel.org from Cc for patches that are meant for review
and will be part of a pull request.

or

b) put soc@kernel.org in the 'to:' field after they have been reviewed
and you want them to get merged.

Or even better, add an explicit sentence below the '---' line asking
for the patches to be merged directly into the soc tree when this
is what you want.

FWIW, I'd suggest merging the MAINTAINERS file change as a
bugfix for 5.15, it's generally better to do these as early as possible
to make sure any patches reach all the right people.

      Arnd

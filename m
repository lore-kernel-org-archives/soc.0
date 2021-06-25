Return-Path: <SRS0=40We=LT=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E30C48BC2
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 18:43:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 862BD61878; Fri, 25 Jun 2021 18:43:21 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D016460FDB;
	Fri, 25 Jun 2021 18:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D016460FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGQax-1m2cVG0tQL-00Gs75; Fri, 25 Jun 2021 20:43:19 +0200
Received: by mail-wr1-f44.google.com with SMTP id g7so6997825wri.7;
        Fri, 25 Jun 2021 11:43:19 -0700 (PDT)
X-Gm-Message-State: AOAM532nd1V04bWUM52VOUrt2/vT4aIavYUrEnIiLIkvAbmdzWDlJ20G
	gQsJ22uBXSJspiNXYoGXgXsF/XlisoVYHJzJIJM=
X-Google-Smtp-Source: ABdhPJwEXB6pH4EHQ72kI8pnEN58pZxj/e6S9sYcBbs1qDXwS2ssmZPovadGPW6KqNN5AXcIRA/EzxF4GTRTCN5h100=
X-Received: by 2002:a5d:5905:: with SMTP id v5mr13106064wrd.361.1624646598834;
 Fri, 25 Jun 2021 11:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210625095000.3358973-1-mnhagan88@gmail.com> <20210625095000.3358973-3-mnhagan88@gmail.com>
 <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
 <bbf38c31-ed75-69d2-39ed-94f324b1f220@gmail.com> <21e895e9-0211-0c97-5e9e-781e6d2fe6dd@gmail.com>
In-Reply-To: <21e895e9-0211-0c97-5e9e-781e6d2fe6dd@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Jun 2021 20:40:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vHOyFVnBTBpJ9_N8QPtb_dhU+itBXixrL3gjEuGpKkA@mail.gmail.com>
Message-ID: <CAK8P3a3vHOyFVnBTBpJ9_N8QPtb_dhU+itBXixrL3gjEuGpKkA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthew Hagan <mnhagan88@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:d4zABLmXnnVOes83YaBXXGE6gK364bunBG+hJ9PbFx/hU6tj0cp
 s0f7J+iOhyjO+RbyfdAowoiskJKufAKM3OX6UQJQxoYtyHtcIgfl3v/+GucRVpS31suUhlP
 T0Pc5sTUOv2DMBFQsJ1ATPQo9Y94xOQQ7xe/ezuvaXQeae3FZPRksKujaYvlQlMIUxzvZIo
 osszY3fyHZb4N3X4lngxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7P1IXlhUYIk=:2ZKao+iL21wfGUsqQgtdmJ
 /JTbNxHUZ3RwH6KJhozHcahGxsBDLG7X9blzs1kBRxZIessoHDFaEznREI0Ge/emC6CSuk6m8
 Npmz1pBo9cgU5YL009lqRX13i9weXBHDTBwjeZ9TVxODkE0TW1irHreqgfEHUJptXZ500zbmw
 JaqcJjOhKPe8B/riXb5q+eh7yKgfyzB+vxAvzp52/nYze/jKraOIdii+nLyg6/m9RawI0SNHr
 HfJ7ou143yfuwwWMxNPx0WbogdjXfYMUl6M2Ts+cnnOLskLRf6A2cpORTXS8pq6JcqMNG4qWK
 Nk+014ccY0MLoR6u7mUxFBLc0ag4mZxa6qxpfm/DZFvjOIideU/urIjPIWAX/4vBNuvSL8abq
 08qtHnF7deYtKrlCtwpIRZoxd5UHkHb5KkASmOROL0fcEnwxb0xHd3Dzrujnt7X9mlXrpGxh2
 FIwZdkFjLP5LNLggdgMUrnXQi5NwEXBa01zE0rzxLnrXrZ58p0/ORXk51FTq5QSPMo65BTcNU
 5R8y08VNLf28ZlGi4c/SJEt4Ervta3h902FwGcJkVLzKOcYCitBlQm9o1MbiW0UyNYouOE8mQ
 jT+i1Fv6chE6vmzWnKQbxzWhWTPhJZ4+dOs9mcEtqK+mC93pUQuyQxTUd/JgArgRmX7JIJts2
 S02wcPiPZzFdejg0vtT0HmmQIEYihjv76vGi478gX1DVTmhSc3DA6WfXcjKCUUg3CpsuFz541
 oJl5zDMhXq1Sek0xyd6qKWhXriOjZdt6ybjdArYdtXokKvdNbniSxv4fyrKXi6vl8v6r2TVV3
 cz0TLwgvv518zVaYvBCJOOoHz0dbaomPrGaTHa183b/vNBcHcywKd5pUcGf/OzCQd91d8Dc

On Fri, Jun 25, 2021 at 7:30 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 6/25/21 10:26 AM, Matthew Hagan wrote:
> > On 25/06/2021 10:59, Arnd Bergmann wrote:
> >
> > How about having separate bcm-nsp-ax and bcm-nsp-bx dtsi files with the
> > appropriate secondary-boot-reg and dma-coherent (or lack of)
> > properties, which then include bcm-nsp.dtsi. Thus we can also avoid use
> > of /delete-property/. Would this be preferable?

That sounds good to me.

> Is there any way that the Ax platforms could use a small shim between
> the boot loader and the kernel which could all of the necessary DT
> adaptation so the kernel only contains a single Device Tree source?
>
> Using something like this:
>
> https://github.com/zonque/pxa-impedance-matcher/
>
> could be useful.

I don't think that's necessary here, but I wouldn't object if someone
finds it useful and does the work. ;-)

> >> On the other hand, the /chosen, /aliases and  /memory nodes that you have
> >> in the .dtsi file should probably get moved into the .dts files, as these tend
> >> to be board specific settings, even if the examples you have are all
> >> the same.
> >
> > I did not come across any convention regarding this, though there are
> > plenty of cases where the /chosen, /aliases and /memory nodes are
> > defined in a .dtsi file and used by multiple similar boards. Also note
> > in this case /aliases is defined in bcm-nsp.dtsi, not by me. Would we
> > not prefer to avoid having 6x duplication?

We are not too consistent about this, and there are cases in which a
.dtsi file is used for a family of boards using different SoCs rather than
a particular SoC or SoC family.

In the bcm-nsp.dtsi example you mention, I would move the aliases into
the board files, mainly because there is no guarantee that each board
exposes both uarts and all three on-chip ethernet ports. Note that the
aliases are supposed to match whatever label you have on the board,
not what the numbers are in the chip.

      Arnd

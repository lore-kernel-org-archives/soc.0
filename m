Return-Path: <SRS0=7AiC=O7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FE7C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 21:01:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 26DF060F43; Mon, 11 Oct 2021 21:01:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7A260F3A;
	Mon, 11 Oct 2021 21:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B7A260F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQNF3-1mNCXV31E1-00MOdQ; Mon, 11 Oct 2021 23:01:24 +0200
Received: by mail-wr1-f54.google.com with SMTP id e12so60118378wra.4;
        Mon, 11 Oct 2021 14:01:24 -0700 (PDT)
X-Gm-Message-State: AOAM5314PYvr0D6w01bitEg3/d6Movn6qLGRK/n90YH2xf/nRPaLaap5
	04oIlieGNYqdIKPuu2ZBB/LphXmXsqkV19mAzoU=
X-Google-Smtp-Source: ABdhPJwJlum4oCdRbc3gkZC+CU0jqqrsb2c79AL+PGtKmiX7j5JjRUVa5I5C2ZIVTw28c/jHjdNNO1NBcNYOXZnCGJY=
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr1388672wmq.82.1633986084389;
 Mon, 11 Oct 2021 14:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211008034533.343167-3-zhang.lyra@gmail.com> <202110120420.QA3lbmW1-lkp@intel.com>
In-Reply-To: <202110120420.QA3lbmW1-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Oct 2021 23:01:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0bDn3Eu6sTjrg1=vx-jrrvvrrkA7GVVj3puSF28BZ+Hg@mail.gmail.com>
Message-ID: <CAK8P3a0bDn3Eu6sTjrg1=vx-jrrvvrrkA7GVVj3puSF28BZ+Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: Add support for Unisoc's UMS512
To: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, kbuild-all@lists.01.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nFyh4XI8/S+MAe63HsPiBkx/aRX405VXPR4yZZ7PZ433vil6pEX
 38n7GWk41AIZqUYza6iIyqT6iLrJAE+sgwUj/cP8PNe8tb9od7IzyHttHyuhd4ajxPvfSud
 7ZpiCGK4TqOP0AZnoXZRpV8VuePXdqPyawfpAoxHhQZNAB6NNgdkr1ZjSA/cT+6CDyQl60M
 JFSbssM1b9d8VRIOBf3YA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Upbe7CQi8BE=:4i3oo0OBq1o/LwW2W+Jpgq
 RaUB9v2jgpru1xpDHRqF5ZsAl/xdR/eBVuY4B9fCc8eKGOZOdiTKRnhfcSdKX+99YNwFDyPXr
 2lb1Yckteh37uumqeMEwkcoLhu00v09S5W7nRWbiZ8O9q7lNBKT6UggcbfNkxkG4+Ae3pS8ih
 nMjbCtu9nnFCFHnarB+pZxXKfjD+zQj9DWL3zK/BBZE4vDpePZxR9Wsw+lOFbtOvvap+0AY/j
 f0R17f6atzJVf5aFJTRSrWr+pA73dzBj8bUPN9tDNjFeG3nzDwWzE7ThATDDjraIO8FOY429v
 sd/FoxllszWWwlZj/N7ecu3xwOJ/7XkwYaAzuu8aWolWPIDTpBBD1ZmfzcdnUzW2F6dlL4RyD
 3rp7X+ESOq5HRRPXvF4a5iODBOASym6w2beldODEcECgQXspUHr1HxnzpobtcYwStqO1CcroP
 D9Tk4oND/XwLhYuu5sqfD8DE/Qfulq5JOU/CQ3r0yHwijNALH/oYVE1/Mfum43uFywr9fF2nI
 5hgjp1BMOyaa1FuejAY3hNAngsWQ4XfWDhhbTMOU2BSzqRo543u2xQClyermD5VmfFrj8oGUp
 lCAhctoCxHku2rueJNGO5/jty3j9YVVe4IGW/j5A/FwbLd3Qs79LT3/Lcs3wYBHpM8OzFzUwf
 AXF9txqO9kVbOOo5RV1fOxg16Y0cx1HXxfS6/WBM2ZCFkSpKnGsb7XJ0nYAT566jg9j9I58AN
 sZ66CcinH01dNCPgv9j8vmkvUu0bwuxpz7TNMJIcfMBVXJkyGhMS35H/bm4avGZRcFm3Q3RvQ
 1Koc3fBwEYCK2umIHj7V7tfet8fITl9bt/6+gKi1xqpSrzlbRx0vKJLDspMfSRlBlHIZqRPR2
 EytRwCVlJnqoPvcCl4DQ==

On Mon, Oct 11, 2021 at 10:29 PM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/arm64/boot/dts/sprd/ums512-1h10.dts:11:
> >> arch/arm64/boot/dts/sprd/ums512.dtsi:8:10: fatal error: dt-bindings/clock/sprd,ums512-clk.h: No such file or directory
>        8 | #include <dt-bindings/clock/sprd,ums512-clk.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
>
> vim +8 arch/arm64/boot/dts/sprd/ums512.dtsi
>
>    > 8  #include <dt-bindings/clock/sprd,ums512-clk.h>
>      9  #include <dt-bindings/interrupt-controller/arm-gic.h>

Thanks for the report.

Unfortunately I just pulled this, and then a bunch of other things on top.

Looking at linux-next, the binding is not merged yet, which means I should
not take this one anyway.

I'll keep the first patch and revert this one.

         Arnd

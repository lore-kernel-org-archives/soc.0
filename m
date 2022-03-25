Return-Path: <SRS0=LaOI=UE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DF9C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Mar 2022 09:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E72FC340F0; Fri, 25 Mar 2022 09:12:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F595C340E9;
	Fri, 25 Mar 2022 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F595C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvJsF-1oO80y3foP-00rKEb; Fri, 25 Mar 2022 10:11:57 +0100
Received: by mail-wr1-f51.google.com with SMTP id h23so9955567wrb.8;
        Fri, 25 Mar 2022 02:11:57 -0700 (PDT)
X-Gm-Message-State: AOAM532EdeLO3Ug0UsAnPymBPRpAqBSYR1Nv8343MvOqrTrpUEe6fmtr
	ZdzASznrEU/wQXnkAUZNxPw9tEcz3PQFyFs/3ac=
X-Google-Smtp-Source: ABdhPJzlSwDWgsgZpeRugVuvy428D1qgQK8pZuiKTRIYi9OSl8H4ndqwB0mRzcaYHlfTvLPePtNJpSY9MHEOxziK+P8=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr7999785wrw.12.1648199517413; Fri, 25
 Mar 2022 02:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
 <20220324023904.h2qfxzxlznggbsyr@vireshk-i7> <20220324062547.GA15504@9a2d8922b8f1>
 <20220325015849.sazvlevnvdqj5z42@vireshk-i7>
In-Reply-To: <20220325015849.sazvlevnvdqj5z42@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Mar 2022 10:11:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>
Message-ID: <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:M8kSWReg2C4oN6Iwy1Ou0cFZ7/EdZI/IeJVeC1D0RXoOrbmluJJ
 olNnkTYMWDNxgiymStp0W7vDi97oKDNRgBc9Tx1TjmEngHZ9sGvpm5lnAW6Ee55/v6ac76G
 jxVaEUjJ6AcydBb4M0BobDf7Y/V1LCLF+hgPi3V7RFBD7yE49+UDmIMuOrkpZz2rt0TvWQr
 BcQe3JA9ODqGtX2xzGKjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BcUo4+/4YRw=:1ui/fNFX8fvcO9svSw1vhA
 VdeeZakq3kbpiwdqzhWlAG9iDbAsNQ6Pr/OZQVN6qFTkRJ2TWw7CGEBlW5qRtf8cLN07crWMl
 Des/LGYXF85WLpJIyzu/w/6+j6owJpV1B8WOQh0+Qg2RWq3RXQLJ8IW8wip5hw0GMFbBLzrwW
 YP+KZLziE1YKHark4S8ChFeFr/qxACS40QC7B8XbCAK+uFa9Gsh2LK3EBoGXtVqw6i/754u8P
 Zpir2+3BXKtOchj5EQF+iDvZIKIRO4UR+IbVU3T7T0K0zYbwVHzp4+c1qM8JpzbwH48AUH61y
 p/DaDgxR/ygXdmRdi5SVAVKEiyMstjEu2bdPlPkJOTIzbrZQQX5STba1+YkLSK0fb/Ik1PdGH
 OaGI+qojsRGIa5RGVCSCEJO2h/n4o843589cHM0QDyoah2RenXGRHLu4q+w0BqgnFBOJG/ZcZ
 6vGzukjL0Gsmxp1+9ygT4ulKuisJyYEZyK0r3ZxVwhqOdBI5Ed06awZ2NSoVyu3xelxWOq3ER
 Wl42UOPrcqCSPVXbl2TVzh9ko7IDlVTJgHEV54YFR1FneKLQvroHsm5J9Ad2MEgqJMgY+07Bm
 4rKtsEflhJPKjEfkMevG9UXHxmzecZmDmRUwQostkLdKo68CkTGd8MUjSiObUb0Gs5706CRsR
 R5BsB+nW1TRoYdGF9mg80OyYcNiuJCrg57A6bsjRgx9kQ4Tkzg7utip+ZZ4OMLwvXOosfwqQV
 6ZPsl6Csz2HHXrdeebhsG8SnyklYRCR+fUlviZIGvpqzxWxDSYZH1VTb8SsC7lj3GKKB1U9oI
 F5o3VCs7nsyiM2gjuoNe4QgTY8Q5RU/4QVo2eMlDWPp1MoDtjA=

On Fri, Mar 25, 2022 at 2:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 24-03-22, 11:55, Kuldeep Singh wrote:
> > Fixed order of values is important in case of properties like
> > compatibles etc. In case of dma-names, yes order shouldn't matter here.
> >
> > This patch is more of appeasing dtbs_check warning rather than fixing
> > something.
>
> Exactly my point. We have seen similar type of issues with other tools, like
> coccinelle, earlier and such patches were rejected as the kernel was just fine
> and tooling needs to be fixed.
>
> > It's safe to go with this patch.
> > I am not sure if there's a provision to exclude dma-names from fix
> > ordering checks. Rob can help here in providing better insights.

I think it's a question of the scale of the warnings: my understanding is that
there are only a handful of dts files that trigger the warning at all, and it
would be rather hard to change the tooling around this. Since the proposed
dts change is clearly harmless, I don't mind applying it.

Kuldeep, you have probably looked at all dts files in the kernel, can you
say how many of them are affected by the dma property reordering?

         Arnd

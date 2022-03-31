Return-Path: <SRS0=nd60=UK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9A1C433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 09:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A0A3C340F2; Thu, 31 Mar 2022 09:35:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E89CEC340ED;
	Thu, 31 Mar 2022 09:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E89CEC340ED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnaY1-1oGZot11uP-00jaNg; Thu, 31 Mar 2022 11:35:54 +0200
Received: by mail-wr1-f52.google.com with SMTP id h4so32844379wrc.13;
        Thu, 31 Mar 2022 02:35:45 -0700 (PDT)
X-Gm-Message-State: AOAM531Ih1Z3Y44iIgFNTvftHrOvd5yohriY4nrjrNrXNqeiziR5gKJr
	43ZaF+wbv1ON8LUYwWiigrnQo8xKWtNZW42NuMs=
X-Google-Smtp-Source: ABdhPJxWd3RtjDSXkoA7ngdrzuRWb2WjuY33jCnVXB+A1AAH0qJlJE8UE/skE144ENFuB/dx3i4kfZu3MJkNdoi2xmg=
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr3364174wrw.12.1648719041888; Thu, 31
 Mar 2022 02:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com> <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com> <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com> <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
 <PH0PR84MB17181C316E55073EBC28C386881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB17185ADBA824F9CC9EB3E022881F9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB17185ADBA824F9CC9EB3E022881F9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 11:30:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1080yz9jggOrwz2iQ1sAB2Xe2Emh22uCuqRok60BQSiA@mail.gmail.com>
Message-ID: <CAK8P3a1080yz9jggOrwz2iQ1sAB2Xe2Emh22uCuqRok60BQSiA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ib/dnlKH3uwoge+DIW7hcoYIw7HoZ6jcy+DLGHO5cfwuPfBOg3
 2pNKYt5fgQDePEOEtl4ADwuAwcf0ogT0sm3FJ3glQa2Zddy/wk5l+mjM6HBrSNwvk58wjop
 yYSBu0TPuBkYGhDW43fpJl1GF0u+kXlshppVtq8il+hcGxVv3/rqPYXT+/QLA1mC/uzr/iB
 8bIsZJB25r5J5KzcKFByA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XHW+ftBwrFA=:T0TONB2foDSC+U/iGKRxi7
 P6R5tkrPhjLGEl6DKGP5gfwjX82EOmh3sruIIo5sA5H9tLUWzaSJd5VgkA7yLtMzj+OoXahql
 QRp9fRtPa3MMHGyk7kim3PaXIB+YKHNO9Gf6V4Ip37v57YyaqwHRIpMiSXo60suZV7ScO/WuU
 brUEKJYtyEsV4+hrmbq0nZH8N13MmyDuvV/M3JL+wXlzE5MqUY7pFwUsxcQDPqZBszaB7ITAm
 S4qc8CNQ3dRCkVSYrdG3n4e8HD97MZufiQVplzqVItBmUiNwx9BWB48HdWnoiJqOfOV3gzxTr
 U2zQdHI0McEDTKB7Lu3SNtNJ0xUlqm+Pa1LDkG1fBBrGY3a2jdqcV0SieGSnI7JQjsA0jd0My
 fdHiZb36D/34of7Pv+ENQMxWvjpNOv3ZbKrQrbL2vGM+jv9JLQSB1AGoHzfZe4PB/BxCtHlZZ
 eTQb6jJdbeyl88Z2ffsX1uayqoJsGswpFUD/j54Is6Ija0vrjVBJkrShPAQYoLAtRV+8ggkoE
 IjainZD1eaYJDgKfekCEveluClPCYLJSgfTt4tgT1yBemzZNE2rJj0SACOF5l9haPuXpnjC5x
 p9lt0teDcnKHxNMId+IYnnE1RrCg693Zgl3uuLZcfI+Xpe3Fp8D5aYDv+JlmQXyZfdNpfMfub
 di7PTZqtfrgx2CtfVYvRkNMDZ+XL72/GxWgLP48F5ZPkbDZXH4i70yCC/7UXkZw+aXsfOkPJ7
 PadYzo6Cw1cARnEeV+ra/a3cYQFA1Hjb201mvsRkP/JN7CQGkzGfDqwcKf5gh3C/PZYiNi7Mv
 5IUw/WNhv9JY9LWcdqhFkuDkLY+JxAaGrSl9rhe24AH/mbLK3nNtyXGWiL43Fh29B8gK89czA
 bfzU5eQe7EKyWOAGocB/4NDrcw1IFvxEnZtw0AZoTL2g4LFvBx4iJBj6w4aIon3tzQPJOgWvA
 zADMSCge/PQFeHA+oe9LLkZTUZ/96pVRBVrePvSAbO9Vn2u1HZtMHLxkbfrigXNfU81PTj206
 cTcSo5ufqq4fu5p+dxXpxJboQ9OuJ11RIlseHD+Gxp/kUgr+B9SM2+tKtgxwvVVPVNHxxB5Cn
 3eotniQZiI10MaB7VRRSsKa2WBW7mUJYDx4EKWsqwGdCsZqsH38RgTeZsfdMLWCyFizDUII1m
 2Qy7Y4JGyswjTMGawX0GN+nF2oUaI9YRvt2Xh9S8TU0Dhs7fUWBi2lcKm1M/l/e5o+euQ=

On Thu, Mar 31, 2022 at 12:27 AM Hawkins, Nick <nick.hawkins@hpe.com> wrote=
:
> On Tue, Mar 29, 2022 at 9:38 PM Hawkins, Nick <nick.hawkins@hpe.com>> wro=
te:
>
> >> I am in the process of rewriting the timer driver for Linux but have h=
it a dilemma and I am looking for some direction. The registers that repres=
ent the watchdog timer, and timer all lay in the same register region and t=
hey are spread out to the point where there are other controls  in the same=
 area.
> >
> >> For instance with our watchdog controls we have:
> >
> >> @90 the countdown value
> >> @96 the configuration
> >
> >> And for our timer we have:
> >> @80 the countdown value
> >> @94 the configuration
> >> @88 this is actually our timestamp register but is being included in w=
ith the timer driver currently to call clocksource_mmio_init.
> >
> >> What would be your recommendation for this? I was considering creating=
 a gxp-clock that specifically points at the timestamp register but I still=
 have the issue with gxp-timer and gxp-wdt being spread across the same are=
a of registers.
>
> > I think this is most commonly done using a 'syscon' node, have a look a=
t the files listed by
>
> I found an example and copied it although I have a couple questions when =
it comes to actually coding it. Can that be here or should I post these que=
stions in the patch that actually concern the file?
>
> st: timer@80 {
>         compatible =3D "hpe,gxp-timer","syscon","simple-mfd";
>         reg =3D <0x80 0x16>;
>         interrupts =3D <0>;
>         interrupt-parent =3D <&vic0>;
>         clocks =3D <&ppuclk>;
>         clock-names =3D "ppuclk";
>         clock-frequency =3D <400000000>;
>
>         watchdog {
>                 compatible =3D "hpe,gxp-wdt";
>         };
>  };

I'd have to study the other examples myself to see what is most common.

My feeling would be that it's better to either have a "hpe,gxp-timer" paren=
t
device with a watchdog child but no syscon, or to have a syscon/simple-mfd
parent with both the timer and the watchdog as children.

       Arnd

Return-Path: <SRS0=nd60=UK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9963C433F5
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 21:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1FBBC340F2; Thu, 31 Mar 2022 21:53:17 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA98BC340ED;
	Thu, 31 Mar 2022 21:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA98BC340ED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuDPf-1ntEhg2xnJ-00uaD6; Thu, 31 Mar 2022 23:53:13 +0200
Received: by mail-wm1-f42.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so425657wme.2;
        Thu, 31 Mar 2022 14:53:13 -0700 (PDT)
X-Gm-Message-State: AOAM533BoqwZhW59TGuAz0r3ryN1VwgdO6di4fHfVBRXWM1C1+gKufYi
	BTwZhIIMC3/a6ufQWlOVV4pS2+p3omQ5MOpHhwA=
X-Google-Smtp-Source: ABdhPJzSHATsHDA8OPQsrpSCw7bzrU0ceQWFZH98PATzuINEPVrGLYQQfA2Y7GDA3HyQPXtd6FxMBYyz2bZIsZjTXz4=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr6160589wmc.94.1648763593322; Thu, 31
 Mar 2022 14:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com> <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com> <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com> <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
 <PH0PR84MB17181C316E55073EBC28C386881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB17185ADBA824F9CC9EB3E022881F9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1080yz9jggOrwz2iQ1sAB2Xe2Emh22uCuqRok60BQSiA@mail.gmail.com> <PH0PR84MB17186189F5025374AA39584D88E19@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB17186189F5025374AA39584D88E19@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 31 Mar 2022 23:52:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2b+ESAAkc=_2hqx0kOxwYVS6mNjMGBKhhipaSj_5jV9g@mail.gmail.com>
Message-ID: <CAK8P3a2b+ESAAkc=_2hqx0kOxwYVS6mNjMGBKhhipaSj_5jV9g@mail.gmail.com>
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
X-Provags-ID: V03:K1:O/MC0PTbO62RCRClbt8wcveOlrd+LqLQDd8cP5dv8aMvWxPW8Dd
 vds5hCAN3wGM/q5Z+RF23hwdRZsJbEvId/pDQynoVB1Gaj/IFLFn7KpMnXCDFsWQ9HLxdyY
 muhu5q2t/0n+SSNp4/bPCUya9cTE/BwtWEiFKa6N0HZwaB+yzHb3BIZDu+EXNwMQJzqZ50K
 dLPAuzR+aLCV5HNTqOi9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VLyi15bXOTc=:OrhOSAfd7/ferjysBaRJc/
 CPKYZvLkfKkxEPOXMrOURXlgizzHZdhN6R+EBco/9OBlgdNWuPT+J9vzGgBl0kCUfVgFHpcfI
 0sg9tWmh9SzTfVjYUNP1fPOg1WCopMwqocfx6ErOlHvGNB3EdP/PphybOLuuRtf3IqlwfBTQt
 qyNltSuLHpnZ+VXKnc5t0ZECmSsJU/23zsbVTTSKBgFseoaCYqhfxjERFbcJRL/WAqwf7RYHr
 UGqB/UUN/LVNTVr8Sj0A8MpwY4B8mPwxm7+txdIB7+ToTYYod/e+yWovJ/tbFbEI5c+tRDb9g
 qpGRKSw+/Qg9ylZLjCTinOXaupvvbWn8lLTvWG6BB0Pcucf+anaVII6ION+jLT8VMXCZG7J47
 HmWue/UHFWGMZQ6NPVbn8XkZgpYaG7JBjAfDx925m9rZ/Xgujwx2jopdiPOjq86bteQhGakpG
 JOBXsBwhd+xIfUnhNtep4cd3iSfLNIFNC3rEoMMYQ7XWcHQI/1DTShdociMnCz053tyBfAqPQ
 eVVehin1oCQDn3SIfc7BdtrmEHi6I4q8w1nF+faW3pAAeqbXmH5jEo3TD2HCjqYvWigp/EkZv
 vYZzyCc9q1wFi51QLKUXcY5qw0fxoFCh0o+4j5E9lwvITXaEzm/RRlfyr9Tn+PFq7LrMnkBk1
 n4jMu2a051C+iPPXoZMR4nRjTTYHaGFFCBg5te1we3wotJqLhd4NARv6GXiQzxoSlze4=

On Thu, Mar 31, 2022 at 11:09 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote=
:
> On Thu, Mar 31, 2022 at 12:27 AM Hawkins, Nick <nick.hawkins@hpe.com> wro=
te:
> > On Tue, Mar 29, 2022 at 9:38 PM Hawkins, Nick <nick.hawkins@hpe.com>> w=
rote:
> > I'd have to study the other examples myself to see what is most common.
>
> > My feeling would be that it's better to either have a "hpe,gxp-timer" p=
arent device with a watchdog child but no syscon, or to have a syscon/simpl=
e-mfd parent with both the timer and the watchdog as children.
>
> Arnd, thanks for the feedback. I am trying to use the approach you recomm=
end where you have a syscon/simple-mfd parent with watchdog and timer as ch=
ildren.
>
> st: chip-controller@80 {
>                                 compatible =3D "hpe,gxp-ctrl-st","syscon"=
,"simple-mfd";
>                                 reg =3D <0x80 0x16>;
>
>                                 timer0: timer {
>                                         compatible =3D "hpe,gxp-timer";
>                                         interrupts =3D <0>;
>                                         interrupt-parent =3D <&vic0>;
>                                         clocks =3D <&ppuclk>;
>                                         clock-names =3D "ppuclk";
>                                 };
>
>                                 watchdog {
>                                         compatible =3D "hpe,gxp-wdt";
>                                 };
> };
>
> This compiles without any errors but I do have some questions about acces=
sing the regmap in both drivers, specifically the timer code. How do you us=
e a regmap with clocksource_mmio_init? I tried searching through the codeba=
se and could not find the answer. I assume I am missing some vital step.

I don't think you can do this, if you are using the syscon regmap, you
go through the
regmap indirection rather than accessing the mmio register by virtual addre=
ss,
and this may result in some extra code in your driver, and a little
runtime overhead.

If you prefer to avoid that, you can go back to having the timer node as th=
e
parent, but without being a syscon. In this case, the watchdog would be han=
dled
in one of these ways:

a) a child device gets created from the clocksource driver and bound to the
    watchdog driver, which then uses a private interface between the clocks=
ource
    and the watchdog to access the registers

b) the clocksource driver itself registers as a watchdog driver, without
    having a separate driver module

One thing to consider is whether the register range here contains any
registers that may be used in another driver, e.g. a second timer,
a PWM, or a clk controller. If not, you are fairly free to pick any of thes=
e
approaches.

        Arnd

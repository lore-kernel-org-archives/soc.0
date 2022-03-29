Return-Path: <SRS0=n2kB=UI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B493C433EF
	for <soc@archiver.kernel.org>; Tue, 29 Mar 2022 21:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0751BC340F0; Tue, 29 Mar 2022 21:13:43 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BC36C2BBE4;
	Tue, 29 Mar 2022 21:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BC36C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCbVD-1nhFNw0COZ-009jeG; Tue, 29 Mar 2022 23:13:39 +0200
Received: by mail-wr1-f42.google.com with SMTP id h23so26572356wrb.8;
        Tue, 29 Mar 2022 14:13:38 -0700 (PDT)
X-Gm-Message-State: AOAM530SliRmwo0Y71lBQ2hGjKzd1ubgVF8x4mUblzrRbt9PjTo44Nii
	50Efs53S1xgY/6Gac0v6VtgsCjXoffOezquBbMo=
X-Google-Smtp-Source: ABdhPJxHR5mXennkJY/lnE7PRTnpSWkihWANMe/hyzwifMKWesIU5r2Ul1WbUeI6PInYCHA7pISaCuLBifcJxx5XUpg=
X-Received: by 2002:adf:e54e:0:b0:205:a9be:c66e with SMTP id
 z14-20020adfe54e000000b00205a9bec66emr26134334wrm.192.1648588418736; Tue, 29
 Mar 2022 14:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com> <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com> <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com> <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 29 Mar 2022 23:13:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
Message-ID: <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	"Verdun, Jean-Marie" <verdun@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HEcCisgunC9r1n2S793FhJ9ZXDJmJ1X2uNAy8jFu3HVwQcyVdVW
 msmHSp0YiSm8yzv4K2YAT+tkbh79Eq8wvJgJ4Rflp+wYxgwvPPBt2REeLs8W4Kwea7IAWDP
 5oQiT9IrGJQ+qa9IAPV7LrrPV0BSM+T1Lyr29L/mgKedylCw7c6MzmnKBdSkplcnmrcgHBl
 vH/LoUQbOvWxVvgcM2BeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QWjW1K5r39A=:8AYvpMmGvteHxRs1xoKxjo
 sF1fZX6qOnc+qbQixobqjjn3WP2jh2mO9yJHNytTMmdkjTJz4jIP3WScNWHZbs+a/hugf7izd
 8AFK+39dXnncK9vb5w3dPY5ciQ2hIFzFEHpDTobKdiFm5dm3fcSQCkJ9AFReIMYjF4M+iRMBS
 KerLBQ3NB4sVLxIfuZ3oiT+Xx1/XX3yMZYV/nYAAxFPUzJELQy1IR4wd0LLdX7RysZywN9ONq
 3dNzyD+TtIPzVQG/ARihDDBrdRdg8u4IEDgRO9Y6XbvnJJBC/guLhy8ruc8iI0FarMG9nSsaT
 5gVg255d7u1/tSRVg2mDnVASJjiWM+6o+lzyf1A4EZWoVthH/612uIcRbBRqSHVVVqZaTY6Qp
 B88O0r77B+JYhzNSErI5cQVogB1rn6C1FAHgvBocvpzOLKOv76hZ/5plE1k+n9kYMNrKF0iTN
 gLG1R69IJLCUoRTGEGXVGQG1sgjqSly+MtFFt7LkRL55ZyaL1zk+HfUnrAGuqCOAra68vyi6D
 ed5Z0D8XafuD6PzmcPSyyQkEC9wly+GNohhm1Aas4NCUf2fFi6MUEtuZOK23ssDJj1I6PP2u8
 kWwgMaYWWTwCilPuvUM6n+h85HHgRm1ndgw8f5PEjfnmcillwSI9OMGvYkJWzYruuc6g/DtLI
 g+WAr1vfEJGBof6Ux4ZbMGmwcFGQHsfAlv0Se7yHw8B+hh3iJJ4brocM6Y2NSC5adqIw=

On Tue, Mar 29, 2022 at 9:38 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:

> I am in the process of rewriting the timer driver for Linux but have hit =
a dilemma and I am looking for some direction. The registers that represent=
 the watchdog timer, and timer all lay in the same register region and they=
 are spread out to the point where there are other controls  in the same ar=
ea.
>
> For instance with our watchdog controls we have:
>
> @90 the countdown value
> @96 the configuration
>
> And for our timer we have:
> @80 the countdown value
> @94 the configuration
> @88 this is actually our timestamp register but is being included in with=
 the timer driver currently to call clocksource_mmio_init.
>
> What would be your recommendation for this? I was considering creating a =
gxp-clock that specifically points at the timestamp register but I still ha=
ve the issue with gxp-timer and gxp-wdt being spread across the same area o=
f registers.

I think this is most commonly done using a 'syscon' node, have a look at th=
e
files listed by


$ git grep syscon drivers/watchdog/ drivers/clocksource/

You may also want to look at those drivers to find if any of them can
be directly reused,
this is perhaps a licensed IP block that others are using as well.

        Arnd

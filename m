Return-Path: <SRS0=d6N2=VS=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA75C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 07:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F04D7C385CA; Tue, 10 May 2022 07:02:21 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 732C2C385C9;
	Tue, 10 May 2022 07:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 732C2C385C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3lgL-1no2u10y0J-000pTT; Tue, 10 May 2022 09:02:18 +0200
Received: by mail-yb1-f170.google.com with SMTP id v59so28995665ybi.12;
        Tue, 10 May 2022 00:02:17 -0700 (PDT)
X-Gm-Message-State: AOAM532J18aADe5e/fWjQcDdeShwIRYxTMlkwA6mVNkOusAODmvo3E+3
	MbghAHsGOw/ryMHA7ew136NWEcB94Hpxw5s8eOI=
X-Google-Smtp-Source: ABdhPJzCoErVlOlWP+3agvpOC/u6kgO4/gR8EykNKzu19PrW0u0Z98t99jOPlEpsD8ttySzd6YiVB2UWW4A083+k8U4=
X-Received: by 2002:a25:cbc9:0:b0:645:879a:cdd3 with SMTP id
 b192-20020a25cbc9000000b00645879acdd3mr15923423ybg.550.1652166136461; Tue, 10
 May 2022 00:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220510032558.10304-1-ychuang3@nuvoton.com> <20220510032558.10304-4-ychuang3@nuvoton.com>
In-Reply-To: <20220510032558.10304-4-ychuang3@nuvoton.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 May 2022 09:01:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tbvE+PTB-qy2y7o3_i3VP0zkgMueDy3zBd64BsGKssw@mail.gmail.com>
Message-ID: <CAK8P3a1tbvE+PTB-qy2y7o3_i3VP0zkgMueDy3zBd64BsGKssw@mail.gmail.com>
Subject: Re: [PATCH V4 3/5] arm64: dts: nuvoton: Add initial support for MA35D1
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>, 
	cfli0@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5dt/wHiA1Y8WbNjGVcdvnW9u06hOx4wD3EUjB2sg1vUr0KPWzza
 dgUsEcAGWAfHrUaY/zZJFUAv3P3cpkUvLIVrAQLtuCEVwFHIDvKk9SekcN81tM9+NhjIT6i
 U7h9ShBIW2wTFjfWAv62DE4Q6fSDNwnWeOIHjQUAtb1zC0ySvaR4wMJI9pJMqryC4193Mc/
 EtoyQJunTpesAgtkNtapw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:valQB88iB1g=:yv4heBprPjjNF+mmkBUaHv
 skkXYCIOzhA6Zudw9Xb1HP8v7L0wyLVfXtofRKpDsmM8hrqyCuQnpHJxbFmxlLolP67zG7ifI
 gRxAV9OJA5sPDjf5DS8WQRyZOX2zt7YW3TL3ZnzqEOBoyfb3iZLLxPU0+C3cj8RQPiiN2cj8e
 WLGrp7Vvzm0s6x3C29iC6wrWaTAP1hm0p/jgxiPjXI6dOgr5lGI00GZKct7rrwisF0755c3uW
 hdImis1+fVPXgvYw+9oJQMQnxGQKavW/QgNrtfjcu5h9tbW9B97lvXyA8E6ESJdQrupP4aEMe
 Xj6sn4aNH/VRF2Gp5130Q2UEZ1/9B5AJTrkBOvEBUGHP0HOlArmPpruj0Delhzz/7v++Z9x1O
 6aBUYDKwv8Otd6qiCLidl5Ipq89oa9iX28IJQCDsynUm0M1xI7V85xlUhHWzpR0naSod2F3jU
 LePd04thBCl0wCOLw9ad5qyuQA2FP4ezFL1XKTrFAhY7yFMAZ034l7HKZqYB3WHbDJvQ7FobF
 5GtA7DTbiTEUddtcGjCLYgRucG+mGhtVAHYyKzTA76uHfx6742QkrGxBYuxhOO6O7TXtPMOjf
 LZWeZj2JJ43qTuEa+dHlmC7uu/B/x2TSFI3J1KLhJu23S4ezl08ehP/F17mvL/zXOIMMSRDBa
 ZBOm+z7ze5ibhcxcManIs4On/rYPKJueBKeJwos0Ln3venFdol6KD67e01mw5SBTOLbLUahao
 Wku7vTb8VUJC3jyH1yIqzmj0EhsllSJUHm7SJAjk/XOfqdfayQ1wA4Y+MNOgLmmCzhKerm+ew
 Vs/qCcGA0skfKNLsCtKm6YzmKOGiQM6FWgakMYM+2GVkFpKNmo=

On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
>
> Add the initial device tree files for Nuvoton MA35D1 Soc.
>
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
> +
> +/ {
> +       model = "Nuvoton MA35D1-EVB";
> +       compatible = "nuvoton,ma35d1-evb", "nuvoton,ma35d1";
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };

Something seems to be missing here: you set the console to the serial0
alias, but that is not defined anywhere, and the ma35d1.dtsi file does not
appear to define any UART at all. Are you still missing the driver for this?

Please add a more detailed description in the changelog text above that
explains what kind of SoC this is (maybe a link to the product web page,
if there is one), and a status of how complete the support is: which drivers
are already merged, and which ones are still being worked on?

        Arnd

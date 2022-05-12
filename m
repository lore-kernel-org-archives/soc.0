Return-Path: <SRS0=CdYO=VU=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9407EC433F5
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 14:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 632ECC36AE3; Thu, 12 May 2022 14:35:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D8EAC385B8;
	Thu, 12 May 2022 14:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D8EAC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1McHQA-1oLBsI2zJE-00ce37; Thu, 12 May 2022 16:35:18 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2f7c57ee6feso59219337b3.2;
        Thu, 12 May 2022 07:35:18 -0700 (PDT)
X-Gm-Message-State: AOAM531B43y6pgHO6Ybegl1yIXVZtqXxP7LM6gi5C2bKD65dBr/yzCai
	xbKElv04SQrezF0GoXAbfri2jlKeay3zoEJrnQI=
X-Google-Smtp-Source: ABdhPJzfbhwoFr1q9juMntgIfHM+m3U1nWpSEbsdjudirAmgYnzjhj8eMLGYhy6XgarB5vhSiUly3q7lBnc1N2pSqgQ=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr331249ywk.209.1652366117032; Thu, 12
 May 2022 07:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510032558.10304-1-ychuang3@nuvoton.com> <CAK8P3a1k8y8U99bBmqBYE1vYAc0q-UeaM0oLP4tTHZCpyYNOgA@mail.gmail.com>
 <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
In-Reply-To: <8be62b40-077a-7634-7d34-7776909a2abe@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 May 2022 16:35:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3=YD7WV+Www8pf+JTv14DwcnSjD+f=YFCNMxXYT9FAZA@mail.gmail.com>
Message-ID: <CAK8P3a3=YD7WV+Www8pf+JTv14DwcnSjD+f=YFCNMxXYT9FAZA@mail.gmail.com>
Subject: Re: [PATCH V4 0/5] Add initial support for MA35D1 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ychuang570808@gmail.com, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, SoC Team <soc@kernel.org>, 
	cfli0@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UZoMoBb+ISBZzlGz8A5SeQFP+qxSb9gvzgED6wg6sIs+2qpfXaT
 gFmzM00rURAlRMaWaA10oVJ5UZFpxXKAlE6DMsyYmdPJa71i/FtDWoaAp+1NXMRXjA1pg3o
 k5WgRUKLrC0KByQVPAOkV8tIAbaS/dA50J3UUoTHlpHHv0pzKbaYe/7sTl1Ha2N4B7IWFUm
 COksDZGv9KIckQcaKqH0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hE1btajlmlU=:O934aCHyoNpbp6+dYAnhRn
 n2UjmGj2Mk0AF9P+xTJm4ao72a7qHuUyRewC6EVvFw35pwcBX277YewWiWWiQBtFlpRnJxZMK
 aJk742y+NdOVGWL5PhXzTdk6bFMQ40XN5jzRH6XBD5VaO21Rp77WL2rpMROnB4qlGK7Po/K8h
 9PYgnnxcwHhJGPD8+hNgR0BKTLl1SGgbQ9h+qed9Zxj/sMDFkg7j3vdki8rZOZ75xow1J1zI9
 el1HFpoMzpiR7AZwXgd+h4JWCzvC+YwGcyggM0UScceilTXJqz4rqCn9tF5XXGE+yy/wuIkGy
 7a0fafp7kmd/ARlPoNHnio1I0EJJ4WGvGBxlyZFrvLwDE41B07w5I/J4oxlit27zOt9kRSNAZ
 JanR7gaxorHI8S6p52wCpiKaGpshs73nahmvsDj8SBNJ+/6Mq8G++O396Pji1lwfgJfNS12C5
 To8EpTHoTR/FpzktPMQJ+P0yfDb/xudkqf5MQYdGEBTn+7UiYsqh9Ntozldv0vTI4eXQG69kr
 uISFoTo6fv1lawviSA9Jg0QZimGWD0OiGuG/pjLMz1jO9+ObRcamfgrcy1r1ppRLTKbhqV7TA
 RzqadvIJV7Arl3ysm93ImidvdVuHFfbC6D8nSmIq175BtuGiNtvp8dl28EU2XtgJiitn4GptA
 L3fVJ2pjEJFVnc7N6Q/ibpBZoZXfOuH73usMfSRc2HPAxukfzO9IAxq8x+gjaA68TnMSzbTo9
 AQB6XiZsydbQ2IeqchKYywfZoRivlhLWH/DDVBzI//6yb1K+UDHg2ySGXDesjJLvd/2u3BoLa
 8+UC0r+gULdwRqiBLGHOHT1ATDMPggjXqHYaXWR6xyKByNa46I=

On Thu, May 12, 2022 at 4:11 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/05/2022 09:07, Arnd Bergmann wrote:
> > On Tue, May 10, 2022 at 5:25 AM Jacky Huang <ychuang3@nuvoton.com> wrote:
> >>
> >> This patch series adds initial support for Nuvoton MA35D1 SoC,
> >> include initial dts and clock controller binding.
> >>
> >
> > This looks fine in principle, but we are getting close to the merge window and
> > should finalize this quickly to make it into v5.19. I see that you don't have a
> > console device, as commented in the .dts patch. Normally I prefer merging
> > platforms only when there is at least rudimentary support for booting into
> > an initramfs with a serial console, but this is a flexible rule.
>
> I disagree. It does not look fine - does not pass `make dtbs_check` even
> with Nuvoton bindings...

Ok, thanks for taking a look. It was already late for 5.19 and missing the uart
driver, so it was clear it had not seen actual runtime testing. Let's try
aiming for 5.20 then.

        Arnd

Return-Path: <SRS0=sQYv=QD=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E93DC433EF
	for <soc@archiver.kernel.org>; Tue, 16 Nov 2021 03:08:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 473CD6320D; Tue, 16 Nov 2021 03:08:01 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA33860E78;
	Tue, 16 Nov 2021 03:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA33860E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id jo22so12777623qvb.13;
        Mon, 15 Nov 2021 19:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
        b=HX+WlerYmiz45dfnhbTRz6BP49luNrI3xPfvXAYTA5J893Cp1bgpgD2R5O7ilpXhW2
         Ztmg7mlqRhJkIkuQm++MMxicg1qvpkbTGvPIau+qkbupjPVIfVYoLwIHU9tvFf/5pFBG
         WgEPgLF0Bhivdt+M0+t9VJ0AkIctplBmfJFqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+3tuhUNj0IibcDWormquB6v06wUV9mYHE56GduUS2M=;
        b=1XA2FIdrGmmoPScVA1A5lSvq3XBuANBXvN5MheXoxM4B/cnjypk+xB0D9cSttWgEEF
         g2oPHf0cfEsZ8zfCU741CIpeZZTMwZ9uLPYaudZ8JZ/mgBETtkLAyRl5Ffe1bMhE2lxe
         USTYyl0XN8jevzF1NUY0tD+x7RnvvSZ9XDRO0k3pQUgHJ7YMnJ6XZXc0UcTPTeML81l3
         sGXu7YreRc3WN0PDJ2EEpSls1HjdI5Fqm8lwmGowT9pgV4hWMoUVVeIbcLHxQlYnxIWh
         RJ7oNuRh0FOJ/uG00WwKFekmQRpVCBeDpfGaPMeH8QDRTgNG1w1Gd5yxUORsiOtEAAxO
         kRNg==
X-Gm-Message-State: AOAM5316as+R50XfoF04esyvoAR2E48k/TInG9kVzRnI38sb8TVgxehj
	pmxA7oiFPl46MTLgkikI/CTcE9Dz+Z4FgPQp50ZyBUWU8IT56w==
X-Google-Smtp-Source: ABdhPJxVHar3OL/4LwNLEgzkuKc1H5RS71UlqygRtUVrY8OEkV+Kz3DE/kgpDDzrS8wn8JXdXAJ7KIukSIeqLNgOs0g=
X-Received: by 2002:a05:6214:e41:: with SMTP id o1mr42634802qvc.43.1637032080033;
 Mon, 15 Nov 2021 19:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110062656.3041994-1-howard.chiu@quantatw.com>
In-Reply-To: <20211110062656.3041994-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 03:07:48 +0000
Message-ID: <CACPK8Xc6wV4KbMAT_ekyMTTbfNqx2ox_d7mEFGVT4OvBDDadBQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Howard Chiu <howard10703049@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Howard Chiu <howard.chiu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"

Hi Howard,

On Wed, 10 Nov 2021 at 06:29, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Initial introduction of Facebook Bletchley equipped with
> Aspeed 2600 BMC SoC.
>
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> ---

Please use this area to document the differences between versions of
your patch. Let us know what you've fixed, and what you've decided not
to change based on review.

> +&uart5 {
> +       // Workaround for A0
> +       compatible = "snps,dw-apb-uart";
> +};

Are you still using a0 boards?

> +
> +&i2c0 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled0_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED0_BMC_CCG5_INT","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
> +               "SLED0_SSD_ALERT","SLED0_MS_DETECT","SLED0_MD_REF_PWM","",
> +               "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
> +               "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","SLED0_AC_PWR_EN";

I'll wait for Patrick's review on these. I would prefer you follow the
openbmc naming scheme that he mentioned in v1 of your patch.

> +
> +               gpio@0 {
> +                       reg = <0>;
> +               };

I think this is incorrect, you would need to specify:

type = <PCA955X_TYPE_GPIO>

However with this change, there's no need to specify the individual gpio nodes:

https://lore.kernel.org/all/20210921043936.468001-2-andrew@aj.id.au/


> +
> +&i2c4 {
> +       status = "okay";
> +       /* TODO: Add HSC MP5023 */
> +       /* TODO: Add ADC INA230 */
> +
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +
> +       sled4_ioexp: pca9539@76 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x76>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","SLED4_BMC_CCG5_INT","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
> +               "SLED4_SSD_ALERT","SLED4_MS_DETECT","SLED4_MD_REF_PWM","",
> +               "SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
> +               "SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","SLED4_AC_PWR_EN";

As Patrick mentioned, I think we want to have a convention for
multi-node machines in the GPIO naming.

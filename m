Return-Path: <SRS0=m7Ph=FU=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB2EE92FF1
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 07:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79E1AC433CC; Fri,  6 Oct 2023 07:08:56 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F8B2C433C8;
	Fri,  6 Oct 2023 07:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F8B2C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f82ad1e09so21831727b3.0;
        Fri, 06 Oct 2023 00:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576134; x=1697180934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDvOGTbwmYKB4yj3dggVQge2NMSHumJx3EfGcewWqNg=;
        b=wpOPTh1zbetvuf+PI9nUZhhI4SQeTTam+p/DJVkd77xbyt8D9sQcCtxigcOYlYhC+d
         ac1ZVNU8yCjRSIJxve7HGAIPX7nxGgG80ICjj29rYlSlf40o4sGJLjdn/8qxSEMRJugy
         nNhwTEA3K6ICfzVhaYnNBBBGOstIsSvNpuVfmJ5CgP154D2OuJU28Z43S+gyOeiacJQW
         yUO+VJesYwzTdCWaLTAUFBJ5Vt8GZgEU9Bm91Aik4z86QuE1gZNcjvzG+yoYr4EA5A7z
         IWUvlFX58FdjLDlrjEkLZmijw4mNhvktNfuTYVnJjJ9WmTN2RMYE/KXpUlV/VhqllnNN
         DZ/A==
X-Gm-Message-State: AOJu0YwdAGaLt3+arF5GBvqABggEvJznIuEmHD7QHZD91JaruSZfFOHM
	XiOT2la82fNU5fOUJ23aE8f3K0pM9tcXXw==
X-Google-Smtp-Source: AGHT+IGoPi0G2Ih2UYMdZUlv/+lMaXNwaT9EfEVzuyX0R7Zm77uiNJLkhQv5qD3lTD6jKNSu6BeRlA==
X-Received: by 2002:a81:4a55:0:b0:599:8bd:5bdf with SMTP id x82-20020a814a55000000b0059908bd5bdfmr7486827ywa.50.1696576133803;
        Fri, 06 Oct 2023 00:08:53 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id x132-20020a817c8a000000b005925c896bc3sm1098938ywc.53.2023.10.06.00.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 00:08:53 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f82ad1e09so21831577b3.0;
        Fri, 06 Oct 2023 00:08:53 -0700 (PDT)
X-Received: by 2002:a81:4a55:0:b0:599:8bd:5bdf with SMTP id
 x82-20020a814a55000000b0059908bd5bdfmr7486809ywa.50.1696576133283; Fri, 06
 Oct 2023 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <20231005155618.700312-20-peter.griffin@linaro.org>
In-Reply-To: <20231005155618.700312-20-peter.griffin@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Oct 2023 09:08:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgW1qx-7ADh89BRE4Hhk7-+R7o5VrswcBMymxh7zWUnQ@mail.gmail.com>
Message-ID: <CAMuHMdUgW1qx-7ADh89BRE4Hhk7-+R7o5VrswcBMymxh7zWUnQ@mail.gmail.com>
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Oct 5, 2023 at 5:58=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
> The LK bootloader on Pixel6 searches for a dt overlay in the
> dtbo partition with a board_id and board_rev that matches
> what is baked into the device. If this overlay is not present
> then the phone will bootloop in fastboot and you can't boot
> the upstream kernel.
>
> This commit adds a dtbo for the production oriole variant.
> The other pre-production board overlays are not included
> at this time.
>
> Adding the dtbo here allows for a better experience when
> building/booting the upstream kernel on Pixel devices
> as all the DT required to boot the device will be created
> as part of the kernel build process. Rather than having to
> fetch the dtbo from some other repo.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole DVT Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +       board_id =3D <0x20304>;
> +       board_rev =3D <0x10000>;
> +       fragment@boardbase {
> +               target-path=3D"/";
> +               __overlay__ {
> +                       model =3D "Oriole DVT";
> +                       compatible =3D "google,gs101-oriole";
> +               };
> +       };

Please use sugar-syntax instead of manually defining
fragment/target-path/__overlay__ constructs.
You can override these properties in the root node of the base DTS
using the much simpler:

    &{/} {
            model =3D "Oriole DVT";
            compatible =3D "google,gs101-oriole";
    };

The generated DTBO should be identical (modulo naming).

> +};

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

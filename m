Return-Path: <SRS0=LAFF=WC=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47942C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 21:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D255C385B8; Thu, 26 May 2022 21:05:46 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD823C385A9;
	Thu, 26 May 2022 21:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD823C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id j3so2129622qvn.0;
        Thu, 26 May 2022 14:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rGFq6ss7N+k24WC+NtUaZFpHQf1enSNC4oSA/gUz+kA=;
        b=CxZe4m2Y8poPs+GOeXRz/B9Ne2tX7O2n6AQloXY3a0qDe0zMnJz55q5/b1bnIJQU/u
         YPRQI4NtykBlU4lVnMYeKDtqd/QCxCKUwVFmmCQKZdNz5XN4rIS5ZbBd+LB+vYnzU6KW
         8f3K3JizET9xDDXT3JTWm8QpAjdwZZWiS4dmhjNlGNIfbZnLIkji4V6aTuzs3FmKkdNp
         7YX4qzOkJOFO9G8QyBeypsOpAhsd2SJTZaAaCtdusjB234Mbs6/ggecpM+LRBrWYi6wI
         TcsAlLDFRxhO6GehCnRUKchzU2gbrZbebF9yaT9gy2cbYhZlUhnOMFybDWlWCx7AUmA2
         3QXw==
X-Gm-Message-State: AOAM533P8S7pn+GM7VH6r0RVc2GYXiOSYZ/GS6sskEL1QDgtAD+el7k1
	aCnKfVyzSVn6l6Q9jkWw20Rc8uWJOyCakw==
X-Google-Smtp-Source: ABdhPJzf2WTCkuylVyBB8ZewHOd83mSOM3gBO1/TsJe4CYlvc2SBIOdfe0lYP0VM8xxGoNoxgXdSPA==
X-Received: by 2002:ad4:50c5:0:b0:462:7154:cac2 with SMTP id e5-20020ad450c5000000b004627154cac2mr3378169qvq.116.1653599143431;
        Thu, 26 May 2022 14:05:43 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id z8-20020ac84548000000b002fcc93761c6sm915055qtn.55.2022.05.26.14.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 14:05:43 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2ef5380669cso28395997b3.9;
        Thu, 26 May 2022 14:05:42 -0700 (PDT)
X-Received: by 2002:a0d:d493:0:b0:300:43da:57f0 with SMTP id
 w141-20020a0dd493000000b0030043da57f0mr12769712ywd.502.1653599142564; Thu, 26
 May 2022 14:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 May 2022 23:05:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvfbbB3578aFAx6twdKNCkB1T-Uihf3OzGLHmcZG047g@mail.gmail.com>
Message-ID: <CAMuHMdWvfbbB3578aFAx6twdKNCkB1T-Uihf3OzGLHmcZG047g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	arm-soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, May 26, 2022 at 10:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -630,7 +630,7 @@ rsnd_for_ak4613: endpoint {
>                                 bitclock-master = <&rsnd_for_ak4613>;
>                                 frame-master = <&rsnd_for_ak4613>;
>                                 playback = <&ssi3>, <&src5>, <&dvc0>;
> -                               capture  = <&ssi4>, <&src6>, <&dvc1>;
> +                               capture = <&ssi4>, <&src6>, <&dvc1>;

I think the idea was to align the playback and capture properties,
for easier comparison.
Hence I'm a bit undecided if this needs to be fixed or not...

>                         };
>                 };
>         };

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -206,12 +206,12 @@ pcm3168a: audio-codec@44 {
>                                 clocks = <&clksndsel>;
>                                 clock-names = "scki";
>
> -                               VDD1-supply     = <&snd_3p3v>;
> -                               VDD2-supply     = <&snd_3p3v>;
> -                               VCCAD1-supply   = <&snd_vcc5v>;
> -                               VCCAD2-supply   = <&snd_vcc5v>;
> -                               VCCDA1-supply   = <&snd_vcc5v>;
> -                               VCCDA2-supply   = <&snd_vcc5v>;
> +                               VDD1-supply = <&snd_3p3v>;
> +                               VDD2-supply = <&snd_3p3v>;
> +                               VCCAD1-supply = <&snd_vcc5v>;
> +                               VCCAD2-supply = <&snd_vcc5v>;
> +                               VCCDA1-supply = <&snd_vcc5v>;
> +                               VCCDA2-supply = <&snd_vcc5v>;

Same for the various supplies.

>
>                                 ports {
>                                         #address-cells = <1>;
> @@ -438,7 +438,7 @@ rsnd_for_pcm3168a_capture: endpoint {
>                                 bitclock-master;
>                                 frame-master;
>                                 dai-tdm-slot-num = <6>;
> -                               capture  = <&ssi4>;
> +                               capture = <&ssi4>;

Right, there's nothing to align here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

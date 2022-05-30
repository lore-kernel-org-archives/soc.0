Return-Path: <SRS0=QzAz=WG=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28A5C433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 14:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8331C385B8; Mon, 30 May 2022 14:39:46 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A382C3411A;
	Mon, 30 May 2022 14:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A382C3411A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id h75so13363774ybg.4;
        Mon, 30 May 2022 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwYudAlsrV6L0E/1oct3kLnDMatMHOnVQrUxmfQHNp0=;
        b=nJb/D6o7T7a8Mb297LS5itZxyr9hhXOWE4cI1CS2gGTaAQcWmDs6sgxITAckTcsbqO
         aVjCnMiZTw+b4RHeeUOfs7ZZ8uhJu+9H3vrDwR8kDUeIJPmAAz+dNjR8nEL4TV+1QxDF
         u49vwV3izHOZZjnCA/h3xEh2LMtiihGNrkHxPVvfRH9pZsq1jJB+cD3l2YcOrZE/FHV3
         oO0LniQOktfpUCJyeRfpEKg9DDa8WBNFOctawAeqAkazISl11g4V/X/KrhW3BSqcXDpM
         rHmuPxyGLKaHOFGx+URNH8GUTtkCZhF8UINV8Pv9mO9GCiQtRvv2jNcgvDl1QzaFiII6
         59oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwYudAlsrV6L0E/1oct3kLnDMatMHOnVQrUxmfQHNp0=;
        b=lSvJjNKb0Cv62MeTR5Scm+ZRpW4TRncezLRN+Ef2vW1xGkMoKJa5hTPfZcnOddvw4H
         YRZYolCYxgithVQOUHjr1MJ3oXPY1UGvcHE3n3E8H8u8yAEtiy9eHeFpYxsG98FPDRZC
         fT4HVHSq3V5by4C2Ya77Or5p4XHXSaKUfaJ2EPSnXV7DVVK2U4wd9q6lfY36b3pze1iC
         QKKR55OWzK1cfXtD5gjF8Pd1hahykXc0DL7dga0AonSug5PZ+l5BFQf+W7vcYhoRNKt+
         OihT6s1zktUsyM5mVaDik88vHn+0kZAdnxVCKA57+cHZqVRE4Hsq5eVnHvNIPhsXogO7
         m/UA==
X-Gm-Message-State: AOAM531KexV3yKzqAgk8nrXBdoVGXC4pgmDMJPNln/ZZ2TUe/qyhqrKl
	mqk0gJ+ndvVs0dmT+9GcHBBVfr1O2hA/Uz3xdam+hLOjxtY=
X-Google-Smtp-Source: ABdhPJwrsgLQtAtWqwcrdq2e1TjIgoIDbrErxGbmJH2wa0Fkm6oxdLbvdkS+K4BYIuwE3er69f8iVYy5UEogxMtnFeI=
X-Received: by 2002:a25:21c3:0:b0:64a:b29a:9b0d with SMTP id
 h186-20020a2521c3000000b0064ab29a9b0dmr54184246ybh.59.1653921585005; Mon, 30
 May 2022 07:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-8-tmaimon77@gmail.com>
 <20220526192412.8ECAAC385A9@smtp.kernel.org>
In-Reply-To: <20220526192412.8ECAAC385A9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 30 May 2022 17:39:34 +0300
Message-ID: <CAP6Zq1gtB_kiEutV=uE30nev_S0rAjs=9BdMnqQbAbi-M1W6iQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] dt-binding: clk: npcm845: Add binding for
 Nuvoton NPCM8XX Clock
To: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
	Benjamin Fair <benjaminfair@google.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Jiri Slaby <jirislaby@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Lubomir Rintel <lkundrak@v3.sk>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Olof Johansson <olof@lixom.net>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Robert Hancock <robert.hancock@calian.com>, 
	Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Patrick Venture <venture@google.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Nancy Yuen <yuenn@google.com>, SoC Team <soc@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

Thanks for your comments.

The patch will modify according to your comments and will be sent in
the next kernel revision 5.19.rc1

On Thu, 26 May 2022 at 22:24, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2022-05-22 08:50:34)
> > diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > new file mode 100644
> > index 000000000000..f305c7c7eaf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > @@ -0,0 +1,68 @@
> [...]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#clock-cells"
>
> Are clocks not required because sometimes the reference clk isn't
> connected?
require, will be fixed
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Clock Control Module node:
> > +  - |
> > +
> > +    ahb {
>
> drop ahb node please.
>
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clk: clock-controller@f0801000 {
>
> Drop label 'clk' as well please.
>
> > +            compatible = "nuvoton,npcm845-clk";
> > +            reg = <0x0 0xf0801000 0x0 0x1000>;
> > +            #clock-cells = <1>;
> > +        };
> > +    };
> > +
> > +...

Best regards,

Tomer

Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E77C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 15:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B75A6C433AC; Fri, 31 Mar 2023 15:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A105EC433A1;
	Fri, 31 Mar 2023 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680277752;
	bh=7sYG1ROb3TcoZzoTgiciX1cqj1srZop/PgY7/5fqvlM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KhNEzbPXIPIybwDCHRKuyygG4A3hmjwTUXeDaEFDK3imThvztJZWvftW7zwtfmGji
	 zLwCI8CAVrqC7StST9DQyUKDYYqCmW+cZuS5njcZecpPJxrDiAIftjYI6AZbHg+CNC
	 9kJoTATN93MuAmGav4pXECDg09hHdnGa9QDCyfZTGHbN8PKViIgChafcUuCQ2voFel
	 xd0JSIBjjjH76oUaWohwOSLIdn2Zu6iYv6nwLYzgp9FDZBv2yQox1FbZLNPl33tj0w
	 SbYBKt3jUIBO1fEZj3P//aJCooZHUyt3iYo5pWXPIxriOGXuDsxycoqTjTkzqQPmJw
	 RBllHTlGxvO6g==
Received: by mail-yb1-f172.google.com with SMTP id z83so27912556ybb.2;
        Fri, 31 Mar 2023 08:49:12 -0700 (PDT)
X-Gm-Message-State: AAQBX9e908dedxRTBTQjFdbgBw8fUrh1Fo7d4g6fukzlVCyP24hJIv8a
	zAOmDbJktbpgLEfFQ3AMyIATGOuBUuCvgdFGYg==
X-Google-Smtp-Source: AKy350Zu45r0mPHHP04Fo3WtjdI5vrOgO43ZKIYE5YCQV78EmZ9+CstGFZM+PufYOUVR2jcRfEZlyZr/BaGKP9HD2oY=
X-Received: by 2002:a05:6902:1586:b0:b68:7b14:186b with SMTP id
 k6-20020a056902158600b00b687b14186bmr13710481ybu.1.1680277751614; Fri, 31 Mar
 2023 08:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230331095715.5988-1-stefan.wahren@chargebyte.com> <20230331095715.5988-3-stefan.wahren@chargebyte.com>
In-Reply-To: <20230331095715.5988-3-stefan.wahren@chargebyte.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 10:49:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ8rabJ7ZSzrvpzxrNrki1jZ7Ry1iVxf1CZOU5pxvjmdg@mail.gmail.com>
Message-ID: <CAL_JsqJ8rabJ7ZSzrvpzxrNrki1jZ7Ry1iVxf1CZOU5pxvjmdg@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: Add DS2482/DS2484 as trivial device
To: Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stefan.wahren@i2se.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 4:58=E2=80=AFAM Stefan Wahren
<stefan.wahren@chargebyte.com> wrote:
>
> Both chips are I2C to 1-wire bridges.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 6f482a254a1d..9b7b24989359 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -183,6 +183,10 @@ properties:
>            - maxim,ds1803-050
>              # 100 kOhm digital potentiometer with I2C interface
>            - maxim,ds1803-100
> +            # I2C to 1-wire bridge
> +          - maxim,ds2482
> +            # I2C to 1-wire bridge
> +          - maxim,ds2484

A 1-wire device isn't really trivial because it can have child nodes.
You're probably not the first here, but don't add more.

You could do a "trivial 1-wire devices" schema similar to trivial RTC
device schema.

Rob

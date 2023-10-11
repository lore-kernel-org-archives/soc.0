Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB630CD6E51
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 09:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D376C433CC; Wed, 11 Oct 2023 09:22:32 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82B47C433C7
	for <soc@kernel.org>; Wed, 11 Oct 2023 09:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82B47C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-65b0dad1f98so42579006d6.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697016150; x=1697620950; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NiamZOqOZZtzzPmQsOXA8/LTPZNpfaNzuK4lw0f8SzI=;
        b=S58W5wjTpQk8npQFuENTQfOnzaJJJYHwv9ZK8i/po1mttm02j+laGaS2MIps0Wo4rl
         96zsQ0HEvSTb565vi6ey765MS38Jkoe9eSDdrvClsAk/KUFooQE44v3KfhdmuRC8iExc
         q7nmLPLbrdpFwkManQaxx9BIsc+3LE4WeTbrOkcm6W//GoHbQ16tJFpkm71qCfSN6h/3
         zQQzPoIcemIkhXw0Y6WlUjaPAq1amS4KtJlL/M3HjXvw1yc/lBiaqdfWy3SDJ81NQlxH
         aRnI5/b3742LltARH43tR5AZPF1CAYjadzWVrKQnIqiPNBkUQICAzlP1Bym63JcbBqE6
         +rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016150; x=1697620950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiamZOqOZZtzzPmQsOXA8/LTPZNpfaNzuK4lw0f8SzI=;
        b=Mqm6f3AnLRNiktARK4SMjDFbT9ZYLfBIBNm3dF8VIqV12z4rOHo5wFLE1Vwp9IoQAR
         i3FPp5UbCMQQcUNQgl2FQSyd+WqfvIF2ICeBr0GfhDn6w4uVWGRnFIbBh7ZJvsTaqLHL
         UM/1htgcoFnYFv7p3futuISH1zaP7kttH4XaYwy/RXSeyc6WwVZJzH56l7TEb/b9Y3k1
         rkuhaoNPrbwKoy91NZiFQ/DklHmpvXcJ1C2gX1Dlgu4NUYV5eKGJvvoZsaDDNs2T/B7g
         10iz2l2cOxhigo4mcnPGlcPD49e+KcM5prOQCaMqLr7gU3auVPm75LTvnsR6JI4eg0Ql
         5cZA==
X-Gm-Message-State: AOJu0YwxT3DL+f91jkh3q2bDM7hMEs0HN6D1e49LtjBz71gmdlFz2qwy
	dYC8r96bCPzCgsOfaIRBqkA/FaVz9lt2FDYqWSgorA==
X-Google-Smtp-Source: AGHT+IFerUNHewgiE5tLLCx5HV3nwVhXkhxt2EIfdccX23DiuelsSBZdOsEH+KJvuaEUMPXd2xPPokchSF+FbYADBnI=
X-Received: by 2002:a0c:e30d:0:b0:66d:343:3512 with SMTP id
 s13-20020a0ce30d000000b0066d03433512mr1954964qvl.63.1697016150324; Wed, 11
 Oct 2023 02:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org> <2023101111-banknote-satin-1f77@gregkh>
In-Reply-To: <2023101111-banknote-satin-1f77@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 10:22:19 +0100
Message-ID: <CADrjBPqGkAh9YauwDTTrjBqx1fYmXEE4FwqDoPEy1+=Stf24QA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for your review feedback!

On Wed, 11 Oct 2023 at 08:48, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
> > Add dedicated google-gs101-uart compatible to the dt-schema for
> > representing uart of the Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index 8bd88d5cbb11..72471ebe5734 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -19,11 +19,13 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > +          - const: google,gs101-uart
> >            - const: samsung,exynosautov9-uart
> >            - const: samsung,exynos850-uart
> >        - enum:
> >            - apple,s5l-uart
> >            - axis,artpec8-uart
> > +          - google,gs101-uart
>
> These shouldn't be needed, just declare the device as the same as what
> the chip really is (i.e. a samsung uart), that way no .yaml or kernel
> driver changes are needed at all.

What you describe is actually how I had it in the v1 submission, which is also
similar to what exynosautov9.dtsi is doing by re-using the
"samsung,exynos850-uart" compatible, and associated data in the driver.

However the review feedback in v1 from Krzysztof and Tudor was to add a
dedicated compatible for it. I guess I could have re-used the existing
EXYNOS850_SERIAL_DRV_DATA structure though rather than duplicating
that as well.

I'll let Krzysztof comment on why a dedicated compatible is required.

regards,

Peter

Return-Path: <SRS0=v52P=GB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC82CDB465
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 13:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31865C433C8; Thu, 19 Oct 2023 13:11:07 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38DA6C433C7
	for <soc@kernel.org>; Thu, 19 Oct 2023 13:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38DA6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ce2bcb131fso279307a34.1
        for <soc@kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721065; x=1698325865; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=cjUA+iSVwkAurfks4B6iR2macALfHgXK5w6NLlptcOO+WztMBO0ABQl/TqD/dwZ+sV
         U7bUuNqFlvPJ9agGvCZRbXaPRYqNpAzDOUXuaYrpNgVTHWGkj/rgRWP5YZUrZNrl8pQS
         jjNthUNcxmd4X80F7aLKL1irS86fsadQNcHqQMQCi9K0M/SikbheGXT2m0JSFm9byXlN
         0CdNUafEHsVVcHgIbw3we90bxVBh4fkU6PQzPDH7assTdfDJadNV111CrWkbH/JbBA5f
         r6He8daV4UdFuv4TGQ79UwBR+i1f9HH2JAfSarV8Yy6o5M5ToCrb7XQNUZ19tL5B6+II
         CyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721065; x=1698325865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=DrG46345LOVv0lH7WQH9igxQ8mIaV66Jp7Vk3wIBYtVWVT+HbgqLI+Pk6i7gyZJJvZ
         BMWNFVm4MXttCbdrBhN2BeJCOqxTPOJXu2sQlV6zATrPGj5UKdyuLj9DEGTjKsVvwerp
         2bvFwTBVG+XmmKgqAms9sj7wD+449xTTxqXQ2tIY+7Fid/ok41HJV6FVPmxwxuveOSNT
         ABlY2NI6vXGW2t0CDLE3ONIGHk3OsQPTDb1j6VXltenM0GNNDIrrJnNksKQzceJTGDuS
         aGuEM2y51erJxDEKokLksi/zEr1akxG5HnpoN2PJTB2o95u5TRkrcsqB3uIPKnaVVS0V
         np9w==
X-Gm-Message-State: AOJu0Yz1Mzwezv2TRVnqH8DdI6pE+SqQR96Ts5KGDYXfPzIC6sy00/mY
	150LgC/TMFbsJnMrhqQar+C7yWjuMMFtVu8A/Vv8NA==
X-Google-Smtp-Source: AGHT+IE/jHTUAAR6nIMpfuFVHDcoOayI4LJaNRr2xjsoB7z11oXnUYLoafVN7xD+i6Z21o/jjAiy3LIc6fQpznqcdbw=
X-Received: by 2002:a05:6830:438c:b0:6c0:f451:ab6a with SMTP id
 s12-20020a056830438c00b006c0f451ab6amr2505339otv.8.1697721065336; Thu, 19 Oct
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-4-peter.griffin@linaro.org> <20231016133649.GA2641997-robh@kernel.org>
In-Reply-To: <20231016133649.GA2641997-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 19 Oct 2023 14:10:54 +0100
Message-ID: <CADrjBPo8xYQtR5qyLPgcUU4VKE9Ecfrb3XGKX4BV8CBLggJE0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Mon, 16 Oct 2023 at 14:36, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:06PM +0100, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..dbd12a97faad 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -30,6 +30,12 @@ properties:
> >                - samsung,exynos5433-fsys-sysreg
> >            - const: samsung,exynos5433-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
>
> Alphabetical order.

Will fix

Peter

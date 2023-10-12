Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A681CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 11:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E7ABC433CC; Thu, 12 Oct 2023 11:24:24 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48289C433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 11:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48289C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7d9d357faso11098687b3.0
        for <soc@kernel.org>; Thu, 12 Oct 2023 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697109862; x=1697714662; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=yCLQfXbhq7TyptOqsnTL774t6qkkjKhpRpg66bHH/5gLftSWyQxrqk5uaLh+S/8wE5
         HYG2gVCrbDCyQeF+QYTvm5gFyIxl4oeWtrlzgTbrkTywtRzT072rIMCyZcnS0Qz4ENIq
         VnqPyk52kjP2v1hhPX108oRhr+LoXVYEEpuoIDqsp3sza+xESLXqsUiZeZxbn//fYyEh
         qrb5lvoZ/S3OSMX0PyflniQKUMw+8JA0AK++3JV+lQDRr+tTJyLsAbRl4ikntXPT0NGi
         ZQCF9MWNUxn0xPEygBQF1fYLFaYTWXvWF2Jy6F5+D9BgzB4D0w6uqRkydsYhfLjY/p/Y
         53Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109862; x=1697714662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evuVw3Hi5rX09lLTvA3SZKrLQPpeaol5FfcaHKUVQ3A=;
        b=lTAc8CueCFv0qcck94YYfRiTkkL9jii6mbclEu20/2Xxd34VJKHQqmlmTYlL+VP8wX
         5WoWHqEiQCHYl3XVLuvXQP8Mx4kncY0azd0jdAU4DoBmxfxtmRHrNb0QGVcHOsVr74IP
         g1VremZaaoKPZtRQC0a7F+2a2Ep2hd0514YcRYjSJoC335ShFTECeOQsR5Jza81YGSeP
         m9jY4HIRIe63XXIuTL+M+hlHfOcfrm3bHgc6p6/I5all4oW944yehx2NkU68HscqjDnF
         4dUdwfZ4BTO10flB80U0EAx78HpYruD5fzS/ay1qJ44//SfZ0Ry+j4HNQWzLlq6I2Da4
         CUxA==
X-Gm-Message-State: AOJu0Yyey0Vab1FiQS2U45oMUYRZ2i0QMtp3vZu+vvnKHTdR+EM/ELsw
	kXTk5WCAfWEjclpG1kZZazf32SucPAtjItMyFVYlgQ==
X-Google-Smtp-Source: AGHT+IEyd9tU65OM05MFMUmFMfOwvob54pQV19I0WfH9OarQjpgIdu1hzRGw1nnfN1MVfenUQvBfK98TGAMRRXEgjxQ=
X-Received: by 2002:a05:690c:3744:b0:5a7:d4a2:cd13 with SMTP id
 fw4-20020a05690c374400b005a7d4a2cd13mr6139438ywb.8.1697109862319; Thu, 12 Oct
 2023 04:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-8-peter.griffin@linaro.org> <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
In-Reply-To: <CAPLW+4nO8kfUbQ6wJDjG_Ft0HAu_j3gAvcLLHU3BAHnALqaULA@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 12:24:11 +0100
Message-ID: <CADrjBPr6GY3YQdADhJZ7RC65-mUdYQ=Pk4XbOQ4nwfZt3EYr=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for the review.

On Thu, 12 Oct 2023 at 00:12, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Tue, Oct 10, 2023 at 5:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> > where more than one pin controller can do external wake-up interrupt.
> > So add a dedicated compatible for it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-=
wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,p=
inctrl-wakeup-interrupt.yaml
> > index 1de91a51234d..7cddce761c46 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > @@ -29,6 +29,7 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wakeup-eint
> >        - samsung,s3c2410-wakeup-eint
> >        - samsung,s3c2412-wakeup-eint
> >        - samsung,s3c64xx-wakeup-eint
> > @@ -99,6 +100,7 @@ allOf:
> >              enum:
> >                - samsung,exynos850-wakeup-eint
> >                - samsung,exynosautov9-wakeup-eint
> > +              - google,gs101-wakeup-eint
>
> Maybe move it on top, to keep the list sorted alphabetically?

Will fix in v4

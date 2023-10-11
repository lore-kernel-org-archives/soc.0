Return-Path: <SRS0=bdDv=FZ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2ECD6E5D
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 11:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8480EC433C9; Wed, 11 Oct 2023 11:58:49 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7BE9C433C7
	for <soc@kernel.org>; Wed, 11 Oct 2023 11:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7BE9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7c011e113so22238157b3.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697025527; x=1697630327; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcZX87bVMqxb05uB6AITFLlBPsFoCe5WSTHnOrtHLWk=;
        b=vtWFDwd/qn3xGwWSaG/egB4M5N+4CclrN70eEXLCC3LwSxzjZvHo9Nv/cA3QpMt+Ga
         c/ZoVAvRHuSX+B6nLYsBx/22jk94nH1x7AZ/jk82eiJLsFnVFQOR+w3t+zA9svI+0q6r
         jlPu7R3JljtmHQeFjVG/kcWu0+qT0rXC77MzcdYwmdv3rEr2sPLUBEtqpsrlq+IrmTNv
         rjJmw6i1+ytKABn1C9sCaTRiCRI6oBZpq8hCq8jn2VacHaQUZIx2c9mAEf1OpXfxfQiZ
         WmlxIXFXbkezB1SAx8YIII2T3SwiL+aeemNV5U0FPVYsBB3ueDGPj1GWzwHzMp8AUaJi
         a4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025527; x=1697630327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcZX87bVMqxb05uB6AITFLlBPsFoCe5WSTHnOrtHLWk=;
        b=so3OxBnKAvotqzme2KretfSoiQDMnZwzxQsyPjuCRNZUTDX+DUrnnlbIe+MsT/JTXo
         hOS9utOmpHKHqf/vWPhJbthQXPNP6NdeJnxrIi/rPmwClnBxuuIQqsq4H9iEdGpNMQM6
         yF58Nf1Rp+ECzEBY5x/2OB8yaEanYRISDhlCjEDmRqDg9Hwg7dPW3LPKNV+ozWmXuuug
         wNCLQ86zkNPxfDeHfux9LQImtYXqdmjbcfXWVNpBQWlr+wn2l4Hv8YkN0rT/O9mveSLj
         BQHUEnboJtmZ8eF1FculZMDdxF24iKSYOwcN0yyPyR11aLnBPyycgfFyQAnOq83t/vKB
         KzDg==
X-Gm-Message-State: AOJu0YzcgMrMJaPMCVkqQPk3KKX+cveTI6zDwm+uLfP9SvqBfX5H8O+w
	JCY4Bd3e8L7ZjNhmmOWcbiPn3g7cjFUs0MLrAitdLw==
X-Google-Smtp-Source: AGHT+IEMT7FKO0GU0LYWIJk61ZoZMd77YWiVGpHr+v/XgAesZ5a9ZC1QYGCxEuGoxQsKfMhFwWDDkXPOv2GeSnJqJoE=
X-Received: by 2002:a81:5c86:0:b0:59f:4f56:59bc with SMTP id
 q128-20020a815c86000000b0059f4f5659bcmr22662562ywb.42.1697025526803; Wed, 11
 Oct 2023 04:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org> <2023101111-banknote-satin-1f77@gregkh>
In-Reply-To: <2023101111-banknote-satin-1f77@gregkh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Oct 2023 13:58:35 +0200
Message-ID: <CACRpkdbsP5B2=5QRNidsPGyGn8gDPJPMMLyJ7U=nhhohff8UiQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 9:48=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> >        - enum:
> >            - apple,s5l-uart
> >            - axis,artpec8-uart
> > +          - google,gs101-uart
>
> These shouldn't be needed, just declare the device as the same as what
> the chip really is (i.e. a samsung uart), that way no .yaml or kernel
> driver changes are needed at all.

We strive to have these as unique as possible, as it is a hardware
description. It is fine to write drivers in Linux or any other OS just
being aware of a "courser" idea of what UART this is, in this case
would have looked something like this:

    compatible =3D "google,gs101-uart", "samsung-uart";

And the driver would be able to match to just the latter string
(these are listed in "particularity order").

BUT! The binding authors chose not to go that path, instead they
have one unique compatible string per hardware/integration version,
essentially per-SoC. So in this case it is just:

    compatible =3D "google,gs101-uart";

It is kind of impossible to fix now as well, because these bindings
are already deployed. So they are like a BIOS: written in stone.

It is possible to add dual compatibles for this *and following*
variants, but I don't know how Krzysztof feels about that, and as
others point out, probably knowledge of the exact SoC is
necessary.

Yours,
Linus Walleij

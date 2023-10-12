Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF3CC41513
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 11:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73B56C433C9; Thu, 12 Oct 2023 11:19:56 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64E60C433CA
	for <soc@kernel.org>; Thu, 12 Oct 2023 11:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64E60C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66d122f6294so4946336d6.0
        for <soc@kernel.org>; Thu, 12 Oct 2023 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697109593; x=1697714393; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNHmIfPj5WqNXPVt4ki8AWS+T3aJ218ouKELPyitkbw=;
        b=EadqUWRSiasck5+nEgCZg79GIPAtcO5aNnN7igGoK/shYBMHBhBvS3EDIzce5B5fVh
         fIWqQ5BWJosbMbffXj0066CwzNjcQVWFT27bInHgCt/TSdcYWPYGstg87EZBLR6LcgLO
         BcIRU0eJyF7G4scTmwVCtQm+NGLwvU23+16bKE28MWfqQ/Jvr9Ov6JZ0TPDxdQmhwEka
         +9nDwNib55CU2hUr4kUbCGMt6jHu5S2FzuxXGH09bygWXMWKRO3VtZu03jDM2OQXHE4s
         UPzr/nbVQp0xmYJlssv3X8rXMnbcylW8kFu9CMPdp7Q9JYlbp3OuvLVQ5VErfx04PgmW
         T3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109593; x=1697714393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNHmIfPj5WqNXPVt4ki8AWS+T3aJ218ouKELPyitkbw=;
        b=JS84G6incFTomtO4evVRrQtKPNvwZgqSOb64gj0m1FKOgbysccM+FlmmG3fq/R8kJd
         tL6IzMyoN/AUdI6d3jR0aYZhiIbEuLLWqDNowaxoTOiZ94BI51pc+MaWXq0zKGDsjwNp
         xgX5NqZlfUb5X14cCn8hneFenq/LW8QiGcvSFyIVxxXOn01lIBwdpxQ721CU+eoDXxOa
         Gp5iozUjzElAf/NAObZq6fFxWQW0NYUjlDOugj8WXrJ7H/jgXraMwkXxCqXPCHBdGwvC
         IARBjxXvJm5HZcdUqBn+y4vbynJNpzqaWRJsvC6VzwuQhlnAWYXJ0+BeW/D1T3DgymfA
         XtvQ==
X-Gm-Message-State: AOJu0Yyo+2+qBNh+cxsNyUhSFOzxD0udJeIqB+gnzTYxiiuJBf5HRzlN
	zfVF5Si5Crv/6GyCLC0cZBnAYWHFwAVE5ebySHBmSQ==
X-Google-Smtp-Source: AGHT+IGHlD2Lg3LFEDnxkXR7a8pgs/reNT+udP2T2si5zTff92WNhLXapfeVmVbapsPEpQqTLDasQ78TvPGrzcPB10s=
X-Received: by 2002:a0c:e042:0:b0:66d:daf:32f with SMTP id y2-20020a0ce042000000b0066d0daf032fmr3117885qvk.21.1697109593194;
 Thu, 12 Oct 2023 04:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-6-peter.griffin@linaro.org> <CAPLW+4kK_hhkht7OPgyUCinwaEPMyVq3DJ4mnbRVkGXJvPWbwg@mail.gmail.com>
In-Reply-To: <CAPLW+4kK_hhkht7OPgyUCinwaEPMyVq3DJ4mnbRVkGXJvPWbwg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 12:19:41 +0100
Message-ID: <CADrjBPpDvfyZCyCpXqDALLbe5POaBnKbzyyrEEfB2QmpChY7ug@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for the review.

On Thu, 12 Oct 2023 at 00:06, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > This introduces bindings and dt-schema for the Google tensor SoCs.
> > Currently just gs101 and pixel 6 are supported.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Docume=
ntation/devicetree/bindings/arm/google.yaml
> > new file mode 100644
> > index 000000000000..167945e4d5ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/google.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/google.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor platforms
> > +
> > +maintainers:
> > +  - Peter Griffin <peter.griffin@linaro.org>
> > +
> > +description: |
> > +  ARM platforms using SoCs designed by Google branded "Tensor" used in=
 Pixel
> > +  devices.
> > +
> > +  Currently upstream this is devices using "gs101" SoC which is found =
in Pixel
> > +  6, Pixel 6 Pro and Pixel 6a.
> > +
> > +  Google have a few different names for the SoC.
> > +  - Marketing name ("Tensor")
> > +  - Codename ("Whitechapel")
> > +  - SoC ID ("gs101")
> > +  - Die ID ("S5P9845");
> > +
> > +  Likewise there are a couple of names for the actual device
> > +  - Marketing name ("Pixel 6")
> > +  - Codename ("Oriole")
> > +
> > +  Devicetrees should use the lowercased SoC ID and lowercased board co=
dename.
> > +  e.g. gs101 and gs101-oriole
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +
>
> Is that empty line is actually needed here?

Will fix in v4.

Peter

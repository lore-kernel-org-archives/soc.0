Return-Path: <SRS0=MDPj=AD=gmail.com=mibodhi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06069C7619A
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 18:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B93D6C4339E; Wed, 12 Apr 2023 18:51:00 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5561C4339C;
	Wed, 12 Apr 2023 18:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5561C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id bh10so9986968uab.13;
        Wed, 12 Apr 2023 11:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681325458; x=1683917458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8GgKi0Rd6kCiCYBZPhErEcVfM0TkK8lsiwJgbaw5K0=;
        b=e1uDKoOANgFwZXtXr6Q1OJ789UtCyc7uXFniZoXLtq9IL3x4Ad49N2oeEmctylAGzI
         eAGaQaZgUH6iYA1wwvCBJnJppwZOxQvsf1ku8qgDIFnzaxJmqAZVg1zXsQgM/Pd7WdOf
         HNLCt/kcEKvIl6mbeLK9izZKLfpHFR3NuGQ1ZNwWbFTKZ4gwf9Jc2/Swa5Bl2vtlYFGQ
         11B/7VI1M59nTdix34hDNSsk0SDLMsMrDnkl0l3FrfRpXL09Qymh1togU36zZzvx09Z6
         F1TmHAemUutNXwmb93BgH6/pttjKSB+Lm79xlK7Bf/so7KfDB0j8FT9dWeXN43MjPUXG
         XQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325458; x=1683917458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8GgKi0Rd6kCiCYBZPhErEcVfM0TkK8lsiwJgbaw5K0=;
        b=ktXA4hKhgDy5Tp3tMYqZsh3ZEwDRVhhtJgxYDCrPAyIh4JB2KbDsQlNh/H4x94F46H
         AaZA+ofHJKb3MwnXP2cpHPhb8C3jf8gDkUuVplQKpwuGwr4ZZuMAAk687VuZGoyNIAH4
         Yvr0ww/tNGZBqV7Tvv9knTCy1162/ibVwZ1/ScQO/ZrHORqkHjRUxg03wnXR/hmm3LRy
         I8b+JYkkVzncHOWQ7p8CtL9bdzTrnsrtN9FBMYP3E+KFQ8DItmd8XiXpqWEIwVy+K9Kw
         5gfKQQYg4bzHMSwH7CwTUzN6mIDSjuQBiJmqzWBa0G2rKKzrXggrIe2k2siEWnfqkVka
         vTmA==
X-Gm-Message-State: AAQBX9ekBM8BYnpxYSDHEKfteRLwYqN30rOg0LvJm8fUJA0SR8Hz7PFq
	sN0ck63sgpUphFMbcXcNNM7dNBMdC2HLf7hcctI=
X-Google-Smtp-Source: AKy350ZSVhFoyFTi/fc3NDFlzFOLXKPOeWn5CiJd8C5f/p/xHotBKpHKfdjLlytUOo9/tu0uRyJWhOwLjvnCGyP6tyA=
X-Received: by 2002:ab0:5b54:0:b0:68b:90f4:1d8c with SMTP id
 v20-20020ab05b54000000b0068b90f41d8cmr4868990uae.1.1681325458573; Wed, 12 Apr
 2023 11:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412025737.20280-1-mibodhi@gmail.com> <20230412025737.20280-3-mibodhi@gmail.com>
 <eddb141e-6a8a-4473-b5e4-2e043d6f5197@lunn.ch>
In-Reply-To: <eddb141e-6a8a-4473-b5e4-2e043d6f5197@lunn.ch>
From: Tony Dinh <mibodhi@gmail.com>
Date: Wed, 12 Apr 2023 11:50:47 -0700
Message-ID: <CAJaLiFw00VyD4rPBh=06U6wXmbDaK75Cd9MCVwUCN1SF4A1_Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: mvebu: add Thecus N2350 board DTS
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel@vger.kernel.org, 
	soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Apr 12, 2023 at 5:24=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +
> > +/ {
> > +     model =3D "Thecus N2350";
> > +     compatible =3D "marvell,armada385";
>
> If you look at all the other armarda-385 .dts files, they all have a
> board compatible. It might not be needed now, but it could be useful
> in the future and allow backwards compatibility.
>
> > +&mdio {
> > +     phy0: ethernet-phy@0 {
> > +             reg =3D <1>;
> > +     };
> > +};
>
> Since you have ref =3D <1>, this should be ethernet-phy@1.
>

Thanks! somehow I kept missing that change.

All the best,
Tony

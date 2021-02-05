Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E1BC433E0
	for <soc@archiver.kernel.org>; Fri,  5 Feb 2021 12:44:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B6DD065029; Fri,  5 Feb 2021 12:44:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AD4C64FD0;
	Fri,  5 Feb 2021 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612529047;
	bh=h2qOOv3e7kAsV2hlLAnsoINg6+vs4lcX0hUtCmYe3lw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pPK9LB7MQvm8YsPJirQhLp4nOi9yXnD2kjUvboMKSOBNrvezB85SG4keDBQMIfRPn
	 iZAFqADDAngV6hTb9pScXPzuO+05v2t3B6TgmuGNf7trZFWKtRJ7dkwbgI2vrIs2oc
	 NmHv3yY5Gl0kzS/Ijf2rkv9Hm7Moh6IJg9RNU3XNonMjZACsGma8jDiQkGBTD8SGOy
	 jhwlwOZPUuQ/FG6n6WikRGfzHiKQTwxk5//uO/JE8XitclsK0dnZWhFRmLhlbw73JB
	 lVXXkh+FAxmqfg7JOAjKoXTeL7+XloliChbhLOGQgSi9q0xKBihuBVYpr1bbXEzQyx
	 0LQ1Uhg1ZJ3Qg==
Received: by mail-oo1-f47.google.com with SMTP id x10so42361oor.3;
        Fri, 05 Feb 2021 04:44:07 -0800 (PST)
X-Gm-Message-State: AOAM531pw5q98o+AdCf8Dw3JPTHnt7IexfEo4ObIV/EYqZaFvM9JSWNv
	gnz41cfIyBX/XunWGbCknoVmk6216GEqPmzq/AM=
X-Google-Smtp-Source: ABdhPJyFNASGtUL6SFR3W/WWHAyCpbx4HXopFMsnG12PVdwpgJVxJ75/vU9c39mapas+s6DugL4fX6Zxp0n9A6GVJ+g=
X-Received: by 2002:a4a:bb01:: with SMTP id f1mr3330752oop.66.1612529046721;
 Fri, 05 Feb 2021 04:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st> <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
 <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st> <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
 <3f2001f0-4a90-645e-d016-03907228dc7a@marcan.st>
In-Reply-To: <3f2001f0-4a90-645e-d016-03907228dc7a@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 13:43:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3DhP3AGWmmM_7O0H4KsaYEwEysdaGUdhJA-RX8A=Q__Q@mail.gmail.com>
Message-ID: <CAK8P3a3DhP3AGWmmM_7O0H4KsaYEwEysdaGUdhJA-RX8A=Q__Q@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
To: "Hector Martin 'marcan'" <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 5, 2021 at 8:11 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>
> One thing I wanted to ask: is there some kind of "experimental" policy
> for DT bindings? At early platform bring-up stages it seems like it
> could be valuable to allow for breaking DT changes while we flesh out
> the details (this is especially true of a reverse engineered platform
> like this, where we don't have knowledge of all the hardware details a
> priori). The dozen or so users we might have at this stage obviously
> won't complain too much :)

We don't have a hard policy here, other than the obvious "never break
setups that users rely on". As you expected, this usually means that
I wouldn't complain if you change something in the initial versions
and there is a good reason for that change, it shouldn't be a problem.

An extreme example here is the omap platform that keeps making
incompatible dt changes as there is still ongoing work for removing
the remaining platform specific code in arch/arm/ and replacing it
with DT descriptions.

Once your port is fairly complete and there are users that rely on stability
of the bindings, I would expect all further changes to be compatible in
both ways, allowing old kernels with new dtbs and the other way round.

       Arnd

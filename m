Return-Path: <SRS0=Y8kj=H4=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA23DC433DB
	for <soc@archiver.kernel.org>; Fri, 26 Feb 2021 11:31:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 59A1764EF3; Fri, 26 Feb 2021 11:31:45 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C54264E60
	for <soc@kernel.org>; Fri, 26 Feb 2021 11:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C54264E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f172.google.com with SMTP id v206so8696365qkb.3
        for <soc@kernel.org>; Fri, 26 Feb 2021 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
        b=IpZdAGjjww2yK7Jevu2iUTH/1ORVnE1GP45V0gbBup5kNdvj7KGTGT20s2j0a5PZtW
         S+3HhSFd8XgHpdGE86R3GFavD+1+IKlCzk9xxeylY6NBEkcZWF0T3xfwrAY3/GhCmPak
         rN81Nja34w7f+LeSBMWGiVaoDguZpdo84SOQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
        b=MZcARFLD3vN/fojLFapsib9PMd+3PZkouzynrfHw6jTr4jN76UUWpIZ8CSiSOvfiM6
         F7GijaquybHbOPIwC7VerXv9k93UBEo3R+86CBTKmgxsTKNvjfIWF/fA/I5vs0ydcO1x
         pKyyfsXnvquf5Pff7ukJh1VNnFfLA9HaAcxgrcJh+mf+x1iHeBhwtGIYzAmq2agFM6l3
         SuDtwp31NobQ8lRs9RFgIsv0RAF+HMWbVXLBqJ1vCVmimPYU7IgXVAtBzT/DgIq745EQ
         szYhWFxd60VxyV84pQlBGToy5MqhLhcWtBr7ozQlImKQOVtfngpyCJLKSZdPnBBowWGx
         sE8Q==
X-Gm-Message-State: AOAM533Wr97fZihFM/3HeMI3wv5vXmDL7F46vV6ESOIsWFxHwCfjU+R6
	HOmc5dEcFvca/PkQ6AvERoGmx7b1lZMY4quSZ/jsEhO9G7g=
X-Google-Smtp-Source: ABdhPJwnjTvOEGoaSYCM1w3lr13lrnyZmgopzVsHcWgIw+GBGh/ABGQCJHdvC5AWt09QvIxIIAVagq49zfIZLAi2Qh4=
X-Received: by 2002:a37:ef09:: with SMTP id j9mr659750qkk.390.1614339103306;
 Fri, 26 Feb 2021 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com> <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
In-Reply-To: <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 26 Feb 2021 20:31:32 +0900
Message-ID: <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Willy Tarreau <w@1wt.eu>, 
	linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rob's bot

On Wed, 24 Feb 2021 at 04:34, Rob Herring <robh@kernel.org> wrote:
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1370: dt_binding_check] Error 2

Looks like I sent this too early. I will try again later.

Thanks,

Daniel

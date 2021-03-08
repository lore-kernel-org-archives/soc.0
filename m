Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01BCC433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F53765238; Mon,  8 Mar 2021 17:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DBDD6522F;
	Mon,  8 Mar 2021 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615223335;
	bh=O4V57frTM1Q2V6DD1XJCpPKOS3e9+Td27CgPy0zbZXc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Ccl1jjnR5OBYLPco9TZXfbkb5E/MkT7dwoA3+x92n80Zz/GviYmHzL1Z8EMWGSjjo
	 7GtDwNdDyuIQJaJtryWchMqUyaQXln5g5TlG+DLpysIj+tKVGsLmhQlUq+bLHK4XO5
	 BqgnG4yVvT00cLNW9Q4BEyAbTBeslZzlvH77xSmjXIQ6J3IuG14dUfi2hF1mA5/T+y
	 AHJkkwhWyQqXD6WqHrvlkflDtxoT+DpwAP9W9dduIWL+aRjAIb/LYYCQDvwyzd9iRv
	 jziCWhImOQfJMAVTQcr/0aHSynA+V1GQtYV/nyVLdUvEyqabT3x+jc8BVnJ7+9JnRT
	 xvHPE3WPhvQqw==
Received: by mail-ej1-f45.google.com with SMTP id dx17so21853352ejb.2;
        Mon, 08 Mar 2021 09:08:55 -0800 (PST)
X-Gm-Message-State: AOAM531L2ohRQ/NfAN0beYhrxAmBRScW3P8DFn3E+hOVAqkEvni0/yD0
	EyrMGPPj1NO81S6raLlLzmxBJUuj9xY2vOcYEBw=
X-Google-Smtp-Source: ABdhPJwnGIYxWOzf7t/IJvdZRxITyPAZJLW9lGcKCUi4upCN/s7lfkbi7lWlaOrpGbQJmJUjA11fjj5bAX3PhHEKinM=
X-Received: by 2002:a17:906:a896:: with SMTP id ha22mr15846918ejb.503.1615223333767;
 Mon, 08 Mar 2021 09:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20210308162228.62614-1-krzk@kernel.org> <1fe9e98c7b3cc380e43a3aa0048a733a18c8816b.camel@intel.com>
In-Reply-To: <1fe9e98c7b3cc380e43a3aa0048a733a18c8816b.camel@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 8 Mar 2021 18:08:40 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdOzgmjxxLgZJwfa_dykfD97hTCo3ewUAyr_JPoErFg9Q@mail.gmail.com>
Message-ID: <CAJKOXPdOzgmjxxLgZJwfa_dykfD97hTCo3ewUAyr_JPoErFg9Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 00/10] arm64: dts: intel: socfpga: minor cleanups
To: "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, 
	"arnd@arndb.de" <arnd@arndb.de>, "soc@kernel.org" <soc@kernel.org>, 
	"dinguyen@kernel.org" <dinguyen@kernel.org>, "arm@kernel.org" <arm@kernel.org>, 
	"Murphy, Paul J" <paul.j.murphy@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Mar 2021 at 17:40, Alessandrelli, Daniele
<daniele.alessandrelli@intel.com> wrote:
>
> On Mon, 2021-03-08 at 17:22 +0100, Krzysztof Kozlowski wrote:
> > Hi Arnd and Olof,
> >
> > This is just a resend of previous patch. Since I did not get replies
> > from Intel maintainers, I assume this could go via soc tree directly.
>
> I think the to/cc list is missing Dinh, the socfpga maintainer:
> Dinh Nguyen <dinguyen@kernel.org>
>
> I already acked the only patch I could review, i.e.:
> dt-bindings: arm: intel,keembay: limit the dtschema to root node

Yes, I also spotted it now, my bad. Thanks Daniele for pointing this out.

Best regards,
Krzysztof

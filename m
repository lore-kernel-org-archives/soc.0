Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9169DC433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 15:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 661BE23888; Fri,  8 Jan 2021 15:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34E0723A21;
	Fri,  8 Jan 2021 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610120205;
	bh=UTk9c3tMauVtqg14iuWu/6qTpsPgKrCg8YvLzVwrZCw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TiupF4WDEzWkuzU4Z5UKbJBMLC0o2geBjK5icLvbINR1JgOkNezXRLqd0M4mQg4hj
	 9EwEXE0gO7kX+eVZzPp4ErhRVT/8jU2Dxm+glIUD2EsXFAjqgrU3+lcrVdkqC3WSFu
	 1f4tEJQZkIGemvD6ggH8/BBiUQXkR3n40tQFPy/gVphGL5nb9xrpraBlwLPEolyPsj
	 4rIaEmHCrJvmGUhKalUaw0h9flZVC5sVmm9vDibVKSq8tcZsLBtCAHv+2tsulyN+mW
	 aOiP7WHn/uTDutb9b6vzc0mWQV8Z69EEN6/Nbvbsu0FMiNByG4zqldsv6/gfaZW45H
	 IYs/CeK3t7Fnw==
Received: by mail-ot1-f42.google.com with SMTP id n42so9966221ota.12;
        Fri, 08 Jan 2021 07:36:45 -0800 (PST)
X-Gm-Message-State: AOAM531PwnuB2MEromuurpljfYuaz/eOqBh2Y0x4sNqswzvXEzTWNchJ
	GCEmQdKfEJojUEzK1QBfbCIkJFO26aykJY1SOfg=
X-Google-Smtp-Source: ABdhPJxfVwqZJDSKG85b/uM3DaM/Uq2gY14c5gQe9seiQ+15OqLY5HzKeYu4FES/c/msile8woOwu8E3qOCx4CPEzlc=
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr2988297otr.210.1610120204448;
 Fri, 08 Jan 2021 07:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20201210200315.2965567-1-robh@kernel.org> <20210104162843.GA1875909@robh.at.kernel.org>
In-Reply-To: <20210104162843.GA1875909@robh.at.kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 16:36:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ed5C+Ym3ANBSSgGKVHrhVZJ3-pJAhn_PATRz7f61Adw@mail.gmail.com>
Message-ID: <CAK8P3a2Ed5C+Ym3ANBSSgGKVHrhVZJ3-pJAhn_PATRz7f61Adw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Remove PicoXcell
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 5:28 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> > PicoXcell has had nothing but treewide cleanups for at least the last 8
> > years and no signs of activity. The most recent activity is a yocto vendor
> > kernel based on v3.0 in 2015.
> >
> > These patches can go via the respective maintainers' trees.
>
> Arnd, Olof,
>
> Can you apply patches 1 and 2. The others have been applied.

Done now. I've created a new top-level branch, as there are some other
platforms that I think can be removed.

       Arnd

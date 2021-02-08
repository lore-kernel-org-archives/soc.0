Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56782C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:01:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9CD64E92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9CD64E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zAUrEj6viFCyFGwPPi9k2BCkGxibh7JRu2TImMZ80SY=; b=cg6gnlxyfvMGs2WrZZLeYL9Q4
	gSHMAkiiaB8CLk1Pqjls5Z/OMJMfgniSKqP8sslMiaheWpD/qNRIG6AHA337NwG5zPyPzczJkZVi4
	NYkwDWiWlGlKFtJEROZXpMNv0rr4X90bBdt/NeG/15NpDjALe3hnj9JYVf50qijof1wLjZf01ydqg
	YGLSVJofi1U43o+oTe7duBaJxvEY0+DFbjjiHj1bVE5TJPXdCMoVtHKd9x7qsbkBKwYSwwpK+s+S5
	XxqKfpB5oplGiphjajl8TLpU2GcxB03OlkE84xWHbLyrgqaePnhSYsnkuR9yf5SdYhDR4RxnvVCTM
	JzlHVYAnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ApV-0007Ym-8k; Mon, 08 Feb 2021 18:00:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9AoU-00072T-C7
 for linux-arm-kernel@merlin.infradead.org; Mon, 08 Feb 2021 17:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lScv50d1ZyqagwO0c9BMwWMnexfOHV/tP4Lgw63kKHw=; b=loMLK3/yuhsUvV7e45aGfJKsGX
 k5wdtfWrfnY5STKRwijCncP2Fqsy/F628EBjxrMpmyddVb6FbboZtDCs4GRuQ4WDHUCgD92N6q3sq
 HxdF9of4p1q2ZSeWO5JJ1dauGY/v8P8WERUcH6dIeXJAWB0LKqB70qEHHROduoc53MQ6KjJOjPXM1
 X996Ny+d6OcRxPhk+ivZwAiWmipIKVS1JUWUdrRII30jZSggE4brCEle+kSzmF6gkDjUJEjJQCV/D
 tKyufj0HNaGN11Hk0esZYVjB61odX2VUC1L50xrEPu7mSM+sYHtOY1KBmY4ZtGEU8lIc3sPn+sQN0
 yhN3BZ1Q==;
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l9AoH-006JeK-UU
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 17:58:55 +0000
Received: by mail-ot1-f53.google.com with SMTP id o12so14957791ote.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 09:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lScv50d1ZyqagwO0c9BMwWMnexfOHV/tP4Lgw63kKHw=;
 b=Z/M/cFEGFJS/h2KnL61Medmkb1egxvz7Gx5Ki5DekbkRy5MTfgVEZecek94Ftc36aL
 2RSdhhKlPCUWL9POMCscXmuKAXPKeXhdMjQbMrdSnLjprwKWTPT7sdZlKFOGOv1XahOW
 kufxvZhUk1ggwK4Byu4F90mnJjyiRsTB/yuNZiseQ8IBzHjvPMHnpU1fQrHDbEI7LhZv
 hwsrwR7yOkfQgKFdD0v/A+Uaja/U9f84wkEnmCMkRYhREsP/1nVbzENy+TLDXvFg56IM
 rhd2HMk3oprL9x2AyaFReMTQSMvIfe1yIrADfCtHlbm4kkKCHrp0ZhJ9fLJZ5icXBDlN
 qXJQ==
X-Gm-Message-State: AOAM5301Z9BvuY6taDlTEflRICHqwrJGT/Kj2oRNw+yCNTdfGtfHwPPA
 DkULupYGUwupqOSZ8qgm4A==
X-Google-Smtp-Source: ABdhPJzqRSrYc4T8fAFx8cdWWHXtMy9OBexjy9vulNRDba6D0v0R4U+Q3TIwsWMEc78NEdWT8dc9FA==
X-Received: by 2002:a05:6830:22d7:: with SMTP id
 q23mr5443543otc.71.1612807129548; 
 Mon, 08 Feb 2021 09:58:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u73sm3668919oie.30.2021.02.08.09.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 09:58:48 -0800 (PST)
Received: (nullmailer pid 1618899 invoked by uid 1000);
 Mon, 08 Feb 2021 17:58:47 -0000
Date: Mon, 8 Feb 2021 11:58:47 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210208175847.GB1567700@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <20210208121325.owjjd7nfbdanszny@kozik-lap>
 <CAK8P3a0yBC3dui6vcz+NByWD-3LqRj-2MF89jpjb_k8r5xmNRA@mail.gmail.com>
 <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f98dc238-6742-455e-3f76-e86ae4c0c838@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_175855_711435_B47441C0 
X-CRM114-Status: GOOD (  26.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208175847.pr_c1htgnOec5_sKXRsM8jQ1EcQ-I6wKM4h2Trn143M@z>

On Mon, Feb 08, 2021 at 11:12:52PM +0900, Hector Martin wrote:
> On 08/02/2021 21.40, Arnd Bergmann wrote:
> > On Mon, Feb 8, 2021 at 1:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
> > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > > > apple
> > > > > 
> > > > > Don't make things different for this one platform (comparing to all
> > > > > other platforms). Apple is not that special. :)
> > > > 
> > > > AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
> > > > `apple`, as long as we're OK with having two different prefixes for the same
> > > > vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
> > > > this one :)
> > > 
> > > Thanks for explanation. I propose to choose just "apple". Sticking to
> > > old vendor name is not a requirement - we have few vendor prefixes which
> > > were marked as deprecated because we switched to a better one.
> > 
> > We've gone back and forth on this a few times already. My current
> > preference would also be to go with "apple", not because it's somehow
> > nicer or clearer but because it avoids the namespace conflict with
> > what the Apple firmware uses:

It's only AAPL,phandle and AAPL,unit-string (equivalent to unit-address) 
AFAICT which are really internal format details. So it's really 'apple' 
that could conflct, but I can't see that mattering.

> Ack, I'll use 'apple' for v2.

3 votes for 'apple'. You all get to pick the color of this shed.

> Amusingly, Apple actually use 'apple,firestorm' and 'apple,icestorm' for the
> CPUs in their devicetrees for these machines, so those will end up identical
> :) (they don't use apple-related prefixes for any other compatible strings
> at all, it's a mess). But we don't care about what their ADTs (Apple DTs) do
> in Linux anyway, the bootloader abstracts all that out and we'll be dealing
> with mantaining proper DTs ourselves.
> 
> > > Makes sense. In such case it's indeed your work. Since you introduce it,
> > > the DTSes are usually licensed with (GPL-2.0+ OR MIT).
> > 
> > Indeed, we do want other OSs to use our dts files, so the general
> > preference is to have a permissive license, unless you have a strong
> > reason yourself to require GPL-only.
> 
> Thanks for pointing this out; this was actually unintentional. I based it
> off of an old dts I'd written ages ago and forgot to revisit the license. I
> even have it marked GPL-2.0+ in the copy in our bootloader repo, which is
> otherwise supposed to be MIT for original code...

I'll also highlight there's a DT only tree[1] available to import DT 
related parts to other projects. It's generated from the kernel tree. 
Probably an overkill to copying at this point though.

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

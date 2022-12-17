Return-Path: <SRS0=7G7I=4P=free.fr=robert.jarzmik@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8FC4332F
	for <soc@archiver.kernel.org>; Sat, 17 Dec 2022 20:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C9EDC433F0; Sat, 17 Dec 2022 20:57:29 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5CD7C433D2;
	Sat, 17 Dec 2022 20:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5CD7C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from SOPL295.local (unknown [IPv6:2a01:e0a:a6a:5f90:5db3:4ad4:9c19:1e87])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 020015FF88;
	Sat, 17 Dec 2022 21:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1671310637;
	bh=OVeURlGUnn7ZUf0+Hoi0DPTZGsHXfWN8ZeCbFAHiRHU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=PE5m16C+/cBk5GWZuBSql3yTv14i9bD9Fi84WIiXIMlVxH2r/0UpMrxznwcb3fNhi
	 cZojmjSCinyHlIMWsUjIu0u0wrV+ZaHi/kTE/NAR/NenML4vTa/aWkpWGVKtx4Hco4
	 T//Df9XpmOHdcwBhiRBJtbYqFcMAMRLVX3WHoBhAWLz1JrRw0WpIk/XZ+QJrUzaVQ7
	 TmWlJ+QxsM3ZyPU4Zs9VOi3h0gvJOVZYycP3u+gVwr66irRl+IvMb7UO2ZkvDDl94O
	 7kUortuccTscYgqykMewPJuQwdd6Ruei3N4YB2XX5nz921f/7gN8BttSy1sGSQHso3
	 qqHSW4GZR8dZQ==
References: <20221215160747.2173998-1-arnd@kernel.org>
User-agent: mu4e 1.8.11; emacs 28.1
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King
 <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: pxa: fix building with clang
Date: Sat, 17 Dec 2022 21:45:41 +0100
In-reply-to: <20221215160747.2173998-1-arnd@kernel.org>
Message-ID: <m21qoxiw9t.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The integrated assembler in clang does not understand the xscale
> specific mra/mar instructions:
>
> arch/arm/mach-pxa/pxa27x.c:136:15: error: unsupported 
> architectural extension: xscale
>         asm volatile(".arch_extension xscale\n\t"
> arch/arm/mach-pxa/pxa27x.c:136:40: error: invalid instruction, 
> did you mean: mcr, mla, mrc, mrs, msr?
>         mra r2, r3, acc0
>
> Since these are coprocessor features, the same can be expressed 
> using
> mrrc/mcrr, so use that for builds with IAS.
Ok Arnd, but "mrrc" is an ARMv6 instruction if I'm not mistaken.
Yet PXA27X is an ARMv5 XScale instruction set IP.

Is that patch correct therefore, or is it just to make clang happy 
even if it's
not correct ?

Cheers.

--
Robert

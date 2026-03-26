Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B71388E6C
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545238; cv=pass; b=ir8goNw+us0+vT2LnzcEGMhHIIxox5AvNMQU56CG97WK/FN60veBN0OKro4U/zKXYMPveYareEO+9O6wmpcAogGQXmTsqav47cf43HpaY05Ow1/TtGfld1Sz9oLUAqxkWHskDtwMLkVFLCVsWPKanqRj5hpLBWj3z5Iun2Vw+eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545238; c=relaxed/simple;
	bh=6by8ax6LVBtJzT2zeIYIiNytwNlMq82fUxqHhZGAH/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ls+ieloS/8068HtQXkvuBkyKMexI8sOo75psWb9dnzWnVk0IyHmFDi8WhMTpT6X3tr9d0FK6Mb/UzvE5Ve+1EhY2NUdJOP7C2Fy4wnKusn2wMlgs6V7a/0Iddm3hH5OoS+yS91zKj800LMcnFCJ9bCOxyzNMOHRZU9/lyOrjUAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6uETXDX; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6uETXDX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c153272250so152316eec.2
        for <soc@lists.linux.dev>; Thu, 26 Mar 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774545236; cv=none;
        d=google.com; s=arc-20240605;
        b=YEOwACvB8js14jH6E3cInVdn4NrxaCt/4p+2wDVSlFx3FV3QjtF5B5xjGPkwisy1mH
         fgWoMN30xWErOLl7mOtPBhuxh6iEr14qNte3yOiaieQYHRXbE9ukoP2pII5sp+8nHKIy
         9NugYjt/K9xU0KZbG6cPAKC6MD63IDir8vw1gP1pNevxzLbBKGZu4ySUDZMC4BhHuo0e
         PpmIWd+CIHXbGhYGqIoZSGLkorNRs5EU3tjoVXLpvq2AfHaZ9lkpo6IWKRiLDqohjLoK
         mR5CqCsbk1Ou7kQlWG/j9L34lX3MQwByAo/Z6biCQm0H7qDHSNEMsbOk9tnWZ1YR38EE
         vysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        fh=kZrqwi6aKQQEuedgrUrjToWjEf0rYG6b+m7m3R4DULs=;
        b=EZWxzKgZzx27LAr5W3FB8LA4Qqitcsym1verRPSLAkeYELcbglTUTQtQqZe1KA4Z3b
         Fqgi6/yH2JkCRsqjUC1fX2sO8adfdUIJplbXsj+Si2+KimaKGFkhkYE/8hfUJ0XRfYyb
         Jq652r1qy2Kvf4drDYqC5mKyOCijv2lO88Fab5dIL37RKM8Ch0vRWf3aMwvwi63jBwyN
         17DeCVUDOEgk21/tpg0i+TN2//B5VJGgt2BLVYMXXUz7Q5HCGxyaUj6eflOGEN9q8sla
         cCq2hrunNLsKqxSmuCU5oGsqqfBI6/Vx21am//TC/LzDEC9LJL3n5RL7UHmizIu+Rkio
         gxtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545236; x=1775150036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=R6uETXDXco1WoxdwLYovMN0ar5akuBQVuaSv+nE+fTtsxm1DeL6l65HUO31PmFLYoG
         j2jfLpoExR9Yu4NIWxG9BOo6l8ECYfzVfa6FWFLk7UhIOqhkhgKavaw2mKLsz9GRz6h/
         ByobXwpp9l+thO0sSs1HkD1HMxH3UpW1cS6CGiD/zYoWE6tUhhbzbO2vilnA8RS67HGY
         EfywfpVN6SqzzIC3JiRxxZPVc8rqpT30DB31gpEKGMCADykeEDl5np0wYZLwjqFpq1jk
         Wo287O7HW8kYTE62CfG6Xj23DaTD0Zf+QeJjlu5ZMYpTroEHVVuvKdme1BNZm9XvO3A9
         afNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545236; x=1775150036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=J8XGCFCF3TfLdkrv+ivxEINblhPJ0bUki7EFktIEQncJ9EocwbCbi0yvVAikTujpWE
         DEITw9X+8u2w/5bwROftqhn/OHxNTj1kgKfAFY84j8z1EqmPIX/2VU9tLhjB39v7BJAf
         QzTP3zgF7GpPZmfebffKjl7suNXcJqUxk/mBlX9p7ZKAP1x5PhW0Q7kId4yIX7luRyz9
         Vq5ZgybZqF7SUAUiPaOA+c6ap0wG8oHy4J2RTD2ZhNq5HXS/xZRSlqEvmojEKgcV/gNE
         Cge2Ry4j8WenCDFXFJ1rBvUmoR3QekQf0hXn8/FBlUUm/ki/F0WmoNAYa7ZbXUPYnJaz
         dAMw==
X-Forwarded-Encrypted: i=1; AJvYcCXuHSYViiBSV19iYxNoF/G4Niy99gcN5b21LrajoPeYp8ChTRSsrCiF+uOMwtnWJFBoZ2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxszQERvn1AtTVHS4fGL2UlmgJH05b3qUv7C+a1+xkSJse1doA2
	zsxaZd+sBak/Evx6oBsb+4mtLAU3QA3xmJWhiLqHPQq503+CgAOzx/RThtTFPSYGun2RKBvN1xK
	r/959UpCM/J8b0DAFPhI6UJvOwv1ClNM=
X-Gm-Gg: ATEYQzxYbyDir4HaerMx8Z/gwt//bPwvP6J0NIgtVgs+DL1f2KeXmZDNjQEyg1s/4Wz
	NIARUOARqSCWipxW8AVOmyrcxpZ6pDjwbz7cBVq6xZs9yceBeBlprMOo9HNUmQIZlbfahjnE9NS
	gkIxu6DFrb8AiNaJuEHkypVxQ82NYZHxmtlgrfMNRn0X8FHYH32Pkw3Gr/5Ur8hOYMbwQk1RWAc
	l0n/GnFWYa086WcNnFOJ9j4emR4jAt8JZg06mXCjEPuldgeZCLyjZUqbqrMHb/OhNb+RB6TAbxK
	ih17YQOSKROoihq9vhPJnobFFpUVp9WN8p66jO+6w8o+LRJZwXM3DW+7X7kPJ6DA5nKYQY5rzEw
	Ng3pIGfJ0KIES0GzuNmJ/2kE=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2407895eec.2.1774545235402; Thu, 26 Mar 2026
 10:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org> <20260326024226.GB2302780@ax162>
In-Reply-To: <20260326024226.GB2302780@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:13:41 +0100
X-Gm-Features: AQROBzCjsVmkmyxhYBQlcnjNfjk1drusXCGXl2NpoBVYAfyx4urVLgdrjE0kdQk
Message-ID: <CANiq72kyFu4StTPbobkPBSMYxNa5T0uErkLj-6mRvwOquEsgSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, David Gow <david@davidgow.net>, 
	Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	aliceryhl@google.com, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-mm@kvack.org, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, nicolas.schier@linux.dev, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:42=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I do agree with some of the concerns that adding an architecure
> dimension to this is a little complicated. I would rather try to flush
> out those build problems with patches and keep it enabled for all
> architectures. At the same time though, I understand that enabling it
> for the "tier 1" architectures is a low barrier of entry for getting the
> feature upstream, validated, and distributed to the majority of people
> that would actually use and depend on it, so I ultimately leave that
> call up to you.

Thanks! I agree that it would be ideal to get it clean everywhere, but
given it is experimental and that arch maintainers should likely known
about this, I think it is best to start simple first.

In fact, let me Cc the x86 and arm64 maintainers so that they are aware.

My current thinking is that I will add:

  depends on ARM64 || X86_64

and try to land it this cycle.

My understanding is that this will be used at least by Google, mostly
for Android (and mostly arm64, but possibly x86_64 too), so I think at
least arm64 will see some actual users on an ongoing basis, i.e. apart
from the "synthetic" testing I was doing.

> No real concern on that front but .gitignore has a command to run when
> modifying it, which will require a !timeconst.bc in a
> kernel/time/.gitignore file.

Yeah, that is the exception I mentioned. Initially I thought about
putting it in a local `.gitignore`, because local is best. But another
option, with a different kind of locality, is keeping the exception
close to the rule, i.e. in the global one, which has the advantage of
showing us all the exceptions easily (and being able to write a
comment for all of them at once).

I am not sure what is best clearer, but I am happy to do either:

    diff --git a/.gitignore b/.gitignore
    index 3a7241c941f5..3044b9590f05 100644
    --- a/.gitignore
    +++ b/.gitignore
    @@ -13,6 +13,7 @@
     .*
     *.a
     *.asn1.[ch]
    +*.bc
     *.bin
     *.bz2
     *.c.[012]*.*
    @@ -184,3 +185,6 @@ sphinx_*/

     # Rust analyzer configuration
     /rust-project.json
    +
    +# bc language scripts (not LLVM bitcode)
    +!kernel/time/timeconst.bc

Thanks again!

Cheers,
Miguel

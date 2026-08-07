Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C0448397
	for <soc@lists.linux.dev>; Fri,  7 Aug 2026 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141170; cv=pass; b=ILU2fJzWyNlMiQfZUBSkqzG3p6BfFv7E0mij33tjfePDYDXJjijfBknNqr5MduSX6v3wfO2JnH2G8U1uHV5XMUiCiX6m1Es8fb+eFhcgiXfE2EHzW5b++A3vbwH0y/0K547cdQy8YlpzULYGHf3UykvjgGCu1q/0zISb5RPVPTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141170; c=relaxed/simple;
	bh=e8Y1Xf7NJBWvn3GcoXqfY0ReAr4Anku3u7aZBDyqicM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scP3BsYjcLB0RINlT9kEGiH5NaU9/jLd3r3UiwJNmLH84YaCleFQPIYiRdbNWhXPFiJkFNlos+4MyEjJWA8Sp2FwYf8/Eczge4evOBb6G6ZVAhcLqQlxveQcAD9eZ9AfJFxmkyUpW54XNslqZIdZyPIVUz3xSTCF/OmHIUXmAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmiOav4A; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmiOav4A"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d027b7c8easo236415ad.3
        for <soc@lists.linux.dev>; Fri, 07 Aug 2026 15:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141169; cv=none;
        d=google.com; s=arc-20260327;
        b=m06ZuyAartvhok6GeGVdr+MvYhdyyRxEhWsxHMfmuWYDwf3sRbynYR1dcdi9nlFk2S
         8t/4XLWlQA0mFQt6SuLc33ve1Dzq7/Ih2aRK/Uso7QknGtz8opZxkcY43M5c4H6hR+Bo
         QxfZS9VuV7TOksGiv2G0NzCoXRBBGUM50UU/jykP3XYVZfusO1YgCkxvxZOfDIkDghiP
         VU18w3O9od1o99j14NdVvUeO0hyG2/uzmNr8TjxalrMF7ynsK10DuFItx99QoBOeuZ9S
         EAZ3KcAEK7ntX5z3Amrl6TYg9xb1v2Jt62VMWzU15pL7HHjz8QI6arvUPVbi/m5Rdp4N
         XQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        fh=k1UoPMakOUIUuAYCH42SXngKfvjcuGy3UMDSI6jDcMM=;
        b=CeHwMhpFWr1lMkvEzY088YLeyL1XK9I1Dvrv0CPLqeptO+FCS6RsaCQsaZZwjbOQqW
         95VkifGZa2CR6xKTHhJgPMMN4JKpU2SY5SynWYwWKyD/NsdqYLav1UBlOr30OAO4cL4Z
         Tmrli+1IyueeLwwYLVSHWS6p2UDz8OB9kRGC+/lQWhaQgzW0WLazqaXAyvEDYv5c0mKM
         A1CVqV99BizLzb0ZbYrA0ATzatlPdy8b58MMpkHGMQEnQ5V5Tmf4JzEaQpYAJfm3qvM1
         4Mm8J5IVp1BtLuogxNGjw2yUAga2b/bkHjJ4Tg1slqsJIAfAc6HXTQuRp8fR7quU/50i
         TdRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141169; x=1786745969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=YmiOav4AUwxNTa+yDGmlyMTOiHLZpNX6QDaOlZN6iA8Ka65rH3wQxwwt/XvoR2yPdT
         bmSMk0WWZaOoM4p8Hd4bpOFxbbSqNfGwJ6yioRiC4mcGIfdyqOIrbTbf3sCISJZDjAhT
         1WzRd+JB7aCA0eqKaGqq164hAHo5nVUKIIZE2NFgRBPnLOX1MsYfIb5TFUIdLATsFB51
         UhHvz8OmEeYBaF/Aw5teGtg8Wx1sCu02BKIUgQes++QwypTCn8lb1RWGWn07E5iNbJKy
         7/tPfd3DIPTEbXV2guANPW5V0/kKhnfLfSqskC3yjEjgZqXx990eYswS0QqnuOlD526q
         n4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141169; x=1786745969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=j0qa73Iv0vT/8K/XrXWmSN44+1vJuSsbz89fLKHuPSlRyMXXmfP1XBTp24XbuMA9f1
         fvv0ACrGNV6GCm4Yfe/oa8LUQCh1P0YxjF6+nA34+X6EuA9gl+DxGX82MDHqPpVkS4iA
         HE9zRIUWszQQk9JvWfoSHcUQbVw1rou1arQ7Fb4kahks0UdYCFRnFttSI5s5cH2Jtlst
         CPkiR39Cz08QaJ3Ng7GxJB2zup2KahDxBCPxk5kcIvOpF7CrHdZkh1XOc8g9MWvH7wRE
         Ko41ymlSlmPngkKRJLg4flT9YV3jpqZMnRWDHB6Vl/YGzpMlktFFK3rWwSyMD4XqUwGE
         RzYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDePEpHvkewbQ4VafZEzPvsVz0Ct/TRTAHcmfMQC7EalzQAVhi0DY3ZC7X24VbdMkmcpA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfB7sboOEA3c+Hmx6ClJvgB4TzX86n7dPH8EMOgVdCzSQrxzTW
	JdkgV7GAwYV2KgaDp3MGzgjEqH584X8z4Q7bEsgLus+zA6zVbxwkNLVMp2hySi1VRb9URVEQxQd
	FqUzOQaLb2qB7sUtopm/HhkN3unv+FnQ=
X-Gm-Gg: AR+sD10hU6xsGWv71XF3YgZFcQCw9H4w/AHnlnwu5rUNNNWmfp3ifCELQqQn30mxIdp
	aQgPq6Zmc6HULixBNV/patPr+ZFE1LqBA5JMNGl8Jsc0aahDMskgr2P2IH1G//e8XqVtsaYP7IJ
	jkIM3ZJp8qpaD6aGj4O9mh8O/rh6SuTcNN2bAcgsCkd9ENjNgHBlG+rrZ6tBLC8yKM2xALZ4Nkh
	gmB03FDqeYjs2oRswY9YOHAyU/5v6tq7IS75og4JO6v4g6+FtHahhWNc9cqko8z9hwjS7s1hpQX
	6Ic5yqpXr+ToeS3uQnhr2YLcr3FBKbAKVC+Y58VTIb3anyeW9uAlO0XhV8olRjkEMurNuiH3ncP
	4pULOADH18q9obuIySxgL+8wiPonxknFEqQSa5XwFXuAn//2aiaho9pHv29ze
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr199280125ad.1.1786141168638; Fri, 07 Aug 2026
 15:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org>
In-Reply-To: <20260807221429.155946-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 00:19:13 +0200
X-Gm-Features: AUfX_mwU-H5_dufTVjV8Trje33MyfE-Oane2tYYmAglrqJ8h4ShpzMvOIUP5krs
Message-ID: <CANiq72kz2Ec119ZW2uiu0-RPHr=Zy5-WRA5tSOYk5it6PqpH2g@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: Miguel Ojeda <ojeda@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:14=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> On arm and loongarch64, or under `CONFIG_BUG=3Dn`, the upcoming SRCU
> abstractions from commit
>
>   59cf3a5bda61 ("rust: sync: add SRCU abstraction")
>
> use `warn_on!`, which in turn warns:
>
>     error: constant `WARN_ON_FLAGS` is never used
>        --> rust/kernel/bug.rs:126:19
>         |
>     126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag=
_taint($crate::bindings::TAINT_WARN);
>         |                     ^^^^^^^^^^^^^
>         |
>        ::: rust/kernel/sync/srcu.rs:106:12
>         |
>     106 |           if crate::warn_on!(
>         |  ____________-
>     107 | |             // SAFETY: By the type invariants, `self` contain=
s a valid and pinned `struct srcu_struct`
>     108 | |             // and `srcu_readers_active()` only checks the ac=
tive reader count.
>     109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>     110 | |         ) {
>         | |_________- in this macro invocation
>         |
>         =3D note: `-D dead-code` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>         =3D note: this error originates in the macro `crate::warn_on` (in=
 Nightly builds, run with -Z macro-backtrace for more info)
>
> The reason is that `warn_flags!` discards both arguments in those cases,
> and so the `const` becomes unused. And since it is a macro, it went
> unnoticed so far.
>
> Thus fix it by simplifying by removing the `const`.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc to Tomonori:

Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>

Cheers,
Miguel

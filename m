Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A7D2BE63F
	for <soc@lists.linux.dev>; Sun,  9 Aug 2026 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786244485; cv=pass; b=alZcXRcKyPgPvZJ1hVFcguk/GBTgF5ejzg06V+BwUhOjZkg/XO1KIuaLQwSYBiVeSR+61HXLEyLwMt3QB3QLstLlE2/2a7uDAZTpSiMU4i8TtwARMSvFVAwvXTgMxqVEht9h79wOBrJX/5hBwbn59ozielsx8xEF1MliuJpayg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786244485; c=relaxed/simple;
	bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOVktUa0yoTx8pLEi/H+CQxOEuVRsiM+2bJUEa0o0lj83EyMNEY3PA6G/9/StbLttQrjol8KgARI+MM+T5EGZ7VOquCqBIcAbdvykF4ES3Tpez+KI1zcaPn0j/qoHQu0rB1Rm54TeAFKpyRKf4vK+UkYwOLb3/vOyPdtlkTiC2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofXaZ1bf; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofXaZ1bf"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe4c537ad6so56994a12.0
        for <soc@lists.linux.dev>; Sat, 08 Aug 2026 20:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786244483; cv=none;
        d=google.com; s=arc-20260327;
        b=ai4Fwsl6Hp3Hx7nrd01v3GJORw13v8PMQ93LjFJ5PQNZzzvuW6Gn4wjbIH1UQocdtK
         czO7NuKol7BLNFuGYPacD9r0BXcsnftFQHzOqPgJvkY52pvqUO7tbjOSn4fgM6wBDret
         eq7yg9yCTn8n71mgwSZMgOEJyekxCumCwEsoQwA43HaIbVNfZsxpqcR8CbNotFGSjcDH
         pJ4croCCB1ELhFFQjSYmcAYD18e1LvmrOkiXain+MwVlddciLiSBLt4t6DrPCYwOiGx5
         4bESv1Tq+oRCei+dUaHiiNchIJSez2iv4ZiimyibaXKzgU2e6wL8eIz5e2JqJJo8zvZf
         b+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        fh=EftdmBRd2OH8MLUvQaJFVmEJVUdYwNNH2Jl9EnPVysE=;
        b=b0ntKCGYTGIMHf+kuh1XMiOlAEalp1ZJXMqvBCYsAo1mORFPlxWQ45ojj6qMfYRHdS
         hsfm2KDn6iRmgi9e7IbY3oyQYKVB1Si1fQk4txNq4gsRHxbeQoX9ueXB+5mFDgOwyJMY
         afgCMLFOSWyzRZ3OlxfFz1z1z4GxcYigKW09wmUoGUB23Yby9cE6Vam2pfh6C7VVwyOq
         MWbGAYQEA54SLSKom6DOEZPBgzXgeS5hG/DdTQV8oHmGQ9pmMTd+XhPIzsA1/5R0VL6Z
         PXRiUrdjabre1SXbB7rvMmXMxo+u9/x6RB1EQ5l16GS/wqtAyVrLN5ryUklUiLqX9zvs
         HzoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786244483; x=1786849283; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=ofXaZ1bfdLDia17Jczj/1mzPTMDxi5iNRzBsCe4DPS1Ukh+yp6tilgo+BYb5PCkeve
         Ob6ueMC2IXa6KLP5ChwTBv6K/RkEZ90Tl+dMuPcwS5fr7q/jX2BGDph8DvHFhu6MLcbw
         lmlaH/YOrjD1+I1wtPCD4TgwSdkuLF3EaTqvWacnAi2d9GdmSnH18Dv1mpUDFY4p8h4t
         vZTKAc1Bnozeh7T6Q35TlHyPbLxhDkdy6h2X/tAUPYWraenkKc5aH3gv4lMFsPdDUwS0
         wPKd0+zLXO+wdYT9kf5kVD8K4CK6dUv4zvQmliM4v+cRVNeH0p4XUe5c4ee7DD10DhlN
         NEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786244483; x=1786849283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=E5o2nxWoD/eL+hnfbAhUoYfskI73B+h2EkV5oODjHn5CsB7CCzMaGHp0Jdmmz7c903
         CU76MOGmeR6kycl+HLKmCtY7V7PWxq5zSr8ncym12DGTwPyrwGgIfSkwWq329eNQwznZ
         gPX96/uzb2m8na2FSw5C3aANLGlViPrrYJBcaCJqfqVLGKZXZsS6e5YA2/bHNJthM7r4
         VxdXJI2O7GXF/T+zPxZ7wOiZpKcHTmyPyQUfx2gFfE4+Eahl5f6+v8Zto67QcvKMu2e3
         4rE/+yrS1SJA0rLZdTvboUlnuu9eqCEW2s9T3XOVki1vQ6FwZ8oVOz8xm/iTviddpBft
         MnnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyJh2EE1R+Z/IU4KroXXmwQfLeFfAUpOKJ3T9cdx/f5Ac9StQDM4xC2nRMiL4ScFYeN0o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ovGn32nZmyiCfO2vbEAz9d7tVaexAu3RlYinfFS99NDT8nPF
	TfetEnPDLsXJ1znOjzwGxwJn6EbrPtt6eYQXa6pMh/tH06gLxUVONi0b1vVc0Pgok9jvjSD5+n3
	vHyYSbAIW4+4wjtJjjz/FEXhg7IQRn7c=
X-Gm-Gg: AR+sD13YSNOVCzJXMBueYMw6s3+AcUJts1SpzvgoxBLe5/DEe7SuZAd5iizjdRAxTbo
	HfJyow54LWoczphLeXG0TRVqFN/H+FZUoJfsDDb31tWZnZf0KojNM8284xtIvte0IpMU0fZQChP
	SPeZwUAkwZlasKlffCEypGo0I7ml65aoTK9xt3YK9TEAj8klNXP7sLxlVjmsmMcbS6DJUIXinpH
	JgTFrx98yZ09DiLgmWEOFSHgkG+3dJ8vF+wz9dplJovjuPFQ4Q/U0GxLoa2xBBkrJuBG9a8d3BC
	WBsVj8uY1AZHPjw7VTKKsLG138VX/WOz39U9nfyfzbL2a62YWV4dBi7DT+R0L1k6zFiR23wsT7h
	+VFlJIhA3oMbpEWe8EcJMWbqb9UYER33pWUrrZ0gKjvzWzu+IGZVnPRMxkToe
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr257513645ad.1.1786244483476; Sat, 08 Aug 2026
 20:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
 <20260808.143013.1251068388254615351.tomo@flapping.org> <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
 <20260809.095041.602618436881623934.tomo@flapping.org>
In-Reply-To: <20260809.095041.602618436881623934.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 05:01:09 +0200
X-Gm-Features: AUfX_mxOkJgVjfpd9Xjn2_lEgaaMyCa2CI5K0zvJDPjtb_T8ut0EX3_Stxulh1A
Message-ID: <CANiq72nxE05HEyNmxGj2gYHaYL95eQQVF9SAuhDdHX0RDW1i2w@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:50=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Then `jump_label.rs` needs the same treatment?
>
> `arch_static_branch!` embeds the generated arch asm too. It is not a
> problem today only because, like `warn_on!` until now, it has no user
> inside the `kernel` crate itself.

Yeah, I think we should do it to avoid surprises later.

Good eyes!

Cheers,
Miguel

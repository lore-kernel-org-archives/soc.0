Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C193379982
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786218064; cv=pass; b=c+27sW42gbPFL3CbnjZtk2HyrQhL+04bK/y94NjkxEg3X2DMXeEkdLGWFFWvXBEyKaQy00s7vNYtHpE4Ug79QHQ22krOEFDFuMsAEVgWCNjkpQmIvNuJhT3ReFFE8Z1DGDWTI+vTjfX7HJFt1Mhd6Ekm0gxjdaWlS3MkzFAtj2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786218064; c=relaxed/simple;
	bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRKtAtfi0Eds+pxhyrfFotq1FQ0R8iHM/ly0evdcvCg6MmEa0Zywk6QkxLiDiuYYDKeHYSWlhQe5TnABa2pThhMfom5E0rznL0UhggAq0I2eYoKPz4/GNBvlCoHV5reSBPe1XDHEzcyrFp99Zg0kAjMhOahWtiVkvI73wqw5kQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewQCIlTS; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewQCIlTS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc8311c6ddso437515ad.0
        for <soc@lists.linux.dev>; Sat, 08 Aug 2026 12:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786218063; cv=none;
        d=google.com; s=arc-20260327;
        b=ApwpkRyreDhMH6v2aZUiROJmB0v7ugpaDKohYz2JpblnaNF/gVSFWJ7RF0DEkGxRkI
         DMZFQSKzl1mKhwmTE+tgjsg2BvJ8M0Jx0AyD/pT+anW5ViO1oeWmSeDolq8KhHRSNRBU
         cfZ62DxISGVi9jjVH8VhZf8h9GK2rz3XiHDf0Spi/9147hwnojc1b0RVuroLv46OGCgX
         ATJ3mVrZGjaQ4BVTpevVOzEV3b9e3ChE/JfSU/5xUdxGSdlorThgA2PucFpk9Wo0B+6Z
         sZ/aND/JlIqrZdlLZN/6tmef4io7PyeI2+rImkdjuBA0klgGXqpQEW74sn5kchBiGlRV
         9jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        fh=hCfsYPA+KMVQ9XLQ18TYoIzZjnvDmYlAb3bzjbflzKg=;
        b=DuGrM3ZdLHGT6InDOX/uRL5Jbn0iHujHaQqjy0O+KgH00Jr7A2sjUvjWAZ4HjSu0Y2
         s/3vPJqPtXLwpsTE01H+4mxNtN/hFTI8Y2Je/3orx8ASDRXWH1nUnnlE4BdxyAnfKJt1
         VZnzNgBTvuz88FhewdeCoeExSLq59naH3pIo7sfzNJOAzykaS1N65sMBQri8AxE0yPkv
         93qiJWFezbsW9i4PjK3t+sbRlD3e3wBtRCz2iei0w6h1xyD7jCXjHp9GsfOlix5AK0xj
         A/Yk8t79qW7seS+UNsNoNGt7bxKNn06RPr0C76Lk3eRebzzDvP8gzhUGwR9ynNox70BA
         4D+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218063; x=1786822863; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=ewQCIlTSu/mzZps1D1hYLIjnV0Q/ErSWUt6bwbw3FAncXFlc07Tstc9nuoDMGixcCe
         eM/Q83nz82D+A5F41SpZ4N2t1DvRHr3NUFgHkpWw41AHCxcWDCMD0rP53IJTxzNRBiL3
         JWmXxpHUlQHfvsYJb1Tag6wN9Jdx0eCwUxHYFpENt1LgedNjTIC4J67VgqjjXkASU/2G
         WT3jdek0oNdjD2X9q4ibypHUilvOZKtWAyMXx67yjXzN85LpC6bgt7viRsFjKmjTOFDU
         uiDcaaFV9fvSNFgKl9NBDZfrFdQHrzjL6LRMVlrGOBYQRYZMApwNu/N2vX3OlW72ysja
         vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218063; x=1786822863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=Sf/Su3ua6GvQ1foknWlywt7beiHdS4HJuGXPG4GW/4SAWT29RR45EJNmBP2//3gJ/c
         Otg/iacg8VSfvUgnytJYVT6dsPgwfvAxGMoGjQ39fGtwk0w8/fr4rsZwWY9zpY3P2z2S
         7msifW3apx8Esu4aRvAyuk760MVzzfRI/XyaoWAT2gzCmgOq+o1sbxMuZTNyEiVI8Ugt
         I3yCEGmVP8b2ArU1/Q7OOLypiRhaBkhqM1PF6Hb/tWsjJEc36FRG9EYSWUfqqS9vIAa8
         FbywlXm04i/gOQzuS9rYujiOds5st1ODRiickGBvKq6w05PFze1W237rQQN7xgTSwDOX
         NjJA==
X-Forwarded-Encrypted: i=1; AHgh+RrF8Rxn7GrM8/q0tGkvkQdZbEXGE32J4weeEy8doAkDrTFNkCuMCtu7wxszrStlrGZvBVM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJNMLyt1BdwxxTdYtr5DD9O3JDwwjn1zqjDGewI3dRvUa7M8T8
	kYR7a27bc9X+/G4VVcZC6GsYastdlXW99xnn+sv1rr8E979SugQ0QbsibudloeYryUDVIJH7iJh
	vEoOBsabf8hKgXyBDkMwluSzukkfz4ko=
X-Gm-Gg: AR+sD11ePuYB2c37f+M0bopbf9yhY0L97hcP+1mZqtnTec0An9WJn7ASls4o/G6oALh
	OMj3da6KUapBE7DaXkfvjkKpsXtXA9sODLjj3KyB5iD+VtFHL6+mfVVScSARRjqRPA3dkYiMBg8
	KJsO7m7XIjBM3uNh5OKq868FKvi5V+oSkXUhLRgYyG+v2ZmsgthqQIoh1y72bLXqfNmBJs2WUdK
	JSoij9/HxFoDjsPndhrB6kvkdjB2VZB0IqtaWusFCYdYJuvtT7swn1zkVlzKGq4P5K6zkVmB8Jb
	YSua70g00gY3yWsCEpgyXHr7YMTgoqjej614+mpYeOjH/D6zIIrLPcA+MUu+UdvKiMjXmJIOFPt
	v5mVl7DIewpb1345nAq+abCLJiRqYc2ROkKaOqFyQwkS1Z832Vf/2CZvxmkzo
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr275615635ad.0.1786218062739; Sat, 08 Aug 2026
 12:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
 <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com> <20260808.143013.1251068388254615351.tomo@flapping.org>
In-Reply-To: <20260808.143013.1251068388254615351.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 21:40:49 +0200
X-Gm-Features: AUfX_myY729uYjJW5IhCmENfsQg8ijuPS9VLtcEZjSqkZiEXciXEvujLP3Jq8gQ
Message-ID: <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
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

On Sat, Aug 8, 2026 at 7:30=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Is this the one you saw?

Yeah, exactly.

> I posted a `cfg(testlib)` split for it:
>
> https://lore.kernel.org/all/20260808022608.1125174-1-tomo@flapping.org/

Thanks! It seems good to me.

> While at it, a question: what is `rusttest` meant to cover when
> `ARCH=3D` is not the host's?

`rusttest` is meant to run tests on the host, regardless of the target.

There aren't many tests there nowadays, since most of them moved to
the actual kernel when we got support for that, but we can still do
there things like testing proc macros.

We could also use it for more things in the future, perhaps...

Cheers,
Miguel

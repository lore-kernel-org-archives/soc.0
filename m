Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF9332EBA
	for <soc@lists.linux.dev>; Wed, 12 Nov 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950976; cv=none; b=WM1Wxoa/sakX05QpZduRaPoBxgciyZ4MnY6q+2TIitpbdnIk34gMkPB3iD08hw/YCquNMaVxtsYR48hzjJFkO6pEymOINVpitZn6NsFgqLzUbxxiDI8yN5WpbsGUs2fHtd0c9aVanhXWoUMkKa4ZcPKb8SjPPfkkf3dwgLLaOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950976; c=relaxed/simple;
	bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAWKhJwFyL1unpXk/11Tfa1W1QeS6lXejvQWxD4T/iEjZwg6KRNX2IJrELnlpRLRwO9ysEekRyWlSzMnJOHYWWrfPPqeALPFSzl9cuMEcg+pjZoJr1QdihOYS2lh+uJubPvniC6nBbSupoMf3HGcxYpE59cmoXL1K6NzZnZ67Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvbfQSBp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvbfQSBp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5957753e0efso798094e87.1
        for <soc@lists.linux.dev>; Wed, 12 Nov 2025 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762950972; x=1763555772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=;
        b=JvbfQSBpHQA07b+GVAQovM/fhuXXPl9cELAOQpDJMVAb5ZltRz9DbOFWs0/Cw9mSpW
         mf78R/bnBj5Qa8SRQhFfPTDCOeP/iJLVuQ5bpBdjMVqNqO/9T/w5rrDAGykxQZrbiSkm
         tNGHZ9h4sXYr6vINFVhpxPvfkaXVbENcEGok1ShcHyn0lRh1wgA5M3KSc1mDoSUv+MaI
         rqg8ff0+m46nGXYRLgf43FVeDfgPjBwQDzMzQFuMx2WzOjGrsYCtglQS1u5gI0bWpFiv
         OJ5GAM2SYmztO7IFzHT6CMsGc6Y/oZl5XZf7bqdElusIrAIhifURQBpV7OIrLMf2D5Tz
         YoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950972; x=1763555772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+H8mi4wzWuOnGOUj+vry+C/RsrNVNIni+GZfNRFC6RQ=;
        b=eF8Jzv434nWaDt1lhfoyWfUtgJXRiOaaa17efYcWlelx4N0jCU3uOsDORI/sKwyecz
         CnyzfUQhYHPlhThYpsq6/KuwkozTdkZLhmBZbSbUCYr3HHXSpc0QooVC/++2wTzZPulF
         g1HsqZNHnEABKHtyG15f0CG2cCr0KBTqPjDsaZx+zW6GS87Eyt/IZXg7lGlQPcoi5bi+
         uwg1wCDtLzO4G0PnHq5GXvMubxyzn4pMuQQEW4rn3tnht3IxjxSFMraA6+1SbkSgYK4V
         pf1QtAMlkgtU7+e6FVsUCsWSsdG93YCRf+jqAdYup1U8UfHvcBf7fRjEGnb5s9wQXYlz
         Vr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCspmQ+1QaDh9unjdWS6VAGdIvT5v5TRMuOeU4QrJL352rXgPKrnVyXu8Qyp41XdY9GwM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJB7gLGvYNiglAdnU9T8cdxwppqKiO22woEjLrUjP5ajeT4s0S
	IRq0FYHpfsvA9ALsQv3C7phXYdf0AUnsEa0rkzsIpmR1Ae3dlUzFjZMFyzzY3QEOSLXghBCt8uS
	qjwguvrNpAJVj3MYYc/CPGTjQrClgVHQgHZLn70Ry4Q==
X-Gm-Gg: ASbGncvO+9WBKYq1sMmRBvLmDP+MigM4RAsUxs6ei7fLme2LD0SWrkktakIEb9U61U0
	eemORvQs1yS+m5vI2bSYuo0AptoXsEVaGLBHm70VTDTOxjw7w3tfPfOT8LPLt8aoTkPlP5NPvsh
	uuQd8agh21jfqDvEmGrsn23iozgYKSMjC4HEciWAS38SAN/4gF0yrIL8DbLSsNYaax6Lvm09Ipz
	rj/m/k4CR+IGAohyiGeAbt2w65cLzyUvyegq4K38q6QW3f8sd8Tbsa18fHX
X-Google-Smtp-Source: AGHT+IF35xdCqK83Nq/ybJ3AbuqFKvL1x2W49echwpcmfLqDZKgxLvlKCL2HANZseQeKP1IlFhLxTXVM/a5c4VD3rP0=
X-Received: by 2002:a05:6512:3089:b0:595:7dcc:3a8d with SMTP id
 2adb3069b0e04-5957dcc3d9dmr101267e87.48.1762950971883; Wed, 12 Nov 2025
 04:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
 <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org> <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
In-Reply-To: <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:36:00 +0100
X-Gm-Features: AWmQ_bnt3mMa52ZapQDOrQjKyBrrsOytzgBujrgqyXTEfoNcsLTSjhn-fe-x9cc
Message-ID: <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 1:26=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> There will be some Laguna SoC
> drivers for pinctrl, clocks etc,

Oh new pin control, interesting!

Will you be doing the upstreaming of that?

Yours,
Linus Walleij

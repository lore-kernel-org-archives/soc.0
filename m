Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6823148DB
	for <soc@lists.linux.dev>; Wed, 12 Nov 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951407; cv=none; b=pgmOK+k4k7JlZk6tgF55ihV8BTBfvcMgjhSId5nLBTQWi+yig1E6nNmJ+nZl7XeZg63Na9FlG15d03RWFkTha5lm6YBx4Z4sSs9EyxfhEEhZMficQEfqNjwi74+vjCTVNIiT2AVL8/zCX03kpnDKXsmgftVzF/qDXOtcSAxOMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951407; c=relaxed/simple;
	bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wn7kgbz/0ZMXEL22hcm2Neilxt5KMum5ce/FfsCvpDlr24Sb9HLAjPOnhuD99otiALnBShf3iCQMj0/DaurHA7enx2OKtCdPxWQvCaM6OPYjsE1u2P/xia2QHwcpirXI8nT3wonFR7+cWqrKzJuCPeLziw1V8VrHYhbTWbHvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stnRMzFg; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stnRMzFg"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3e4228e0fb7so425607fac.3
        for <soc@lists.linux.dev>; Wed, 12 Nov 2025 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951404; x=1763556204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=stnRMzFg8X+VdiAJ1vIKyRPRQjBr1NvZh97xkusUmhtDkjmqt0ubCJRlymYkcfCPJo
         KxxRQOePnua7dYcA+80RUGbiu7xx+tuY3Vb41Sxq17YrNPG3rcNkxSJLZdYWYecmaVAj
         2pOeMH9RA8V3Xua2wNvUbaXii7D3ZZroljr+/DlxrjP7art/jiTcESG8cnGSYEy6++OI
         w+ygjLA8E2JZqZjUlRLQ27LZVNrLM0o/GwIlGAN2czzYQwvrWim8+yTz2/8tDc/QOD+V
         y247NNhSNjdD16boqwp29+5a8+57UVQYv7gcTp2tuNcyIAKjPAqYy9nosb1YwChTv1IH
         ICsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951404; x=1763556204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nCLGdNg0B7kK9ihswq7fVace/Pjn+bodu3kR1lh3t8=;
        b=rBjw3C7NVLzhdEP1kNh98l7By3BTVLHAOyYUJoG0dZnQVCxcpEXaFihz3NqnHd4ptU
         FQrp9pjO3AeVI8Zm+e+mvUGzwzEP7xJf1jkH1CD8cIU7x7frk7+QWhEG7eqgs3tvf/Xt
         GpFYYekvHqPNUlQfR8LPm3fQLpAzcO4hWs++KAo2/mjjLeoDZb6FiYrijmMDgdAXhLJC
         HIw+NkOQ0M/YaFR4VFhDzNgtGglwUbIxeRIYTv4TlHxFYJyClEhAkzJXvSqYD4XP6hGe
         G/7Sw+7Doap5ZItQ7IrCIqFQvZSTAj56pfqdKI92WgRuZ9EeC/C0n6o5G11vL0+ZtE/n
         KmEA==
X-Forwarded-Encrypted: i=1; AJvYcCWyxmzmFcZWGcpzQp9m1GY9p6/qQ8k2vrP9PRU06lBE9FMQ8tbt85pcAnFgu0cAmvQKvAY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6QoS6cDTcx2X6m5yQk/KeqxcVf28A0p/UYqDGhnmCbb+ykp4F
	FfWLCAQUEADO+WaCqVyAOSg7kIdkI/w9g6Bwe5XzjoyOgYeJK0xFRG0kvBTqnpclz9zlrykjx5v
	A0vztGYyg6M/ogfvRplb0TJBnNmgkk4eTXj3iwqy4Ig==
X-Gm-Gg: ASbGncsqxF6fs/woxQS9vYBjlWwWcOSBWdVB+qE7CvJwpMeeLT++4kvK/QPHb140PuO
	AD+tAiwP8XwnsNyP4G/mSK0WGlZoYjynQiW+iNajvL4rPvtOuohiltJBklFm0fJd+NXVNd30k4l
	uHWP8A67Dv8zZdVIVcZz4ENnFxK1zIkUrwBbp5k2Rss+YEzWCdad1oTEBt94pIUmGKiX0/0pVRY
	ry2zByPuSkCTDgXULz92EVlAyrARLgv9rFuU+wqjEhrk2KMXAtfLrBsN0bmdg==
X-Google-Smtp-Source: AGHT+IF56OFOYiIqZ0djA3ZvTwB3pXvmWTE2Y/2e47Acadn9UwrR6l4mgUbLbvMhjjLW0TKRt/QCjKhcWzj8fAK4e1A=
X-Received: by 2002:a05:6870:b14a:b0:3d2:ed44:67b9 with SMTP id
 586e51a60fabf-3e83416c4e5mr1230844fac.23.1762951404616; Wed, 12 Nov 2025
 04:43:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
 <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org> <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
 <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
In-Reply-To: <CACRpkdYN=FN92cuS3U-XBVoyD3DcKkfzEXYVNnQNK07rxJJZ=A@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:43:12 +0000
X-Gm-Features: AWmQ_bmPb1_M5A-rGtzHjXMiQBLBGQHTdvPma_dayyNctbSOvz5HTwmZK5JuVGs
Message-ID: <CADrjBPo+EhJ5iLCm=HpzLCWjv+QCX3ft4e4eC1CPzeCk+trpKQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Wed, 12 Nov 2025 at 12:36, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Nov 12, 2025 at 1:26=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
>
> > There will be some Laguna SoC
> > drivers for pinctrl, clocks etc,
>
> Oh new pin control, interesting!
>
> Will you be doing the upstreaming of that?

It will most likely be Doug, not sure if he's started looking at that
yet though.

Peter

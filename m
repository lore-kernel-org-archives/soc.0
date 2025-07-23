Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE027780C
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259160; cv=none; b=WFm/stkWJV+9sCxjQ4xW2r6dfQ/rcDgghnPZnXEnjPgRBXNAigGzS7pLHansa8ilj54pI5KXFoF98//oPy01o9xVN5P6J3bKExbwFcvza/Gu9xnCLdaDuc2M4BhrIsucuI2EX7IKYAm8QdSu2vwndiPLC0inhEBUfHobJ0jhDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259160; c=relaxed/simple;
	bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsd53EtDroOfsRQrQzCqCXB66SkQUgGuR+QgTAcNCS21rLho9M40A2NUlBzajtvVTT/qYk9XbVS7Xw4P0dWh9Oxs/ILgf266RnI+YCREb/jiEQhon/Qm67y9M/yTTrZ+gbzEFNpB9QHnfYvnfEfQzVsuAyKfeFJy1A6oY/8OCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i2dDM1qV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i2dDM1qV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso5497437a91.2
        for <soc@lists.linux.dev>; Wed, 23 Jul 2025 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259158; x=1753863958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=i2dDM1qVy6ffMfEx23gV4FTyCYtFve+KsI7StyDnu735zmI4bbwPjCRoqwTz979+97
         4odjBXZadp/mCXoqJ0WNWXgiiz+jarjpOeWK5wyR1IS0BQRCADdFAjD7mFDEucSZAL6I
         FC662jmN3rjq7aLrge19FU1jICe3OtD395z9mKZLLv4oNLREyRwaxflEILLJz/DTFw+P
         FtuohjqMKra0/hbobCwpw1P5kUu/zJ22N87xJvXG3+vfXv5zDc26h13qTxT3u3WVUB3q
         IP/SdF7Bz20/KTYuKcxHL19fK9ThOGG+uGsxFnHAAWc2ur2Vwco76cV8puLLnQ0jc2IW
         JB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259158; x=1753863958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=DV/C4GkYXAt6vIpcMTwXaCAj9SVq9BCrGS0JzO9fehGxGpWxq36yLn6WyVOHXDrA4A
         9136vZdscw8X8nh9CNnG5kCRoQA9CeUKbLr5NvPIb3RSMnFVxE01HE/2SGvuLj5MC7Kp
         nJ8Sptfho+7FUVaJGMpqyMj+Im7vOOxBpgERFoZsw1rA12phHqdH8omcQ/4Uv4g6P1pw
         7WlD/1ei18Pd2YM9IfGdCWKUyzn83qYLh1dHWfeWgUxpafJDQpdCu940loIHUbPZM89S
         r9MPlZrfmL5vkt2Ca0TdJTXiIWJ1y6WbRoxDtZHNVlDCfsvavijqwkClLiE+tAn4grtS
         JgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6z+qB+ad5zIlJ2BJvhB5REhz7tpSA09VfuqbuJWaBCHDwQ1IOVfdXIiHqTDVhPlXNOU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsjfZzEi3zsezIR2eiDY7t6F6i1PlN/ftb9njjQvlY7Wb2SFH6
	IqVUCHRBtvKB+7ddTjlPvE9+AUMXjo143VDziFqhkIrDtYElMpACga51BFYTjo1MpTwY9b9V3VF
	PtBCSufLxQeC/lwWPYQ/4OucLZlvfQh9JHABhZu84aw==
X-Gm-Gg: ASbGncup5EMMhKi7agYQTAH9Fx+8qeZiKQJSiy9OKRUDK7P5cXs+KUzwonKMNtcqbZP
	xBPPcIcAsVL6i0vOV8NqIRnhyPuKdHtVoR2npmwTPgIYrgorkvdDFT5UQ8LhKUZBiS0oV5FvZLC
	H6igM7xfqcJ8bRLl1zqH/Qj2H9VOOiFL+3IPWZmDaWyJ9G8kkkG6LdDlxrjFPzZX5nQf0THLwj2
	cRYqyuXnIPGVbOvjhxZWJg+c3+ndH97DzmC4GlGSrxzMgd7
X-Google-Smtp-Source: AGHT+IFzwCafFosCdx131zbcEFY3D64m+7mo0loj5vAsYVkMFUgy5UAHuuRGjg5yAkxctR2cI5zO8+e+kqhHgdsFxCw=
X-Received: by 2002:a17:90b:53d0:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-31e507dc7b4mr4498294a91.24.1753259157929; Wed, 23 Jul 2025
 01:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:25:43 +0200
X-Gm-Features: Ac12FXyLbBDcOzrp8fBxUqR9jIu-gUOTaGAF4LxjwERQBqGacqdoGbliH_T9iv8
Message-ID: <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:16=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> -------------------------------
> Hello SoC maintainers,
>
> This patch series adds initial support for the Axiado AX3000 SoC and its
> evaluation board.
>
> Change from v6
> - Ran "b4 trailer -u" and add reviewed by Krzysztof
>
> Add soc@lists.linux.dev in the to list and send this series again as per
> suggestion by Krzysztof and Arnd. Thank you.
>
> Checked locally and able to apply these patchset to soc git.
> (git/soc/soc.git, for-next, checked commit: 7dfbf3176d886ff9a0c7786942d3a=
89809d0641e)
>
> Sorry for late request, please consider this series for the 6.17.
>

I can't speak for the rest but do you want me to take the GPIO
dt-bindings patches through the GPIO tree for v6.17 separately?

Bartosz

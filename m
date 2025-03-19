Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEF1E521A
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742424384; cv=none; b=Q+6Hu9j1/ud0BEjB5HFSfxkx+ye1dswcSLn7SQE8PMdNTOpyyBPKNAbhlhGofcWawZOc2UWSo5cQ2BrHS+TuYyzsQSuLH5MkMnzA7uE2yLxOtuQOioGqSp9zFKJSyzR6T/ssgiZjJN5NKL1qkZiD3oedc6EIhYVr3c9x3mJY9Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742424384; c=relaxed/simple;
	bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcV/SL4A20kViqwT7DUAa7W2w9DtqAgrNdfTu9w2wwMLddEKx8aHQFgbZG+seyCo5y4mtjEr2m5qVfkDQ1dTk5GH3JaNyDoVqBUr47XbwghO31yN6VrcHNXEX0SUEeNCggabinFI8bQsMMFG1gUFEA1zpaIdtRxrANYjOzgyFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=f0ss3yx+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="f0ss3yx+"
Received: by smtp.kernel.org (Postfix)
	id 2D3FFC4CEE7; Wed, 19 Mar 2025 22:46:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E57CC4CEE4;
	Wed, 19 Mar 2025 22:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E57CC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22435603572so1331235ad.1;
        Wed, 19 Mar 2025 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742424382; x=1743029182; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=f0ss3yx+vg7JKFhak1sUAdCOng0VOCuSMMQaMEZ0kCDCs94a4YnMtTzF960owGVNFU
         TmCBbDyPj61Q0zdivTwp5/y1tiYW1ss2dnl8xwZNIOKdVdkN7lYWlU0qxxESrFqQ9tJc
         38n9SL7XyF+F3d4sKy/6ooZeHlVJtxF9QWdvfnUORgkpeYta1H0RV8hyt/Gq3WA1DaGy
         pODDHlCih3uv4THk7WH7hhLwnickjbF7ifTgZ47pm0vmlo3fMjNiXp120NoSCaMVpRgU
         FknsuTO7WASaTDQmLvNcQoNrFu/kdKOSe+nsr+wzVtIiPnmmm7dV4HQLecJoRcd2z63Y
         OFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742424382; x=1743029182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=Ho4K7/Teku7NlSZD2YGBX1AYfgWu3VUc4YsR1XHsH9gbFBhcBPAAj7xMegD7fW5U4D
         iKzmohznkHJ8wju4bZCID+7osNOYp6LcG9Mhx3JY9IHZDfpgkfIok0F24JXH7KyPbmWQ
         pYRfFP4cvIwkITmD6Z4GPFEkoh1YrV3vonSdxUGksxrlpHVhKJYIU3OUfpzWOx9ET51g
         SgePExoykrzN5aqRGlqeKqgEA8Lepu7wPI4k0e2wqqOBmS1itQ7HgQBhzGctnP64++y/
         jh9iMRTgWL9ptpKOwOHyrkyrqYMqTRuWVzjklSOwSl1JB5eOkZErBoKd+X9OoKhAFDHE
         C4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVTtrTjkTbavcv9stBiXwc32nvEIRNYmVi9QoBW+Z+ZXtSNsYZucRbKdmDSmYgXWlylZ0jP@kernel.org, AJvYcCWE2w/ZF2gKMqEZb2VhSq2SwxUswb/jur03gvv37WZobjSOwFc6rRBkUSfuTIrq6pgC+iE=@kernel.org
X-Gm-Message-State: AOJu0Yw3gPtVoigFabtVLqlFv47BjO4XKtVRJ9ZKLFLQVrWqnhDH8mtJ
	+V8VokE4rcHXbqlKF1hyF0GwXC6EcCZoY/4K/uBKi9mD8flx2Jnm1r+JsRugclAEBvJnAvx9wEu
	6WIHWqAUWWPEtI4ZNzmwSDFPnHAs1sI31
X-Gm-Gg: ASbGncu6AI1tkJkg83/uAP/D2v4b3Dd58VOYB8soQ2MhHFiWv8ijKI22DHLQb4g9Gkx
	X9Q9qw51WdX3a4yZysz4Lz3mMlr7TpwfEyWERqQpzsLbG7Xo8TtebERPkmEevz5PwZBI+UVb7xs
	fwB8FNhIQVnWF3az4lLbFGaHxGkhYAWLcrG0yzUZqeIeah57aZ4tLZvqfUnrI=
X-Google-Smtp-Source: AGHT+IG8GiaDjf3sdv7Ye3FkTV+AEaDW7f6KYxRvPyZsM3yaqLJDqBbKlA9xkI4sNwT7OOGxYzetDJTJZ5N5BHjlaJM=
X-Received: by 2002:a17:903:32ce:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-2265ee924fbmr16165715ad.48.1742424382296; Wed, 19 Mar 2025
 15:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org> <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
In-Reply-To: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:46:11 +0100
X-Gm-Features: AQ5f1JpBHXJRBsjDf382ohz1oHEzy_ztXE_MKlrqlUkHAd_fr7KlcjqRE5tCQhw
Message-ID: <CAFBinCCY4-sETrXoi5ELjXhnUYB+6q+A3M2FqaGCFprBxe31kA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm <arm@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Mar 19, 2025 at 9:58=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
> > Hi,
> >
> > Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM =
bindings,
> > adding pinctrl support for Amlogic A4 SoC with a brand new binding styl=
e then
> > finally gpio_intc node for Amlogic A4 & A5 SoCs.
>
> I'll skip this one for 6.15, seeing that the branch contains both
> driver and devicetree changes, which messes up the way I send
> the contents.
There's an immutable branch in the linux-pinctrl tree from Linus.
I'm not sure on the exact process here (whether the contents of the
tag are fine and we're "just" missing a description, ...) so I'll let
Neil comment on this.

> From the description I also can't tell to what degree there is
> backwards compatibility in the new binding, I assume the changed
> PWM and pinctrl drivers continue to work find with the old dts
> but not the other way round, which is why you sent them together?
The PWM part is backwards compatible. The bindings are upstream since
commit 5fd61cc28171 ("dt-bindings: pwm: amlogic: Add a new binding for
meson8 pwm types").
The mentioned pinctrl binding / driver is completely new for the A4
SoCs, so there's nothing to be backwards compatible with.

Neil, for me it's fine to skip this one for 6.15 if it causes too much
work on your side.
Using the old PWM bindings for another release won't hurt anyone.
And I think the same goes for A4 pinctrl support as well as GPIO
interrupt controller nodes for A4/S5.


Best regards,
Martin


[0] https://lore.kernel.org/linux-gpio/CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40k=
hNZDdYb01-BGigw@mail.gmail.com/

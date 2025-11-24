Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A9314D0F
	for <soc@lists.linux.dev>; Mon, 24 Nov 2025 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000811; cv=none; b=Jkze3UYsgwT5pWgpqbYD06ZTUBj+ZpA/U0RHM9/FYOH1xwG0O/a9TN/D0XtGZhQgunbguaROXDxvLCifEps2lMBSsqQaBqcEFZuBRodXziwkEcEYGDs7rNr8JsB7RM9mRgST+8KUo3NOWLaRD8GUf4bICnKr8+AIouswO6W5CXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000811; c=relaxed/simple;
	bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAeOfzXyWdPLBKlTlUIr7lr+esULkSZ5Wc0aZsz9ak0jA2gYdlTmMokoBIfwjw6EV7UJFumiQM4SVbJF/44AfLyyCA4nTa/TXUimB7TzcTyS6yPN9YctUbjRYaT7VeeaScMpDNopOKHtbX77DVFATCLO44i0qZS9mKPHGhcHaas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oBi9MT4C; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oBi9MT4C"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b713c7096f9so691208166b.3
        for <soc@lists.linux.dev>; Mon, 24 Nov 2025 08:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764000805; x=1764605605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=oBi9MT4CBT5NiGlRkDAA2AtxEru4cwFARVg+aHI++y1t3NWXXD4icP5luL380PphFV
         O/fSp/pxB1c73U39VVw308utbZ1hSbzmqziaWjEFhsuAfImmnETleAB9TU5p3wxD2bRO
         E4qwY5GulRcbYJxvckjoOFn/+KeTVE/EslJUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000805; x=1764605605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=dfmV0CTqzvEhOY92p2lE6wWUMyok/g55KppYtpNaeCvaePfx3eeNtWwYwjo1xHMtwu
         7xuC6lHMpBKr2xvaPBur5VWkonxBOjt925RqC7qI3IriokjpUQe48V/6wRfKgntJxQl2
         xsSewGPGgBh7tL4xOLb9SvsmyJfD59otM20I2AsSMpe+Kd+qvPaW7pMGjO4nfY0Mprnz
         m5bUDHl5gS0pLxIXvbF7vSwUAqnFwVuSCkmtpfHt5oep/Gzbnr1e+B1be6nUItNAkbfg
         3DYm4LP1IPbqZzeO0MW+wkAgS+K+k6J2+TrI6YoTw58B6o50B2lgGBlgN3EdSI68UuMP
         dDQg==
X-Forwarded-Encrypted: i=1; AJvYcCWoTwu6p1PVmlauyDfxN81yPXB6nEq88U1c3OiUOpqQzJHTrP0xgW0qpCWWOXd08WZHO/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyujNhYtSP3i9dirQvB592sLxfX/veFIm83kfj7xpA+dJWQgxq
	wWyzXcegWMSxyIbbJ5clWhOVU9a+2ajOcZfqmNImLvb1YkjdXZdTLwQdR57W6E2ysAntv0PPIbm
	K5UvJkg==
X-Gm-Gg: ASbGncsfjS7Opw4+t5lunLtprtiaNGIUmb30TWkaJ2VZ186m9LSMDdS1GdQyUt5HYY0
	DmoPxwvG0w4RC9f2EDzfIw2LCkS5lzSS8Ba2/1q8thNauS4vVeSJuVNIGXOtbXYY1lCqL2RBsrq
	wb2A9EQuraw0CNAbncJtd4j0Bpe96fX6oCbp7Xu+kcIrqfUIrBuP2lq9BgAQtw1XRLDUNj/XVw3
	mtBrKiEHjwOsEZGKG8xjTrRzWtFCLTbbJz6+IruZJtJYAB3OWNip5SWklY7zgZ43gh0VKelzl9L
	9FUz50mygicQnEeeKjfWJ+yJNB+RnSmgxnaX5taKb7B4bT7js9nmsrYHIwLbzBs3fLhfpPXJaDX
	/HBpT65ZTqSTzs0hQ+H5ZCEHSLdYAfcbqe9NDzLNNNdI+OknN1dlg8/jD0/bEY8Tep8uiOhpamf
	afUbm8qHVcTjupZkSrKB4JrsW9ojb6D7S1mVqsPgXDCqbxhDm1sA==
X-Google-Smtp-Source: AGHT+IEEcyFzqd5Y9QyNfgKw5lXgYBu+zkOOLT54vVmHOLj5hW/xx0CKEVFG/JCfpHAmJhZ4AIRELA==
X-Received: by 2002:a17:907:3e0c:b0:b73:9b49:3042 with SMTP id a640c23a62f3a-b767170bfdcmr1538301466b.31.1764000805263;
        Mon, 24 Nov 2025 08:13:25 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cefe53sm1321192866b.13.2025.11.24.08.13.20
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:13:22 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so3656430f8f.2
        for <soc@lists.linux.dev>; Mon, 24 Nov 2025 08:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOSx7QZr7+dLh6ql/+OxGxTCqpWuj3P4/icu3EEHCs5WbrA+27DhHB1U95N3UYbUsMM7U=@lists.linux.dev
X-Received: by 2002:a05:6000:2504:b0:42b:5448:7ae8 with SMTP id
 ffacd0b85a97d-42cc1d2d6fcmr12194643f8f.29.1764000799689; Mon, 24 Nov 2025
 08:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org> <aSOKS35/huSWd/RW@duo.ucw.cz>
In-Reply-To: <aSOKS35/huSWd/RW@duo.ucw.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Nov 2025 08:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnTIIDYlcAzuiT7QR2OuZm4XUUvQ7JBRQh8rXJBFJr7sqsbbpHBMlqok64
Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and mustang boards
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 23, 2025 at 2:27=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This series adds barebones device trees for Pixel 10 (frankel), Pixel
> > 10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
> > bootloader these can boot to a UART command prompt from an initramfs.
>
> Well, booting to full system with working cameras would be nicer,

For sure!


> but
> this is good start. Do you plan / do you have resources for full
> support in some reasonable timeframe?

As you can probably guess, I can't really make any promises. :-) Of
course, "full support" of Pixel 10 by an upstream kernel in a
"reasonable" timeframe could arguably be impossible no matter how many
resources were thrown at it. There are just some drivers / subsystems
where getting upstream working as well as downstream is working
doesn't feel likely as a short term goal.

That all being said, interest / support from the community helps.
Knowing that people are interested in this work helps motivate folks
at Google and (hopefully) upstream maintainers.


> Please cc phone-devel@vger with phone related patches.

I will try to remember.


> And... thanks! :-).

Of course! Hopefully many people find the work interesting / helpful.

-Doug

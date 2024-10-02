Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64A1D04BE
	for <soc@lists.linux.dev>; Wed,  2 Oct 2024 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877232; cv=none; b=h69sK6dsoC/W+B1DBNGBthuUaiRaNQvVujYMJwoL7XLGYb7s4qKFs2Og/pS4FynUbwIZvxRSBmXPxoPACGZIJJ6t7IMzr7GHSl35VcfrR2w8pZAO+cdMce2rNdoyiqqwINWDogJldRm+G9kW9cefoq2AvzV9j+Oc5cyiL2AW2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877232; c=relaxed/simple;
	bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwEkr40AU4ZldmNAbZ0jEJx14QJ4rnMLx+T0HH8o/PNlQEg9QTTUsWNdTT3t0/tqcCqHu/y5/Cfra2TBduYYuzDRKeqXqGXSAOW1I08ywkkxl913qXupq/DUKxULj9oLHiQQ/yDE7Atqm/2h14gXePYSmjWV0UfJX2IBlb3hHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWhGXz/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWhGXz/L"
Received: by smtp.kernel.org (Postfix)
	id 5804EC4CED5; Wed,  2 Oct 2024 13:53:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CD77C4CEDD
	for <soc@kernel.org>; Wed,  2 Oct 2024 13:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CD77C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so47615841fa.3
        for <soc@kernel.org>; Wed, 02 Oct 2024 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877228; x=1728482028; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
        b=nWhGXz/LpQwhjuLB/RsnpgkB1iQ8+yG7g5E1rlvB+CHFGuvF/gI8Zi7yaGW1GZsxjT
         GTYIT+jGG3PpKLMrfVLKk6S33paQ3XIRI6KNDilmtiXbBbJmbMzimUjB4UqcY7zcZzGw
         usC/b8LtvDrs7ugGlBqtrVVl4U8D9Sy/6Yjnt2yMABpuELxPlCTWpf5rmtKZ79r5Gzns
         eno3vJGJGzASWPmHczNV8aNfKLAFz8B1EvnQGkQMWsN6h46DoAWB6GFGVijt1KLkODeW
         MXm5IhfW7v5bIgaLHQFPkHuuki+NWFZ5/7qpmpWY8rWdYpmDkJRngYAe2WmOytJTBUvZ
         UKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877228; x=1728482028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6xi0yErQ1R9JnzgLN0C+zTW2E96PBAw77wYIYi2zGY=;
        b=K0ODn6LmOFDrfaNF9dYzMO/YzKjWeqqCc+zBxDWtiqawT+IgCSiHO9LBcVgDGEqGOv
         Ga1j+Jb/fr/rTZ/2W8z2Lr6o1d4eRu8M8Hay4hA0vk2I9uokuGIgCjU39FHQen6yTd26
         /e+b4oJvpW9SL91sej7WssdW2Win236k2lRoXeKKgkWJZIOI8eMk5JX0Am0gZuJ+sjtj
         CA2r/LyQX/otyQ2K1emaO5VtcYlqGZSmu8HijROjSYp6Io4QAdAOAV8Lm/ytvfHNLWtj
         kHvPxJdsDNSWLbrtYoQ+J0byOYkRlEE5qJzbWe641TL60ENRqsG2QC00MZFizV0llZN4
         Ixbg==
X-Forwarded-Encrypted: i=1; AJvYcCWKXg+nI8f3gkcF0pDAocR2HwlW/dU55pMtGAk68IUufXdz+JVZJsCVFWj2PM8fZiJndVo=@kernel.org
X-Gm-Message-State: AOJu0YwS629il1WENQlbsAkGkWV+VUV90l5B/0xqSuLDwjI91CZQPb1z
	+FlsM6hJRb1ZuOevdopVcB0kk2iDJG6CT9V7qffTgZb9qhY4So8r7ZuKGSieoFVs3r1JJFb57H0
	KAICf7z42u7+fOwzlY/VOVdQ3WIV99hNvVsuriQ==
X-Google-Smtp-Source: AGHT+IH6J/1hIBQYUuOO6E4cFW0dSWZmODFCQ9NK7J4/38LglqeQ+e19d7bbsLpye8LH/IrpVT7SzxHTLiNIBgM3MX8=
X-Received: by 2002:a05:6512:31cd:b0:533:4676:c21c with SMTP id
 2adb3069b0e04-539a079f587mr2037762e87.44.1727877228234; Wed, 02 Oct 2024
 06:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com> <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
In-Reply-To: <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:53:36 +0200
Message-ID: <CACRpkdY7jJXOsKwyfbZWGq90jhnufwDeeF3=Dy0Rfps0rxmBGQ@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: Greg Malysa <greg.malysa@timesys.com>
Cc: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, adsp-linux@analog.com, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 11:58=E2=80=AFPM Greg Malysa <greg.malysa@timesys.co=
m> wrote:

> > Interrupt enable in the direction function? No thanks, poke the
> > interrupt registers in your irqchip if you make one (you currently
> > do not) in this case I'd say just disable all interrupts in probe()
> > using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
> > and be done with it.
> >
>
> This will come up next time too so I wanted to mention that INEN here
> means "input enable." The PORT design has two registers for
> controlling pin direction, one to enable/disable output drivers (DIR)
> and one to enable input drivers (INEN) to be able to read the pin
> state from the gpio data register. If I recall the bare metal
> reference code toggled both but we can review if setting INEN for all
> pins and leaving it is acceptable as well to simplify things.

Aha so that's what it means!

Yeah play around with it and see what you can come up with.

Perhaps you need to override the input/output enable
callbacks with local versions rather than the gpio-mmio
ones to set all bits. (This is possible to do after
bgpio_init() but before adding the gpio_chip if necessary.)

Yours,
Linus Walleij

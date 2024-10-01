Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E01CEEA4
	for <soc@lists.linux.dev>; Tue,  1 Oct 2024 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727819913; cv=none; b=su31jHHWJgBgrfR3C2UAUQQMEX6spf0cZqhccwxMBgRS/drEwirnRDFao04pV0w4HCiuupqKt/KN/N+3PWOAm3AWKAftCXOMBNxGQFl2N5+DwpJUKeZqzPzgHxl7fZS3xU78btGpb7NsdGNs69ePoR+1xvogxTQwWACX7rSIjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727819913; c=relaxed/simple;
	bh=90cj3MZQ2bSTZsUCDSDy7qQ6PfIFyQv5SQPEYusdK10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YumyWXTqbaGYhHcuq42bIu773DX9qJHwjxmx4KxcGfnJIqQ2YdZ4+A1q+lu1MQZaYg8+w6ON6D62MR/vnwsq1DGwF6YQ4cNUl6mD3YYR+lHaWfy3xnLIiaaCt8oIB7pOdDGHZAZRdnYhyNy7TP1D7vUMxJtmhs9pip3Ks5iQ9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=KCAxwzEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="KCAxwzEG"
Received: by smtp.kernel.org (Postfix)
	id C45B9C4CED1; Tue,  1 Oct 2024 21:58:31 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 239AAC4CECD
	for <soc@kernel.org>; Tue,  1 Oct 2024 21:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 239AAC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a0cad8a0a5so31170335ab.1
        for <soc@kernel.org>; Tue, 01 Oct 2024 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1727819908; x=1728424708; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypgub8lGo9uIxhP/Ts+gM6FIKRMUkTQXJvJ7axKC0No=;
        b=KCAxwzEGDGN9K3IU/NkRrIKudZsr7BcCTC4cGlAQD5wV4xW4j1dt1GN8wvrqWQ1Ops
         oem1XI0Mw8A2g6YXdGWSbujCSAQZQH0fTFIrOwXlC3E3/X1q0GGJuROixVuwbQ+pJgHf
         4Jf3o5vr2YnHQtO9mKzB/mCGD/h83bTbbAypns+T/BgjpVdPu6jSNkeQYUQL2w67UZQ+
         rCGgDkh6bNp3K750P3jqzue8wNSEwhF5y9KClIFL0JLght2ZL3l02+w6X9VpGOXF7gHg
         5KjLleAtJvDzQWhcyuhjPivwF7KSEEPQgOidrSG1R5uw4djtspKmnJXkAhYlACoM2Xlg
         d5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727819908; x=1728424708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypgub8lGo9uIxhP/Ts+gM6FIKRMUkTQXJvJ7axKC0No=;
        b=Z/MKLxIrEPtJoM5f92h7FGn0WdNsyfcOuL26mX9SR5hqJrFIMg1+NTSlt1eX4F7da6
         DmEhDApRUQtfba4Ibv3uoeKjbTJMowwmzIi+KCf3uKgolaCQgfPj6ltUR4KUAVa4NleR
         9iPHWc4jjgOYmouC8alconc8a+heajko8rtVA+XKSg6Y/SeIbsft0mJrNL32dfU+j+Hx
         O4YF96Co0727PsY/pNsImCLMO/UpYalNwx/xIgA3dhbQsbn/Fi3D3SQHGxqLPbuHnkbj
         F0zXy5oxNtyRtlc2NDsbtMZ+SFK7owALv5XRZXz5a4X0Gxe0+dscwK6XARnRFpVwb9qm
         Ro6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEwWRd/eaGd3kJBnl1a2BAGEXP2QP06MUyja8YbcpXvfkpAizG1AZT4/uztzLL9uEAj0U=@kernel.org
X-Gm-Message-State: AOJu0YzoD9pSpciRfdu/PbFNW+ibbfvDqQMsRYoKVKPPk+WZPT5HoQt9
	XtJWVG9Hgtj4hLMx1yS/AjmLKkoT3GP0SyTWAJKEGDuGWUBJQThYhzJyOyo29zdtEHyT6Zhqedm
	BBextKbADbD9w91bYlDwN6dAVKq/E4hpwueGs
X-Google-Smtp-Source: AGHT+IG8Mbwj1HalbNL61KqJPzFf+za9Ivu70OdRA7nBBfmVxjXJSGKtMf6v6sdYVH+UJ6WqSeqKg1y+vZZ3u8imlbI=
X-Received: by 2002:a05:6e02:1c87:b0:3a0:a4ac:ee36 with SMTP id
 e9e14a558f8ab-3a365918466mr10985925ab.5.1727819908246; Tue, 01 Oct 2024
 14:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
In-Reply-To: <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
From: Greg Malysa <greg.malysa@timesys.com>
Date: Tue, 1 Oct 2024 17:57:16 -0400
Message-ID: <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

Thanks for the review.

> > +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);
>
> Interrupt enable in the direction function? No thanks, poke the
> interrupt registers in your irqchip if you make one (you currently
> do not) in this case I'd say just disable all interrupts in probe()
> using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
> and be done with it.
>

This will come up next time too so I wanted to mention that INEN here
means "input enable." The PORT design has two registers for
controlling pin direction, one to enable/disable output drivers (DIR)
and one to enable input drivers (INEN) to be able to read the pin
state from the gpio data register. If I recall the bare metal
reference code toggled both but we can review if setting INEN for all
pins and leaving it is acceptable as well to simplify things.

Thanks,
Greg

-- 
Greg Malysa
Timesys Corporation

Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F83394490
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878898; cv=none; b=t1Ad2fq8totMLvLDYbklQ1vmXB779P0jQ6w5DOah3Wj4422EA4Uqo+lIeLAdSEZ9GrZ4A8mhXXPxbb+FTa8mtEVBaGzjpz8lMPTVyNtaFLi/unfxMOPScMp4E9X/eP0i74SP0DuPpItgb6wXzZrnXPU2xB0B832dGmlFa6RWVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878898; c=relaxed/simple;
	bh=pk7dUICJeGv4cZD7dIWaCs7bQECpS833h8dQY918+1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMVXlKKDYawz4/97sEy2DecxGv1qMfjeVZB56SJhpvfdlsZ5RR9oveoG6LQMnvNTzNwBW2tHaKxEbVpL1bza9g7RobIsOkDTpceDsP1xRSow9KwNqe2G7I3ole57SBtJEpl9huRcUvYoTES7Jze57ilr9JYoHBq8YS5lf9uYdTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966db0b76daso1996845241.0
        for <soc@lists.linux.dev>; Fri, 19 Jun 2026 07:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878891; x=1782483691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy4khWhmG8SG6J19dWJnQfN4DUKYCIX4D5weoKLMQgs=;
        b=Yo/VrpqQpRZ/Rq0OAWs6zcBQOgkqW9JDXHSvhct+kqgRHi+ofeWid8xmWAt9C7JPNm
         NImsu6citGGpCRWNN397ot8JpryqUmgLH/xr7o2jNfBtbty+fLle1Wbct4vP5MNhFq5Q
         B2T+kbZc5bWCyzLrjK4payXTTHgDreGxMfuSsknAoJkAwObxPY9H4Q/HuxFCw98C7g/s
         udqbE5tdkhyH5bBWjLw0JEYmcO0J4MDUAvJH2JNVTLzJAPTmwDH2QTKwuNSfGqN8JFoG
         nuTiRxJctVWWzfytWliokPN49lhMir5XsmW41WtWnqVaQ2T2net00AaY8Dp+QF8JWmoD
         fmjw==
X-Forwarded-Encrypted: i=1; AFNElJ8EVKQwwr5Tv7qK1phMCScrL2vsxDxrjZxv7HhaTcYeyCp6PflRYDCZdsjKcEN+ujjR14Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa5kVc0nT9KnHZWplXKSRc3nRFpE0eQ//m3jkIf6eu5MIMVAul
	LjUHyZZgaPNxzMJ1n76sE6UiAyiga42B2lzXjCMW50FMlAQ9VlLwwjYMdnTDbtWA
X-Gm-Gg: AfdE7cl79fN82XzVQj7YpLkdsiyIg8lMfVdh3dOzb/k14c6hWyzZmBMGQp3+3T7j/V3
	iW8tpHPztORn2HBonqdCM1R7dChMv3nKFUlhBDSZNUeAnv08597J8OcxuevrnblwRdge3hIKPOQ
	kF0ppZrF1pnDuQCLakhwgbZ/vikzjT3IZCvIoU3cgNWZO2eRO1wFY/+aTAzTKe+i9Ydw0KGoCbb
	IfouOXxieRU6oXEHbqze6/eDsPOybpclgAFNatdtjfcBwrva1+bu1k1BHZtvGYhA8GAaQncx3wZ
	ihOQHFm1+jCQqw0wUjydudrnRZJ5Fsu2VeNNlziEwLucx0WpU7jBnmuvNduAFlNaAH6XVGoHjnR
	vTptv/21Yr/2TMDQs3SS8cGwGfk5zZlyxvf3VSD7Xw//NXUAWDpnTgkBLRH68jFW9no8l0ESJMh
	WXjd9QmF00S+apxaFkwP9t7/bWvvMOn9kXxVJKWH4/ngFxh5CvFsEdZLWh6p47dkv0
X-Received: by 2002:a05:6102:5cc5:b0:632:5db8:f672 with SMTP id ada2fe7eead31-72a2775c997mr1363138137.6.1781878891318;
        Fri, 19 Jun 2026 07:21:31 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72a36bfe9edsm1636158137.11.2026.06.19.07.21.30
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:21:30 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bbca605be3so1900639e0c.1
        for <soc@lists.linux.dev>; Fri, 19 Jun 2026 07:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/cCeMocO0rUh69qPPob2JJA6sQcgmfbPM/YvIBRU1RNox6wfkCy/l5wbUITtctTE2H5rE=@lists.linux.dev
X-Received: by 2002:a05:6102:ad1:b0:6c9:d9f3:1e20 with SMTP id
 ada2fe7eead31-72a293dfd7emr1104952137.15.1781878890690; Fri, 19 Jun 2026
 07:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com> <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
 <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com> <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
In-Reply-To: <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 16:21:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnR38X-Baqzb0Dm+Mq3=LH6RFt+7=wU46DrkP2gqiWbQ@mail.gmail.com>
X-Gm-Features: AVVi8CcX7ozhPh8JhyNR7a8r_7a1qss6QfZz7-KfzrH_7gCDXRho6nLaKkb4lJo
Message-ID: <CAMuHMdXnR38X-Baqzb0Dm+Mq3=LH6RFt+7=wU46DrkP2gqiWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 19 Jun 2026 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jun 19, 2026, at 15:11, Krzysztof Kozlowski wrote:
> > On 19/06/2026 12:12, Geert Uytterhoeven wrote:
> >>> +# CONFIG_NET_VENDOR_ACTIONS is not set
> >>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
> >>> +# CONFIG_NET_VENDOR_AGERE is not set
> >>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
> >>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
> >>
> >> [...]
> >>
> >> I am not sure this new policy is a good idea: none of this affects
> >
> > I would not call it new policy. Just an idea which got accepted. :)
>
> I think when we originally added the CONFIG_NET_VENDOR_xxx symbols,
> the idea would be that we would one day change them to
> default-disabled, but that never happened, and generally causes
> more problems than it solves.

Yeah. While "make oldconfig" would handle that fine, all defconfigs would
need an update.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

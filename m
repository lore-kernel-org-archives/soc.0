Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B5014A60F
	for <soc@lists.linux.dev>; Mon, 12 Jan 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235953; cv=none; b=ftbTQ0F6maiCasUget0O8p/Gv0Pfxu/ZoNHFz5eqVwfy6FnexfsjOedwFLQrpoURbfqQkR/Fe/mV37/Z4qYrpVo5dkUF3DhmlOJWhDozEV1gppvlrMoAO4m2T5rdzDHemyxh7sMXWQB/bhZ5s+Ocs4lB+A4N27dDbZYwYXik0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235953; c=relaxed/simple;
	bh=SfHeLqceqLqg1F0BDqmoBZTnhqV24wMBAr2Vi8nBJAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+GE1Z/gQ0XEB15wBcgj6GZ5vFgyTANJdvfdyHP0fidf8rH8fkjPvpz4/FIy22NSLE3RB99zdFSE7m3etvCFp3LnX9HaPloiDdbi08NtZwlmquy0NVrCHJcEOUIFVY0JWEIyyo3Cu+x6bvEv6DsG1v/OkCyi7etycBY+QcHbEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so1999007241.0
        for <soc@lists.linux.dev>; Mon, 12 Jan 2026 08:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235948; x=1768840748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwQEbtswObKKVraQKvQaR/3+rbt3A2+8t9J7vUhV2P8=;
        b=wmTaLPH6IS/f8hnFxTGjH9tja7xUTRUWlbcb99NWRA/Igh6g5Ao4ZWISseC/JuPITa
         ySXtAHSYUvTfttrCOeemPGcaFYgow+/HLZi7IWLDvqkd00xhKiQO/pNSFjv6vX0PzcCO
         LOS3gg8kfrcMN/XlcmkcQQqGPlB8OB9u/7liFIMGgTYUEzxIx6GffKgYbcMZmEl2AaBy
         ecQNgofNq9gjkqahnkP9ErT+p7YE/xve9U1tysQnsJsbueOghESxj73qsEb3IyV2Y/sI
         TgBDudVRdm9T5XTybCUa319oW3Qa4dCpUOZ3+hV1OG793836JIGpWWqGQlPh65TWST9Z
         MA8Q==
X-Gm-Message-State: AOJu0Yxx4zxvFvv66IuI8TkZWiKxLbSXZejvw4+fgJW0q+1ZUA3kCH+G
	wE6W0jVEYIWi1K725Tq6/JFLhCmGPQe8ZW2as0dtQheWXv9Td+tTRCS+ZjNHbAdx
X-Gm-Gg: AY/fxX7Uxq4yGsCxy7N9IG903hAMPOIAvjNPUv2+9IOPscARIfYDOeSSQwNG8NQsK4j
	MQg88DDzjwwXMD2+DFA1ZSGfP6l2+bThAquWUqIdKct42daAP9oS4R2uwHj9bKtgOh3B05I0cVQ
	hDWYxDymJzVb00cn76KrYzys8uIBT4aQV4+IFR1qHa2v0lOdkeGnRfPFTalJKMrG7ztGyWGrqwx
	CiXrVLKt9+UJFzL7q5KGdMz42q6Ltjpg5+OgupVOraloLDMOa61wkDGP70dpat2XF5qimuLUbHc
	qwoM0mTHNk/7r7Zx2YsLrbNKz5TRVbwL5cjaU+R9cXaOPfsvsvLf9z7wFB/AIZBs70N/ZKFi8J7
	cL4qRhRHwJ/8O2tFhmaCrc7F70rJwgRb+yV+AOhN4OcEUGvjk3gVbA4G4cXSp/RYddBr5eu2HiD
	l6AhFFI/AHikpfl+uk+uOe3uZqiqiIoRv3Wvali/CpMBQb1ha7
X-Google-Smtp-Source: AGHT+IGmnXoPJBRPWRXxrGm42XlYBJJRklk3RVgGodF85tXdD3u4LDuB1D/pDhaisP75xaGWbK/9TQ==
X-Received: by 2002:a05:6102:1621:b0:5ef:a78d:8095 with SMTP id ada2fe7eead31-5efa78d81a4mr3238039137.26.1768235948195;
        Mon, 12 Jan 2026 08:39:08 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d3040sm16765407241.4.2026.01.12.08.39.07
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:39:07 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5eae7bb8018so2551686137.2
        for <soc@lists.linux.dev>; Mon, 12 Jan 2026 08:39:07 -0800 (PST)
X-Received: by 2002:a05:6102:cc8:b0:5dd:a616:69fc with SMTP id
 ada2fe7eead31-5ecb5ccf089mr5406109137.9.1768235947165; Mon, 12 Jan 2026
 08:39:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112153255.795553-1-arnd@kernel.org> <20260112153255.795553-2-arnd@kernel.org>
In-Reply-To: <20260112153255.795553-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 17:38:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV91autCQvYmqBfQqTbGXRJN4_Qvg9gbrExXxP=KDuGYA@mail.gmail.com>
X-Gm-Features: AZwV_Qgo8GK0GmcM1_4lK01dOThbWZHequguqB6ZSDvB8kICyDbgd6OIA8W4fK4
Message-ID: <CAMuHMdV91autCQvYmqBfQqTbGXRJN4_Qvg9gbrExXxP=KDuGYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: defconfig: turn off CONFIG_EXPERT
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 12 Jan 2026 at 16:35, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Since multi_v7_defconfig is meant to be the generic defconfig, many
> users are not going to be experts and it is counterintuitive to have
> CONFIG_EXPERT enabled.
>
> This change has a couple of side-effects:
>
>  - CONFIG_NAMESPACES is enabled by default. This adds about 0.2% of
>   .text, but is already enabled in many board specific configs, and
>    apparently a requirement for systemd, so this seems like a useful
>    change.
>
>  - CONFIG_DEBUG_MEMORY_INIT is enabled now, adding a tiny bit
>    of code in the inittext section
>
>  - CONFIG_RFKILL, CONFIG_MEDIA_SUPPORT_FILTER and various CONFIG_HID
>    driver defaults change, so these have to be listed explicitly to
>    maintain the previous behavior
>
>  - CONFIG_SERIAL_SH_SCI_NR_UARTS=20 changes to the default value
>    of 18, which I understand to be sufficient for any buard, even

board

>    if all UARTS are enabled at the same time
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig

> @@ -859,6 +857,18 @@ CONFIG_SND_SOC_WM8960=m
>  CONFIG_SND_SOC_WM8962=m
>  CONFIG_SND_SOC_WM8978=m
>  CONFIG_SND_AUDIO_GRAPH_CARD=m
> +# CONFIG_HID_A4TECH is not set
> +# CONFIG_HID_APPLE is not set
> +# CONFIG_HID_BELKIN is not set
> +# CONFIG_HID_CHERRY is not set
> +# CONFIG_HID_CHICONY is not set
> +# CONFIG_HID_CYPRESS is not set
> +# CONFIG_HID_EZKEY is not set
> +# CONFIG_HID_ITE is not set
> +# CONFIG_HID_KENSINGTON is not set
> +# CONFIG_HID_REDRAGON is not set
> +# CONFIG_HID_MICROSOFT is not set
> +# CONFIG_HID_MONTEREY is not set
>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y

I guess these should be dropped, and the Kconfig logic fixed instead?
The current "default !EXPERT" makes them default to "y", while we
probably want to default to "m" when module support is enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

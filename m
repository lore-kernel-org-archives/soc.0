Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145033A9D3
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895758; cv=none; b=urhQZveJfwsXWAbYM/+ioVivCJa+GgIQE59ditkkJfykxQ0AXy/Mh24iKy4KLiPdQHtXZVX6+2TdhLNMlF8nuve1TbnPfIk8AnccOmR0tegLIsYCS30tHrWo5RuvQXknk5nwZiRLEHttokCjC2MAuPiRBf3WGMJlnze40iONlnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895758; c=relaxed/simple;
	bh=CQP01wI40yfCAaN+xuwRruAoF2NnihgC1fc3TRwt8Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faNCD8Ne43Kz+btwWUg9nDvZurmu3tiB6F+Z5g0oGXHblTmETvbSWCcVOT1NoTKotFmuCZc5jnlw/HMcqmImVf4Vr4H8ZVPINxclPd29/kp3qMNxiFLdpEDI9yntW5kp63tALpBWJk+VlqgXjGm/QR26+3b6UeliYCgmNlxSjc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-941063da73eso2644527241.3
        for <soc@lists.linux.dev>; Tue, 16 Dec 2025 06:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895755; x=1766500555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re5YBOZyD0Zj32H+1no6aQeFsI2W9h+rLAtav/Y6K64=;
        b=miVJslcRBpGqtH9RCDnn6KSA4it0JJnhP+H+4I/tcpnfN2LMep8w5TEo8kD06gJKzy
         yCJzDki52fn9HExeA57/EE7uLgRM6BoGwrDFyjWapM/HDdJPMWVnp+vTOhprPPUqsfo6
         esnALBWD67ZeyLmE1pXULEm5FoWOI4faYIhv2D6UFXMN33cfratcyPzq34EzwmfX4Gb7
         0mgLshXdqxyMotJXqe9Y8p/WFycgHB30hWWI3GarrJVgK9+V9yJ560pBEbHXv2uXXM9Z
         br/qsNzC9vW4LsE2nyPSJ15/8d6gQd/U2M4OhLIWLLOwJaI6qi11AqA8OYi1NRFxDLLq
         SOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeCZiM66lRn0IbuZB5a1j9N/5+S8B8XOBDVtVZJPceDCgyWifiukcTazaGqId+5mWv1Vk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJSssuFoTvEaGNQyZDps42ZbVxQXyqs3VzFTxRvgj6wFlKuzEl
	Zc9jVweyEl2PT/BjBQ4Ts6BVWxsL8tHjxXXVaAED38IUdg6abDGcEFGYbIH1ObSO
X-Gm-Gg: AY/fxX5Duzn6zQDE/m47qssFg0QGVEX3SFuVIVlchyx/9lEI8F2tY26jaoXlj9yNVBI
	JfMj54tWzkFB0fG4G8+r02YLIscEagTh+P9AQpCDQJfpjF9X3492m6H75fFHt0eOAUPSxaWMePH
	xF1H1tl+Qg6hRakmVUaPrLIT45TNjf08h2JgC9mgyOOKJfxMD5a0/pGR93XBeIN5qYT5k6OFvns
	M/j0Zt7nevNdco7Ee5Y7ld/Rngtdp8C8qYQT5GFvZCqDOsF2AOxvXKsMmxJAQnlQLc2MRXu7l5t
	q1ABJ8g+esUVhZn/Pz2SMk80KjE/0EGHDRC8ILnTkAGnyp8O+YpBaBTqZerx9DW50CrgDJrloVg
	isHQ/k9CwncQ2fBLZDqsd3Td8Lo+BCkSKLYtRA7ccUdIBnLry9LCaXCwo81eZBCwrX9QEOZClH3
	4KCaaNwSA5HReEOHdKozuWhEVIicvFC58JQXm92oZtuSLZGgGx
X-Google-Smtp-Source: AGHT+IGbWHB4/ojKnQbSasXq4vFrTgN0yeFboBbYukK3BXh7YFEms/kFBiXVRU9zs7QOaxX7TYPZ/w==
X-Received: by 2002:a05:6102:5818:b0:5d6:12fc:76e1 with SMTP id ada2fe7eead31-5e8276ba82amr4862439137.17.1765895754391;
        Tue, 16 Dec 2025 06:35:54 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0ecf428sm7487474137.5.2025.12.16.06.35.53
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:35:53 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso2355733241.2
        for <soc@lists.linux.dev>; Tue, 16 Dec 2025 06:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ5pSpoxocKbTMsMIOIhonYSbGnL8gD3ljK7qwFsKaybr9A/rsdGpxUpZyuABSdg0wsQQ=@lists.linux.dev
X-Received: by 2002:a05:6102:5818:b0:5d6:12fc:76e1 with SMTP id
 ada2fe7eead31-5e8276ba82amr4862421137.17.1765895753360; Tue, 16 Dec 2025
 06:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
In-Reply-To: <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 15:35:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
X-Gm-Features: AQt7F2rACQpLF79AXAKKa3e1I8_5jvGUOJu5XzdjILbOotHKGddZqOAsNt9CQLQ
Message-ID: <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
Subject: Re: [GIT PULL 3/6] soc: devicetree updates for 6.19
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 19:28, Arnd Bergmann <arnd@arndb.de> wrote:
> Three new SoCs got added in existing arm64 chip families:
>
>  - Renesas R-Car X5H (R8A78000) is a new generation of automotive SoCs,
>    based on 16 Cortex-A720 (Armv9.2) cores, which makes the the currently
>    highest-perforance embedded SoC.

Actually 32 Cortex-A720AE cores, which I believe could indeed reduce to
16 cores when enabling dual-core lock-step mode.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

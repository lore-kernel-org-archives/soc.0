Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC32D781B
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335430; cv=none; b=fbLeExU6Fqg4voh87v0p4vpCC6syzMLpaiy+Mbwm9wFvdETmzIcGUUgWUKDT8OkRwHIG1vKN/ZEJKmQ1VRIbQHX1nbvIM7kQKXf+JjRxbu6U2pq2413wGd6S5Zu/JA3aLWS/lZkFiE0oYszymNfB6sX4Iyog87B1J01VIQeC0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335430; c=relaxed/simple;
	bh=Wv9usFZnfS7kK95hkSPiPI2QnCEnCaHz2isr2NMGWUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyTZfcLrZ85OefvfOkcOKx+OhS9gRKfekx9eY4v4QXeXzuDF+WQIBxH8I+YG1z66fMNLNkC2MeQrBHCPojAHhO3J++5zxSfcIw7FFFvJjxbZRYe18OhM9/Sa7bvqpGuaHSjJYl3KqCf/Lt5dBwJYU8lQnQpzF5+VyBUTHNdAjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59c627b53a0so785244e0c.3
        for <soc@lists.linux.dev>; Mon, 01 Jun 2026 10:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335428; x=1780940228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9sxbisFtWpwoKU7G3mS5YfDApAUtM0f1mz57V6Gziw=;
        b=AIr0dRuzydXabV2duQBGQXtkS7GXgkilHWvVkORbzVbc0tELq1+sbTm44d9ubidX0L
         LDchulBlpznyTdjlZOFKPJoNV0CyqisMrL4PJkSQkaSaVkHrhKrw2KAiDRJQeUr5ZKJx
         Ujh2zr8fRnt+wwAUYmvsCFVPEvt2v6AFyinj2x9KnE6jFXu14Grxv3ukVAm1yQ414QOq
         yw7UQazptpwxcigSmWeFzDM6q7uzcVrUIO4R+FipMTpnILmqdAsiO5+eCiqAcq2Iu5Hx
         NxbCc+KP5rVvBvACKaG9QIamaadTIbxGb2yFF5OoDi28xyHkToK7FOuJlE3mDoWxehJL
         VFjw==
X-Gm-Message-State: AOJu0YzfNKqrFy4R3iSvCrXvCXfjmOZre2lbv0k8DOl9b3iyt1pwmpPA
	i+6zTosl7OB0jm9z6Jk2GP1yFU7DYFVl3aBCOSlS7i0dzl3rhckwHvXwi7ciCah8
X-Gm-Gg: Acq92OEQh8Kpm8rjiLKCCkuYoSM/sqTbSENqEA22TLSO0WZ71jnCr0UQ3st3a4IAitk
	VLilaQFQMFitwZ1tuT08k7gNc6ngDcqu2o7aTkZzmBdBBjvkYIO0tbXBD4cWfbFjyapuzgSaANJ
	r6iuJKEUCAnPBbMxKGZQhcMrcyXuQSdX5q1+n8El+1OX3J4D3y3bjK+BUmaFnh3ZV2PLVzD1C6b
	DLnWJAo2yPCO2lsT5hg6cJafDHykH2u6eSb10MAgwVXPx1IuCvww7Osw/TPSSdydJUqQ/w9fePe
	TVKuyHObsn8suZ+GhVqrOSijxzsbzxjwg/1dadI+7vjxYDzPHbkZrLCOt++ItbM1ol0OowaPfYQ
	XzqvKaqpC4EBaHhKVMDY5nGuKcUVN2cQyGqZ/vtSSPPbLr+8Vd1oWTg/bL1RdMHmKhLoXHn4s82
	uOaB223eHh0DtMVJE9PnRAZTxlIEgACYvz5WkqGhK8qXzsIf1QeD9zPE64VS8G0F/QB6H2p6mZb
	5Q=
X-Received: by 2002:a05:6122:6e0f:b0:575:360e:6009 with SMTP id 71dfb90a1353d-59bf9084071mr5571186e0c.4.1780335427982;
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-59b7521675bsm7323831e0c.13.2026.06.01.10.37.07
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59cfbfe64baso755040e0c.2
        for <soc@lists.linux.dev>; Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
X-Received: by 2002:a05:6122:a26:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-59bf84c927amr5742975e0c.2.1780335426878; Mon, 01 Jun 2026
 10:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.178031911driver8.git.geert+renesas@glider.be> <ah2t8FPZpJCF6CL7@shikoro>
In-Reply-To: <ah2t8FPZpJCF6CL7@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 19:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
X-Gm-Features: AVHnY4LGrjuiK8Yupb4kRE62mimooYo_V8U0dBYQY870ZETHUqYjUyV_8zVtMJo
Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 1 Jun 2026 at 18:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Jun 01, 2026 at 03:18:17PM +0200, Geert Uytterhoeven wrote:
> > This is my second pull request for the inclusion of Renesas SoC updates
> > for v7.2.
> >
> > It consists of 2 parts:
> >
> >   [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
> >
> >     - Identify the R-Car M3Le SoC,
> >     - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.
>
> The bindings patch for this V4H update...

[A]

> >   [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
> >
> >     - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
> >       SoCs and their EVK boards,
> >     - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
> >     - Add support for the R-Car M3Le SoC and the Geist development board,
> >     - Specify ethernet PHY reset timings on various R-Car boards,
> >     - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
> >     - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
> >       R-Car X5H SoC and Ironhide development board,
>
> ... depends on the initial X5H binding addition in this pull request.

[B]

>
> >     - Add serial DMA support for the RZ/G2L SoC,
> >     - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
> >       SMARC SoM and EVK boards,
> >     - Miscellaneous fixes and improvements.
>
> I am confused, does this really work?

Thanks for your comments!

[A] does not depend on [B].  Both [A] and [B] depend on commit
0f63ba15dde8748e ("dt-bindings: soc: renesas: Document MFIS IP core"),
which was merged through renesas-r8a78000-dt-binding-defs-tag1 in both
renesas-drivers-for-v7.2 and renesas-dts-for-v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

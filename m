Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AFA3563C4
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648966; cv=none; b=mIkYGYYEl8MUBEDN5KXRT2up2TXWVILg1XC66pJyaDSONFLXWyiCkgNr09YS39b9IbgTP8HlZSV37HBSzwTfLebWGkFKvAqT2p63uxwe1ivo1zBSdSEWO6Of6Zkb2/Sea6/Fpm/e8vvkjLxDpgkXUNxZwkKmwpYimx7IW7xZtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648966; c=relaxed/simple;
	bh=6J6jIiMws+sldd1rr8KuW/unMB6Pf7N1kVnkcrX5N0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cc/khsmKzIaCVpkmyVbt9wadfBDTc+jRV0qHXo/u2uSymSSzWftPgZEMJjzRMg96S391vw5YfIu71ctrvLi+togTzCQmQgaHKxP79i4Iq3SPmVHBZ8enV9FLGwILXFUph1BMNKmQXslJVBpn5ZZAgwT6dZyQmDnX7Crz/NZaREc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94aca174532so901254241.3
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648962; x=1774253762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmTefij6xVk2JRb0OyDr5LMzX/ACr1ha2wKgEcc1/H8=;
        b=dfjFGgX/I+TZB+HAkSv6v5h2YdViH6/8pH07WOGrExontWg/WT2gROh6k5MttF1lyZ
         SJMxNUipAXVdFBM75m8QHQvbHLB8nR+GyXgxb14sDH2NwhcuRcpF3U7Xl0UkV6jpQsBb
         j4lQmlw/tONkiC+AgeHZgWDfX4F08hpR1+MJIFhYaCRtHEk38BrPuArMn5EvLKh1Pvfu
         f7hOAb4r+GnObT0F+1yFxS1nv6ng2ZViLFM0yCpyj2yUI8wccRfgf31HCoW374YWoaQ8
         j7Gi6NYQchyskiMHFIMcBxGnK6QXqhmVDhBfhK4V/GA2CVVOgrHWbVNv8zDAOVrPWk5R
         aBZQ==
X-Gm-Message-State: AOJu0YzB/gsDiW42yy5RVsSP0oW/kG6CmdqyZLMkoGH8E6inODch1t6z
	9xdE+WzSexMkMv3uJM+haodu4fdtKU0m2d8wJAIJJclUxL55rF8Vk/Ak3+D1DJLs
X-Gm-Gg: ATEYQzyHbWkWIJfHTwv+kQvD8Gr5cFRPylyun9MQI7uICIUGbkN9rPgiUpAK7DSuM3a
	tVorPryAdEevBSyNGLqi6lr0eC4cS38WYNDdtibk1Fcf6HiljIGwM/R/Rrc5C2ZcpNPpbd6f3Wt
	5zo8RBTyKwDBwLdBZK6BBmkwR07VVYLYywM8mMe0JeRoTNhJPU3PXmXRmrNY6o+bGKfJNSqqxJw
	KcqxeKV5WBg2T2OmKR8PN5U+7XylZeDlFNM6JqkTW0lYzmI+U5zF3c/XrqyWLXQOvmw2aPLliM5
	ocXVQm1GH4phA+Dnj4h4nomf5jfYytCUWNlyNU9plMcBN0I9ELfizXhjlIgnhF5dmmn/09ub3Ju
	egAtvGnzEyKMz14BoWEYBYe3dVb2VIQZM2g5zn0qte7G23cgJnrB16DPs8XaF8ko0Rhw2croVOc
	0vKoTcwGEalW3Bur3N6+pgvdk1YYojV2zcUO6nlSqDIqiyYZQc5IZ/La7fcTVM1mSm
X-Received: by 2002:a05:6102:162b:b0:5ff:e39d:9f9b with SMTP id ada2fe7eead31-6020e24556emr4498946137.16.1773648962234;
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601f31e7520sm5754955137.4.2026.03.16.01.16.02
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56af30dde0cso1596168e0c.2
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
X-Received: by 2002:a05:6122:659e:b0:56b:8d2a:8c8f with SMTP id
 71dfb90a1353d-56b8d2a9d66mr528332e0c.11.1773648961820; Mon, 16 Mar 2026
 01:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <20260314-arboreal-bold-vicugna-cdca27@quoll>
In-Reply-To: <20260314-arboreal-bold-vicugna-cdca27@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:15:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
X-Gm-Features: AaiRm53Rv5kBqmNlsxPfaTacL6gnOFBZ2evKRoyLQgMqcyEYrLLjn0WDPu1UeIk
Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sat, 14 Mar 2026 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:13:00PM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1
> >
> > for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:
> >
> >   ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)
>
> Next analysis tells me:
>
> Days in linux-next:
> ----------------------------------------
>  1 | ++ (2)
>  2 | ++++++ (6)
>  3 |
>  4 |
>  5 | ++++++++++++++++++++++ (22)
>
> Please keep non-fix patches in the next for at least 3 next releases, so
> you are sure any community tests/complains reached you. It is
> unreasonable to expect that community will test your for-next patch
> immediately the next day.

Sorry, you are just soo much quicker than Arnd ;-)

> I merged other pulls but this one I will leave for few days more.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

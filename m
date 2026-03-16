Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735C372EC8
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649535; cv=none; b=mtkkvRyUIJuKibfoNgmPgWaF0ZBvBOOPOSSDnl+1W3EY3R2ICJtvZgGEQwIwbPGnFSHrtAq9gSD6diIUuRwr9LL/tiqCBXxcv5KIy7P0aesuuG2Ds9oZ3HABuYU3Fw4ImKmiOYRRZf02e6AGE43Jbfgy80RRWsNj1kcMsM0b9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649535; c=relaxed/simple;
	bh=b3D2cvYxaRTwimRhpTqSoEI3N106GPgqUDVsPffvnA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+6lJLNLtKqlpEHJ309UGLp+d3QPuSmnBleCfOH8K5xjx+P0deDfqax7WDasGBJfAP1O2X6I79a/vLgg2g9GzH1u/Fr7QBp3zSclUklwgf2aQARguagDrKs9CqdRwTuXroYxg2AZvjQulkmq+S4xFia97vKf7qv//gmWulebvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so3017363241.0
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649533; x=1774254333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8w1ZWnLMf6F4C87k8bElJ70YpWAqTRI9KRHLM4iWmQ=;
        b=R52cv0RvjgxMPNCNySWfvYzHBEyjQR/M8k/1jIC8zNTDKJ6UGlW5p5sqBSzf515mWc
         iIJWmbxa5i4p8wJBdi7dnazp9iaGnwUgxgHxi6cX0hOEuNMk0DH8GRcE0mydwYCow0F0
         m3dvNnzWm0ysgr5mad4ZSi1PCvKspKVFwdc/0hBTD/kpz0Scthi+btEl1YT28Ol80+cR
         2if4qBZMmBKGqHwnyeEHJoakeKueus2c2f06KInnZ48vg1VicpqwldZgR/qDgqVw37lQ
         m3qHi5QOIfeb/ruCVsJus89eVt32qklskHZ08lz9jwmJEZuZt2KpktRnqv85I1YFgrCo
         zO4Q==
X-Gm-Message-State: AOJu0YwOPWqeDA74VprOPOM5qcN0iYqf8xxr/lVhf8mUWLWkDYweZxQB
	VhWYMr1uZNb+qIThNC2IiZxrcuOdjgEwFtE0pzZwTW632hazrfIdI+lJgRGAe5N2
X-Gm-Gg: ATEYQzz/sAXeasq79FecWpUpplTtIxmYIAyfP/aRrHGr68dXgOHvl/r8wS7piDSai+e
	Hm1KAWt+CLYLbzGvL46wkZHf306rcrCxQrANM736pMwj5AfJf6VaJ+1sy+0h5eBnJlpKR0DCXra
	34qvquWJ7sLMMjNUstfGUYJvrUFXN9EX3y3ZPmc5WkFge8uyJMI0AA6z7tMsy3Z/hP+NmE2rURu
	oqmlhMVzjsExdLwGII1y6JrxEiwRpg2/tb6PNgKJMDGxz5i7w+Kf6v+KuF1a5kaU3fCpFQZF1bG
	dHr7WBS/gARGZc8KXCK6DVrSSo0HC3O9qdfn3xyux/Y6lYwHHrV9pj7BPNuAQ81iIR66jge9y6j
	jKl7Ine5ow8psf7a2tWEfkrsMzJGlIV/ytf+v7Gg2mAPHjeP7BYfK/bqAHx3Yxv3gDtGwyddNSn
	F/3QTwXxjwF/TiRBFTrB/2m9izTfMxNR0bw5OiPwJCZ/adPToKowOX4p8vvYJw
X-Received: by 2002:a05:6102:1625:b0:5f7:246c:7d59 with SMTP id ada2fe7eead31-601f4a77791mr6617951137.18.1773649533081;
        Mon, 16 Mar 2026 01:25:33 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfd41fd9sm5552035241.8.2026.03.16.01.25.32
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fff13d5a19so3887196137.0
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:6ce:b0:5ff:bb36:891f with SMTP id
 ada2fe7eead31-601f4ab98d5mr6344003137.20.1773649532209; Mon, 16 Mar 2026
 01:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org> <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
 <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
In-Reply-To: <b5d2f9a6-8039-48fb-8d7e-ee7823c504e3@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:25:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
X-Gm-Features: AaiRm51dZoP08rSkEPZA2qRhTlGCqYmiKD1mwKQ8Vzj_OaeTy2G1pzJ_lXZLAZU
Message-ID: <CAMuHMdW9dNT99N2UWbh+-YTdhafQtBRz_xE7iX2pA2O+KC-eiQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Mon, 16 Mar 2026 at 09:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 16/03/2026 09:18, Geert Uytterhoeven wrote:
> > On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> >>> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >>>
> >>>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >>
> >> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> >> request email has place at the beginning where you explain such things
> >> and I can easily locate or understand the base.
> >
> > Let's readd the part you cut, which is also present in the cover letter:
> >
> >>> Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".
>
> Ah... no one reads cover letters :) so I expected that information here,
> before the pull boilerplate. I guess this depends on scripting, so it's
> fine. I will look for cover letters in the future.

As I wrote above, it was also mentioned in the PR itself.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

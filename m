Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F532E13B
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651082; cv=none; b=AFNguEneE7lyLI9490ur46DAxe99/NHyoP5dGM/rriST+AXiNB3KttzXCGKXnf5EqS9SEx8ukswxbCtmL9oMh+SfRrJAY3yyOJwZpILIfUARr7YtNvQPqoZ1EiMYOU4bbmunwudJceqKOSAm2Ic+QBVQJLvkj5TlxIBnX8xxSz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651082; c=relaxed/simple;
	bh=27Xb/PjJ4oY9n6sievhbObmM/x8nGuiMHd/6chr7M+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oG4JugiOScmdGTZLZOcV3KSv+T9JWMHxvIJjQwYzaJNaHF3M45Qg48bi/fWEgjy/1M8DPRYmzoq+yFJQJKTydMo/+Jg9OpZeugN1lkmJyL/kOTxT3AAk5CxgxFIxuEobMy4Qg2Sc5a0+Paf5YQzaZ/Uv3kl5L8fWIhCegcWtQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5675d609621so3675482e0c.2
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651080; x=1774255880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni27tE4Uc17PebqPukQD2Audc02oOzEQcH3vVp9B4BQ=;
        b=PmrIXEhk0ZYdodQga0HcHke6vYr12UFz7gRKGBbimku3FZRQXtla8tUOjyokA4i6Uk
         c7lb3MZp39PWsKxGRsym266awuVv5OWg+/XwJ6cPxOduSY+J5gkp5XzgKhK1qo6jx46R
         Zkg1hVYfd+fpnkdTA+i3J4CDwzLHmnr2MNG8vABiLpqZK60WCWANQVsOwd73V1mueMZw
         G9WQzi8SLawPBU4Pk36tW26HoeCE2JJx3+cfqRWsOl8BUjvIZGZbvBY7fa+q0z0shDqH
         /OjkFgpWjwE5NMlpfve/1PF/r7htj+N6MagRjqrg4K+3MGAmqXh3gTJ1vYvMVkuDZrZF
         K57Q==
X-Gm-Message-State: AOJu0YzagAjUnxE2pptRtLbdQgPDi7hlsHC02Eunc+NDmL2icCXr47Rf
	G+zoaSclau+ZTlL6weeCp12sjPWZfLNgFGR0u4sfXe429R6s9U+mckiYsxbquc6O
X-Gm-Gg: ATEYQzxLYKaTtVJYTz5rtP5ZLOyi2061LVbPhrCJhBZSyl1t9ObkBZSo77VQ9oEBI3d
	KSlVwEXKC6HbIHBmxFZfPslPrH7E5ZHcO2QY9UjGRj2PcYu9k3mtTYBk1/bqD6y/cYAeTYe2qVS
	urr9chiwL9qLK4v2ygwqfBeIZ1LrOk4aGJ7iWjr/xtlRVHHyjqGVwXNTfWLbe9fYqg5Fd8YWG8m
	/q2ZlNiwI6t7CT2AKn6JsXqt2ke7o1pdh0yhe0Xq+GydbISgzXTDdf99/qa52MoXTcik/4KbCxk
	fG+DFSf24XBl2JwWHm/5W6bdvh1CSEfnaCreDhbsj86RY8/kefCmTv0ITkaR25rQCBMqe7LIRcK
	b2EXUMsJKToDEXVh5Z8/FTpWkDdYkjd+LE8StqtcmJUZEz3zJ4v9jmGSobS4o4bEZVn4b6iqaTk
	gXpH37yKwcKxgzqcWJzTIuTOv8jEqxpKdxx2P7ypy9CURa9/NjIUGtHk+q9OSd
X-Received: by 2002:a05:6122:82a3:b0:56b:8ba0:fd6a with SMTP id 71dfb90a1353d-56b8ba122bfmr673015e0c.0.1773651079757;
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d132sm7423227e0c.11.2026.03.16.01.51.19
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-950c41532e1so714022241.1
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:51:19 -0700 (PDT)
X-Received: by 2002:a05:6102:6cc:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6020e2cde73mr5380780137.16.1773651078892; Mon, 16 Mar 2026
 01:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
In-Reply-To: <20260314-quick-gray-saluki-0f96ff@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:51:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
X-Gm-Features: AaiRm51SoosmbfwaefU6BPqSHDNLBprafGmdntJh4QZy8XCfS9j5Er_XSACDcgM
Message-ID: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments!

On Sat, 14 Mar 2026 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
> > Renesas DT binding updates for v7.1
> >
> >   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
> >     SMARC SoM and Carrier-II EVK boards.
> >
> > ----------------------------------------------------------------
> > Biju Das (2):
> >       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
>
> This is DTS branch patch.

It is a DT bindings patch.

> >       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
>
> This is drivers. Splitting it into additional branch is not making it
> easier. I don't know where is this supposed to be merged. I will take it
> to drivers, but in the future, please do not put DTS bindings into
> driver bindings.

This is also a DT bindings patch.

DT bindings are soft dependencies for drivers and DTS.
DT binding definitions (I don't have any this time) are hard
dependencies for drivers, DTS, and examples and DT bindings.
Arnd merges dt-bindings PRs in the soc DTS branch.

> See also submitting patches in DT dir.

So the second commit is subject to II.3:

  3) For a series going through multiple trees, the binding patch should be
     kept with the driver using the binding.

In this particular case, I could have included it in my drivers branch.
Where do I put SoC-specific DT binding changes that are not picked
up by anyone else (I don't have any this time)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

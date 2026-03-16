Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77B933B961
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649143; cv=none; b=gp/aBJKwFP1+vK402/niJz29YZufS8Zrvwwys3UQNVOqh0dc23KwiHJ6sePSRtwamaQq6PU4jLBoiXZAGCsX+fpLRQ6fHwKtBryK30lrd7LlQngFCYoWfkcjXZY0rlBj9XCY41eHZy4zFYEXU224UE9QIeHpBKs1A8iZIkdLOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649143; c=relaxed/simple;
	bh=2iXoS3m6dNsX83tj7CSq5KxhYihKVQmUZZSrLXTwQKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJM6vGVfTg5u5NDQGzhclQXyqwHjHfcZj98lVM5IieJcBy+AyklQO/TAufiZcyjg/gyHPhSmNw4dN6XW5lEQi38e1ObwqhsQBegZeaxFs5mw4wNMugme7kiZNLCzbu+ZbCAwQpCVSqyVmRMs9EfY1yiTzOygomkVwos25whCN6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffbd778410so1034128137.3
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649142; x=1774253942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ5ZL3YahQ5LgPO6RUkICWxC/OTnvmWLlmCP38xXSZI=;
        b=Edc7twvfp64C+4IbnQm8XdaTgoNr9bfJX/Jbn6uQKnAIq3g8HBAALnu1maZI0DLA6Q
         6ZG22mCvo3D74tot9W57t0WBjkSBjyAokvrx0w99JSOz6yXbo0l3D7ZE1xL1fXKGOnTK
         O9xYBd0UhDt2SDXsxbMqEPmx76K2z8K9QKzb+rkHdJwQJiXpkuy7esbtDq/W69AyvVwk
         CHZHOyLqrrwkMeVdCoCs+sD0vw2lEJFicsj6E7vVgCHrQIC/smMS3aPGJ1lp0+l7pz9T
         pqDPNh6Fsot9zv7RmsdyCPA13kU3T9bdJM0rjZlVUdkqhQ4rCg2MZYGOlWi/Zidw3Ccn
         szPg==
X-Gm-Message-State: AOJu0Yyc7hTQYo+SH/eqMvjNQ+vaNsK20JhDshlXH7G868691yCPXnJ2
	hESmR3PRyYgEEVkH6K8Gqj6JumdlZdPlfecglhHfRmfwqYUSmP44akPio48zkw+Q
X-Gm-Gg: ATEYQzyBJwbatCEJoHJ8gBOpNu6DpiTF3dPQX5hhQ99l+wRjPoZ0bdqCAS3DoQJnU1b
	DezyIJ/Ag8EHII5gNFfAVMWF+YamJEdc9XQDe5If8N+jtOjm8wCaIW15uF5g+aZa+VquifssoW+
	iFGCWzi3XET/DOIOCVfnfafsfPzp1uC//qTgB+gUjt5ohLf1mBMGWfAXdhDvKgT3OVFZ+3KqJzD
	N1GjLIuNls836Y0D0Yzx3jEPLJ3qtwd63hOCBIRq8RZbo0Dod6NUFotPl3H5T7QBdj6+GitZr36
	UW8Se4izu51GjC/G4xw4TodGydVAU3ASUQReXdqdWyuJg+i4jZn02thKCE6k58G6qNfmq0UND77
	39/0lGJd7fr7AiNSayNb7a9FE9UnsLnGMnHaqqVm3tFRvaFTHP8fFVKpfL4W1CO8DlKVWFZIrCu
	BCKZdq0AM8ADSWOo4gaY8083YqneTzQtoHFWJwvR856R+AjRgq/zwFAsW3AnQL
X-Received: by 2002:a05:6102:d87:b0:5ff:d299:6679 with SMTP id ada2fe7eead31-6020e56c4b6mr4142019137.27.1773649141580;
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601f31e7520sm5756915137.4.2026.03.16.01.19.01
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5fff52ab292so960086137.1
        for <soc@lists.linux.dev>; Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
X-Received: by 2002:a05:6102:952:b0:601:f82c:57e7 with SMTP id
 ada2fe7eead31-6020e5f1888mr4295849137.37.1773649141135; Mon, 16 Mar 2026
 01:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
In-Reply-To: <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:18:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
X-Gm-Features: AaiRm52ybkgfdE7QGE94nAnXy7mmjQuKiyvylh7pzD-F9X6Hn2BIVpsA-3r677g
Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
>
> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> request email has place at the beginning where you explain such things
> and I can easily locate or understand the base.

Let's readd the part you cut, which is also present in the cover letter:

> > Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

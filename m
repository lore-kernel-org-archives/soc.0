Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7B3C1971
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079738; cv=none; b=HkKN7F0Byw7I86OVlxdvKjHdGGNc0eoBeRjDMDmw1XTOJji0hVcobvXispUmEtfHqE4IwrgqX53Iz0xSS8agqoPUAQRCwW7ApmNwMJ4FRQ9KvGADgRxkCcwtKWr9khjX2Eg4wUH1WOFsMGFq+Ox8xzCMSBb1ATMwZhSZPg2qUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079738; c=relaxed/simple;
	bh=YgL17ySxLRQFB2KUyEq/eG4A/qsGXvMYPGteQORDio8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehZOl0YxRMm4BFBpA9W4Ve5RlRSL2MrB3jHnpuY0rnqXUqIB2HKtMjq/y6ZVTyVagUF1sTXGksJFsaGMtYR13Bqsonnn89bsb7B+Mr8qF/65HfLZjGKZoA+iIMP1qP0m90pnhgPFlfa7aSlAA829FWzMKvhchgMp4MNjZwch+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8058DC16AAE; Thu, 22 Jan 2026 11:02:18 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8224FC19425
	for <soc@kernel.org>; Thu, 22 Jan 2026 11:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8224FC19425
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-566390e7db3so121318e0c.1
        for <soc@kernel.org>; Thu, 22 Jan 2026 03:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079736; x=1769684536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN2yiAXGrs4j4CPQfUE6cOAJN86qtVnsMhnJLeMqjm8=;
        b=cVglNgusG1kpM2g3vodDDVGbPN2xPFXK1SC579BTtvj2i4BEEwUIgIPFC2rxZ53Zzm
         3nOrE44GVbuw4aCoZkz0dOtH9kthBDJdTDHv17AOKXztAxLLBP3NDFmboDqh0NVPuxfJ
         bReRKRNsYgyl8P7DdzKoXRwFA48WsC0oTh6qbFHYYMmiY6m/idksPfsKxDyCy/MM51OM
         MTGmiEy66REXggqy+W0wksFTYV5WZ2LoX1YbyCOGZKYc+BZ5HEJY6FxTxuWdQnGr9IE2
         F+c5uEJf+jh0HhlIu4Jb6/D4k1QX2IJuBBS2Ti4egZbLHnX0EVXDnJqH3vJhv78mHKm5
         Mzmw==
X-Forwarded-Encrypted: i=1; AJvYcCXiOqUiBSEYB/01khSm4HsP5syWRiZ6pNTwdFKkwoy+s0laVowGgTQLQmgpPHRzaJewnWY=@kernel.org
X-Gm-Message-State: AOJu0YzVjP/qp7jcz0ziqfcAC1fiPQPUsBegvqIrC8fDWl0vSm8WsYKu
	elq0lKMLMSXEu3U0g+MzeUC9cX5rbpMaOj/OzEanIDqZmLb2jcMXbV02dDouAZaJ
X-Gm-Gg: AZuq6aIQ50G5diht2TaMjF2wtNWDjqKdXaG3ACiUU3nLk7FmMRSBvnAK3b5lKr/f9xQ
	T6tPTzv3Ii7oNUOGh8GzDOMu3LZnMmWgHyCwT9ElxZpFxLZHB1jv/r1Zhg2zBhSVv1DYA2pFjMi
	6ZuYa77tdGSB+tQsCnZWdP4yLc8v+IPhp8bzvn7S3xnzi4obaW6vEcIkZg7vIST/ibw1Z+v9Dws
	eAa8fjWgI9TYUGDFTqysWr1usU9x2Vx8VUmPHiMyuoJTNq4o3RG6ftyomBHBozZFM+4TXZ0dkzF
	dN4FrggDt3zo2S/0iyY7Yy9V+kljHF1GPlEvc5SYD6uIGC9J7+oMdQ1MsaY+l0nj+hflCGF9aVr
	aWwM6Tw2tjB8jut36LzRXb+ma4/JvUXl+G2BDkLlbuqNR0GXg93Ml5cSz5jsXp7RFzLWOK1dBsh
	F2ufy0VrPT4EvuQsTSOrK3FcrakT71s/pPIXDac3aKy6jfMJ9i
X-Received: by 2002:a05:6122:179d:b0:55b:9c1c:85d7 with SMTP id 71dfb90a1353d-565d6fec505mr3091954e0c.3.1769079736268;
        Thu, 22 Jan 2026 03:02:16 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56628c994easm431753e0c.20.2026.01.22.03.02.15
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:02:16 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9480ad20274so562935241.0
        for <soc@kernel.org>; Thu, 22 Jan 2026 03:02:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmhuIW4v3QAJadS0xL2NIbh20+s6hxCbqWvD1icvyaFoJQgHlTVDvgYUXWPQ3rsTpT/60=@kernel.org
X-Received: by 2002:a05:6102:508c:b0:5ee:a7e9:f14f with SMTP id
 ada2fe7eead31-5f50a9d42afmr3220059137.28.1769079734911; Thu, 22 Jan 2026
 03:02:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260118080304.2646387-1-thierry.reding@gmail.com> <20260122-hidden-goat-of-excellence-a43b9f@quoll>
In-Reply-To: <20260122-hidden-goat-of-excellence-a43b9f@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 12:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
X-Gm-Features: AZwV_QhoOgi0chLJd-7T2xDzJCkVV-FejdTMGfxiem0V0-g6G9b9g8xnxTjocjU
Message-ID: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> >
> > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> >
> >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> >
> > Thanks,
> > Thierry
> >
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v6.20-rc1
> >
> > This series updates various DT bindings for Tegra architecture,
> > primarily focusing on schema validation fixes and new feature
> > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > legacy warnings for Tegra30/132 display and VI interfaces.
>
> Same comment as was for Geert, I am surprised to see DT bindings as
> separate pull and I see drivers were alerady merged, so I will defer
> entire Tegra pull to Arnd.

The soc tree used to have a separate branch for dt-bindings.
Hence several soc submaintainers still use that split for their PRs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

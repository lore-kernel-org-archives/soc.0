Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670B34CFC3
	for <soc@lists.linux.dev>; Wed, 19 Aug 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159111; cv=none; b=bEFBIgHFZVL7QLFhHdQntOjZlT/rMbGndnImRZLnhrDHh5eumLgGqHFbrGvhmYef4TCoGjFGWAuLDgIWtjX55WvGXNaH75LEoMCqWi0ZweTLzjT/X92fE28NR2if5VhBWikeMsQek6x7hIIL5x0cZ+D/WsVjXQZO1ddD/Ym0Eak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159111; c=relaxed/simple;
	bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VeouXWDKhUZPRHmww9y2VZQDgfBldBRsmsDW/3SK+ZYugXmvxfSl+rWvKecV54D+8N+VOel/NJvLJtXJIG5MVYYY9Z+06rRHJYeyw1+Ff88gZdO+z65LtNK81KtFWljG6SGwQ0pGhdx30Q17Lsjz/S/ZnDmIXFJTZ4+E2Hw/NM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YOopb4CC; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YOopb4CC"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so94459241.1
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159109; x=1787763909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=YOopb4CC44aifaQx92nKUkD+dIjRzKLHjqjEEIkDGfuk2Z6K14OTyfamPKXB4XOy/R
         /BcgTMW1Fi1jo8e/5nwqh7SMBMvRm4Y37qtffF42kjeEXa2XGRIIxljMr5c78TE+4p1K
         nijIOLCTXVu+PZjtn82iDiz174UWZZ9Q7aHy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159109; x=1787763909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=MnQg/ToBGHzp09MvtXlpY5HmzCenr8YEILm7nMLcyIpj2q5L8VClocCmDSCNFlXHzv
         JaRHd8DAAg3GYHOPt6BxUaTViVGlDHh1syfXoBTgVKdVgecbahjATA0ICTeLZmaaS7fn
         XXC0DBJzJEfLX7VxUtsvAICKXEY3iStBDAF/EW5mXDYQrw/TPIRBgthSVaEovAvHO3kk
         IcwedLn7+Nk73QKiVwRPONaTbOuHdx6O095U1qqjhmW5aSb9ko1x3WPvBOCqv62GzV0r
         pljyVugsV5KwY7v1xx3FnWroJ0hnMCy+a3SuhfgEaiIw5i3QhAbXy7mcaqoZkcH4dAwp
         gjyg==
X-Forwarded-Encrypted: i=1; AHgh+RqdDMkfKRyh8WzjzbsUWpehCQ8tJa283i+DaTm+bYNEdHRDt0+2M3paeBJ3+4IS+Ryz/Ng=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg+4veiOQSD4raeK8bDCoteQOeYawt9U0sQCibr3VnGct2G9fl
	1S/Li6Sa1UpPluQaWYNSNLIu7yEOhG9jfm3iOSlXLDpNnoucq1e7FC86gKLM7n5swy3Rra5GbSk
	EbNY=
X-Gm-Gg: AR+sD10FZ0CILlqA7teSl4A/2uE9OIr6ZXNWfMH9pJKZML65ToCBqtJTSekQkA3azQh
	j8QUthEB5xGoWY9Lhq5akDfr7lTWxWS5/7geL0o3WaZTAdsyo/hbIy5889dYZKK46j1B/+gbLSB
	0OSCbPEg3WWc1rYK5PcJKCGjC1Zg+c1vEdy4/g5jEVCM2aBycyjFuQBndhPF1AB6TLrLciHiNV7
	ANwpWJ+D7pieJfO1fU79mFlgOTJn8AOhhf/8SI/cRoeYe1uaAvhSvUKl3eBG1kt8G47xd55kvCu
	m6WxSYKR3b5AAMKEb52B+feRTZCPAfDGRnpfJ35v3Ux7zZ0G4OyIELCcVB8lWDtf4Hv8Jw6dT93
	2sDwrTd/Ag/8nGOztqZdIY+vhM3HnvWDjAarWt0DWpS9OyVNtr96BDpjfIPe/YaZD3cf0zKzDN9
	/i40F90iczPGKj3bN/WycjHnObisn4GByzTXLgygSYrDpndG4c73YUz7SI+nHjBqHZu3Vi0pY7I
	JNglH85JlgaK9/2Etu9eTLGF6Q=
X-Received: by 2002:a05:6102:a20b:20b0:76e:fa41:6361 with SMTP id ada2fe7eead31-778f05baa4bmr133252137.4.1787159108668;
        Wed, 19 Aug 2026 10:05:08 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777dd4a7fb1sm2878229137.8.2026.08.19.10.05.01
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:05:03 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7377dde7bc6so96157137.0
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpnZMSRbZMDpXeWOVZEBa+UF/4I7z62h0jlMbQYHIJCht38tPVE/qTVy4s8uXDqxSdafCs=@lists.linux.dev
X-Received: by 2002:a05:6102:4449:20b0:76b:2548:560a with SMTP id
 ada2fe7eead31-778f37d8a97mr140907137.16.1787159100271; Wed, 19 Aug 2026
 10:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
In-Reply-To: <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
X-Gm-Features: AcwNN1UtXmY_Pr6A3vg9yN6JPfaZdRsVgtlhCWAfgMFRKlEKan_CTSIL5IjyAS4
Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 2:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 00:13, Doug Anderson wrote:
> > I did some digging. As far as I can tell:
> >
> > * Nothing in the DeviceTree specification 0.4 [1] mentions that
> > aliases are deprecated.
> >
> > * Nothing in the dt-schema repository [2] causes validation to fail
> > when you use new aliases and there is no "allowlist" of old aliases
> > that are allowed for historical reasons.
> >
> > * There is a single reference in the kernel "Documentation/devicetree"
> > about not using aliases to assign an "instance ID" [3].
>
>
> No. The rule is saying: Do not add instance index properties OR custom
> OF aliases.
>
> Logical "OR" means here that for you this sentence is equal to:
> "Do not add custom OF aliases."

That feels like a stretch. While that interpretation is correct if you
read just that sentence in isolation, in the context of the patch as a
whole it feels clear that the point was that you didn't want aliases
specifically because they were used to assign instance IDs. The
patch's subject is "Document discouraged instance IDs", not "document
that aliases are bad" or even "document a bunch of bad things". The
sentence is also in a paragraph that's all about instance IDs.

While I understand you authored the patch, it still feels hard to read
"all aliases are bad" from it.


-Doug

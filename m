Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4EF261B8A
	for <soc@lists.linux.dev>; Thu, 20 Aug 2026 23:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269721; cv=none; b=DYc4fxjK7MbsUfdPEDjNUIgstDyyriSjb9uswZ/CrF3mwkuQuBzDXbNQjcMdWu7sZ5+5/Gab37+dU3VQOzxTxTBYgMz6mgpXtuOMLGmbOXbvj2A0Gk4kNOnhWmzQ/rhpg9j7oLr3idJZqsQHEGNTQPwKWJk9p/mhokjKlE8utxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269721; c=relaxed/simple;
	bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0xfCo0pqq75RWXxGETMxOzZXTpC2sW0DrGoIlXPqBvlPpZihuLobB9d6wvkebWTpmadczSG4y0CZEInZGhGJS2pi7D/vFOHfvs+k/4k1eoSQQnFMZ9MCOKmsiU0EXaPnZdaHA24jKbjn5xr6OUFiDbjL7zoVEQyteDLo5RORug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h6OgRztp; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h6OgRztp"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4864ebb6268so297878b6e.3
        for <soc@lists.linux.dev>; Thu, 20 Aug 2026 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269719; x=1787874519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=h6OgRztpMXEGEgJG57r8C3u34Hk3vHvUjQhujczUEakk1xiMnOMDlD87n+uwaQy29+
         xqk4fcqAguuCLP2LVmYvfRS9pnQTArsmwNnXFTjkRsdSRNGwrImQr0snm1WDLpTHkZ0b
         mXTKL/qyZTvMkbbVV8C4pq/m9S4WN/f0XqKN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269719; x=1787874519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=OYC2RdTP18PAZgaC/mYumWMhR+3xcCosud/KukDhE68aMRXBc4UYnCWUCyb/K2JvKI
         W/uwKSXg0Jr8zlA+iiHFOuSz5bFcyshcTP3QEIJvbCS1ESWQ7ZELHVGpOxyQM/shyXu+
         /1/DjT7A9ByLCh6s7fvxgVQCYQVTVrirb+wWVARiF44e4LamjQ/hW67Z5nz4R7MIBtnk
         CHvlCBh6rc4m4povU7dF615cyYO2RcqnD92oxBXQoEZlySuhNIdsAWR3mnc3Wxz9BXt2
         fpb3rhn0ZfBeNF683HCvwOeW3OLJBPjU62JZTCMazLvXAv8UJRMYWVUmqjgNWTPanZNo
         jPxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7hYxzZUzDGRnzapPvBCo+m0x2XyE6fbfo5l4FBrbTwCOb8DqzX1vN1GPbr8EaQjNnSuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNBxyrotUf094Gbzd01QiUAF8+aLUEMwiF+J1WXaAdxc/ISFN1
	2JjMOI4GS1lXXkE8NAzk520GZiqEBRLVL89bAvVyc6pWQhX+rREunC3nw9Wu3drza1QFORzlzxm
	CcTo=
X-Gm-Gg: AR+sD10rEZeZCNbAFgyrAxhlfNc4MhTs/E7odd8GzuxIfI6WFnPeZ4Xia+vWIjZZtUn
	VSJvQ0OUE0+krVahE6y2uGXbbHu7sWtsXQ/N/a9Muigzdt4211f4Zhviw0LueobXVBTIqUw6DMN
	kirYd8EnTYuvlY4Jzc4tLp3NZNlNgUn+CN4hUDfFHVO5CPfxdtP9sFO/IEPEv7KoeSx9JQIXwcj
	VSa/2w8zuF1MqcXslPzvKYhmLxe2mE0VNqToMjhhdlOJmGld3xRyeA3tgUCgbWZjlyLWgcnWm80
	q37kaAVItE1DbBPlScAJG+CjjqMtgdjc2jGaDUeRD44eUCkgzQv1oaV4NwuxKHBL/ntZD+C/nQ8
	fP21LUWgo8ma6Ql52q9kg1b+dJ2uftCsOEjgO1MBm72Ql8RUbp9BiH/g/PQIrrZeaFiWKzmrfLU
	H1sUCufMAqUx352scz16zk6o8RX45UOtJXspLbV2uCNVp7dJSGQeYc1XvAcarY2WvYKTPlCp/Ms
	WnrvVP4BZZephyznrV73YHqADI=
X-Received: by 2002:a05:6808:1c08:b0:4ab:32ea:95f6 with SMTP id 5614622812f47-4b2ef3b0a4dmr2055745b6e.13.1787269719449;
        Thu, 20 Aug 2026 16:48:39 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6dc1f5csm3140191b6e.18.2026.08.20.16.48.36
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:48:38 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so373750fac.0
        for <soc@lists.linux.dev>; Thu, 20 Aug 2026 16:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrzOZm7zoTkxUoBASUG7DOggquWvwO94lYAd9+G2BlPaomDnBSFw/XwnLMFwoUKECoXowQ=@lists.linux.dev
X-Received: by 2002:a05:6102:5809:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-77a623259d3mr898151137.2.1787269303777; Thu, 20 Aug 2026
 16:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
 <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
 <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com> <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
In-Reply-To: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:41:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
X-Gm-Features: AcwNN1W02_U2EPpwN5r9pV16wwm63sX1fk_h0bppJD-El35NE0PVzCZcm5fPTEs
Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 20, 2026 at 12:04=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is where the imperialistic ambition of device tree
> kicks in: the piece of software - be that a manufacturing
> run-it-once piece of code - that produced said calibration
> should have *also* used device tree to find the thing it
> was to calibrate. Supposedly looping over all UFS devices
> in the device tree and calibrating them one at a time,
> something like this.

Sure. I guess this is one way to look at the root of the problem. The
firmware doesn't itself consume the device tree. It has its own
independent ways to know what hardware is present. Trying to get
Pixel's firmware to use device tree is pretty far out of scope, but I
do see how this fundamental disconnect can be seen as the root fo the
problem.


> "I have a random piece of calibration data and only I know
> which UFS it is for, so I am going to encode that knowledge
> into the device tree as an alias."

To be fair, it's not encoding the calibration as an alias. It's using
an alias to _find_ the node where it can put the calibration data. ;-)


> I don't know if this solves your problem other than saying
> "go with any hack because this takes place in an imperfect
> world", but at least it points out how this kind of problems
> collide with some of the core philosophy of device tree.

LOL. Yeah, I think at this point I'm ready to give up and just
hardcode the path that we hope we'll end up with upstream. ...and if
we're not allowed to have an "empty UFS node" for now, I guess I'll
just have to have the first detect that it's running on an upstream
device tree and have it not fail if it can't find the UFS node. Ugly,
but it'll get us booting and I guess will be uncontroversial.

-Doug

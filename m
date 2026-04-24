Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C2336ED2
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013961; cv=none; b=KwdurRUecOmSmF1qhCr/K/ItcyRbNIGMmPyFmhjwgneRNaoc2JEsxjEDmm3rorWFGJRDiVccA5pnJ4kjp5Fi0SlcjjGLXTjxPAzCWl41V9KhxoZSXliG8MoLqQt+EFRAm+vm91davHfVtoGHzmoZwmf35VBLiKX1xL3CeQL6Ago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013961; c=relaxed/simple;
	bh=vJytY8WL4HMe3HBBQqeR7J9sAXb/0IxpjYcnbPquKV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWWQO9G52XbHMffI4KNI9s1JtRRF4P5JXDzWLICodQaNUEsmNTPuEb/aJfpEMlMcgJxjvQcEHq7yNBwS8auD4XvQ5L9QFxSjFlc4WDdBWR3TZR9+rt+RL/fE4Sa3hBsVEv270B49nG1x1WEG4IX5k7JjW9LwjpS4g82LCE2d16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kzywh5Z4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kzywh5Z4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B57EC2BCB6
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013961;
	bh=vJytY8WL4HMe3HBBQqeR7J9sAXb/0IxpjYcnbPquKV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kzywh5Z42fHQMDhvXyWb4tTW+4madIm//c1a8WPDnSRwZEeiqzJDmcnNE1BfLIaLr
	 GoyAS2IIl4zc2lk/3o57KXvQkMXLEPu0IADq5I6DCb59Q3UnhegJ/Oh6auAFhkWD4s
	 dh/QDaspJLyXs0ww0E+oAgXGOUEpb8a6PqsokVyLPrMUA7PHpkF86VQ6AKhFnKn3DZ
	 mVqnp9zKx2oivgEb+260/EOpl5XNXbEisiBBbmOCVkh1VnQddcMySg5ZwkxzQkuKT+
	 c6Di1GMHRnFRrUHQQ+KnVE6Hsxxkaz25HJZCO6iSS2Pwp6EW+bYazksWL8la+zwLm0
	 XcjTuvyVWcI1w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso6063047e87.3
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HLcZoFObGmyYKKVzWgMSQU5JjLtG672ZSh3/bjdqO6ZfSDDDEBPys40KASIKzrRxQl+A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl9+DQh+NScKVPSrYRWrA3FeBsbwx7pPLKqESaanLZ4wFxJjp7
	snFLOQdzULdofLCZKcLSi2Zso7Ej42PAthnBZBjk2FPDcHqh0h+OVRtCWxVRcMS7FLWUEzzFk9U
	k6j/NPwmiwOOl9BXui44GzbioZONeSOk=
X-Received: by 2002:a05:6512:3a86:b0:5a4:59:d47d with SMTP id
 2adb3069b0e04-5a4172be0d0mr11924307e87.4.1777013960336; Thu, 23 Apr 2026
 23:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWR2=6ZbLZQKzL8+bqKGKByWOR5M9Dv3Lj0AJp46r+QA@mail.gmail.com>
X-Gm-Features: AQROBzC76nTsXbrB6iGKQlywmHXe5UAMid2rCNSiTIGiO8bzyFgn1BPunTP0_eI
Message-ID: <CAD++jLkWR2=6ZbLZQKzL8+bqKGKByWOR5M9Dv3Lj0AJp46r+QA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
> Standardize ASoC menu") and can be simply dropped without effect.
>
> No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

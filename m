Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A723603EB
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013597; cv=none; b=eTLr16/SOceenJexXJ/xyX84Wk+p6KWzucy5E/pCZntHDdB79lnk8hmdmBU1kenwVV1ysSqbI7UKx3CtU8bZptyLX6/Oizv3+jFcrHCyM485b2CfvEr+JiugVbhxOoVvUsaGSF2iv1YTKi3kPXW+AYqB1nHNByjrxp04L7XYPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013597; c=relaxed/simple;
	bh=5Vo3wXPhyKtM3/dyylPu8ExYPGX0PQDeds0ppBEwWBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJfdUQjyeOvEyncEJVRBYlwqTATrwbtqaCL9UNiORbJvEtC9qnoZ7tLO1g9UYuHPSCSYhg3u93CepbLD0UvO8ZoeAaxFuDXLnH+kswSSV/AYjHt77bhiqP1Tt2Xc5DhDOWpOb/g7bQ4e82sNELpztVQgfAgN9qv5WP5QJayPZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCiiIHeS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCiiIHeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555C3C2BCC4
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013597;
	bh=5Vo3wXPhyKtM3/dyylPu8ExYPGX0PQDeds0ppBEwWBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GCiiIHeSTEmR0j6Ib97mZN2XuXDNgvlTu74PmDDR68QcbPYet5WOI/ZoNrp5V23e1
	 5NZEJdG8YOfE98sC5lMD4gjJxQrUwYeWOyBaiNdjckIh7jQtpojYxcVhqXmY/oihoH
	 IUCZ/wn97fIA1QHUYFLWgeq4H2Uhko9eo8h2dJvMxZlTjWccr1VrCLGLrKynQrnXnC
	 TaGJks1FJOIr/OhUgwXpRv+NnjJwqGhVTRW8C17uzNELxxLf4mMst3WGF85zrYLfPQ
	 iL1zWh1f8D/l2nSbCMy+FmYb6S4/L/z5Zc3RYyxhI8CkfJFsi4eLfzzOE7RGboGQEv
	 J3HwYpjeyiXIg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so7165777e87.2
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mmS6OllJa/iwfyI4GMRzBtcyqN0ypcILTqzmXcsbo2BH1I+pTKBVGvIW6N5YmpJV4JwU=@lists.linux.dev
X-Gm-Message-State: AOJu0YycUrMlREs+I1ZEedBLpuhruyc4gyo76EOosTDucoOz3TmEESRy
	p5+egUbbVnR+3X/kje+6l3AiwCQfupIblCRGyaxE8/3jPDazpPOTS+VX+jrllpx5eXAr5rz+tTQ
	hev1oCEdyj4ylpahiUhcgD8ZJ88usJHU=
X-Received: by 2002:a05:6512:3096:b0:5a4:b0:a081 with SMTP id
 2adb3069b0e04-5a4172bacb2mr9576668e87.2.1777013596043; Thu, 23 Apr 2026
 23:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-4-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:53:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbk8HUppHnJkqND1RzMmdnv6drDP=tx7r20bgL8TFCCw@mail.gmail.com>
X-Gm-Features: AQROBzA06myPZXYAZ7onhAGvH2alsvnS0tmCCwvnJ3RUS04OkeMyeNAR-CX6Lw8
Message-ID: <CAD++jLmbk8HUppHnJkqND1RzMmdnv6drDP=tx7r20bgL8TFCCw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: defconfig: Drop unused Ethernet vendors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Make going through `make menuconfig` easier by disabling the unused
> Ethernet vendor menu options, where no actual driver for given vendor is
> selected.
>
> Impact checked with comparing old and new autoconf.h:
>   diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

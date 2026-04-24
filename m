Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2924339863
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014442; cv=none; b=Ayqyi8AJkpq0mKxi4/eoMPESZd9qguT31RJm99nghYQLJn3+Y0QJlG1ULOK+rW3dZMDNMcn64zKUe4zU/riO3MQp+E4V+l+Ll6+exZYRoWRMLOfivHP34J7waf5750G6WHe1Gf/eqCxw93u58w8mXlQv6NRxr3Q5rm+KqQuQeD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014442; c=relaxed/simple;
	bh=pbnGJiqrP8jRAcn40oS1Ab2bMTl/WwxZH6xu9xU/G1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVkJO8+3PYoNKUmwLuD0FBadlEgkE0RGdy3qV3+V/dYy2Z2EPc/KGihCSz5dclbyxIlBpBmxTWbQ2IOMSzxA4Q77XpHcakpxu/5hOPnNdVAgZ6gwWD/BbbudE/C6/trQJifsO7pX3hKCFaQsTyaQiRj+oYPnpXFgxJT/oDmsjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njlx00A1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njlx00A1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C8EC4AF0E
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014442;
	bh=pbnGJiqrP8jRAcn40oS1Ab2bMTl/WwxZH6xu9xU/G1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=njlx00A1MRjkjmQw2YjC10g1xTfcnCDzvhb4huNB0WmZNvulUOaNMK3/KiGBrWm27
	 bTgBWVRhU0dKV3rRvbpge7Y+9OsjRFNiwMDIAsTTFJoKr0OolQrrSlelDAIjK9vwSe
	 DRsBB1rbumOu9WZMqfVInxH+22Ihp+Jum38e3fTeuXd7yokd/6UjoEkRvv1l7yl9q4
	 lFs5FnvL1RGnS2X3BF6aoU0S6MQCVcuUoLCUmgQB21uiuiJHrnu3rV3ADbTgCnyIck
	 JrUBYmWRJi+pT+O/kDIh8/7t7wNf5NH1AH0JOrgC+WFh71fwjvsaMqIgVfZU2j79Mm
	 DmLXoGWVdm7aw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7d984096so82649861fa.2
        for <soc@lists.linux.dev>; Fri, 24 Apr 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qsj8y+3CDg1h4y0xshiSX+3TqrkmaEELioDVCiVIoiDHQ7b7dSns2e1JdoOlzjKNE7GA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBGGMKmGZgbTKDtzutbOKNLUR/yzQFoWaxhsAKNbpIDzbj1Jim
	uZiBUDGiPIbHFLp8Dj2q7/b0O65P9xLUrsJZngxw+l0qCzbbW9G+KKsi2S5G1Eqnki+SxYWnGCF
	L9XqXbxnXsTtdkfEGqDhIG0gn0cRgsxE=
X-Received: by 2002:a05:6512:1189:b0:5a2:7c1c:74a with SMTP id
 2adb3069b0e04-5a4172e78f7mr10272865e87.29.1777014441285; Fri, 24 Apr 2026
 00:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-4-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-4-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:07:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLRTEjG15y1=f47te-5uirMUnpOTATA_5F21dSaWuGeA@mail.gmail.com>
X-Gm-Features: AQROBzA-9wp9u4XvJ0O13Bd6ibbYj5VYWJ5xrqchTqPmB8NQokc3_R07wRhKPaM
Message-ID: <CAD++jLmLRTEjG15y1=f47te-5uirMUnpOTATA_5F21dSaWuGeA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] ARM: zte: Add support for zx29 low level debug
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This is based on the removed zx29 code. A separate (more complicated)
> patch will re-add the register map to the pl011 serial driver.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

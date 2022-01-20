Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C62CC433EF
	for <soc@archiver.kernel.org>; Thu, 20 Jan 2022 17:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D4D4C340E5; Thu, 20 Jan 2022 17:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D39C340E0;
	Thu, 20 Jan 2022 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642700819;
	bh=wSf8OiMW4H7ZByPYpbf7xGHEeGKTbXxwwwZCQd5TYeM=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=VXMuBhfX4fLq81QPayP6nFp9cMohHmJYH7Addm7wUCo8AAD4JVJcDm0xEoB7hENbt
	 oTGVcKMR41/kugSUkzi07ry3cWsNSPvfTdOFcwV1Qj675Av9KYEz7xG6Et2Say7+nQ
	 Dp8mCxp+j8xL2w7YwETJ2cReSRIBD7m+edE7+fwgl2RbditWdC8VchD6a6ze+KkMFf
	 MGGKkLepaGi4GxGsTzOhJnQ7M9RbyQZiYpf2zkGyeLygz15oxf+wnYayQ8Z2iOgxb2
	 iI9aJPLMFZWq0RxUUY3tU6+rgM+ok9oddgC6xjVx1kvnJoYRo+0i+YofgidBgMOiYx
	 rKYoP0mi2gpYA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <016c01d80e05$1ef9eab0$5cedc010$@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com> <CGME20220118150028epcas5p282c05b78f28a9b11d46da94e78330f0c@epcas5p2.samsung.com> <20220118144851.69537-5-alim.akhtar@samsung.com> <20220119201509.6220FC004E1@smtp.kernel.org> <016c01d80e05$1ef9eab0$5cedc010$@samsung.com>
Subject: RE: [PATCH v2 04/16] clk: samsung: fsd: Add initial clock support
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org, catalin.marinas@arm.com, robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, linux-fsd@tesla.com, 'Jayati Sahu' <jayati.sahu@samsung.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Jan 2022 09:46:57 -0800
User-Agent: alot/0.10
Message-Id: <20220120174659.03D39C340E0@smtp.kernel.org>

Quoting Alim Akhtar (2022-01-20 05:53:31)
> Hi Stephen
>=20
> >-----Original Message-----
> >From: Stephen Boyd [mailto:sboyd@kernel.org]
> >Sent: Thursday, January 20, 2022 1:45 AM
> >To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
> >kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.or=
g;
> >olof@lixom.net; arnd@arndb.de; linus.walleij@linaro.org;
> >catalin.marinas@arm.com; robh+dt@kernel.org;
> >krzysztof.kozlowski@canonical.com; s.nawrocki@samsung.com; linux-
> >samsung-soc@vger.kernel.org; pankaj.dubey@samsung.com; Alim Akhtar
> ><alim.akhtar@samsung.com>; linux-fsd@tesla.com; Jayati Sahu
> ><jayati.sahu@samsung.com>; Ajay Kumar <ajaykumar.rs@samsung.com>
> >Subject: Re: [PATCH v2 04/16] clk: samsung: fsd: Add initial clock suppo=
rt
> >
> >Quoting Alim Akhtar (2022-01-18 06:48:39)
> >> diff --git a/drivers/clk/samsung/clk-fsd.c
> >> b/drivers/clk/samsung/clk-fsd.c new file mode 100644 index
> >> 000000000000..2669396d81b9
> >> --- /dev/null
> >> +++ b/drivers/clk/samsung/clk-fsd.c
> >> @@ -0,0 +1,308 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2017-2022 Samsung Electronics Co., Ltd.
> >> + *             https://www.samsung.com
> >> + * Copyright (c) 2017-2022 Tesla, Inc.
> >> + *             https://www.tesla.com
> >> + *
> >> + * Common Clock Framework support for FSD SoC.
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/of.h>
> >
> >include init.h for __initconst and kernel.h for ARRAY_SIZE
> >
> I did not face any compilation error.
> Do I need to explicitly add these header files in driver? I see clk.h imp=
licitly includes kernel.h
> Same is the case of other driver in this directory.

Yes they should be included. Depending on implicit includes leads to
pain later when that include is moved out of the header and compilation
breaks here. Include what you use, thanks!

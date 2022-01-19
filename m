Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99186C433F5
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 810ADC340E3; Wed, 19 Jan 2022 20:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6220FC004E1;
	Wed, 19 Jan 2022 20:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642623309;
	bh=y417UvSf+BoUhMft5/+BWA+LE9F7Qcykt4K1SS+mnsU=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=cae0Ez7sBnARVrX4gEo65Qfxhcl1AnnIYmYGZMOIFZnX+SquBBQfa5gkMdOWwPUQE
	 h7rJ9rn2UBqPVnhapM2pwej/sNJfsalJTiLFD6AWP8JwACROj2pIjK2zm5ar6YExST
	 DkSJjquWAZwrDwhS3fTWL3+GT8hab5UqMRAU8R5zmxF/0hdUpvaoBuVSeuMCCaVI14
	 14N6fcKxKOkpKXeKFIQg846tZLzqnlYdTmO6x+no14iqrklErLSl6jU8Lzo7bTBALt
	 Ln/wUhHva5p6w//eaXJIoSOElTPO5u2EoLAs19Lt6qrIdmZq2ID7YUF+1KpSWAOdtN
	 jK1Zkv/qzJtbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220118144851.69537-5-alim.akhtar@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com> <CGME20220118150028epcas5p282c05b78f28a9b11d46da94e78330f0c@epcas5p2.samsung.com> <20220118144851.69537-5-alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 04/16] clk: samsung: fsd: Add initial clock support
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org, catalin.marinas@arm.com, robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, Jayati Sahu <jayati.sahu@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 12:15:07 -0800
User-Agent: alot/0.10
Message-Id: <20220119201509.6220FC004E1@smtp.kernel.org>

Quoting Alim Akhtar (2022-01-18 06:48:39)
> diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
> new file mode 100644
> index 000000000000..2669396d81b9
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-fsd.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017-2022 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2017-2022 Tesla, Inc.
> + *             https://www.tesla.com
> + *
> + * Common Clock Framework support for FSD SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>

include init.h for __initconst and kernel.h for ARRAY_SIZE

> +
> +#include <dt-bindings/clock/fsd-clk.h>
> +
> +#include "clk.h"
> +

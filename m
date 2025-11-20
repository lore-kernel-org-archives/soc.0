Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8B2FE57B
	for <soc@lists.linux.dev>; Thu, 20 Nov 2025 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662794; cv=none; b=tR8j8lgTLnlVv9p/9HpUe9S20plyGcHC5maY982Arzq6QVZLGxo26BYfDkYpFcE6n1Ms4Tn+ir9fnE4AlHI4DPq0ntfdzYkLoaDQfvQFuAnkrD6F3tG8xqXmPHxknSq1OfYiT/Qr48eqY8KRs3uTIs9qkH5vNX+ZSUZ6eZVYsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662794; c=relaxed/simple;
	bh=2frM4ZKJ9sHrFHvhxYMW/pljtv9IlgikwDwgYXbV9+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTdekyvKFgkXnXKQUItT51Ag7Y8HGSWTjrEeR9pRBJFnXLbqW5eon3xAzF9c4cAq5SoD6nVsJ22sOvJAvwrDlutHInnBMC8aibAwGN72tl396HpVOMgFN8vUCb55Jb01IyJMj8F3cob9lSUXOmrRZ3v1Pmi58/3Sxa/uuBoiKXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aKe/k4k+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aKe/k4k+"
Received: by smtp.kernel.org (Postfix)
	id CA868C19421; Thu, 20 Nov 2025 18:19:53 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17DFBC116C6
	for <soc@kernel.org>; Thu, 20 Nov 2025 18:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17DFBC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5958931c9c7so1334422e87.2
        for <soc@kernel.org>; Thu, 20 Nov 2025 10:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763662789; x=1764267589; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=aKe/k4k+tcWSxHTHBiroLOlL6QNPUuDbwRkGtUM6fQOBn6gr6pq7rCNi9C7NiiEXAj
         i8bU292SPzfa+VmOYks2sgRveaDGNS/P+XOpA+z54h1yJgumPU2gcYVqfgNa5U+m2V+N
         Rpr3BZzd9rcX5faHK7RIQWMf41fNCXheiqfcsOo5QrV2+Yv/HSzYhqXWSPW6RlbNm2Uj
         fmi93M0K76IDOW6Y6rKnECfefGus4h+EZBCR8OY87w59paHhCCIhguzsl76W020W2agm
         dOlb3sc5GeVZUO+A9S2/EHJm6gzhJZ+m38/tVFpTS3HvQq5AT0I4UzkNhpSFifYCGWec
         jfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662789; x=1764267589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=dvgWT2FV0HTGKkRXqajyU0RHJQSzgsS8wr7BkYVpz0X90cY/hBCXSl0OgcYuR06Rg+
         Ay+EoLJI1E5BiUNTSQgy0AAuTqoTj+TaDw/SIjex5u8fI+mm0C7PVKWkXQnZNAdY87Ei
         95IK/6xhIqqiLf3SutckczUrms5m4azIpgHZb6w4mfKtAb89YOeBB+FcDEb2C+GXjppD
         Ng+RKWS84853vuYHvTT71GHD9VJfjCnnJ4p9rbB+d27j0IM9qzjNxrJsAJ146ueEawu2
         OI3eBZCc9UcPWT7B+TiD1Xh1B72weHaQegvjsTr7uMZ4NbBeeGdHVl78kn10lAF3SXY1
         HVSA==
X-Gm-Message-State: AOJu0YwzIbpwZv/RjRvkrrWN2+nC9UYgcIF/3rmBMxvLKlEPK2/PytpG
	8eZNAwBRzc5gD2nNPeBiodhyHZhou7WJuHfMvnEF+yGy55YwcdoUTuxu8C+nvP6ZvkiMepp12n/
	GQBFOa8UZodRrlsmc3XLlKKpTUAOo4epdUp4BmYY7Qg==
X-Gm-Gg: ASbGncuuatSjGLauPQa6lfqsGJ595gNGJz5GO8mQcxQocmazh3Cc51vePFE5BKLPZKj
	vYhBWFRl1LyeoIZX1ZO8FxLfHPIzlAYLuDAnFnZmkroBRGJjVlWJPihfmjEoMmNr5u6NXXtHiGt
	0opKo3Qm8/jIJsiZlpn87SFcxY5sTQPQImgnc/nvZDTO7G53Zzw4+nW39Ne2fgrFlKXHQmJdDyY
	rjX+GQxZk+pMKrpu8OpEnUzk7uXA+fXDa0+/9fGTcCV6Gah7hefj43VzFkHEMOE0ncwciHefWg9
	YmmpmQJoYcWNn1tAnYTHFonYw6TPzsrXYeAp
X-Google-Smtp-Source: AGHT+IFJUK59m9cV2hdaMboMdwCuLYZSd6vorsTLduT0KYUQfG8bYza6yPNSkEBgztU1V5kaircoAsMSf6iO5hTasWc=
X-Received: by 2002:a05:6512:b01:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-5969e2f421cmr1562911e87.29.1763662788999; Thu, 20 Nov 2025
 10:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120163252.34760-1-p.zabel@pengutronix.de>
In-Reply-To: <20251120163252.34760-1-p.zabel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 19:19:36 +0100
X-Gm-Features: AWmQ_bkWVGFSZn3FalnS_qvDgjI51sEMsJrOYvZkmui2vXqgrMxEN-ruhSsnp2s
Message-ID: <CAMRc=Mfzzgx2JcBa1iG9L9ztF+S55cSNHgNurubPBsDteoLraQ@mail.gmail.com>
Subject: Re: [GIT PULL] Reset/GPIO/swnode changes for v6.19
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 5:33=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Dear arm-soc maintainers,
>
> The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a=
7c:
>
>   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
>
> are available in the Git repository at:
>
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19
>
> for you to fetch changes up to 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:
>
>   reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16=
:51:49 +0100)
>
> This tag is separated from reset-for-v6.19 because it may also be merged
> into the driver core, GPIO or SPI trees, if needed.
> It contains a single series [1] with changes to swnode, gpio, and reset
> code.
> It is based on v6.18-rc5, which includes the prerequisite commit
> e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the key for
> GPIO lookup").
>
> [1] https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493=
a0f4b@linaro.org/
>
> ----------------------------------------------------------------
> Reset/GPIO/swnode changes for v6.19
>
> * Extend software node implementation, allowing its properties to referen=
ce
>   existing firmware nodes.
> * Update the GPIO property interface to use reworked swnode macros.
> * Rework reset-gpio code to use GPIO lookup via swnode.
> * Fix spi-cs42l43 driver to work with swnode changes.
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (8):
>       software node: read the reference args via the fwnode API
>       software node: increase the reference of the swnode by its fwnode
>       software node: allow referencing firmware nodes
>       gpio: swnode: allow referencing GPIO chips by firmware nodes
>       reset: order includes alphabetically in reset/core.c
>       reset: make the provider of reset-gpios the parent of the reset dev=
ice
>       reset: gpio: convert the driver to using the auxiliary bus
>       reset: gpio: use software nodes to setup the GPIO lookup
>
> Charles Keepax (1):
>       spi: cs42l43: Use actual ACPI firmware node for chip selects
>
>  drivers/base/swnode.c         |  30 +++++++--
>  drivers/gpio/gpiolib-swnode.c |   3 +-
>  drivers/reset/Kconfig         |   1 +
>  drivers/reset/core.c          | 146 ++++++++++++++++++++++++------------=
------
>  drivers/reset/reset-gpio.c    |  19 +++---
>  drivers/spi/spi-cs42l43.c     |  40 +++---------
>  include/linux/property.h      |  13 +++-
>  7 files changed, 141 insertions(+), 111 deletions(-)

Pulled into the GPIO tree. Thanks everyone for reviews and patience!

Bartosz

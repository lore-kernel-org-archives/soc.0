Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B632D0CF
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013987; cv=none; b=H+UHvc1iKqdk/RViwNU/bgPwrdXEiLyQTIin/bJ89lK9/sQ8Xvj3dd+wGSxFKBoIZV9+182wicdz34ncx3TkbeD1vm6lIXschjzoB6Oq8v5z/gV0zRCQFLHVr3737qW+EpW7MZo2y6pEAOXhjrIorYbcZI/tWsv9c5A3j0IQWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013987; c=relaxed/simple;
	bh=LZsFY7iJShNWMEVnFNOL857SDQajJ3gYYQlZ3v6aEVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKVaJiBXSO1UFi73HjIh/npULqFB5JJGBmX7M0W9PGSxrLpeKnz5sWIRxQJCPToLiVyGbZn9WAQAWb0pTgDy9oohQO5ZJfECW6wQSRQ7B4QIFrRbrv4CJ8HoYWv0liCqMPrGcuM3wrj7UOxPpRX8tiaTKqtQVgy66+19OXMasYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsfISfbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsfISfbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CD5C2BCB4
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013987;
	bh=LZsFY7iJShNWMEVnFNOL857SDQajJ3gYYQlZ3v6aEVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OsfISfbicJ8X1LXm68dOc3+GADNAmAx7Ak1zMFSAjJfwx2bR+BlPz3+5WHit1g5Ml
	 9l40EOC3zSSOEWM3AFU9ajSRDTCUtW7X57/SB6u1M+3V9t6w6iBhKcVpa7/Rnzbkw9
	 PpU4vCSP0UrqVqMoe0kSFISIU0hkvlgeSxL7o/FmPTzNrqplxTOo9nmae4S2cYL+Rx
	 Ik34qy59dIUsBugzFJ9fcex5GVCd6KFss3//WFrvkYgvWKDEk88Nup5OljYa5bOn9E
	 BT0knNAnHCFoNZcCf+Z7/EtJJ28mTNcynZHswt/KDx32+WqvEbwSqxDSX0paPNC1UE
	 0EUjRksKbOrBQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so7172563e87.2
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+6RstJVso4+xrD3ets5K7a50V22vpwKLgDTrYyRGcaJUKJip0oJYcTgo7WGe6CfbheNoM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGqS3hns7bvWlwkjdy/WgboHc9xRYna1+lNK+cAKCioZnypNeA
	b2RMRDQn1EXq1BmMUwNXwUZph8w/ys6au/iGVMGRbsIiVSNH19bExUZjLfn38FSlNjQ7M1K9zii
	I59Q5xFZzE2IsNFEJ37Yt6pZRxNil9D8=
X-Received: by 2002:a05:6512:3e07:b0:5a4:12db:d0f2 with SMTP id
 2adb3069b0e04-5a4172de474mr12767434e87.24.1777013985824; Thu, 23 Apr 2026
 23:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=LY266=b68ydnS4tVdvicPqteNLqPKqummrzFRjOLXCw@mail.gmail.com>
X-Gm-Features: AQROBzBmsWhHQ2_KXCFXGlplKosIuekAM-QBBy4E5vzAQYJGtE0Q5WL4C4_ykRk
Message-ID: <CAD++jL=LY266=b68ydnS4tVdvicPqteNLqPKqummrzFRjOLXCw@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: multi_v7_defconfig: Cleanup redundant options
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

> Drop all redundant entries:
> 1. SERIAL_BCM63XX is default=3Dy for ARCH_BCMBCA.
> 2. USB_GPIO_VBUS is conflicting with enabled USB_CONN_GPIO since
>    commit 0ce0f9d0785a ("usb: phy: phy-gpio-vbus-usb: Add device tree
>    probing").
> 3. SND_HDA_CODEC_REALTEK_LIB is selected by other codecs,
>    SND_HDA_CODEC_ALC269 by default.
> 4. SND_PXA_SOC_SSP depends on ARCH_PXA which is only for multi v5.
> 5. SND_SOC_ROCKCHIP is gone since commit cae3cc435db5 ("ASoC: rockchip:
>    Standardize ASoC menu") and can be simply dropped without effect.
> 6. SND_SOC_TLV320AIC32X4 is selected by SND_SOC_TLV320AIC32X4_I2C/SPI.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

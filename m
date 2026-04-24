Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA61361DD2
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013936; cv=none; b=OUc2lKWSq2ty7lktgb1zC6tJuO+9LYbcxpKsPcQPuEpQThWHSk6oR0k+autFdfmIR9bVH95GMbxXS1Ie7LJEBwdNA8dZJYUMB65oi3LTco2xkq9fs+6oQFCXZHwxsoPx83NSIa50BE3M8W+tSCnd37QmB16Ba0B4Yrg/yVdCbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013936; c=relaxed/simple;
	bh=iaYxt9AMLkeN9IM6ftUBSYmqelQZmEG9oCJlezeiK0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNpWB/otOKy+WTldej4iPEASsdyLKLYsZSMisUd0Cv7tkQlGYDi6a8g3Zqel15nJo/0Nccv8phEEuAv4QTXzEaFAUw/JiaN/CHWBDEEY/sDtO7PSPnOJnN4LpQ+5rxYzFJ0xS3otMtmzbuciLRs/HdUNKO1AYOvng45RLJtbkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD1cH/wV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD1cH/wV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328A1C2BCB8
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013936;
	bh=iaYxt9AMLkeN9IM6ftUBSYmqelQZmEG9oCJlezeiK0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KD1cH/wVRAkhxpKyIgGwnVwNKO9vS8algf9lCpvMZ3LD/7nBABa++dWRLhEjBBgek
	 fLzD4JgFrJadUBppjNykTLoHN35FXEaH6n4NXnYMv3ZndzGR1axbdsR+hnorJ3Oc/V
	 Tc4Q9iocyGxz3PM3yYtcRGmlrm1oaJ46wycrmIES0GbSBHGIWGXokhrfc65IRlEgrI
	 7Ble80djXX8hX7YVoNsbk/Tn5uN+M656P8PgHvGMyumKh+o/25Rgon+yv/0C8BhKZu
	 WZcjTp4QqNrIS33YAt6yKdLX3cc4r4NVrpjnx+vUOP5/ldUIGFnqdsLzwOGiyO5Hs+
	 UUwvvec2eST/Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a4113ab355so7905120e87.1
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:58:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+v8xIBsS6cemnKJuWWkXQ99H/bvEmjHCWSNLlMhkBXI6vXRohC8bL5MsbRetzc2PwVys=@lists.linux.dev
X-Gm-Message-State: AOJu0YynF0p+7tWLbJYdXyfIrpDkQK2dcdDiItQxM3iNg6YdKk/AvK8h
	PRbLkipBVWvynUbaNYIGXlNVd7EUPoH3SFjs3WdebrgdYilv3fNjN8n7sHEPlsUF0ILP0TBvCdd
	oUyN5iFdSK/MAxFXLX9nI2UOI2oDrcpA=
X-Received: by 2002:a05:6512:138c:b0:5a4:6a5:9910 with SMTP id
 2adb3069b0e04-5a4172dc698mr11347475e87.23.1777013934905; Thu, 23 Apr 2026
 23:58:54 -0700 (PDT)
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
Date: Fri, 24 Apr 2026 08:58:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1s4FWZ+zoKs-UkEhKgMEFVOTgAJrrbhjuTTZkPBUsVw@mail.gmail.com>
X-Gm-Features: AQROBzBE7No9DY5SvJhFb2KBRmdi1-NdT3J1fO5lkzFDj3-nX3LtfUFmilbfCTY
Message-ID: <CAD++jLm1s4FWZ+zoKs-UkEhKgMEFVOTgAJrrbhjuTTZkPBUsVw@mail.gmail.com>
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

Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CCA1F4262
	for <soc@lists.linux.dev>; Sat, 12 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752348432; cv=none; b=AYW6PmCuFbh429NDvKk5eYWO/sYoRn0rBeicH6Zk4euWFdaCT5N/8e2BnXd0/A3BAKSAE6TqMThhiIb1u9nDMrJZym3BROaJzFvSPkfgiD2iCnVXTgFo4QzjAU0Hyv4fYKTEQJlSlorQCZBuRtVTbs55az2w8WmpmGbqBR81bIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752348432; c=relaxed/simple;
	bh=/hOKuusE5jMFtwzQjB1VDvpOrtRiFiTDNJiNJFK2Dmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGyQRM6tJpzXe4y7IfcmfSEh2uwvMr4O43EYOtjASRVaCW6HeQVr91uncrpJ+4AZ6QAu906o9PZ3/h/CgIXWZIErf/eDudE0YeWct2/WowsKTHLtaBgaHrKzAVqt5wlNOz3pVJZhqoVtBsKUOzbeRuwkk8/MIBC8jqjAaPT7YbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmNFafSM; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmNFafSM"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b561a861fso27254721fa.0
        for <soc@lists.linux.dev>; Sat, 12 Jul 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752348429; x=1752953229; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=kmNFafSML9TZYR+aw/JHqElq21NVX4t0HbvY01hb8DxyGy5eNtHiHYlSY0Zk7TrpBy
         EXhGGPVsxRzoISG7mFCQTw62iiUfkbBNK+cyWG9dV40rb8ktnqr1aNftU3jpY93pfImZ
         LfpYn4sq+uYt9zPRfMzpwb0/dQtVWkWpIc821VDVzw5elkZYVfKoPmccEBYPlJ8ZqHqC
         5IdgahBQEsE64VDJshzd/QZT1BJvB7CtLRyuGiLRXE4+08UPiWe8XKnwz2QgxFf8G3Kk
         60gsdyLNOIEg1OADm5ti+3vdugl2E32oOLBeQ6goYE3p251AZ17SDWmmcTOH2FXaK5BG
         oKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752348429; x=1752953229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmdrDokSvSEbkPXVz0WTUYECUUDrY3dIue4l79myHLA=;
        b=ZfA4ov3MShw9qZSw6DtBEDavpHZdgzCCDfVt4g0Tr0tJe2s1giQFjcVJ6N2jSNpZOC
         gwm5EGpd5KilduRkSRCVoe8HtLu27T0Mbu1hSGVs3dkQ80MJ+z8Nw9YunzxatalrW2CM
         gB0OV7OwB+G4PPqIB5h/KR/OfwcTRqv3uTj1lCso2SmImrgcy9ITgUb+hlaAukNMTiPh
         b1n+BcMsGoPU3EFFS2dprF6K4vLDH+XD56hFy1Yqf/+Q1wzQe6/WLv6GRiOahGx+cNsN
         4ksjbzaeLStIiGKDaUoelRxDG8DH+nK7QzwHenDiQdboizxwDHYaLgOus1d/BdgytMe4
         GAHg==
X-Forwarded-Encrypted: i=1; AJvYcCX3YA55QnrAFsOS87DNYDI3DGA1PtWvAXtquUJnCWb1YlMYbPwzWsexBUks+EXt8xicdMI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyme4IacHxu3IKUFPASAwVCDDydQpsm39+J7gURBuE6Yj9OS/lC
	2LOEBZeL7MwECPH3AMlwxmHpTvnJo0NrrAd05cF4JylDsThYhzQ9XE0my4k+0+qQy2qWG4f5uv8
	M2n/a2khFzPRI8CTtmoa5Wt4qlHYtTdd38R2QnriWqw==
X-Gm-Gg: ASbGncuxdLvMLzs5wRtTCdcU2QAQFJftth/3bg2xs8eV3e9a51aGfEzVqQLN39X+9k0
	iZm5UqX31mecfJaBoEmL8Xl58oXSlo4BSuLWm9xwJo8K4WLG35u7jrAi5Skl1oVExwlIvnEvmxJ
	nSfnPkcogFWXxJ9YGE/9j2kdi6pxHvNlJerEpJSAl+NFwF0SsL7HeAjY/5TrO+k9mSd5DoSLnri
	hQopYQ=
X-Google-Smtp-Source: AGHT+IEg/39vWPjh633ZUj8UqZLuNkeQ4zJb+DeEXqhdOGqkb2UzJv4loDelR2kMaTSHX23IkdKGCBQxVkP3ySeashA=
X-Received: by 2002:a05:651c:4ca:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3305509f9c8mr19310751fa.32.1752348428638; Sat, 12 Jul 2025
 12:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com>
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Jul 2025 21:26:57 +0200
X-Gm-Features: Ac12FXwfRBs5js5oSquCaRb4DKz10a2pVgF5CqiS_5Na7OWkjOlWh-jR8X6bLJY
Message-ID: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, 
	Jongshin Park <pjsin865@coasia.com>, GunWoo Kim <gwk1013@coasia.com>, 
	HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, 
	SungMin Park <smn1196@coasia.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Ravi Patel <ravi.patel@samsung.com>, 
	Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>, 
	Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang <dj76.yang@samsung.com>, 
	Sang Min Kim <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hakyeong,

thanks for your patch!

On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:

> Add basic support for the Axis ARTPEC-8 SoC.
> This SoC contains four Cortex-A53 CPUs and other several IPs.
>
> Patches 1 to 10 provide the support for the clock controller,
> which is similar to other Samsung SoCs.
>
> The remaining patches provide pinctrl support and
> initial device tree support.
>
> Hakyeong Kim (9):
>   dt-bindings: clock: Add ARTPEC-8 CMU bindings
>   clk: samsung: Add clock PLL support for ARTPEC-8 SoC
>   clk: samsung: artpec-8: Add initial clock support
>   clk: samsung: artpec-8: Add clock support for CMU_CMU block
>   clk: samsung: artpec-8: Add clock support for CMU_BUS block
>   clk: samsung: artpec-8: Add clock support for CMU_CORE block
>   clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
>   clk: samsung: artpec-8: Add clock support for CMU_FSYS block
>   clk: samsung: artpec-8: Add clock support for CMU_PERI block

Out of the 9 patches there are 7 patches related to "CMU" without
any explanation or even expansion of this acronym.

Camera Management Unit? I think I'm not supposed to
guess. Is is an Axis-custom piece of hardware? (Would make
sense.)

Please expand this acronym and state clearly that (if this
is a correct assumption) that you are not supplying any
bindings and even less a driver for the "CMU" thing, just the
clocks. (That's fine the actual CMU can come later, but
it should be clear *what* it is.)

Yours,
Linus Walleij

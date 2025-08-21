Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4F2E427B
	for <soc@lists.linux.dev>; Thu, 21 Aug 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795053; cv=none; b=drkNyMztmkHgVB/yIgWb6uys5JO5gwiU7D1Aj+X66lykjhahrhfpM4JdD2zz/+7JOS7MLigfpYd04yUKfsD7g4CVZmF+EdCNXDgfgQHRuEFZ7S0c3UZJamVi8VcbATQHg4h9V7tPNzFOsNJ9AggEscRQiXvTzCy+7J0ZdK9b6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795053; c=relaxed/simple;
	bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQXUqU+8wbPVRbi0ZNgvdivnhrbbjAzCcBi2SOlBcHL5C+4uYV+8TEIELb+FwgHIQDNdjeiVCBeUKqNxpRk1UzFeYxnrT2n/GQyRsMPHzkadSlCPYbPEcO0mgdQvbmOBSkpTR4PtlAnV3pQ7Z8+zDEglizAEMKsJLj+Bh6Y86/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfKLSEIr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfKLSEIr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce510f4f6so1274888e87.1
        for <soc@lists.linux.dev>; Thu, 21 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755795049; x=1756399849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=gfKLSEIrSzkO5z8PRUh+uOqo+nDCXKGNtPaZuc8oTFQJ7ZBTXBFi+x2ah6cNntMLbb
         VO5yW8txjK9qYG4c5aWziG4VjVy7qe8HViRLVN/T0/t0Xgt1Zuf9+bczJ0pVkyEUaydj
         hrWN1ahx4JTM2qHFpjP+0ifCIDHriPxHk0WjNOiJLaPUbjfvnKjprJTA5SAgZHJeHfMQ
         gysLlCD+NEr2u082Uw/2fHBIPCzIQ5gGTNR3bxoN94OTzswCU9Fe8v2pAxG+6iZivEzq
         kmAmF4x6Mwo69ng2Nl2mjctECWCQ2McA1diI9ZCZF5da5J1U+XiwtUOknQL81bW8Sdb7
         kJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755795049; x=1756399849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA5CoRznscTD/9JPv2I1fgD+UFpMWzRT7Bcr37nG6ws=;
        b=TszKWd+3oia5FCS4TjS7PBQ5ISlMphGSTlBGD/VrwUHFgsQNP4rLx5wIf68cFbPkmK
         urexwGMFyFp0MV+p3rKbvHLK+aLJ89dCKPRr8CrP6hhE/2uPmdec/NpJkXESAXpkLKGn
         RejmWw9zGfyuYJqVr6O73ztTkWVQQ3ruir96zrUKvz+BgSSfftR9grabC00mwdeC25/I
         iZtWHW6x+qLf7+Qsx1wdlGXlt/8ng5wi7d3dPY0VOCTeR8BiWoaUcnYBsZZCCCcNPBfg
         wj668g47t1JL0hd3xU52GE2YIALCax6Up3kk4VTTiKx9rQT0IrHRDuik+GQAD50v+Y82
         tAvg==
X-Forwarded-Encrypted: i=1; AJvYcCXxXqo7DZESKccG30ARbc2R7kbjQ/HyFFHk+h9Vvz4z62baVKyDJUffQaaSe6KGSZJUpq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZXoku5kFOVDBchxKQWIonkitWH2RM8eZ33eWFjgoinCh9x1vf
	4CzISwnYus6FXNAP31etML2B5cBTVGl7waYRce+2TzUGkf0IrXmBUtE4xnRyWTjV77g5SGIFcd8
	kcGpLrWGphlppUYD9VpGNnydlYeljxo0vl4usEV/2rw==
X-Gm-Gg: ASbGncsT/H8EcBuivD7Iv0l5bb2MrKOROCPGzJ9H6A/IFOqXvR+oTQvRnUrZB5PjqYB
	beH/WUuJuLucD80pHPHcLtRMV22lTbraXwQZJGGdcvnehvVvGxpjuiEIfO8M5OCUZZqQ+LoAxvI
	tOjr8wCwbusguRfmyWMfx7ZwGzrYG6JCTrlYqgAEJ2zcnhjzPoWhXwCxv5xrYoiCqjQfIPFb95r
	9bkU4AW3uEXD2blow==
X-Google-Smtp-Source: AGHT+IHXxJmnZpxwlzV39CihpI1fip8jHsQ3wqrQIPStR8+WqibfCJ2j76EEt47pzZKFul7hhblBfkLJ4pGoe6B1jMM=
X-Received: by 2002:a05:651c:23c8:20b0:32a:78f7:9bef with SMTP id
 38308e7fff4ca-33549e3ad61mr6524161fa.8.1755795049223; Thu, 21 Aug 2025
 09:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710002047.1573841-1-ksk4725@coasia.com> <CGME20250821124039epcas5p34b77813c9936b8b70c801e0e1b67891a@epcas5p3.samsung.com>
 <20250821123310.94089-1-ravi.patel@samsung.com> <20250821123310.94089-6-ravi.patel@samsung.com>
In-Reply-To: <20250821123310.94089-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 18:50:38 +0200
X-Gm-Features: Ac12FXwqIo6zLlw0fIpSEAb-CCiAQ7nCYe-8wPk85-SMsx3heqK_K_zSrsS4110
Message-ID: <CACRpkdbdpcPBC8mwazoXHy+HE+hH-XWDkfHV4Uz38YhZU7UH7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:40=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Looks good to me.

I expect that Krzysztof will queue this and send
to me with a pull request once he's happy with it.

Yours,
Linus Walleij

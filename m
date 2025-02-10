Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895B12CD8B
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 20:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219459; cv=none; b=djCxAd+y3hl+ecHpulJEca41ivVTk9/ql9LNhuEl4EVDsQCi1pugTk4Hz4c6Z043nm/z8cctUU0QpbgAXH9vzHG98+d6m6hlfmnYn3mF8K6U3aWxHxrts2wrB18jnC+E5sSxa6KdSw509eK4XLdu6b/xcs+QROJ8zET65EqtN2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219459; c=relaxed/simple;
	bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kCghfoo2CMOMnL95m2Puvvz68FTRtC+kUG3Z+lRNdQWzPLeataYHoE8aSdgak7gontKpd9aci15m2IxFIgzjFqSDpwInnun9vyIQkFlc0GYkkVt8RgztvhtXfI7AhtmUZf8/R8t+JhfW7aWfzqWQtw0nBrpurE2n6hep0v98EFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXXrkMA5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXXrkMA5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so3522934f8f.3
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 12:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739219456; x=1739824256; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=;
        b=fXXrkMA5ZHVw378JaKqTBC0yvQ5HNLJcYrUTYtcBkpKUoeai3AeDPytk923k4DM7bq
         Hf/YXyx3Ldnkw9je+zaqPjSYe+keYCRa7PrG9Tg2puRs5OPdxB+DB21ME+U+Xd+C1XfH
         PseBm0IhdvY66uiY60sjGEO27nRZb3sJQ2ZY36115QLOKZwH2LCcWkFA987XIGGK7G7z
         +o8AKVqoVlr8A68gSIv3LGWI9y3eBFC5gkbzzqP3d9ph6Tbn7qqmI+bCuyG57+gsOZBu
         3WMFpNr7cPDaSiBlJQF+/8cQCJDNf2R+ZHfoInXHdp1LR3DFP2o3KrbtNDOb1EtD/SM0
         Y3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219456; x=1739824256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=;
        b=W79xW/EjGL+ukYVox0+IjXa2m6j6U1heEzLrD301snYwoT0dhc2pxF3CI5tMHTmlGR
         s2CafEix+kTSYyerM75NC9mnrw7A5nxpKZMk8PD0HmrsqdbhxLUScRjWsRQZhmSSlNKP
         OlTvIZdCWZmAaIdBSV13TUQ4LQsVrgfV60gh5Dutp8iuwCHpN9MTOiA2QrtyCkCbyNB8
         37q8iT3L5dgOaM+9OpzA/tikhc+peaLbuNaEh2X9qccP7mRex8uRrmwCyogcCqIhuMdy
         /kklemL+lULsWD70G7iyaFcHP9AFKi3axBQ/RkuZywkbbIR4jdq8Yd3to1PS+c/3nwk4
         kaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWnpg/KJJ9Jcx4ycvTY0Apr4FHMR6lTFcWJ8Djz6ifQzHtX3uxr0MsmYMDjpr7QsFybWk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIYTwIAKRCXpAnXOjlLWHBTM12qVUf2X8ASXBXHLVh/nknrji8
	DoUqeyTIZuGB3309rKzWUoCptly5Hcq4M8D/NQJ62J6wVn4ac5De
X-Gm-Gg: ASbGnctqbQIL2gWkOm8dMqkJLoiowOdDSgISaUW0vGA7/RNq1GgrThsJOEeFvtgk6E9
	9QemdzHsR0vkZG0UH742YipwaqoU3bZSnDtl7BMw1WtlCLct8TBEgRdcwPLkA1+uqkQ0q0ah4ss
	U3nGWmNPUmvImXLuUp2mD2efzQO2x9v1PBhnMCLiNn0W1rb/SYYod00KlALgxSk8DvzX67tj7D9
	NtBf5aqWPnRSy3pnPGgh2hDbSukgc3FhxWcmYeytlzZMll8XD22hKeC6xM1/WYiBhugci+51yfv
	1pYFwgJdkV7Ht5yeFyxxsqGeoAIDgL6d
X-Google-Smtp-Source: AGHT+IFvurPoS9MTaLS3PpCWAsYOJF7NzTYw7+2Z56lUplq4lRolzdbvYN3eBpQHiYgZPARX6B6e0g==
X-Received: by 2002:a5d:64eb:0:b0:386:32ca:aa12 with SMTP id ffacd0b85a97d-38dc93745famr11388110f8f.49.1739219455327;
        Mon, 10 Feb 2025 12:30:55 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd9c48173sm5389541f8f.37.2025.02.10.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:30:54 -0800 (PST)
Message-ID: <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx
 rtcsys core and ctrl compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 21:30:51 +0100
In-Reply-To: <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
	 <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Krzysztof!

On Mon, 2025-02-10 at 09:48 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > These syscon blocks will be used for CV18xx reset driver.
>=20
>=20
> No, implement proper reset block instead of abusing syscon.

I don't think it's an abuse... You need to look into the corresponding TRM =
[1].

4 bits I need to tweak (and one magic number into unlock register) are rand=
omly
placed at random memory adresses and otherwise adjacent bits have random
unrelated functions from random unrelated subsystems.
If it's not syscon, I don't know what it is.

It has a reset HW block, as you and Inochi have correctly pointed out, for =
other
purposes, for resetting the SoC IP blocks. The overall SoC reset is complet=
e
mamba jamba.

I was thinking now about a syscon driver, which will register_restart_handl=
er()...

Inochi, do you have more insights into it? You've mentioned RTC and 8051...
Looking into TRM I don't get it, why a thing blessed to do all the housekee=
ping
(and called "System Controller" in imx8, for instance) happen to have RTC_ =
prefix...
Would RTC subsystem maintainer be happy with a monster driver which has tie=
s
to all other subsystems?

[1] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01=
/sg2000_trm_en.pdf
("rtc_ctrl_unlockkey", "rtc_ctrl0", "RTC_EN_WARM_RST_REQ", "RTC_EN_PWR_CYC_=
REQ").

--=20
Alexander Sverdlin.


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D3264602
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 20:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220043; cv=none; b=e2DualEuGY0JwkpMGRd/qmRe2jX7+ZS9hGEEpdSrAf82M/4cT9WuPnR4SaQpNJl9km2gA3PgXkP5aBVDGCJ9bz89j2B7LrOVKFapVFPOSeqWioesBSXFln9NpTdFrjLuvNTc/BjAs2yjTK1DIqhJvKspq9cFElbiExvMAJ2STwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220043; c=relaxed/simple;
	bh=EOrJyLpi9o+aX1l7UhQTaefPqHhchUVGMwHkMkiXSo0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HBGrbgjCkavlWao13qnysPLBQ3557dw6oLlNFxUksyBBCDWSBdeAyruFYvCQlFqVE2jHWH641LPfZOM3V4p88Ii8afDMg+YseCriuTpcTV/Pre6pykffuup7WqNSxyJE+7Hnockbt483sNAEOGmjoiNgfdm9EkMoc/U4gy2BlrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS+GDtbZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS+GDtbZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so56520015e9.2
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 12:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220040; x=1739824840; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EOrJyLpi9o+aX1l7UhQTaefPqHhchUVGMwHkMkiXSo0=;
        b=HS+GDtbZkAibwJRDUNHR87XwkKrnwQFMRpnM8d4srmGbHwVTBXkYTeXpoMWK4r0590
         s4QX6EQxmTWNCeb8C70m3McI4tJ1MEaIokASj178S/b5FN5PY5+RYP2VvpxYvzuHDcr7
         Xn4wUJ8o8AQwLtcE/gUyOaXXPalDvmA09bG6U2gOdMJ/EAaEUhh3RQkXimL8bt6ZxVVx
         zn+V17FalRCfITm3F7BorMo2p8kvX3Hu6AP41f2cCk7azVYlaNh2mhnSnlq5SIzPwQQR
         xIgYfgzLvlcPrZtI2mnt2ntGRBLr2c0ZSeXLBHi0QsADsUqaRvUmTR2F67CntDaeW73J
         Grxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220040; x=1739824840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOrJyLpi9o+aX1l7UhQTaefPqHhchUVGMwHkMkiXSo0=;
        b=A7RxZgGVKcNjX9pV6PFRgKXoIIK9HruA2Whc5akqe3UJ9BZAEU8597fqawyh4yZ12H
         0k80UOyxFdKlRwxZFZq3RWXuX7bj5zZOlHbpBXR6SiLZoBtJfE1cyRD/U40JKhzlJQqh
         swp/IotAQ1pR5PW2HOTjrpWSoZJ14CdP3Mv6pbcxisVdjnAzyyjA3XJ1iZ7tM87reOrf
         WrPYIry9516uwDF4esZMsXvt0XB3PUGNNtHdHIx+PEHh45moXwXD++5d0HG9Y37OSHGK
         GftsB1WnHUs0toLVIrgEs8j1V5jRgChLn3WZylZynjdOWPEoRHuInH7rkbfpkmP/10Xf
         D/sA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Icd6QdKsp3Ip/dqGt+cadysdmYz8EpN2QvG8/pKjKUrOlpa0cSN1TL8II8VjV9gPRzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YywNPdYXEDBxdXqYStzAp4NGNKM2Nqk8UPYgHTgXF1l9YcttzQ0
	J6PsdshII0H9IAMCEz6WpZLFtsP/Pa45rwPrx4heU94a+N1srmoQ
X-Gm-Gg: ASbGncuNI+yHKiJdT/h+LbDDTyyoKFHnPsFS1t8WGoqOVJFuNsSVr9Pw0OzDYvJUIPh
	9veX+hGpX5sbKD4qPBXvs9307/DhK7qnZyfj2bb/jlUooUCBIXSS4hfIh+vLI89B7GgOYjXHORL
	bFGTAAVY6S1mNr5HuQGhw26gBhIrd0G3tcNBmWV/sMVrJwazlHJWW7MRFwN19S/u5ddLOkGXFaV
	XZNeTg2yITOTaR4XnL+drB0EYAHwt6JGoMeHehMglqTvqDqzfx56UiNqYH7JAqA0CVhNEV55uzL
	eCfzUE7lRRbIqxJxSdy6QkdgdlDevPGm
X-Google-Smtp-Source: AGHT+IGANzhAWt5IwkQhTvn7xGsdCRHvYJ4peTBZKCls6+W0CRyuS6ldpr+5UQbejq+0t4DSbFyanQ==
X-Received: by 2002:a05:600c:b9b:b0:439:4637:9df with SMTP id 5b1f17b1804b1-43946370d05mr42704375e9.3.1739220039819;
        Mon, 10 Feb 2025 12:40:39 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf44f3sm194823195e9.29.2025.02.10.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:40:39 -0800 (PST)
Message-ID: <b51ca7db3e2a7fab372ed950e3a18cbcd6c56ba9.camel@gmail.com>
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
Date: Mon, 10 Feb 2025 21:40:36 +0100
In-Reply-To: <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
		 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
		 <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
	 <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-02-10 at 21:30 +0100, Alexander Sverdlin wrote:
> On Mon, 2025-02-10 at 09:48 +0100, Krzysztof Kozlowski wrote:
> > On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > > These syscon blocks will be used for CV18xx reset driver.
> >=20
> >=20
> > No, implement proper reset block instead of abusing syscon.
>=20
> I don't think it's an abuse... You need to look into the corresponding TR=
M [1].
>=20
> 4 bits I need to tweak (and one magic number into unlock register) are ra=
ndomly
> placed at random memory adresses and otherwise adjacent bits have random
> unrelated functions from random unrelated subsystems.
> If it's not syscon, I don't know what it is.
>=20
> It has a reset HW block, as you and Inochi have correctly pointed out, fo=
r other
> purposes, for resetting the SoC IP blocks. The overall SoC reset is compl=
ete
> mamba jamba.
>=20
> I was thinking now about a syscon driver, which will register_restart_han=
dler()...

Sorry, I meant "MFD" driver...

> Inochi, do you have more insights into it? You've mentioned RTC and 8051.=
..
> Looking into TRM I don't get it, why a thing blessed to do all the housek=
eeping
> (and called "System Controller" in imx8, for instance) happen to have RTC=
_ prefix...
> Would RTC subsystem maintainer be happy with a monster driver which has t=
ies
> to all other subsystems?
>=20
> [1] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.=
01/sg2000_trm_en.pdf
> ("rtc_ctrl_unlockkey", "rtc_ctrl0", "RTC_EN_WARM_RST_REQ", "RTC_EN_PWR_CY=
C_REQ").

--=20
Alexander Sverdlin.


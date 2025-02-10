Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94B1F3D59
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188086; cv=none; b=ELrKff0RWm3DY3mjYY1yJ1IX3WubOrpDeoiw/uX2j4Zfl++v00Z+pHSCJc0SniI9FLh8cfGiPOoUxquuQFhHlZ8Zvn+V4yKp40z3XJKS+s0D5arWKFR2oR/Q/tIzCjQaAd3HqqloqDOVgxe7pO0dnw2haOyrZTglPAfZC6uLX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188086; c=relaxed/simple;
	bh=7xr6eif59D5Z0cBZLVAON47L6iycbPs+daElwJ+WYIY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdkZUfYL1cVXaNclI7B3A7uvKzWjdeLXrwUSngi0QSD8GgignXXyaZ9YRIRlt7Y2ywKJNUFITi026Y21ZYnobNDSomGvATFjZWPI97C1U0H6jRSVt8Zal1J4ZvOvSBOtel41ZXyvGqXpJwFL6nDNWRgMgVq9v1qoYiMlnY4XlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLQwM9kx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLQwM9kx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so501558566b.0
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739188083; x=1739792883; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=mLQwM9kximSNIqFWKXse5maoWbL8GJk57x0MtvHubGiuoXsWA4EoFetCdi/UF1eZMQ
         r+TKIrecrG8ab54qxlkxk8PNSiBPr40sfg64hZH/z8NXt7HdCK6SajEBWOw1jyhNUjNT
         zzW0xdZVc2jRHV9LGrWcqw4jBD+Y2Dd9YQ5SrIM3n0y1Quqx/AQGwXIze0Vim9/Gok+N
         dDwBlUPSm/2oRl8UrUdBdQc67dchIP2Hm/PxQ2RCPOG0J+nmwTMS8OeoS8zrMxXo+WXU
         uQLgtQ7aQwL4y0dXmJTiFtRscjPJ10PelIxHtQX1pFnHSUx02GgR9ZZCJVSdeZpEFgrS
         A69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188083; x=1739792883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=SHhV3v1TJd6CRWSOFJoZAFlhyAtCCNzGohlFKq7/NwR8iFZSScWl5oWO07wdI140NE
         Ui0JAJJ4hTn3m5p3NIIXvNuk+5vJdFUe/awew10C73lKNIvRMlL+V0OXJkx/Hb7qFye6
         up4Du1+oZ+PW490IPITwDq6s3MWaLDNQKZFF/Fp546G1ry5S60G2ax+cFad+3Z8cACNB
         BOdKUR8YVkqyS2fudtNZYb7ckAuA4MgW69nGLfHpthZa1Jd5S4jgNktXcWykB19PPZ4L
         wHiEoB4TgLNLLZeNCP2HfwjJ35C51YlaZcypVIaSaLxXKdhX4W2TNVLiF++yscQiLpZR
         POIA==
X-Forwarded-Encrypted: i=1; AJvYcCXjyOwj86eFfOcs+yUMD1adH0o4PMx0ssEQ4l5yi40zj53A1pYfFA4HG1rbVennB4lHb+E=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlo5S7wbq8/ZxEEAJ6Y5djG17QmU0UMi8NESpQnePwySUPFAOS
	D+bscLgw8ug/He6+6oRu0f3HxtjEdeRpLj9UMubRM9F9LoXHT4N/
X-Gm-Gg: ASbGncuc+XNAG+T3hZ7IYSCFBxAUi8wty7+J60gI4pt2NmXzan8+SNaOFjfVCaBhc6h
	Nvm4LnNO+eiX4PLjMKhtUYznSjBvZCLxh34qZKj2uYt3RQbxkdeN++9HJLgAkvYLFi8EbNck6ZM
	k9bJsxlfWe3Lnl8OtArvGWA0XK/I+scucKBswtDq39ElO6HFNqvy0nLyPVqde9oa0lDFVoBrPAA
	cRFuZwrkte8Ri3ITOFg2kibj6bwavUQ+Qo9Qw06k8px5111LykdMHQg+9Mm+nuHUDlt6iAxgZTP
	rI42wiR0oVMUEP50EclaqHkRUJd0r1kI
X-Google-Smtp-Source: AGHT+IGY3dILn6ts/Eq3QIZU6ECVgNuSbLxMNRT8V0H+TQxvFHnWdoPp+ST/buUvAjzzmdL3OQMGTA==
X-Received: by 2002:a17:907:9719:b0:aae:8841:2bba with SMTP id a640c23a62f3a-ab789b84353mr1350942666b.22.1739188082366;
        Mon, 10 Feb 2025 03:48:02 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm252975066b.135.2025.02.10.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:48:01 -0800 (PST)
Message-ID: <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 12:47:59 +0100
In-Reply-To: <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
	 <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for quick feedback Inochi!

On Mon, 2025-02-10 at 13:13 +0800, Inochi Amaoto wrote:
> On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> > Add reset controller node and required sysctl nodes.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 +++++++++++++=
+++
> > =C2=A0 1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv=
/boot/dts/sophgo/cv18xx-periph.dtsi
> > index 53834b0658b2..d793b6db4ed1 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
> > =C2=A0=C2=A0			snps,data-width =3D <4>;
> > =C2=A0=C2=A0			status =3D "disabled";
> > =C2=A0=C2=A0		};
> > +
>=20
> > +		rtcsys_ctrl: syscon@5025000 {
> > +			compatible =3D "sophgo,cv1800-rtcsys-ctrl", "syscon";
> > +			reg =3D <0x05025000 0x1000>;
> > +		};
> > +
> > +		rtcsys_core: syscon@5026000 {
> > +			compatible =3D "sophgo,cv1800-rtcsys-core", "syscon";
> > +			reg =3D <0x05026000 0x1000>;
> > +		};
> > +
> > +		soc-reset {
> > +			compatible =3D "sophgo,cv1800-reset";
> > +			sophgo,rtcsys-ctrl =3D <&rtcsys_ctrl>;
> > +			sophgo,rtcsys-core =3D <&rtcsys_core>;
> > +		};
>=20
> I think these node is not suitable for riscv. It should use SBI SRST
> extension to restart.

Independent from the particular form, or its correctness, this is still HW
description, right? It would be a "policy" for the kernel configuration, if
the particular build would rely on the FW or a kernel driver to reboot.

In other words, the HW block remains in place, no matter if it's controlled
by a kernel module or a FW. What the point in hiding it from the RiscV part
of DT, keeping on ARM64 side only?

--=20
Alexander Sverdlin.


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C321F0E3E
	for <soc@lists.linux.dev>; Tue, 11 Feb 2025 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265259; cv=none; b=ChJrGkPvhqWoIPg3U2QEmiR80ZIDTbGgBocRcSuF9Yi5GO4q8VguPes2WALs3VQzZ55aOI5KwbRsQd8zuNa6rdrQIWcJOjKisTJ1IcEswRrqzpWl682vimrfrjFw4dNrZWFZmj68Jl3kNtYZIi4//pxmmwoCbZ0ZrwZg1rzP9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265259; c=relaxed/simple;
	bh=BgBeE2dHFG/fUDGg59ZBKfcaHQAIhsnOWY9IR+/ZJ5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n0J9XgIPZbEZ2Zbe9lKQsY7dsc0swumb3/tZrbAYHbC19OoE6aMa0s82thNJmCe35HETYxnJyQeDTlCF5V2v3dFacWyCly7w4mDLUrGDbKBv5j5uupjFwdYNXXuKWn0unIM9QJSgK/r6gyygwtN8P5EdvriZOt2r5oV+qHAYQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6GKlpY2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6GKlpY2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2761186f8f.0
        for <soc@lists.linux.dev>; Tue, 11 Feb 2025 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265256; x=1739870056; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e0gUrFkOMyKNFnFh3bFOpTeSy2QBMxAkVbnFWdeqIiU=;
        b=S6GKlpY2+qzTnBVLGCgKUA1wYR4vsIjTMwhYrOJFCtY1wYRDcIUmg/EmMPa73G+STA
         cKfiqkP9+eu6+R3i36EQQ1r5y8YFIwRuEP/6jhDh7GUoNYOp6L99bFnjkeAHKHUJXCBz
         WSLXl38EYZxzIfQtelYP2Lwmg6VXWKHxSs5H6FCjS1GJ+P8CkeXgMOIROv/vAVSNy70k
         DtcS3Urj/HWpiCCeNQcQHaeLqHI/kaLyX3Dwaq7oRXV8wUFatHyt6CS8qOKELStVaCbn
         tTnZMVD8uE7LK8tzBIfo9GGQVdcz4JMBqAagAFKz6cmP7asaHq0HOwh1XbCHWoyZeeSv
         BWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265256; x=1739870056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0gUrFkOMyKNFnFh3bFOpTeSy2QBMxAkVbnFWdeqIiU=;
        b=IY70NMRujd3jH0YCK2qvHDzFhK5aqKHgJsxl+o1FC5aNa8smnHuCUk204JJ22w3VBD
         AYM1oUOgDquaXNUGupB/xvjgFq0N5yhse32GKL6IZN8S4VSD/bZRBLMXzxSQCm/7Hx9+
         c93yAS5+DvPk3ZYzJ4zECn+/nkecftmsov91xP+LJR61MwZEPqKabw32nJHnlb6zdnf/
         I73bLUkkynHHQO8sjQurbmqigpoVUdHkJ2vpKZU7od1TXH2LHOiHEcd8CZ+3+1wfLS9D
         gOAYi5oM35nQbmG7L6ug2tKJDZh4YXfHZ2YdAaifvqeOuTTS9JGiUiCpiMtBEgBuReiX
         GR1A==
X-Forwarded-Encrypted: i=1; AJvYcCXIHRDF1du7bp821Wd4goXnqKfhKDBBhdWT+qhzzHP3ERcfY2KXh1sGylCefL0C7iH6KjM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQdIOwxvNLAAm2qMv1/nPYyk7m6XszFkasF8zz7SVWDBNk1zA9
	LEB9823pPqQFw2SUv46qTW8jaKFEaanomkLyN15LeEdd7dFsU24NUwsgwmYQ
X-Gm-Gg: ASbGnct1P2MkErcSoW0nrypu/ndQOOrIvYivTIoVHzHHindz7SQu7tqezrQw6nSTdIH
	uvvnKoInH7AUdFd/43Yc9PTZ4CSMNOoknyiLP+byPhn/7JdsI9yo1fagtcxvTuimXNSSbadwAGX
	XqMFZn7Hg7QPkSJBB3TnGe5Wt5uzjBSWmLW4um4Yp/mgcMBUj4551/khpnfh86qd68Kg/XoIzQo
	cl1Y6ZkRNg4d443s4C2sJQdmNTrCTfY6jtAq5pwBdP3PJrHju1XxMfv6XXQD46mBmnHHKgWFmvB
	4l+0ChYAP0W37kLNhEKGuKf6nK/kSiL4
X-Google-Smtp-Source: AGHT+IGkTdyt5H6COEXxIblCp8Mkz8zw3aq7BTC3oTMMt/aizs2mFlO0xMqbkPV5ncYfNxXdId9zEA==
X-Received: by 2002:a05:6000:1ac9:b0:38d:da79:c27 with SMTP id ffacd0b85a97d-38dda790d9fmr7107010f8f.2.1739265255326;
        Tue, 11 Feb 2025 01:14:15 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm14477397f8f.15.2025.02.11.01.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:14:14 -0800 (PST)
Message-ID: <bfe6a1cecdbeb6606cc69e851135033fb42ddd8d.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Date: Tue, 11 Feb 2025 10:14:11 +0100
In-Reply-To: <3f548621-6f66-41ee-a23f-ae4a8345061a@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
	 <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
	 <3f548621-6f66-41ee-a23f-ae4a8345061a@kernel.org>
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

On Tue, 2025-02-11 at 09:08 +0100, Krzysztof Kozlowski wrote:
> > > > +/ {
> > > > +	osc: oscillator {
> > > > +		compatible =3D "fixed-clock";
> > >=20
> > > I really doubt that external oscillator is a peripheral. This is eith=
er
> > > part of board or the SoC.
> >=20
> > This is actually a problem of the original cv18xx.dtsi [1]. Do you thin=
k
> > I need to fix it as part of my series? This would touch all the pure
> > RiscV boards (using CV18xx SoCs, not SG200x SoCs), which I could avoid
> > otherwise.
>=20
> You are moving the node out of cv18xx.dtsi, so you can move it to final
> place for example. But I do not insist, because I also do not know the
> final (truly correct) place - don't know the hardware here.

Fortunately, problem disappeared by itself in v2 [1], now I don't touch it =
any longer
and only move CPU and int controller into corresponding SoCs, so the oscill=
ator
falls into "could be coded as a fixed-clock in the SoC DTSI" cathegory of t=
he
coding style.

Link: https://lore.kernel.org/soc/20250210220951.1248533-2-alexander.sverdl=
in@gmail.com/

--=20
Alexander Sverdlin.


Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A02528F4
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197617; cv=none; b=BHeTiR7GegD0fVaTSfgj1AS2OMTmenREkwKxGeTz7s2JowAvNG0Ej9vEpHlCwF4hBCKwuishDazWpDbTU/QJXv4M+rcBoMPbHTSjWz5U6yMY4kzzLg9OavA5iIm7fY1ipKkd/xXReGjDpOekLwwD1zx9B+/BoqsEXpFgZK9RmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197617; c=relaxed/simple;
	bh=oASEPjHAaowh4iL42KmWLyDV/ZIihkVhkEpMzaq1FYw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gPSOppelTAZ85CbHJLN3PbFj+SY6ILwSbFATpDF/IgUfHCKuAxzvJeXffb7ED7oLAMOf3oyefqaz+meYAhQKQVzWauDjbl6Dq2/s2Jw2naXy9lSOlxDFpPUfDgpwomdaQeq/NrcuKJPs7Sd4Dir/sBIzfZ0ZxFya0/JkFDYlg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJPyGDl8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJPyGDl8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43934d6b155so11044035e9.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 06:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197614; x=1739802414; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VgraRHso95F81B4DXSSaBLV0feh+tpXbSVAWbEyzHv4=;
        b=AJPyGDl84vs1FGCa1TWT7sU3Q+KRsUPaT+8UyDD8Yv0fQCiVOwRRIoyKiWJnUhnPi5
         nVND7kFTgJzZfUAI0Pz0JzjqZLSJnVF1KpRDP2GkCLvA6TFSIlOaXUVMUB1jDj60OFOw
         kwNA0cw36aEKSsp9PmJ3pT55k2DdQZdZacCgnkyVRNiCKn5qR4xHTltesR3kdwfN23WL
         7Y5C+W+0LLuZfBAikBNLeBhFgkI37udk0m9n3qi+oAV3QggZq0IAbOQ/nk7z9QYQ2nSb
         800BKOxWqW3Rh/8i/Bq1uTFjKFa4tFfSFMrP4vpSjlaCe1xTLNOTo6idtpL230unitQG
         C+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197614; x=1739802414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgraRHso95F81B4DXSSaBLV0feh+tpXbSVAWbEyzHv4=;
        b=CAfH3Unc3QEx/byB8gP52w7m9INOrTNAs00F4p6Y9YnGpQ6DB0Oi0t5y/M08w5Tuo2
         7oCn6TjO6yMNkYc+R5Foqx4zrjoXxQ01CIw2b99AoSID5IMZ5D/nSgctzLAg8NcVw14u
         LwZz027prz7yaL2hNYYTgeW5+QUxnKcCg6P1eH0BplFa0ZoCyZxX3DTU+ES4qug+4A91
         1CAND3M8whaRWHNVxuIixKaEl7a0YC/lAoUpCIV1KzBysdzD+gyK5KZulLdsBnOgafeq
         mFG7xgE8+C87Tzwc6BAx/Ja4N5CQ42am2kRBdF/SWTgTUsiHWul1XljWASTTdwfz9/c0
         jTyA==
X-Forwarded-Encrypted: i=1; AJvYcCWisJGabpSydsc3ySPfMFFNxaRaht9ThCzIJ0KmVB+kAo6vblzgDhHEGEEL/wW5r/yUZhs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa0xSV2UNgVaG3Znilh2I8gJ4rXAwzDYQn3l+q9u4o1BGIIGKv
	f3WUDSjlQb4IRlEK6tpAi7b+syiLYjcxwo/DIDivRBBWmhN7PaKs
X-Gm-Gg: ASbGncuqYvipWLrivqTUFpUgVm7E4DAgAkYJvuU/ukST3ON0kOA++/KU8Gboe7+pA8y
	oZU6HnDTKeUYwrC1eNTGtBA/SeSxh/2AUuN06sPu8ED6mfJ2nYuymcBWguwKD5APR8y9pornLKG
	gcnf6RdZT5KEqbdOmoiDJRzZuskwSrr/L1KcYci2ottjn0IU9RNlLYXLMqR6MRtLiIj5vLtrtJN
	cubmmaRCDT0AmtATImFN42OaIR14PiIO41ekysAb9Bv9+793PK37terD/LIfmCTmCerXIlisK+5
	FsQtnLYbt72nAdDv4IyUceJcISvDn1J+
X-Google-Smtp-Source: AGHT+IEYNgbdZHkRJU1UDHCBy9QezY1XmzJ1vuM2419I++2sRPB2lMGddbBAfie6JehAjN/mVPK+vg==
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr70934525e9.13.1739197614251;
        Mon, 10 Feb 2025 06:26:54 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393f202721sm49032005e9.21.2025.02.10.06.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:26:53 -0800 (PST)
Message-ID: <4d171a4fdf7ce9bfbe6352b36d6b6791584f86c4.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 10 Feb 2025 15:26:52 +0100
In-Reply-To: <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
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

On Mon, 2025-02-10 at 09:43 +0100, Krzysztof Kozlowski wrote:
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv=
/boot/dts/sophgo/cv18xx-periph.dtsi
> > new file mode 100644
> > index 000000000000..53834b0658b2
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <dt-bindings/clock/sophgo,cv1800.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	osc: oscillator {
> > +		compatible =3D "fixed-clock";
>=20
> I really doubt that external oscillator is a peripheral. This is either
> part of board or the SoC.
>=20
>=20
> > +		clock-output-names =3D "osc_25m";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	soc {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> No, override by phandle/label instead of duplicating SoC.

Is this one critical? Otherwise I struggle in v2 to both keep
SOC_PERIPHERAL_IRQ() in [a new] cv18xx-cpu.dtsi and reference &soc
from cv18xx-cpu.dtsi. It's kind of circular-dependency.

--=20
Alexander Sverdlin.


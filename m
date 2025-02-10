Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0221B1AD3F6
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195157; cv=none; b=Zv+Zt8fsjZPHOhTBahdUXBsmOQqpLSVwTxN3tqy0dFc/kx5bd72Hrp+7vtJdvAyq8kUNQ80amj9xpwE9nfVr5xMXNnaiz3qUsN8T9MTBSoIlsbhls8KutnERVJqg4x+XHsSlqe40uer69mxN6HRZFmXr7QBfdQSGaqkZAwhg4vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195157; c=relaxed/simple;
	bh=QbPTsi4OAjSIrBQnM76xMZPd9/WffLeZlO9a1bLVPwg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DaNEJr4TGAk7WPjKXwA0OGJpMWzlyYyg0jUwiz2cdcHv5fhjAoDFXHK6FK9/0IGft/vLsTsLjLEJwe309KBg3KkikTUxgYYDeDRy71vDHipMegrU9OIIiS/8i5s3VIdWiCE0yG36iSQTmGwrHtiNOaxHlZQlpnzbVz122LAicB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmb94fal; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmb94fal"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2211739f8f.2
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739195154; x=1739799954; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=hmb94falaVre/eJe+Olb1UjATNOXLgUOSX5fkR5NR7fEw/2i2RfyW6fXj/HxcBwq5Y
         FCyzHdhx96qhZp1Hk9+WeAx+W1BKsEVd1rZfqTr+Pq+i1cQq98LhFSjVaTRjF4FOfOXH
         psYpP6ix43tIT4FiIOtPqi72QRlktTOB/q1cK1WjzW1RigQ1lNbr+X8vK3ITlnAafPIP
         oFft1IjOrhnvTLyWM92dWqLSu1xwV1zy2EkkdImH5CLfqaO+YdUX0AXnUNNOzKxacV7c
         aAsbZDbMxDcNKoBbxkoBMn8AQdVcUv6bYlkF2Rk4R7MhRZnpztbrAFWDB6UTf/aAriKz
         f2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195154; x=1739799954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=iR9n1qDFAVzlKNZWdLJFL2VFI7r9x4IktILwfRMKRX5An/Efm9ZllJ/1hrdAHF+/pl
         JyggTOFzDU30aSpcSsaXSJt8tZyu9QDBdrkSjdovoLtzbu5DDzfnL9UPZeK46dUIcZiS
         FeVi0psxxGeReo8jBLf8NP5+SRRRETxzlQI6pzo3bptFVesOPv3B96x3IyNU+FHKir9m
         koYZykFazO90F+aE7n8NPLcdQOCuzVh1RcS7LzeDCf3x2etRtan0I1XnmJ9Vn2NlqgCx
         2sueNUs3EDJZ9E0UtoDUh4OfuYIEBiCNQ+fQG1WMqYirdYOQ0Dj/2xbb0RBWmI910kX4
         Gsrg==
X-Forwarded-Encrypted: i=1; AJvYcCV1C9M9LvZxi55/JJYbAIhCWgLmucCgr/Y1VCdHi9KvJWAoTMqQQK0ogB7CCJIkfZFb8gM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEcPV6yZ8ytUP7Kn7D9ELwaciy8mx/cF73QqbSwkGsy/z+FuyF
	xZ3dS7e4VT8oaVllK1JaWMNzwu9D8qmmJe+GGaJWkxea1yEhuGwe
X-Gm-Gg: ASbGncvoO2mmLwfP9w5ONY1rOaK7GxdYyMXGCmve1Y1NxdMFW2dMqnh52Of79kfuhWb
	T0jDU2yhTBw7T+fKk0Cg8vTG9cIMJ1iZvVrBNMuSlb0X7bgTSgmbD4gAzwwuM+14eTQkEhgmEGn
	qWLeiWvLQwPclnS3LshfbMKJXMAJC+IEdYIK3X/zOEb4JQJv0+4zbBKnPr39/oCV46lRTWeyB8X
	MBhuSZoM450Q6PbEZ0L/ILd0//5K6id+5eo9tfWv3c5ivYkGJP5zfrSwy/6HDDk86rQEFUCZ1cr
	jrD7Bc7AEJk6O2Lw7vQiCdM+TZWuDdoa
X-Google-Smtp-Source: AGHT+IH9uHWSiEXMVmzjpVAxMhboYo6LDwjJ5Xy7khI/V14PrgJYtGxDMf03BQTGcuTX+S72JWXzFg==
X-Received: by 2002:a05:6000:156e:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-38dc9347ff2mr11108966f8f.41.1739195153957;
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd21fe18sm9233159f8f.91.2025.02.10.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Message-ID: <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
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
Date: Mon, 10 Feb 2025 14:45:51 +0100
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

Thanks for quick review Krzysztof!

On Mon, 2025-02-10 at 09:43 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by splittin=
g it
> > into CPU-core specific and peripheral parts.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 313 ++++++++++++=
++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 305 +----------------
                                 ^^^^^^^^^^^
[1]

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

This is actually a problem of the original cv18xx.dtsi [1]. Do you think
I need to fix it as part of my series? This would touch all the pure
RiscV boards (using CV18xx SoCs, not SG200x SoCs), which I could avoid
otherwise.

--=20
Alexander Sverdlin.


Received: from mail-qv2-f1.google.com (mail-qv2-f1.google.com [74.125.230.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FC73C3C09
	for <soc@lists.linux.dev>; Wed,  1 Jul 2026 22:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945680; cv=pass; b=cFe3o6Tlb2/HrlgYVhHiJ9Wvd62DiAz3Swlqf44/9SVfwFJBk8V1xR8ETJ8nRg8hU6a/2y7ZEESHJWK4MBfElJuEj2f93hV6IcW905AmtRf5lw6bOvtMs/8aRB/HpH4JmTasV+7Nnz08Bul1GCfCTQNZNI8pq9vfEN+L+a9y+GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945680; c=relaxed/simple;
	bh=fZ+AorSnmsjgid/jhFjS1KD0WdKo2def6qdAbBx50JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWh1s7iDIm8VYPOZ+n74fB1tK5KR7bWBZrqirMwP4PtnsDxMjPb/+T3D2iKM2zWzcq/AcoOulqPgfNQBpgKh2ayH8zkIeiInwGyziury5xsHSIkQeLVa9Hc5jvHzQ9TqO3ouhrrw9NwKB8hybpmwQnQh26D/6gyPp1fSODrD7nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m04ST9S7; arc=pass smtp.client-ip=74.125.230.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m04ST9S7"
Received: by mail-qv2-f1.google.com with SMTP id 6a1803df08f44-8f3f86931afso1980296d6.1
        for <soc@lists.linux.dev>; Wed, 01 Jul 2026 15:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782945678; cv=none;
        d=google.com; s=arc-20260327;
        b=mMJty4wsh++mrsXy1PBUhU6fseVzKwrI/YbjfgBAoAw2paYdtlTsyFeFXI/Omu7Pd9
         7QQZENDyq8o1SKIZCqpxUPPkf7tmOSBU/QbzeTPdww1P1dp9utcUPVYqgVmAdC0m7M7g
         Cocv5MMl8bDVsByGDaxr1BX4VgvqAknWB6jaeonEMDM7gmy7SA1Xf2Bo+SJCL8r+4CP0
         PcRF13iQTvsK5wfsRTdf/Np7sb5zLLxw+2SUMYZLzvI8kJs59N7SHcXFmBiz+CH8MUUN
         7KGMhqd5d0S9qa2kOowHd9a/xajTPbovf2jkxqeQV8F0rIHZh6noXxatEvoyJ2TWBneK
         1VIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        fh=fAsP9dGClLEV8Dg+BGO8dLmGI4qh/iaKpBlSERezGR0=;
        b=izlh4AQA7l7DnYVFhy3uhIAthZGqwrtasT6WqgP/qjKaBZULbtPUmQqAzCRiYoXeDb
         7hRcdq29a49z/zUkuGF5M6kn2Gg6Av9Wn+WlhtkF1py2TviqIyMifnN40F3gLvv6vQxd
         9NIpkjTCnOPEv8x1bP/nHjAbugporEfslHl4TRfYedhFYAWh70zqqGrGw9OyV+1Sbg3e
         S/Wq1c5IUo6heN6jXUrxsP9NbOVfDd97mtThMqBdXfeAzIO0pVcg8rALqcfo0yDaOQUl
         611mfqZxKlIloCsXLfiXPv84XRGIIsL2cz/cpXiSkUtszpkGgegBRxHdDxX6AFRdqGgF
         5png==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782945678; x=1783550478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        b=m04ST9S7nlcegB4LBTPgEOOlVUFNIKe5N0dQ4vrTbX1iXGvdIBT5WYA8b3sqoAPl27
         /MSRxb0yyquuGdiFrir/3SyKd/LccefXRdg76oyQWqD3feE0OLNG27JDEPhWUNXwiUaz
         eEhWdmB3G5fp8C0ecM8Bl59zSKRD1x/lHGY65iTksYnbIi/Gqxeg/J2MAhb4TiW46OIE
         MZIo8UkvvSvSX91M4qaSbTgCvTFpS74ucKl8yPwB6QBNz3DXJGtKaSalT9C9e9w3ToY1
         jsV4il7b5mJj1RKT18Zr53o/O/7O4BSM1zeJwMcx50pDpqAkNH2OwGL2s21mkG0E3qWi
         y/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945678; x=1783550478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zEs8V4lWPcL649keJ+/5ibHEH9EE+ydATPB+tEzuWA=;
        b=R5o7XheXHMIuqDd1hn4AEYpkp9yTKeNvs3+u7ntJR0kFQpdavXye1vBsTjCSlGIf2k
         qZs8hEnpA93Ovl3UEflhjGGN4vXuK6d5OxYHLQp3Zdf8LK0HTt9axn83+6o4PWvJzekD
         NIJ/HhQXXsnhpDzuscS1+PvbfENkR2jo1rZ9oEgO13BTnYANrDItPZ9TQzNYYM9TM41v
         Mu6DwhCa8RtKhekV1na3R7bSNMriTQ8TaddihQzJ8XtluvgGB3XJUyDcGU4fdxToNwqQ
         OLnlzaPXRxIPrjkljIixQmShrH81f0xuqBx5fpDXqzvI61kOUDfY0sSa58OxTggHmhcj
         xsRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrma8vMeThEbkUpE1HFFN/BR2IXAx5Q38npR7dyRGHwHwBVOGT33JQiCu2APP8gBWytSt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwnN071KtoXi6OqCuB0WwDwII5OSmtdHF4w0lCh5W1vk2nnnYF
	ipdQfHFNdcugUdD+lpL+MSIwCuxN9q7d1YPi9y7IfAiglGXW1p65iOq2ROrPKG0ad4+RpqXgpwN
	dFAmpMj83wF0rhRH9UYQspMeDQAMCak0=
X-Gm-Gg: AfdE7ckMVQu+zvsn9IFauN1Z0XxUadUp0DW3a7WgATkS8c992DDnqM0Rg8bMYgemt9N
	AL7BBMqhqFV+KZAS6qE23vPpuG8UfIvqzErkIa4dyJVVAM/L8DtqKoR4uLhBW3yK3j73Yqm1/uV
	WevkdmKjHqfNs+FU6Z2UFDaTY//P3wIuy5dGUVWKTFhUxjbZvvR6B8ClsBPLOpk1HFk6rU5TvGg
	GQz5bfaH04ggiISeHvetqZXxh5FaYxSXz92VolMbmDEHmqOm8aXxkKPKcohS4Kkrs+O+irHL4HC
	Sblm0ZZTz4B9qT+msRxAlazOjJ2AeuDxVeilYGFe8odFKmO+fYpv/BNWng==
X-Received: by 2002:a05:6214:21cc:b0:8f2:940e:2417 with SMTP id
 6a1803df08f44-8f3c9dabf76mr54875016d6.55.1782945677686; Wed, 01 Jul 2026
 15:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-19-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-19-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:41:06 -0700
X-Gm-Features: AVVi8CfF9d6l7tqaBnW0ymwju7u7UMwSlLnAFDbskHiVs27X0kHxLxxNHiLf_kc
Message-ID: <CADkSEUhWe9aLuM7AURDKjMkrpEKOog9X59fWuZXvUVjkT9BuBw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnd,

On Wed, Jul 1, 2026 at 2:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>

All of these patches have this line at the beginning but were sent
from your kernel.org email - did something go wrong with git
send-email?

> The Axxia platform was initially upstream by Anders Berg for LSI and
> later Avago, but this included only support for I2C and reset drivers,
> while most of the interesting bits (network, pci, rapidio, usb, ...) or
> the arm64 platform support were never merged.

Given the incomplete state of this platform, removing it makes
complete sense to me.

>  config ARCH_AXXIA
> -       bool "LSI Axxia platforms"
> +       bool "LSI Axxia platforms (DEPRECATED)"
>         depends on ARCH_MULTI_V7 && ARM_LPAE

The dependency on LPAE reminded me of two other 32-bit ARM platforms
with lots of memory: Calxeda Midway and Highbank. Is anyone still
using those? Maybe they could be removed, since people seem to want to
remove highmem:
https://lwn.net/Articles/813201/
https://static.linaro.org/connect/lvc20/presentations/LVC20-106-0.pdf

>         select ARM_AMBA
>         select ARM_GIC
> @@ -13,3 +13,5 @@ config ARCH_AXXIA
>
>           The LSI Axxia platforms require a Flattened Device Tree to be p=
assed
>           to the kernel.
> +
> +         This platform is scheduled for removal in early 2027
microscopic nit: missing period

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>



Ethan

Received: from mail-qv2-f0.google.com (mail-qv2-f0.google.com [74.125.230.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41E397B05
	for <soc@lists.linux.dev>; Wed,  1 Jul 2026 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782943077; cv=pass; b=gINpl/jVk8zN/GorjCY0vRr6dVMVrpCp826K6w+INhHFnNo72HWALsv4SAbh6XcvA5RHXtHZaRfoFJDwqGLY7Jin54KG1ZUJvffm5q9M3/MWTAACszm8WUWOuOH/K7KzPu+piRb4QaguvkyQnwclZhtTkdT/UsIOcNhfRx/wwzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782943077; c=relaxed/simple;
	bh=5ltjoBRbEzqbksUDJKHjqUvAZIE3NprxeW9Klfb/wa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDvV57H/ZLg0+4CmqAGMprYN6PW3NVHgzEjdFkv7jhEofLHdkMWSxRJI3xueLSZKhcrI4RnibSpc6JK5VYShzZvI46wfPBByzLV/EuKp58eQSl2l7F6aLfnV98n6E+Xg2uJOIx0zp4NiR82rkMCrYFZrfvW3IKozf7ya0thkMZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esDfHMwk; arc=pass smtp.client-ip=74.125.230.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esDfHMwk"
Received: by mail-qv2-f0.google.com with SMTP id 6a1803df08f44-8e9c06149e2so2256176d6.1
        for <soc@lists.linux.dev>; Wed, 01 Jul 2026 14:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782943074; cv=none;
        d=google.com; s=arc-20260327;
        b=pxr58umKjIE3jEMMBRcqjjkPtl3yKBLhl9fY6xFOwCEBqh1oIR8/4pEgEsQXS0WceL
         j40/9/ZMHrPps00AVn0xpGfeN1+KfnUhoNzwl+3OrIh9VA/Wmmd/tQDk0o9KjG0vyg/+
         Uk/moJUsA7yLJgxB1jX15d7QT2ws5LaAJk7y/FrOin4QR3Gzbt/Exna2ioWBLLKdDkWv
         M3j2Ty5cJaqyUwgKDEfwCTf7iky2oXFEcZB7bWYl7jsUq/+Yp3J9rnbHiIRqDNhxJVff
         xFFAN0lSqvG0NnxFX180eIT1KsNG2sta0jGJEmbn3uCLwxx8Ytz7fhdebFhdwHGCd4Ex
         DIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        fh=eu3Y8ZYBJIWohr+eWoqsyM5mppqDHWTMk9HcSBadHNw=;
        b=Ihuy9HJxVHeaTYA+bwpXbpWWyB5MVRrO4ZkSqw9LbX67WCnKgCNbrUGW16FErqUoW/
         PqArTEX6uDbgJ5NW/8OpFmTVNQ5SdMQgs4SUodAVWjDZdntUGtFXDoK2e7DCbdbq9ESn
         Yuj5Ra+eQNWSB19X9dTmgh4l30/AvEECDXTj5SHeo+NHcP2hVCFXxXss/pyLMyU04+Yt
         0HeMBvE+cwC625UedGdheHzs+5xU9rlqic/px9fAXMt0A9uqFtIFfSWObrVLFMOE4kcc
         mQ3FfeJCcpV2xurG6TTVRQSROk6RN6y6HwBUmhfC2N8OLvGSKwENV25JAcPy8nfofAvs
         ICEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782943074; x=1783547874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        b=esDfHMwkc+M5LT6Jj0eCvU8YZHTqC/k9dBHFP1n/OwJa2QyPHalWAzQfT7+znbCmoB
         8PAg8QYLimrJIyLQe8a12ItvKsQMaWzer1xe+oUGsbNSmCzT1fUDCLfNg635AWVKYiwI
         15lIgR6rkDNKXbYART7vh084qCkDguu3PZ4tP+W2Jz5On4Rkvy0Xov0+GoOPhilkPqp8
         NcYeP/ZpAg1CWK8i5Mrby3xdNDIZa8Ag+fVkcxYr9b2rnZpbEMjXqQmQ2QVNNGcLIHXh
         J+7TN1/psOI8DLqW1VVN/xuzAmVGznpscq/U9Nm1OTJ5voLHDzH+LgEb+jznbwuVaCNC
         Y5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782943074; x=1783547874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r08jOnBEbv4+p8s8I+uh058Lu0DJ1DPtCrylSRF2t7o=;
        b=Y/7xLNaa4scpk/Jv57Cj5yU1OSlbcTxglZah1ngifFpj2ROlJ+zBalAJapXmGDI3WV
         ARkZ9K4ntiS+RgZrFViYPEdVpXCEgKUdtC5B4z2xCnrQ8WqwctExzCxtbedlTqvWo7MQ
         M6sGGiefyndjhlCxcKl8lESqLjfUlIdMGSxCSLI+m9aYH+lCcQjcoy2xNzl4neHaq2hg
         vMM96jh/QQYvKaUT6IzfLoivV8hS3rmE3n9xOnbd7SPRKIntZeXEpyQC9xXSfukTqHq6
         6m7PavA3d0o2jT9+Cj8Or5drKe3sw3CoAn655F/Lhqr+iTZr0+xubC0bySGfpucyl+r/
         FuFA==
X-Forwarded-Encrypted: i=1; AHgh+RrG1cKFbHb1AYJYh8YLn7o5wju+y2l2E7KaCE/t7chbOhzYiGJgMJpk3WpD3cTvRgpz5eY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLEdeLEjShshqiJwbUY4h+QkAg7JyCJVlUKrQG2H6ChQBuhWX5
	/knhuucM2XtLS7CqrsVv+Hdg3WmlNb2UDZOtlmQw86zpaVfPYCr5MSTosRYgQBY6lcCGaRMy4ul
	5JWoN440F/vQd3TMILYdKZApwYkWxSuc=
X-Gm-Gg: AfdE7cmqJ6pX3Kn84nvR5YUU80C7VdYHFt9mhR3p/UDDxMWFS4FZRdXhvhnAdj4Pfdp
	mpbO75Q+5K7vKVt3Pt+bi6wZtr3y511vKjEAe0OZnH/i+wpTZ293sthJiUaadVrLz97rmmjzX9K
	APiS6RUQ8gBwhY8BHYSqGTyyIaMF5mP9S2rk5f2LD70yVcGV0O9XezfUDDMGkPBSC2qpV8RdwDr
	bK/U7mpFtEtTzxCne2mqxUviPDhCugTBrTMSZFstVh8e1haJgIGU0sAn1IyKr0it/FtcnqVMs1g
	aBrlK4Mbg8KupVb/qzFQjub53Ruj3NGVzfM170hGAYayvvKjNhUXDByQog==
X-Received: by 2002:a05:6214:3203:b0:8f0:47b2:5736 with SMTP id
 6a1803df08f44-8f3c6ac1b79mr52988016d6.13.1782943074645; Wed, 01 Jul 2026
 14:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-7-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-7-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 14:57:43 -0700
X-Gm-Features: AVVi8Cc5P_ml4W8xRWvnn7RkMv5ON-KwMIB9CujF2NjvtyywyLTQEgj_XJmMKsw
Message-ID: <CADkSEUgm4yX36W6dG-5WOm42Z3iDpHVcz73suWDN3=bsGgq+0g@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
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

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> Following the deprecation of big-endian ARMv8 mode in arch/arm64 in commi=
t
> 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN"),
> this does the same for ARMv7 (and v6), leaving the code around but
> disabled by default: There are no known products that make use of this
> mode any more, and it only hangs around for testing that it still works.

Nice! Getting rid of ARM big-endian support is long overdue in my
opinion. The patch looks good to me, although see below for a couple
minor questions.

> At the moment, there are no known bugs with big-endian ARMv7 mode, but
> it does break occasionally and require someone to fix it.  By marking
> the code as 'depends on BROKEN' now, it will no longer be covered by CI
> testing. If any users remain, they can keep patching out the dependency
> but are more likely to run into regressions.
>
> The big-endian ARMv5 support (CONFIG_CPU_ENDIAN_BE32) in contrast is
> still used on Intel IXP4xx platform, and is the only currently supported
> mode there, so this one can still be enabled.

If IXP4xx is the only known remaining user, would it make sense for
CPU_BIG_ENDIAN to instead depend on ARCH_IXP4XX || BROKEN? Is BE32
mode known to work correctly on any other platforms?

Ethan

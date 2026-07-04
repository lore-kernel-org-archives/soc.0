Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07820DD51
	for <soc@lists.linux.dev>; Sat,  4 Jul 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783163166; cv=none; b=iJA0cUbs9BIGPsh0aGPb/qm/vHjIN2laurl/QT5n6yDhj67N9zm3WA+AkaZQQ+0XO3iJ8A1NlZIDhLY2CYZMGlxvvqjjZP/N4AZ46QAhhoDr57qRZsZDLJkBiPcxxoYyL3V0rzim7ATxmLKUrJ3SlM50yrpH5geTA8W7QyYWHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783163166; c=relaxed/simple;
	bh=RxrEKvsAJ2ArPgkXuzwgfSk+cVxegA43jqpiC+66820=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sbg7sjWwh/e8Q7dbu0EkVKwag8TUtiChsGvAyRcOD+NOUZexAydOuo/RmjoSS0igTMzgHZuBR25bPI6dH+Ln9HC4fb1rX/5K50N/TQ2lszVaIkdcYRR667bjzetimwTNFPVxEtfNcjmKAtaB5ycWrkHO7diOCB+6/wQ0QygFE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaGS2u6R; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaGS2u6R"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so11922005e9.1
        for <soc@lists.linux.dev>; Sat, 04 Jul 2026 04:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783163163; x=1783767963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai/qrUJ/3ExIMBUOgdZi+V1kaGZn6ftPFCLh/kFwUjo=;
        b=aaGS2u6RNiAyz+5X1JMybHYFWQzKIpdF7ENhCbsBG8+pOFmrks6U3LxWsvQXvt9eV1
         gvWY3lX/q+/FnNOQihgsD3HSeFnQuJ99165wsbWGmVpqT9+cRalhuoSZBSoHCV6TkeIy
         5yrEkPSh8THTmnpNHKAIYz1h7DQZ6izfQouk52/Uqf2lGwA24MuTGb4XP3Ytk3usnLOv
         bosq0C3Bp48eR/M8TayMCmE59JEK1YoJyrUXqDJyKOA6wd64aLNyFhZLIKFB1Us0W2yw
         4A6qcRktYY26gjgmJfpYJ8A/UfCmfl8lHPQTZbmsYyazRpYavgkMz5aN4OUtxNcmGTP4
         3Oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783163163; x=1783767963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ai/qrUJ/3ExIMBUOgdZi+V1kaGZn6ftPFCLh/kFwUjo=;
        b=O2WSpf2iRBH0aNWGVoR4VtNZ+4KJJMBEagexMFPuqZKUvEsln28Rq1cYKZ3k3jcj4O
         meofwPn/EcyxG2AZQW5ek2r8lObF7sbN+N2a0cv6yWrHKXDxics9l+Jp9SpZKX7FDmvI
         hgF7jx+1dsI215lfkXydPM58aS4JIO8KRhZ4wheGu/4//6HIrMo6KRfIBc4qvO9wena7
         L/5XRt7/wTpm3VA7YVG5C51/fWAxh04X0ujxn5ew0L+S8zymLzQXq7lMTdVVNyRwXYPP
         Kae5IsTdZBaxkjdCo/mJhOf/JxuvAhmXN/iFl/mO7yh1i7pnP0KLSGFdkqpyaaebNDTT
         n/Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/klFnPKVva95RJ5q95LVMJFzI/U/pl7rHMaa0lpWd6M5NtcBFZD4TRdxsi2SaQBsH0Enc=@lists.linux.dev
X-Gm-Message-State: AOJu0YygNjSa3fxb7nJAnba5P6DUGEY4Bdm1YNEO6TAzBeJ3OyoMuwxa
	m+Bpw5MXoLf6+q0bUEwJgqRez+IlgULInYehz5M26XCOhO3MKraAndaH
X-Gm-Gg: AfdE7cnjP+cdw9ODsp3Yuf9DJLgjA1nqZZkD+go0FKfQkZVtThD0XwshulFSH+N28mA
	cWZ+ainWow77SsjyP9VQuVVvTmy1e1lj6ADJiqgJdTy0v+26aeJuYjfmxnRB+3uOa9PTk8srnCb
	jlZ0v24lBZD6IWuhZhItvjJqumEWxQGzv3KncwGCLu7UuNeHpLaDWKWbLplDKcD3cEL/gDLNEU6
	LNWj6JV+usXFH0PWaW6HPybrPh/bQlooJyEQdjwerU+oijXkSvTLcvVilkqvpkUIhEGx/QCtm9r
	9Zs2HFZGww5dpzRaOlFpB8jRtLpDZEAFkLcFhbhmTwxFk1j2b+hZqHP2/T+aKv2+gVkZZI0oBGy
	g9x62cCjOT5Mm6BJNo9saUBBFO8oTbWQIsDG/ooQfb6e3mOdDjpqm6vrk2aMGQsaREK4WJfJyXg
	gnKqmOrDmbqwjyP/nCBMcTGMnQmFPd5Hhb04xm1swXI264SjsrEqp83BAIO88WPpqwslNxdH9O7
	1wtaYi6ocKtd76dOwA=
X-Received: by 2002:a05:600c:a213:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493d11fb898mr20361315e9.36.1783163162957;
        Sat, 04 Jul 2026 04:06:02 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm7121987f8f.32.2026.07.04.04.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 04:06:01 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dcaf2e98-ba91-468a-a9a1-fd0e3247bedd@gmail.com>
Date: Sat, 4 Jul 2026 12:05:58 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-7-arnd@kernel.org>
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
 <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/4/26 11:33, Arnd Bergmann wrote:
>  config CPU_ENDIAN_BE8
> -	bool
> -	depends on CPU_BIG_ENDIAN
> -	default CPU_V6 || CPU_V6K || CPU_V7 || CPU_V7M
> +	bool "Build big-endian kernel (DEPRECATED)"
> +	depends on BROKEN
> +	depends on ARCH_MULTI_V6 || ARCH_MULTI_V7
> +	select CPU_BIG_ENDIAN
>  	help
>  	  Support for the BE-8 (big-endian) mode on ARMv6 and ARMv7 processors.
>  
> +	  This is deprecated and will likely be removed in the future.

Maybe it makes sense to add a 'transitional' to this option?

- Julian Braha

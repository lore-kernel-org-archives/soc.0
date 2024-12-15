Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE614831F
	for <soc@lists.linux.dev>; Sun, 15 Dec 2024 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734262755; cv=none; b=ZKNAJGT7lUUjBAoXVFBvIUyRY2cmxeWDQOpj02MhPtXKFCkP+o8V6XhjI6EZVPXHSnFt4gYprOt64kLi4b63dzNq3vYM2AFwOxdFJDDenVtnWCYAz86iGTGiYCTYAxC8mcovoi1DNnWjJ0cTMVkrDv5P4FS/y3jA+Yy20Gcekns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734262755; c=relaxed/simple;
	bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a4CnrKQAKkCVTR44lBUX27zi+f49vylYyT08/CSUZEIYGCY3p1iDvi+rCG9CRk3PBSAleJd4hMsn4sFIZtFT4XiuFiT7gRNrdnAvIY3Dd/FfiMkzFJzdVOxxozlZAFAowS1DbvZqhnho131eT80NZUoZaSf8AyZa6O3d+2FSNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hE1p1N3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE1p1N3t"
Received: by smtp.kernel.org (Postfix)
	id 355BBC4CEE0; Sun, 15 Dec 2024 11:39:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31841C4CECE;
	Sun, 15 Dec 2024 11:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31841C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363ae65100so6543665e9.0;
        Sun, 15 Dec 2024 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734262752; x=1734867552; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=hE1p1N3t3pJQIJAYrNmrD86duZfpDT925DElfR6ADn2Q+cPLm7O6RwolpGss5q3Bsf
         L7GnPB3yDUxZsYs1qTGwQ0CRzoyB3Xg3Pr2k1ToVKVVddNQpq+hlYdEThUxk89AfHcxF
         w3yJTz5f+DZhTHGb4MtN3bwv0DmszEvw4DYic5IKDIOGbf9gzvc7hZlgo6ZVb2RM1KeV
         z1ZMTT77CMQo4MaSm35yhTk9Z8X+CvQnkIJgFD4Y1Zn25sknoOBpb/yBvcmyjZ1OoElf
         qN1VrIeMm+eq2y8h4hMDAgaUJxSIFX2tr8vEO5XjylG78d2+4XnIhkwrkCb9Vkf2+7c0
         NWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734262752; x=1734867552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xALTCpd8jzW0oO9ZcLpdgxp5GqeJYahzrwm/Vk98pNY=;
        b=rQKlHHMs2a4+e6D+mU7OoYbApAm9WCCp2MWfO1mL9UT+h8H0UoPn/lVZlMObpL80UL
         ufv36CNdhcDJq+6VFVhnB92lL7Q00jFpFOYGvraHvTLy4lxl7dWPOxaUk7/TzpRcYlOd
         IDrpom7wQeIUFnMiolStCK6ZhBBZj7Y2xNvtmaGz/H2F/FhdQINTwG3GdnK9l2GMCOSf
         GzKObH27oUMkvtdnEQDXrqoHqTzbu0Xa3tqMwN4SAAKQu9w8M2M1Q4zAFcFsynZHHkUT
         rj5K7O+FP8PC4+4atxEfLgZ5KfT78v85d2jEHaOhTqaDQBhMs2XyQWLSz0WlaIbt/zTt
         pvtg==
X-Forwarded-Encrypted: i=1; AJvYcCUaNSW6Gvr2e71hYyFb8PKeHSpbyrrF+NyNi6SJkHJ668JGx3V+uDChG5HSTE4zZ6IUf5w9rw==@kernel.org, AJvYcCUlKW+C86roM4xmGUm1tEy0wvVTEv5p8zIdsCocLNJq+LFuzKhtvWSszyHOl9vBbkJh4Sjo@kernel.org, AJvYcCVB0ShOVLvoiu1iYxrFzzMREDTvO2RKnlyLbWxodzVDCBuCKKaW4Aj62iEx/Y8EuALghQM3@kernel.org, AJvYcCVKPW5fo3d1cwu5aRwwdqt5nbekTErKACNs81aYQ7x4/uXf4+DXDeqIunpYWaSU2OTqxd514Bs=@kernel.org, AJvYcCVxPOSJkNE4TvcY1g+jjminH/XV4n5R3lQ5buCCGUqfampBBQ+9y0L4KmakSwg+evfueZ5j@kernel.org, AJvYcCWB2d1nKpbu6hJax068bYczFTWspQUAN4aPJ4BT/58goWPZrDslAvTX3APpwWaie9ALpTH8@kernel.org, AJvYcCXjndemcTHPsSN5qN5UHTUD8RrRn7GBufpnyKtyGZ4DUCr1Lh3TELKcbI+xR5L2JcZFlgoivw==@kernel.org
X-Gm-Message-State: AOJu0YwtERntHhrTSb0U/xcUNJGfz+fmmmWYxTI3JlDjvwe0Hb8IlXO9
	b3lqZQpmbPSFvDk/Kxl8OdHbYbOclzUKKZvf78YqfiZNESEwwTH9srL7vUMbuRs=
X-Gm-Gg: ASbGncuvLw92PJ7u8+gzkRLp9RJ3pGvq0ePwkBRpL75u05XRSy+3MB+Lz6snjSsVcOr
	9MrFYmMRgDZXtL92lJrRRq3SjmyE9flNqdNMfe56hQCD6vD9wdfd7UlXV4YCk3UXUtNK66GZoWh
	tm70wfIMtqDk9q5idjDaB5SWgSa7liEYK9DaXcPYi6NHd1EjNenixbRGwAOZTKwGMWltmQOlFYi
	P6dyjoOUFxq3Epnmv3W6RTB8x2tQ3HW/oakQV4BeWN7dvA+5SAGOdiEVvfxxDwoDEcRRnOiTinQ
	OZKeY8fQ6QVH4PLTl2mz3rSQTi8=
X-Google-Smtp-Source: AGHT+IHCjjb2sJAgzXNsxbFtbUESnU4r2HWdLhNkKVc3bDDAlQfI1jI2mfRiPp/kKqOHOaY9q3fGmA==
X-Received: by 2002:a5d:47ac:0:b0:385:ef2f:9278 with SMTP id ffacd0b85a97d-38880ac5f92mr7767140f8f.2.1734262752015;
        Sun, 15 Dec 2024 03:39:12 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c726:52ac:a540:51aa? ([2a02:168:6806:0:c726:52ac:a540:51aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012081sm5027268f8f.19.2024.12.15.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 03:39:11 -0800 (PST)
Message-ID: <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Marek =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones
 <lee@kernel.org>, 	regressions@lists.linux.dev, Pavel Machek
 <pavel@ucw.cz>, 	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, 	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de
 Goede	 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, 	devicetree@vger.kernel.org
Date: Sun, 15 Dec 2024 12:39:10 +0100
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
References: <20241104141924.18816-1-kabel@kernel.org>
	 <20241104141924.18816-13-kabel@kernel.org>
	 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
	 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
	 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
	 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-12-05 at 13:42 +0100, Marek Beh=C3=BAn wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >=20
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >=20
> > Apply this series and it will work.
> >=20
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>=20
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>=20
> =C2=A0 CONFIG_CZNIC_PLATFORMS=3Dy
> =C2=A0 CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>=20
> Marek

Testing reveals:
I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS wor=
k again with v6.13-rc2.

So far, so good.

But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU, not=
 on CONFIG_TURRIS_OMNIA_MCU_GPIO.
Is this correct?

Best regards, Klaus


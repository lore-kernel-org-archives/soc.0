Received: from mail-qv2-f0.google.com (mail-qv2-f0.google.com [74.125.230.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F52431E7F
	for <soc@lists.linux.dev>; Thu,  2 Jul 2026 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953710; cv=pass; b=gcqMsPx8Zly1m4q+7og086aTjhdsVhIGEcgJqpCOFYGkTndGJMiuSmb//oVXGwaa7k7bDLaC07hHYbTy4fFpxQEtVafimAqi5WvbxDO6sjERxNlHfrz4HsLJNMopc8oafPsRLSNUYCnpWTb+JsUF9pNWUqV4b23ZHtsjBmB8+Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953710; c=relaxed/simple;
	bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUmmo6mV0R6xFgTDlQTz/rDc7aSM//ZjUpSXnbD4ok0uvWF8t7DBeK4oVSivXUtcGlvwOUzvO39AOvJzVo80iXU2uvmJlCyv+xI/p7MhhU8fwWonVxrowtTiCnz50j4wYswereIb7/pM+lD1dax69E5POx08dOMzAnCnvzxqyqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJOAtCWE; arc=pass smtp.client-ip=74.125.230.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJOAtCWE"
Received: by mail-qv2-f0.google.com with SMTP id 6a1803df08f44-8ef30ad36daso2716136d6.1
        for <soc@lists.linux.dev>; Wed, 01 Jul 2026 17:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782953708; cv=none;
        d=google.com; s=arc-20260327;
        b=eYEM3hLHjpDW58LOjBwFX3tICRNqRfUAbhtp4Y4NbaEQ/iO/zZ3Sh20PYrAsfPhGx2
         j81Jlc5IXpKNKSzfMK7h7lPKWyFPF8J8mMn5+U5BTmYBjNZoXw5SAxJC1Delrc4ZiBEC
         x+nYHR4p/9WDk6VCbRc/PEiqIf0MEXDjPaUe+WMC308bqE1hahjA7fDhEQQ8k4N2C5S5
         VwgZiss8x1vuolOJxW9lOr00UIts6FC3aXVK40K6pLfUhE6g8ObMcifCYvOj9uQwtje9
         DrIUaMqmp414Z2WYXzdpb78CGotLA+T/P6sVH55rqqHXRdY4BXcP2Sm3CnH6wvOcXorP
         3ZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        fh=E5dLtkYfzn1Bf1FVlcEcKrdNaaWZbklew7n7cT17sLM=;
        b=gug+4Fme5Ru7GZpKMihMA1bNaMvLHjRrJD5qaU+jcFs434VPEyOTeftABI45F89OJ8
         sC4lcT6zAne4HxgV5nmYzPlKAumGX3fUz1eDzhdMXqTqLP+YQAbwwQuKLiHhxlUyZWMN
         /MHoP+p9bLd+s8qqC+Al4oUdi0fvqFmQ9OCfnT9wUL1oroxveCiJxJcd2MOAFDwwL/Lu
         gwF4wnrVN2z9Dbbfjf8w2iRkx24tD42jInfKwu/Q7j/gfriUgwdZ52wJ7FBw9DLpAYEq
         O4msmdri2o28Auy7bGPMTsFv2PRD4qSrRp2jVoDa+idrEq8qa495HnlM5QCtjcU8OX7S
         1psw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782953708; x=1783558508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        b=BJOAtCWEsNzYYSQIcqwRY2YAkeDrNroZ46vqVJdhVNUhPIUpoTg6Tm7TlxkTiyXxZ/
         XaRLJSPJ1jVEJd/X5JxWR0V7s614Sp4agUL5Iv3Hm7Zi3iWiZ52sPD8JSmlT47rl4jJC
         56IEEMecb1eMmSb9zvRJvfzmKbNfsuoYvgXS6PaBTuabw9qyHfwtP/vhFAz4/JWEOxEq
         HaqdXKMxhdIK6dw8FSiUjXYx5gcRBNGssymwr+9QoGqqS0FnoIDRCmMBVlUhLYboOLw4
         XAh5BJ37mlRP2b0m8E71LAR2GhRFDk+vN/0tvb1AKAV4eiA2hqQFCU5MtZne8g7mDQhn
         nn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953708; x=1783558508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        b=Jm/VNp5eZrPBOi3yD0Iy1g9T/TNazkH/9GlcPizjT+xRf8enPfYaQRSLnSpe7ubQvr
         9wncknxvrxLfXUu7mHxZW+/g8OChOhL7ky0alT1JVYebVvLkUhyMgdb0mfjfvk7+YYvb
         ArKricjNCYaRr7EBwFBw2ZeYqC8UMZd6T+jXEMDp3u2bB88xuL6OKHijDwN+xSJiQJ6A
         Dfnl5nSo0upYTI8ZsAeAxUoAm9w0lXLLQyvJsLtQywGR4bQLA7nmfhlr7SsHqQfzunE5
         lb+2HIbfmYSXzvcp9Ezii2oqIIU2O9CoiR56iTEZfs8G1LluU0JO35TUOuvQ1cWlJmKk
         JaBw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Atx1Wt+58NGoV6xRUTRUlUJ9caZ5Kn1MNZYL0jcxUua2XRwx+bFomr4+6KUjrer47DQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLXN1zCAQ4x/jRA+2Ty78ulZiDlEh8SjEjI7QJTY8/jDS/amfy
	o1FAuIQMAHejzM0WJRUrMmaCz/fWrtx9VkRN7douirsbIauo9kCrfrUseaXq5WpXZQLwi+dbr/n
	GdeIDu9kXtkVCHvPBzO1u80rsjjTZOC4=
X-Gm-Gg: AfdE7ckRFZ/m7ikNx9osHQi+s82yTwDOL3wMTzgLYxpkBQ8hHoVfj14RjGcopkuPmb/
	N7myMC65cX3Yd4cW59G92hX+jheRdqJMs1sXqsHYS471n3drTpyyuaUeQMvc101CMHhWU1h+Btz
	sB7IvfeyGBR4Cim22PI7HC7Wc98RHOrTLit2lHUpdZEFyNUBgFKAy3/9CzPZd/1OAhTaInNBkQm
	5ADChsE9VVP9x4svP9H5gyfdDSve9XGbM+sWPH1E3kPNPMLCJygKhoana+GTWwxXHrDJ+n3w3Uk
	YA0/PDTF9qXCR6bAepjku3gREAqNyD1p1qUuo74Lk/WGsHYrULXF+jRKrw==
X-Received: by 2002:a05:6214:45:b0:8ef:1dc9:27e8 with SMTP id
 6a1803df08f44-8f3c99bfbb0mr36043326d6.49.1782953708551; Wed, 01 Jul 2026
 17:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-8-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-8-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 17:54:57 -0700
X-Gm-Features: AVVi8CcSOzhFzPsWUOEG7lSD3yFIyfxu2K16jG_kbQtZEf0p-TG6IrXn3i7gVuw
Message-ID: <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
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
> This configuration option is for the older boot method that preceeded
> ATAGS. This was scheduled for removal back in 2001, but the removal
> never happened, presumably because nobody cared enough to actually do it,
> not because there are any users left.

Only netwinder_defconfig selects this option. Do the most recent
NetWinder firmware versions actually need it? (LinusW, do you know
this?) If not, can't we just drop it entirely?

Ethan

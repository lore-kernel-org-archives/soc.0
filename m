Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425420;
	b=srCzOzZ3XhnpxyXpNXoBoLkZn5TY4TZZSkC/yhTzITpwkiBLYMLSXimb4ZgD9B91SXHb
	 NQ0NekOlx609vCe2HYq1XHnh3hcq0n8LXVQyhxLkN6EZUY1ZijTIMSxwikOsW3c+ypR0l
	 hg8C20talQWceZsu+g9p/UUB2o+rCuWZ6547cwBLqK8zJFy4sfoZ9Y20NrRUK0IYYAEaA
	 9ARsDU5mP7whFRM9zMWtl/tptN44tMIAyNnvW/wyXAnb5Ofh78Z+3mDeUnfRxWl28Juok
	 cHRTciYO1D/VWF91ZRdJt94v71jA6LZ/q9RvGF2jiaW831oqePautki37+FUTcR1Iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
	b=4SivCO/8P5DJN28fUXLlZ8HIbkgj7HRrLVpV3lz5x+/R5s8L7wTAwui7D9a/+JHxx9gn
	 CuTTw4Pc5G9zz6P2ezUokxp4/+YO/qBuHLRcJi3AGdLHmplb/ukMY6/MQcdj8NQW2Y7/l
	 4rHsIUUKwq20b9FgwqCeUeVvl5FvT5iBhfLsfsmc6QC+ScqLDzCpN8UrsdiS/bRy97egv
	 wbsRutu6jV6MW6MMc43btxcW2BoJkjz+DaUU7YoqWKbUP/KtADqSanWd5o/IwJn+4A9KJ
	 vm6otLeqmv5ds67BWzZO/5ghMbVQcLaVWVvONL8Qb0zl3e3E94Wy6X5rPkSl4Nrm88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZCh352Qw;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7C606A32A
	for <soc@lists.linux.dev>; Mon, 23 Nov 2026 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB7C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZCh352Qw
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a9be758734so1788685f8f.1
        for <soc@lists.linux.dev>; Mon, 23 Nov 2026 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425419; x=1796030219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=ZCh352QwdFPYAgyWC9thx+bUpKF5v5/TIyYEvxx5RHUw7BmjlkG2w43wCkNqwAqjuK
         v4Qg+FTBeY+mngubisY1h+rfSgpxdh3v/iOeAPbebS666icM1VLus6k6H6uJ2U45y5Da
         oJH6Wgu6iUpDDIZB6wW6e/1QpqerI2lUy3GRkE7yrYnygsuMFAJw9Fi28wbIkD87kCjc
         AfL8S9sZ+IYOVQZ0tJhmPnUq297Qty+Dk9ntanRRlFRtEDwBQ+vMvWMhaaKkZmbNqYRl
         tpu5KbSaJ8JS6hubWwCD+LT/S0OP/bfkTEZ139WDkjYy8UN3G7KnSDWaAANJfxl5MUb4
         H4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425419; x=1796030219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=rDwjHFXSpB5ANLuDUYN4MdZASnyzL+qMpdFPgS9evLB7zRv9s9rywX1tvv8LSoUdpZ
         trq7wQ5iylHeJeH3puqqJ+HRTYMTTCUaN3NR/UsJG9h4r3cUxmZWjJPsil9J3kZqF9sy
         Nn1OUOh7l7DIt2MBxAzTwIIOzLDl3GROx8t7ANDykKxLbFDBIhLZ0N4e0FTCej0zbICr
         YxMIZ79hjXy3i9UuP8G15EbbPGwJYfvEvaDSnzFfTglKDv/nwNfujp76lpwIeUtqfOTX
         wV3Cwgyo+DGq42Jc3mZBYXOojbI2gs/6TdYacYvQRgyvWCleg2Fn82lKkpWk2lROtK+F
         HeVA==
X-Forwarded-Encrypted: i=1; AL+hErEEF5tD1jj2FR2R3FAorF08PNY5hjE3CvNwyNsCRT55HqOxL8xpKCZgBrWRHMGmEJ5zjmM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8YADIZXe2ux2whDIpWxhOCKgRYvEJ/BjSeFtZsbk2KoVaH83Ol
	V1Py9IlUzPo23MhXwi0zV8nAp2cibzwzH6hWlA3PK6K6AWa9UsKbv0yewWN2u1hRvO4=
X-Gm-Gg: AZFdTZca7sT31doEusloxPU8S+dCcXW17pZoB1FB1oAKUSJNXDrHAGoc6iujNqikNH4
	b7R76IR2tsLjW2wZk5UNBE/1PVA6ux3t0xPEnEM6mlL5NeQNnk4l13ahWA18y1RW0bR50DaOhHT
	ARWOxIIo4WpOV0hRsmzdadKqMeTB24+aud8cJ6g0QmqPq4mr2vwlhPs2TRUDBY2++GMp7oFaWI5
	aB6oE8v/QBSh5OAPeLTVBM7stuTn5Frp6HOaFyVCzu4t6PEB9WqFeX6YN0NCNFThrU/OGEXLU3/
	QU4VfCRgA7oM95SIZJNZU0UGlusBIkwSB4our+lrBCAXE4KgckoA6IEHx2uATMKxdFsEXRwUIHU
	FUBXHPDnpWXIZs7y7ZzdRt1sc5Q3kBduUqTyzboHmmU/2JlX3sCG5ek7DgvyNIubMzOOJIHLROc
	NBklalH81j9rcuLn3NGiNYUVgaDv47alR3Qv8hqjWZFNJdqvpkXLM4eOl2+2z82zcSRiEdqa4G1
	oMfXGdoMrRpKBgTwQivIqk6AREIBGNhFeKpgBIoIiGlu3GCaNMrZjLeyl9TdvxpMsqf4oCSTAo9
	QsejJhjZQXFxdXmcy+v9ICRQso5o6Dwyi4/2aw9vKl9/eb2vlq/Lrts9lnOEzHxugSuIFh7B2lC
	yVbrkGLrD06++1vvIZ+Qc7Nn9wFstcrSvndBzNQ==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr20062459f8f.28.1795425418389;
        Mon, 23 Nov 2026 01:16:58 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61e8sm22313933f8f.11.2026.11.23.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:16:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:16:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
Message-ID: <awQEP9bHA0RPfRUA@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4xfpqjjox3khpoi"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>


--o4xfpqjjox3khpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touchscreen/at550-ts.c
> new file mode 100644
> index 000000000..89c2d2701
> --- /dev/null
> +++ b/drivers/input/touchscreen/at550-ts.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 draft. */
> +#include <linux/bits.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--o4xfpqjjox3khpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBIYACgkQj4D7WH0S
/k6Mogf+I4t6gj7ob8tkta5kHm+YP96+f6rsROw+nYQ5NXBDBTwdaHgtuxTw/3u3
9TSFi59BI6mt1CJkV2ldOhel8Do0lFyFlVyx1+tlaLGNAjrt3f8m2IWJcvQU4hQK
qCxr790Ac2+n+6M13QHVHO8E7+V5Kxu109uuNUNUWIsrjawNdIUx+lqOywM9o/JT
s7dUkwPF41vgxb8gPn3Hr9uAImmkTspc70TUfxqNtGVNmQlizkBCtSCoABv5QCdW
mXZx4sl+NJUJpqZ/jj0ehbdZ1DT8xVBRF1ZDrDU0AdqO6EAWVEnOx3tb5+7JsaKI
HSj3Bm7869/tgf+jXQ3QF1Uu7I1vmA==
=UpFb
-----END PGP SIGNATURE-----

--o4xfpqjjox3khpoi--

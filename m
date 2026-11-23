Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425460;
	b=SXReJD/c+hyJ4cVptaGWjLYgRrP1CtJuh245w3860HghGFy/5gl3Ul8O572fBcSGkcwh
	 dea0liKeXMF2lVM3NX6msh4oMu2Ln2cMkUMxpYVOpsdq6/JASfa/3ySaT7wf23SAPIGOB
	 EoOjRu1KBayubBESTverZLGybHtioXA80OOrkXUTun0dYbE4k/FZ4d133lsQh8XFe7qeK
	 SPU3ug8t8s4hjRb+IvhsimD421K1wsdwb/a+ngxPfBDkwIuaPIdkqhi3Yf8DKWq8FG4ds
	 kalMg+x8uhV27UCPAG4h2baewdYRmpo1sCgHtRAWc/QpiVTBt429XjZfwLRkZqHAJBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
	b=gjJH7AiX9d5DBcORGoIMU6AkJCbXSFcD9bTvyS17tl0Qy9l0+HKoeWF+0xwUkHd0HsKb
	 0UWgBloHzD1MS+DZYEDCxJCr38Auy425Z7zY0j43OkPrGeqlXalI5I2NVk+OSqFaUWoeU
	 FlloIyJcob3sLDr5FknlRSWcjSeqmFTzToUfRI/Y7luMvvm7HY13Z4iqjLu2BR3cvZDLR
	 gyA8F3CxBsEerHiCRbXak8zCGCuWDsvCA2SDZvk0QuD3vmQOJoR36bv8AyNfodr+rnBFT
	 yqY5Ps0XLfaQLOI3b1WpmlO6ZmAhwTQ1kNdhk5XZSohYH97/kfWWvrmG5lCv0uPuN0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MFO4M9mb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC160A3825
	for <soc@lists.linux.dev>; Mon, 23 Nov 2026 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEC160A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MFO4M9mb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so30118965e9.0
        for <soc@lists.linux.dev>; Mon, 23 Nov 2026 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425458; x=1796030258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=MFO4M9mbKRX7OGQeosHJZHAHLMN+S3HrFAdk5eAgDLJryqQ9HVMawSOeVMChzl6pm5
         XKKjqyzUJOwahKUVfCuasUQN6hhde1f9FVr5lziZ/Em9JXmB5euS11PHU6kvpF8vR7mz
         FzsHBN91c/0igbE/LXU3JT0ct8M0tjtFFDvQxm9L71ahneP+UIKv/dy7WbqIY8zDgj4/
         miTBVpERZzgIzPtEc7X+FXQ5+AP6Xs7+RhQNrDAVd/XH9teO97BV6vpAJSpFaITl1UCK
         0y2cVRWpaPo6FbgMsPMuvl/PPAK8rWyKFegACnQHstxu/j3fKgb1nUiXXtWWfNNDcS/6
         ucFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425458; x=1796030258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=LVHYxbeHLFZ3GXDXgXINCKEU9cDDeJpY2J8EI4D3ovXVdtXJCKiMNylSW7Qb9Mc08I
         dggb+5z2IhFbfPdm3KHO97wSIZ4ZYbu4TSf2EI2QvpILJbzG2xeh5QcGpD2vJShFkHYk
         KFiq3ORwY6N2E3UqQVsHB1SpA4yMbmTJ7DWxpzvkKirKIlirB4xqJIXH/IuhNt1Vw11X
         Dg0A4FLM9wWUE6guTO/8fY8X4/SFTFWOhHHnYixZWVtYpNSKHqs2B0NudZv/6iG6ngot
         yp4tpXNtGGVeVw85gMkHJRisDKiZEFWs7ZbDSZd+ak8SdxjJbg2k6wbx6mqfGDwfjLCe
         Al8g==
X-Forwarded-Encrypted: i=1; AL+hErH5J6d4DDL6CtsHOUmDDkmYoIfR84sozSu4YPd4p9WDZlp2NAIenUWjCnwPvMYvSA+rLEU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ccQl/0Q5ijpDBd5IUSuVxyNYQGq9fl8abQ64ihNtWoO65P6OV
	qCX+UbZDxd5SJEBFcHXX0N0JVlDpIVWWmB3vqbjHYT584d5DR62+pTsOpp+7koUboi4=
X-Gm-Gg: AZFdTZcAJ1fygyFIGsQQuqfq1kWeQlW4ZNAMOD1PGGcIGz0IyCQzgw3HtkLVrhTL+S0
	o8dnhy3+gazKdHAw/mh2AcB7haNjThqIe7KetJCO9Ooo3RTgJdIl8BFIDK6Y/xnKRQJu40TZ/s3
	XTM2SKHaH3ySHa9FANf3JKcF+jYeriixP5c93jOzPPEjwbC1V7HaRKD7TsILOpCXxnc/CKXcgXt
	yv4oFhx2Hfxv3I69wlOevd6msRwCAAFP+0y/04/qqOhxVKbn3dgnMgT8mSCmkBSxkYHELlpxo7G
	kQa/Ror9EcWkEjZ0nCcjxgAMsrMYNMZVEGU9NjXmNhX1HV5FBtCTc46unJOoH/OfloUSKfNiFMo
	v5JVzp2gWfi2l2jHK7CNx0NUzdS1ErykhzY/b1jY1EUeST2qE0M0sgSAl6/9IyCmp4Aw0JUonFZ
	Iz6qQ37tDHvlqSOnnv5e0GnDttCTHvtcuYlm9dPSjXdH0G9O/PxkD6ZXvzWChndIysDWU/3s7Qb
	8rHD3JBYM4Vsg7qrRo6gVESa/ImJ8PALXBx7UyKzBLbSRVn4c/GZ+8hto4BvbLSg71rmlOIVx1O
	y7eo6x8MH1beX18FYoAVEzPjptIwpWegLToCHAp9ZGZ5YZu+YP0IDZ7Z8qsR90J2PC0M9QlpXUZ
	h0c7kFqkKwZChPeo+IIn8sm/6+IBlwAHZ21ykCw==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr224342725e9.18.1795425457707;
        Mon, 23 Nov 2026 01:17:37 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm162891895e9.4.2026.11.23.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:17:36 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:35 +0100
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
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
Message-ID: <awQEjpz2572Y9wsB@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="53xo6eipu5xw5r7j"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>


--53xo6eipu5xw5r7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
> new file mode 100644
> index 000000000..11c9de0c9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-at550.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
> +#include <linux/mmc/host.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--53xo6eipu5xw5r7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBK0ACgkQj4D7WH0S
/k7hOgf/csj9IbehNzv7kJ/jSWUzgb6r4/RUEEbwtHDzllOp2mTN98xOQkRXzRr+
kmuM5eb3Prkbs0qQBPQiihfmm0Jo8lnvB2N8uBswWQM42XQ1o5YmtZx2RIs5cp4a
M0FFz9Bz2fH6rmOr5ETS3FRjnZ8CNqQnaFBWD9lGusUfgppfoyqvFwbXBZyQd45Z
KCR1pIqN6sWoDMkalLwcL8/M72VapgfDtPpmNp4qxYjf3m8WbJJZGT7uK2Mk78DG
WWybLbbeuHCv72ICgMdJArlShc5E7A8r/LZSSpXjnNPBCxOU5AeW1Fa/7Ma+TYWI
G0UtaE9KZSsmGdqMVovJUC5O5/MnDA==
=R4EF
-----END PGP SIGNATURE-----

--53xo6eipu5xw5r7j--

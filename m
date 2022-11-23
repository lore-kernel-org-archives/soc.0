Return-Path: <SRS0=nJqM=3X=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1243C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74B09C43470; Wed, 23 Nov 2022 11:36:26 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93B51C433C1;
	Wed, 23 Nov 2022 11:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93B51C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id s5so24398805edc.12;
        Wed, 23 Nov 2022 03:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN5Y28hwuIHnQP6o6fKt5abNwq79w5LvuYTtcDqJUxg=;
        b=ZUOIL24dRn3hKqwG1VbEpCobqa57ticgVX7m9yHTobiSWT+rEqQMPut1hMN1tGv8vy
         5P2/Yy+i6betIfOSd+B+K/kKWVeP76ho/eWPJJi0XgMy/jkgwvO7oXY8mMvioQDtXT0w
         YQd4cOrbtSuBblS5gh+vbrxzYWHj+XJVjnEP+kdKDKVjbjkmcRb9vA1liprwUwesYC6X
         qB40wJODhZZ1V6+U+yhRXkDsR6w0ccuol/o2TMHmU83cdOvHabi97uiPmEl1oIrpKE/n
         bFCc8/tmNdnkIuy16zi5KTzGN9trzXxy4nN3WYfQWl4nxDA3kacFLqrm6RARctGn6W07
         YTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN5Y28hwuIHnQP6o6fKt5abNwq79w5LvuYTtcDqJUxg=;
        b=3my3GY2D5osTmXPoqiEmVaTk5+T3/9W6/kYdd5zKvqOERFYzFAz98mmzzUOTFgaGtz
         +1sPNFo0WENf2CCLJaa7rB/16lKFOdxolxsgBmg6xLRTrxY4s21D5LxwssvXyI6+cuIW
         dV2ntoq/KPcV/kTOLI/Ca5jQA4qQlA70bnBATZpabpAGvNraBsGwFztBZcHO0Jp4a9Qc
         +fBTwypcFyiOr7TZqv+W1/r9NXypNlHt51UKSNVyuo9wYBHwhXIHtBlTkkvPA4UE9ERA
         UzOckkybrn939ErHchtzA6r3HttxSmB7WAeuYGBnU6nzAdZxU/X9ityqYQBek+meLIND
         uaWw==
X-Gm-Message-State: ANoB5pmmF4MMUL1+OUzC6MA2RrkNt2x1UzcYWxKzhOkGEzAd7+S3nXo8
	jt5Gi3B5tQ73jH+UVhXEmH8=
X-Google-Smtp-Source: AA0mqf43O86hs1uWhRNM7rSw9FfdU3qH0rO7MPgsa4YBIUPvKy7+jBf49I5+GglHQ/JGuwUH0F1OBw==
X-Received: by 2002:a05:6402:1f14:b0:461:c7ef:b09e with SMTP id b20-20020a0564021f1400b00461c7efb09emr11690588edb.58.1669203383813;
        Wed, 23 Nov 2022 03:36:23 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7dbd3000000b0045b910b0542sm7447341edt.15.2022.11.23.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:36:23 -0800 (PST)
Date: Wed, 23 Nov 2022 12:36:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 7/7] arm64: tegra: Device tree changes for v6.2-rc1
Message-ID: <Y34FtfuIgHV9F6wS@orome>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-7-thierry.reding@gmail.com>
 <4994fbb1-72d2-4d21-bfb9-c1eefd9815fe@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LNf7FqSdmFZ7VxOi"
Content-Disposition: inline
In-Reply-To: <4994fbb1-72d2-4d21-bfb9-c1eefd9815fe@app.fastmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)


--LNf7FqSdmFZ7VxOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 11:09:43PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 21, 2022, at 18:12, Thierry Reding wrote:
> >
> > Jon Hunter (6):
> >       arm64: tegra: Update console for Jetson Xavier and Orin
>=20
> While this change is clearly correct, I think it would be even
> better to completely drop the chosen/bootargs property completely
> here. The bootargs are meant to come from the bootloader anyway,
> and the console=3D argument is already implicitly set through the
> chosen/stdout-path property.

This is more of a safety net we've used in the past to make sure we can
run even if the bootloader doesn't add these. I also know that Jon was
running into some issues if these were not specified.

Jon, can we add a TODO item that we go over some of these and verify
which ones we need and which ones we don't. If we need them it might be
worth looking into why that is and if there isn't a better way to fix
this.

Thierry

--LNf7FqSdmFZ7VxOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN+BbUACgkQ3SOs138+
s6FoOQ/7Bb2tJv+uqz159LOLmAwBLGQ8zNMEbujovZ+oHOQJBkhZ8SAlYrE7zwrI
o4bJcNZaheybkg1SDJ4FolFg8f1cRBMq1JKEbdK1T0YLQeIyYMm/dsYaCyruWhWF
UriIPTQ85LMB5BdHz2l0T8W//Jj/Uhp2JoyJkNtkWb15eweuBuM6R+5x3jP9CU1J
Az5qLCEbJGV0iWyHrqHyScnSMFdJusYB4Px9LMGsDsz+6MQV3wHzcqHlJ9u6t/fv
rwVT7Td6KB6Kjka1xhiGcNSTWDEMxrG8XyKcu0hLXf6XtZHyVnlra2Zd1trexr8I
AjLOllN4r3z7nkjY74BXu0UOXgIFgG0AxLND+nH8WgDd0qZW6vnqy8dQkSUqji7b
M4zfDYt6I1jbbzXSXzgUlw2YcLggIhXOi/Dte0Tmw0bXtCNE5zQLdAiWSuQ5pFo0
+5zULsmvI7btNgnoggyAb6WnujD9mRCI+HFwQNVeQVm3wMXRnlAViapsQd6E4gFL
3XQtiF08DJN8dI+hOnOqLzktxmEuJSV6KW2UkyJgBA27+knA8kzXhIojYhQvKYPl
4Xm+QbX8D0hqqebteloeP6spRbqbnmu9MMuLoUs1SlNxfuu4rCw6VITpaPmDlIMi
8BnCqJpQUAPfu2szycxncdOBL9nQbfsY6ZberVJA0A6mYj9Rw8M=
=loUI
-----END PGP SIGNATURE-----

--LNf7FqSdmFZ7VxOi--

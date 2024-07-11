Return-Path: <SRS0=Xqrz=OL=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38575C3DA4A
	for <soc@archiver.kernel.org>; Thu, 11 Jul 2024 10:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2578C4AF07; Thu, 11 Jul 2024 10:57:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2BAEC116B1;
	Thu, 11 Jul 2024 10:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2BAEC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3678fbf4a91so353785f8f.1;
        Thu, 11 Jul 2024 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720695426; x=1721300226; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQHzIiSWTitM6V9sbofVZMI4IiRhu75e5ef/GJ6xGvU=;
        b=T+yV6Ki1KIB885FnQOHiAUituhxBDaNJ8ft6jVmaLOYkx0Qn47aSopL4JfsRBxFE/0
         Izzzi6DqsnLQ39G4L3evPzhCxTHjasZ6JryaloBdfRAlKqqVDA1yRkyEdOZqCkknSila
         hvs3Yoh0O1l3N200fIq7bVn+Az0Tsj3e/RSxTU6ZSyokRbN82oocgfJ2V1sW10f2yUh1
         BwQsHjFjx714KeoRZfwOHYr1TVnwoGp0SR7AAck9/h2FeICPJ1CKUfe2XD0FSi9EUGz6
         7JYOV1cWFgl/Ck30mUGN5+y+Ytmybs8JaVP00iS96P8f5362CXU76Saa13aYTJR3o3sz
         xyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720695426; x=1721300226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQHzIiSWTitM6V9sbofVZMI4IiRhu75e5ef/GJ6xGvU=;
        b=EoileWJdj13+GfNBuY19rZpD6niHj7DmZHv5ftiKyAl+m3e8HHHtEh4kxzJnOGDYiG
         2bhsqbRCMpI02BrhwDw+VBykdhQ9H4kvV6tOfYYAur7604HMBfYFmu221uZ4jW9QLPQG
         Vd8lszr7XG5AsYUjK20tRgXEdHKGOpwzNuz4lvMt0GIHDqITvj+LJETsdcKawyoTY87I
         5hNZT5395txQ5hjXzYB4oIJ9/xl6+nPRY382xL/lfSl3lWTLEKFJTclbNvn29x5oZ/p5
         XQxeltcQ646afqaKzKajaQVxJvym8y8HcdzRJut80QlO38/KN9ZpV9JzHe1b+H00NUgg
         jVyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVjmmn5fsrJb/MpUtCXiaYd2a1uuvNxcHVL+ujmBEHWgD4AFqbDXNuWYscMvX53oNWZJemISzIx6oti5kicQ==
X-Gm-Message-State: AOJu0Ywse8Fnm7zg3/3QFLI913ojZ/wAhtiiuFYqz1yzdEs9gUNgwcrw
	WfUKsUbcS2u9dtqd4+ZrFaDq4WlXnfHduvuIrn0f9RQZwb23NqT/
X-Google-Smtp-Source: AGHT+IF2Ibor+jL4DgtClDb+oJtw4JCDSesmygzczZLE3ZjQ9XeV2LIgdeo3rP3YPLpYvQ4tTWqP7g==
X-Received: by 2002:a05:6000:1865:b0:360:96d8:ab7c with SMTP id ffacd0b85a97d-367cea46d63mr7859906f8f.11.1720695425638;
        Thu, 11 Jul 2024 03:57:05 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06desm7494517f8f.76.2024.07.11.03.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:57:05 -0700 (PDT)
Date: Thu, 11 Jul 2024 12:57:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] soc/tegra: Changes for v6.11-rc1
Message-ID: <gxwkwovnrvmjmksezn3itwipj3pzsszucgx2mybchl3k5o3zfc@y2lmubyuk3gm>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
 <211ba53e-5cd5-4a38-867c-5eab9356b2ff@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jljr4zgn2ukzifbk"
Content-Disposition: inline
In-Reply-To: <211ba53e-5cd5-4a38-867c-5eab9356b2ff@app.fastmail.com>


--jljr4zgn2ukzifbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 04:01:12PM GMT, Arnd Bergmann wrote:
> On Fri, Jun 28, 2024, at 23:08, Thierry Reding wrote:
>=20
> > ----------------------------------------------------------------
> > soc/tegra: Changes for v6.11-rc1
> >
> > This is a simple change that condenses two function calls into one in
> > two places to save some boilerplate.
> >
>=20
> Hi Thierry,
>=20
> I have merged all four tegra pull requests, but for some reason
> patchwork did not notice this, so there was no automated reply
> and I manually marked them as "Queued" in patchwork now.
>=20
> Maybe double-check that the contents I have are indeed
> what you sent me.

Looks all good.

Thanks,
Thierry

--jljr4zgn2ukzifbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaPun8ACgkQ3SOs138+
s6FpkQ//ViFuXU/GxH7DFY9R+9u+17XKSppQjY1FhVi7IEtXrcGsUaPdz9wJ5qL+
HYCY+3QSAkX972ViUVegO39sfVT5pulFtSi5fs9o767p44pGVlfgI6mUNW2Kxyyn
8GSHOYLocfuRlSchccqVE+ITlHAsrGUM/2DguzqEzpbk0yxk9/FxXMlh6PxRUZvO
MofANiUSOfOFJ4Qb02iWE6IF/RdfJw+LFQcfwmjPiKFx/Eb+rmseB73MvIlsiMIG
Vk8s0dyBnfPMU6gNNlnYZNuM0ayHkpyKa6qXjWsZiW+4GjtYCN0thOdRg1Rm0ZoY
A/oBG/7kvN2SSI/b3yrvJZnX+WD+LbpWFpO2WcD2FF4IVpQMgCTaRnlkXIBjVsuP
sfzkCQZ2EPqp0h0JegOVBe/YiOsHr8p6SiUjQ/koSUazCaf1ThDxCO4YDWlGNvVf
ZUxAOKsdtLCPduOjCxW9HXFDDxQXRkL5The8EowviR5f7Tys4dHjGP1RtwW1eqZE
3qW/RVL22T3aiWBbdJowtZtizug1ZfxSuvLZbai+TXzjyW6QgBtHbMdEYOBAfRF2
em8ce8DpINbzavR3TcCA88XdVQ+79Fb7P2Nw01sl0JLAqo7ges1/ikNGRL9S8dOh
NmbollSRtLBxGspR3hLoHQInkEYPcwTs3s994gK29cbP6OCRlU8=
=2mdQ
-----END PGP SIGNATURE-----

--jljr4zgn2ukzifbk--

Return-Path: <SRS0=AxmB=N6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C41C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 15:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9459AC2BBFC; Fri, 28 Jun 2024 15:06:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB389C116B1;
	Fri, 28 Jun 2024 15:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB389C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so8411341fa.3;
        Fri, 28 Jun 2024 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587173; x=1720191973; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byFX7b+g2YFL0Se4495noznBPNIYmBdRduirs65L2O0=;
        b=gN2AJFRBGdDb7eaLzoKrBJp/4FaTcUoRVMdhIbKxQ/HNvyERsHbipPxdodg2fY4zkv
         Vw5DpYltxIJxy82ceE5du6c06DpS7wgSfzyeUOYVVdNhQbStwR9xNHOXZncVG5InR42E
         dNRRzRLB8YylvTM/rChWHSshBFX7FM7zD4ULYD3TS1J8h/ZQ0ojdc0rm/XXQB33mjfPV
         o3ITmQ0JfdCMeGaPvLBDNC/FLZiNtz9BCC4HlcmqUF+zRAGV+ihpFCy3zAoVkCkm8hux
         M5meXjGL1exmXp+2kPLvo3tZdE2RIhFhNqywOdNEy3KgHzzF1pF2BlXQwKR5yRyXGo3t
         9Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587173; x=1720191973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byFX7b+g2YFL0Se4495noznBPNIYmBdRduirs65L2O0=;
        b=BfyDbdyMN4HCAwt/FWCu2T337Ktw/ruz1dKlKr+vFh/lJ1URf+ovrgEC77j4q3jfGi
         Al8aceWtRoN5l+XgMZRMZvh+zv+lOJtu8vPcamJRipft+tpjSYObKFh8/wrGE/pN2YAW
         7dXQJVPUA20Mez8NwUeXFeEoh/fUwQG2hNA04DGfSqglz2lnvS7VdbwvMRE9uZA0WZnn
         jYAWeN60cBKHyP5oWzn7BzHjjXxSYUWssCc0rwswU1gxTp4Q9r/mG5frJ5c8v+I/BcN/
         PgeggX7AhLMOnYYKfsVGDr2+zbMCm2hIInH50VKaJVAh0xwZ0WtXbfXLWpi2LLAkE5Zj
         WT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWdDyfiBhXo897TAqxYCBAdxFySVaJFEt3GohWS9wJqM44+DBNpggRKiovTNlqDdUiU81PveP6TscUMqovbOtm2yVtx
X-Gm-Message-State: AOJu0YzIe+yWb4xBMsU0w+ufjn8UirGR+b2G0JvG5zSn1jTMKPiWk/4l
	DKaMO7X+XynDycLL2g1BNQ8xS6ulJ02LaiYHvhcQvFmN2D1GO/23tfcpkQ==
X-Google-Smtp-Source: AGHT+IH+IBDKrbwb67wJZQY1PQz8Vr9gonBlqgAsSdkyvnNetOBliXJAAb1ffJe8fDb9NRUkMKWYDA==
X-Received: by 2002:a2e:9087:0:b0:2ec:4d48:75f3 with SMTP id 38308e7fff4ca-2ec5b30765emr99738851fa.45.1719587172823;
        Fri, 28 Jun 2024 08:06:12 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e0661sm2557180f8f.47.2024.06.28.08.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:06:12 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:06:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
Message-ID: <lbv5dlpvjfolp3tidna6ft7o3c3xswu6udp6savazegbfovygp@uzf2yyrocfuj>
References: <20240430191856.874600-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pjs3gbaie5x227iz"
Content-Disposition: inline
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>


--pjs3gbaie5x227iz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 02:18:54PM GMT, Rob Herring (Arm) wrote:
[...]
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 9ebb7369256e..2e5b6b2c1f56 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -25,7 +25,7 @@ chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> -	memory {
> +	memory@80000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x0 0x80000000 0x0 0xc0000000>;
>  	};

[trimming the recipient list and adding Diogo]

Sorry I just noticed this as I was doing a cleanup path of patchwork.

For tegra210-smaug, unfortunately we can't do this. The problem is that
the firmware for this device looks for a hard-coded /memory device when
updating with the proper memory size and this firmware can't always be
updated.

Diogo, you're one of the few remaining people that I know of that still
use this device (with an upstream kernel). Do you have any more details
about this? Is there any way the firmware can be safely updated on these
devices?

Thierry

--pjs3gbaie5x227iz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+0WIACgkQ3SOs138+
s6ETww//fKn/izh6941gGmnNr73X80O4LhJqg2ssrOGsboYQJ9Ca2/+LImPyEeIv
Hp4JfswrF2kNORV268f24OZ9dZG/XehTCR5yJwi3MRmF7uawKIItDOsafq7yh1GG
B+QatqpwOlvX9JFq+uK61TIF/NR7NP+ILo1H4OnnbHmOfNfnm6wG/8bcV2GWGyHg
Xax2H47PW+TvFKAi5m4yM/qzEfj6rCOOsANoqfhoMyzVQ3+C4SY7JyeHX3ZPn5uD
nt1MJNxktXZkP45t2s99mEW3yDD5Jia88jIVgBvIRq/VWiT3RRqXoBOCfNxy4ne1
mE06ZfEGZZeqQsSfdgcs1ZRsG2//h2EjCgOc7+JaE+yvbGC0LsIqoirH8foU+74w
vrgQd9kY5y3XpoOxQuGJpTsKmVrtJDm1ScLcr3zAcpqR0HMLTEXxInL6gOFv2Lfv
CI9ACx1cJsmzNNHrgrSWk39HeeoegCtrm+7DKrgaD6zUMUYbug5p2E3BfIKRMdiu
+yMZ9CMYUD7dylywUIgrQXnsbgWWygMJUEuaLYFZHThzJ2jdCY1vX8FvvWVbDxqn
Pa09zlWUsN6+BABlb8kqjPhU9FBS6o2FJ1eLFS+lpCwah6KE1fPfPRHhZHtn0oO9
FXNNCTagT0b8RJc2RPiMTytbtHwherbP+QyYlfpIoHp6qSavTo8=
=qW8X
-----END PGP SIGNATURE-----

--pjs3gbaie5x227iz--

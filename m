Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DD37F8DB
	for <soc@lists.linux.dev>; Fri, 17 Apr 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446669; cv=none; b=hoy0ytAjgDh3UtWvgmhzVK3EdSBsdvJ9rkT69ukbjOGBAOvqYys5gTvX4oxik28P583PR9t+4cQ2UtZczD7Ej1xTUEdJjFSW+vBD75N4hO/uDFKVu4RdVF+hfWpkNQoAj6k7nHbrhjuz094ZVXfcvKfy/sveV9E6RM+IZju7VWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446669; c=relaxed/simple;
	bh=KVxkAo6OaK7ElY1yVtpbpwz5EsN+i4mdWUQboHKutek=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=agiigv7AVwyXFGLH0pHfzc/c6loDDlpp5gkOo6qMPNvk0shCwZjHZXYPw+RoqYafQLbJwE3/RjeCaqa7Cj7F7dPuGbVUMW2rZ8nlTl13lfpdUNC38Q224iXDIaZw61gpMht6t5wm4AXSH5HbFMJveeEvF3RDYyEIqNp/SxmsMC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJ6NPRu2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJ6NPRu2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba545100a13so8665666b.2
        for <soc@lists.linux.dev>; Fri, 17 Apr 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776446665; x=1777051465; darn=lists.linux.dev;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=bJ6NPRu2gjc4TRXYKpvZmCiCwd6QRcGYJ9FmJ3lzziSBuf0PeNO00YV6I/qMDXCoDL
         tg3T1hii1NEiGN4JjvgMVXUd3BWwgMq5AZQ11v73ulj8vO7swxfjPODP5zX1LwDuuSao
         T2Jg34k/+9XHaJvqD56XmOdXGG9nKOPNrP246EDndPdlOifFBUhwjEW+PJ3Zt3G70CFO
         jQyn4oYy+mwmuyMNHl7mtYznZPvIihmxCKh6oKzigCw4HKSVqlCtFyAupMbZNgg+EdoN
         kKgoT5UhIEgKroeMw9AwRKFsD+xdpB33fDJJFYRL8Pp9E/0J8/hYfuVFkmgh+n3hcQlD
         Rm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446665; x=1777051465;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6tVQ0pUQqp8YvBCfgccdHLoTS042A6J2tPjUSrHHQY=;
        b=ZXf1JVxLmxnEZPE77bPCaNcuEQs+93BVDk4P4urnWZ25kIb168FspgPU+aUNTJYONW
         68jYegmY7RbGdNWbL8hCEcskTeyJ5tlGUJfcOscL9/RaFEQtQDbKqa0Eg9pmTCor0MPG
         /bpUuqH9uXVFt0W6hI+MuDBxS4hChAFSVyQ/4z+3FLPCsIdFAOi7KAE5/CoYot5lIxLB
         jccf0paQ60FVu9cDeBJ1EMgU9R/E+t9/0d3DAOyUUrOKUusdEaZEhBTrgiAytTJQohqE
         kWVi+VY/vmZ2avsHjbkjf8qDZvEnwYwSqJfs/CDTwjykH6VZoKCv5O/AUetK+cEjr6Nl
         0OSA==
X-Forwarded-Encrypted: i=1; AFNElJ8SAqCtonwJ1w1ywFD/3ehc5zU5HWWSfmOI8yPgV6hRpVVtSz5MBqnRmIS86ElEdo83UmA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqMPzodOIDt8efZhMDFGaqJ+qbt5iARkPx00KVH3uxALHUKmcx
	xjlh8PuvrKPmFnaL8vcP3sOP8dFFcX43t14qAQ8kOly9ZoaP0DcPtflx
X-Gm-Gg: AeBDievqtRtV+lSxeQf7RhUEn+ggy1Th43Z4NACoYWNuuE/8nvkdaaWRFwILsd2377V
	f/wGnlDLpfi6FmXQn60jzbyXmLqxuuduYLY1rJr78RWMKXHI+R4KooffT+i4QUQzBgfsah1ylYj
	4h7iZkwLgat2k/zyYpGlZHXFTPVN0wMC67rjAQHmZufPRDMVocbJCYMGTkWUsIWYeaY+SD0jFwg
	HEgIVqOBqGIx644ve3rIbpZUCbT4l3tIvAnp6I0a+SIT4vL1FK9m0x/zmgqf7XnWHj5fK3ttuzG
	dPQDfSo3Uck/JXqou0C8ubknfqnXhprDyggpE6mCFdow1jrdXgGsH7YpuUWAWW3mKo0HFkwiSUb
	uORT7nZ+xJmqHsrJxXxC645LlUGCJW4qJV9GjtblvBfCSXpJIDfGBjNgvF8CE7MEBqxm6iFUQpb
	WiesAdGiEIUU1SdlSkbdlTpJ9k6EGUI65D9V98g2q4pq3hlLpopLNEeYt2SFFCjUVp
X-Received: by 2002:a17:907:9495:b0:ba2:48d:a95c with SMTP id a640c23a62f3a-ba41a04cdccmr206095866b.29.1776446664275;
        Fri, 17 Apr 2026 10:24:24 -0700 (PDT)
Received: from smtpclient.apple ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm75465166b.43.2026.04.17.10.24.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:24:23 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
Date: Fri, 17 Apr 2026 20:24:05 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <D3228B7D-0C11-4087-9547-0D1F7D5FB628@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-7-e19d02b944ec@gmail.com>
 <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Arnd,

Thanks for your comments.

> Am 17.04.2026 um 11:59 schrieb Arnd Bergmann <arnd@arndb.de>:
>=20
> On Thu, Apr 16, 2026, at 22:19, Stefan D=C3=B6singer wrote:
>>=20
>> The reason why I add the serial1=3Duart1 alias is to keep =
console=3DttyAMA1
>> stable regardless of the other enabled UARTs. UART0, as the name
>> implies, has a lower MMIO address, but uart1 is the one that usually =
has
>> the boot output and console.
>=20
> I'm not sure I'm following here. You generally want to either make
> sure the alias matches whatever number is printed on the product
> if there are multiple numbered ports, or you just use 'serial0'
> as the only alias if there is only one port.

Not all boards have their uart pins labeled, but those that do have the =
pins that connect to the UART at 0x01408000 named UART1RX/UART1TX. Most =
boards have only one though. I have seen a picture of only one that has =
UART0 and UART1. I could not test that board myself yet.

My original reason is one of developer convenience: If I have

uart0=3Dserial@131000{
    reg =3D <0x00131000 0x1000>;
    ...
    status =3D "disabled";
};
uart1=3Dserial@1408000{
    reg =3D <0x01408000 0x1000>;
    ...
    status =3D "okay";
};

cmdline=3D"... console=3DttyAMA{0/1} ..."

changing uart0.status between disabled and okay (e.g. to experiment with =
uart0 and pinctrl) required changing the command line to match. I found =
that pretty annoying and the aliases seemed like the best way to avoid =
this.

Either way I am open to do whatever. I can keep the current naming for =
the reasons stated above, I can name serial@1408000 "uart0" and leave =
the others without an alias or I can drop the alias altogether.

> Either way, the alias should go into the board specific file, not
> the general SoC file, as a board might be using a different
> set of UARTs.

That works for me, I'll move them. The aliases will most likely be the =
same for all boards based on this chipset, meaning duplicate code, but =
matching the alias to the board labels makes sense to me.

> Since you know the addresses of the other uart instances, I would
> suggest you add all of them at the same time.

Will do.

I'll hold off for a bit before I resend the patches to see if some other =
comments come up.

Cheers,
Stefan=

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnibLUACgkQPRO8yFRP
GiIKTQ/+NaGjhii1hGtfVI27m5B7xvrO45mnvMkcV0ceIDc63OvWS4qRsBlOJnwF
9pjaplL2Kbm4sf/uPfQnAE0BviBly1d/14riJjJmEr4G4re2+Q/c9BeCxazBDbDJ
tjODl+Ajwiu273EcwTN4ZU28p/80oJjmuEEAHsL8crw7d8rhnOjrwY/Ige9HgcBl
BYlJRjunX6SxHxGNH/eEfrwrABGjHVD1ya8YjQ9NIZnkEEub9lRZO4v3gr3mU0F1
tjATbZV1BL1SQ3/Zld3BNzYkj7JzCmiEH601T3RZittY4yZBDefYMFantWcrq8Ug
nVM3or6OxSiKoLQ6vak5XVW9ks1iX1k+jU19AUN71/VIvWQ+zTVnO9c1wJae/eEe
SMeyP/Kt4bOGDi1Bq22aD+nv2lJ8wo/4l3k9vDv8vJDECg6UxjLFgYPbtJyEV/wr
mTaODzo1XDfo4PXQD5x0bpgYrguK4X0wVM5Yu/+x/kZLKrm+TWfXN4exCwO6WJPW
sZ7mj6ksI03MTxB5XpBKeoaruf//hQe3lhLDJ837SaDq8xCekCsldXyMop/qQ92a
HBwMG6hD3kLzxRjClYksypijVruKHNcHshp0imqt1Hhs5wXNbaEsTQOqRUgSWj08
Yb2Veu9YNoQcnrIK0Kh0YtoHMDb29uagvWkRg63fyD40m56GPyA=
=CzCY
-----END PGP SIGNATURE-----

--Apple-Mail=_6363C69E-ACB3-474B-9473-521CD530D032--

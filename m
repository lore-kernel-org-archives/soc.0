Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842C747F
	for <soc@lists.linux.dev>; Sun, 24 Aug 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756060892; cv=none; b=kWeDqLmHY4H5QidVvY75K79exRHq+xiW4+jHgc2bYglpvw5D5pJ9Zoe1MFlBcVYfP02O98wcXJ8CEGTTGuAWMzJu0DB4kF3VRW+2tvc12JMXzhvi3zFt5HaemN0tvUeqKrENaEVYBsgvTXTjie+CsBuDTt2S9oL78ArLN9OyHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756060892; c=relaxed/simple;
	bh=aldXpSXFZsf1b9WUi1tbuAPhB1ZbzKICQCaFkopUWH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvRGmDZdfu91Qb3U4C7WxZaZKT+8eyvD/R7AZaegA2SxqGfNBFuEqj7lpkw1e2BGwwGP895GdQ/WjjabuVSdJ3wVWQ4eCSIHscRWFGiLad/DvAdAJd98vPsR4//NvYTuJQKgG/yrUgoAXylVGExvcpW6i0Nxjm5ecT2IyIYx2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=B4VU3iGT; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="B4VU3iGT"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 9666C1C008E; Sun, 24 Aug 2025 20:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1756060451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq1PAeKV1s4YmLBR80pZHsmgpoZjucg9Fy7oCVrjUFc=;
	b=B4VU3iGTH9nM/JqJF4J+vybBadFPzi6y5LR/UqbO4j3SefwKu6bw86OHvi0Hv4THWNA5LM
	Xh+5LbdIoGBkbgLUoj3Xl6l9W81w1Bwq6uM52kYhR5p1QB43MKEksANjoZXZNa9yTeWCWl
	ZoErlrdWU2y/VUduG+HDJh9sCQaBLPM=
Date: Sun, 24 Aug 2025 20:34:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
Message-ID: <aKtbG1xk/8sbyHmW@duo.ucw.cz>
References: <1755663767-1612-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="moKA/m+8I1Jc/KOW"
Content-Disposition: inline
In-Reply-To: <1755663767-1612-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>


--moKA/m+8I1Jc/KOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The company's email address has been changed, so update my email
> address in MAINTAINERS and .mailmap files.
>=20
> Signed-off-by: Nobuhiro Iwamatsu
> <nobuhiro.iwamatsu.x90@mail.toshiba>


> index 4bb3a7f253b9b..328b04f82dac7 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -585,6 +585,7 @@ Nikolay Aleksandrov <razor@blackwall.org> <nikolay@re=
dhat.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@cumulusnetworks.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@nvidia.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@isovalent.com>
> +Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba> <nobuhiro 1.iwama=
tsu@toshiba.co.jp>
>  Odelu Kukatla <quic_okukatla@quicinc.com> <okukatla@codeaurora.org>

There seems to be typo (extra space) in <nobuhiro 1.iwamatsu@toshiba.co.jp>.

Best regards,
											Pavel

>  ARM/TOSHIBA VISCONTI ARCHITECTURE
> -M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visc=
onti.git

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--moKA/m+8I1Jc/KOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaKtbGwAKCRAw5/Bqldv6
8j3iAJwJWCnZC/1x6bmybPkhEm68FTqfXgCggl6QXqnEit2A6S8N/QTn8TOCtG0=
=trmY
-----END PGP SIGNATURE-----

--moKA/m+8I1Jc/KOW--

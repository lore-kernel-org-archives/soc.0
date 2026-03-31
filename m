Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5D39BFF0
	for <soc@lists.linux.dev>; Tue, 31 Mar 2026 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955367; cv=none; b=Xv38UPI8kTopO8Hv329ZlaTH+oVY38Sjve0EZLSWgzHAYYKvD/xa+8uO2DW6PDKim/lp9xAkDarSqM7rFlqDBDrU/xmJoQ3/w0jmWFwrpr4DSb4xj/cC6NppnxcXwvB2NWc0aK8lQ7qXnbLtZ2KjLr5ZEl+QnaUTn210La20ikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955367; c=relaxed/simple;
	bh=/SbinRP8ScJC8DDnauWlJ9sB1SGOi5CRtDVPWlYVVS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAOXIYVxxU1cDIzEodmdSIKXvolcRnEP8zwvT5/T/+UM4cMgw8q3Zc8NKC+O1Mw+9nfwSP6c4jP8Ug+p80rBRGtzFzl/jvZICdZEg+uMFcxvSK7jbgBeTLqTGMh1Q8N2tkQWhRYnOqNGWgarVcoGtVE0u1dfAHfiIQq68gpuY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFVFYiI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFVFYiI/"
Received: by smtp.kernel.org (Postfix)
	id 09DB2C2BCB3; Tue, 31 Mar 2026 11:09:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0786BC2BCB1
	for <soc@kernel.org>; Tue, 31 Mar 2026 11:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0786BC2BCB1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb439299so51963025e9.0
        for <soc@kernel.org>; Tue, 31 Mar 2026 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774955364; x=1775560164; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7hbRBTpUIN+ln6L5dv1hc+tqClxwvFAb+PRq7Z+5XE=;
        b=TFVFYiI/ZYXkcH16kTkaNH0DUVqsJt3xqqv7cLp7ShCyIBF6Xhi39CwQ5Kt5Z5Aa9i
         GxjlNb9Qxth9TuWYsEmTL8j69XdOCYqcxyBWRBLuU0guXV2JrmIgbPrS70lPteu3ujqx
         WK7Ld4cc20QnciKF7HiylkvynWXhiTOaoQNnwA39AqAYEIoFL4XJj9JnoNG/PXAbsNg1
         dMFyuNjuhfb+46Ihe9oujcy4tDnSE1GX6s3qV6c5zXakyynDbf0fmLqNgRmpUtl+kgMQ
         ohn7JaQ8+jl/NqX6T5Q6O9+evYoSCx4utUgelFRXTzX6hlcdcpBIKvnqvhWHIRjzsdqf
         Fx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955364; x=1775560164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7hbRBTpUIN+ln6L5dv1hc+tqClxwvFAb+PRq7Z+5XE=;
        b=aCqNxBKfFdjyuWFLA/ecvbZlzCsuGXmAf46kEOuMpv8ZPdYTp71PrpeTJh4R71LCgD
         eZf7vbHGK0zxCdqHT/tF2xsODLbwd3c4yQOk633G5jE4ARpXGHh3i8pE17dTNXJwcS3M
         9rj4BrmSnBseWuKXr3h4hS3xn1Mxarp/CVhUR0r5jirOY9453YggogIaZrgHHGXlSVAR
         2qLbrO9LtGYUNZWvd3xug63MsMqgmZcIGdCiUiJTmvGzT4BB7WwRqDbVgfZQ04Lq61pG
         tixIsM95Ra8NnD77+gltt5fCC4OAuAOz37J8AC6P58QxxaLM3BtGJMsSJSTm6htlycEL
         iNXg==
X-Forwarded-Encrypted: i=1; AJvYcCWqZBl63HhHLBHmuYEq3C4DER6QjBjFf/WOUQCv8O4jYZ/rZ0IACUSAlNAoQSczsGz+DOk=@kernel.org
X-Gm-Message-State: AOJu0YwWlzogNFjREY+6ssu3k78+sFLPLea0GZ/m2vnIesL1blPy6W/H
	fw99MwCxg8puxU44HwxfKRZodZOtHBma1R7HWIaDY+v2OmPbdxBtO6M0
X-Gm-Gg: ATEYQzx+7uFc9CrtgM1K84nAO7AVb9oxgA+pGkQSmfZzyLSfOv+0vzmeAQRHw8KtwpW
	ZFT9f57rT4ckHcqFA+/+bXWpw7o0bikaPc7WfQpMHdKhP3Kzm/2HRHNHbEO9cSUEn9R44MyGkau
	S6+NWLylgc6MQEF5HtPD+XOGDbmFTFLbzHi1TpDteFhgP7Dl0XvjaRLICtJP9H4NYVlBCYv1KS2
	CXQg4GT29Ul/iTG+uoUeFO9z55v3X15F6B0zYNXA6hBBJVgfLaoMAX8jfEkqsfBS9GNd4ghHknE
	vSBEnafIJghtBuk0uUQvMOV3ef8aHTk3s38zac4wBA7ywKaW3RF5AalOp60NyDUbf9c5XK3Z9DF
	Rtv9wJ8v1wXvbxuhrQaXAoU75WjG06Q+SUulNn3LZQpP48c6i+IW3G9MxQYdDRs1Hq5KhVCSsqm
	4BU1TgRiqO2e8uPGyeB7fgItR929Wo9jbMQnyeQxDyY2IJS8uihUlU5cBTuwGFVHR8J84GiDOuC
	aw5O20VQrRm1Q==
X-Received: by 2002:a05:600c:8b46:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48727f0ea89mr252274975e9.11.1774955364046;
        Tue, 31 Mar 2026 04:09:24 -0700 (PDT)
Received: from orome (p200300e41f249a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f24:9a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm31447575e9.9.2026.03.31.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:09:22 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:09:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Message-ID: <acumPszu9kvDsebG@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <406ca5ed-4a3e-48ba-94ad-d88c53b09299@kernel.org>
 <act9hqxjL6wZ25dP@orome>
 <1bdf911d-383a-4ea3-9a33-f8ee6e8f26e4@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usfe2x3hrwjkocru"
Content-Disposition: inline
In-Reply-To: <1bdf911d-383a-4ea3-9a33-f8ee6e8f26e4@kernel.org>


--usfe2x3hrwjkocru
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 11:50:18AM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2026 10:25, Thierry Reding wrote:
> >=20
> >>>       dt-bindings: phy: tegra-xusb: Document Type C support
> >>
> >> No acks, but that is waiting for one month so it is fine.
> >=20
> > It's got a Reviewed-by from Rob and there were no corresponding driver
> > changes associated with it. There's literally no reason for this to go
> > in through a subsystem tree.
>=20
> There are reasons - process and technical:
> 1. It's a subsystem maintainer's patch, not yours. You rather should
> have reason to take someone else's patches.
>=20
> 2. Conflict in that file.
>=20
>=20
> >=20
> >>>       dt-bindings: clock: tegra124-dfll: Convert to json-schema
> >>>       dt-bindings: interrupt-controller: tegra: Fix reg entries
> >>>       dt-bindings: arm: tegra: Add missing compatible strings
> >>>       dt-bindings: phy: tegra: Document Tegra210 USB PHY
> >>>       dt-bindings: memory: Add Tegra210 memory controller bindings
> >>>       dt-bindings: memory: tegra210: Mark EMC as cooling device
> >>
> >> That's even my subsystem and I did not ack it. You did not even sent it
> >> to me as requested by MAINTAINERS file (+dt is ignore alias), so
> >> obviously I did not even had a chance to ack it.
> >=20
> > Ugh... really? I was Cc'ed to you as a DT maintainer as well as the
> > devicetree mailing list, so I'm sure you've seen it. This had also been
>=20
> Really, you are supposed to use get_maintainers.pl. Not invent the CC
> list, not come with own filtered list.
>=20
> I understand that my non dt address disappears when running
> get_maintainers.pl on entire set.
>=20
> But if you sent that patch targetting subsystem instead of combining 6
> or 7 subsystems at once, it would pop up.
>=20
> And yes, you are not supposed to mix 7 different subsystems in single
> patchset. That's basic!

Pft... you're being unreasonable. These are all relatively trivial
changes that have at one point or another been already reviewed. Do you
seriously expect me to turn these into 7 different patch series so that
everyone gets to spend even more time dealing with these?

> But sure, let's skip memory controllers patch cc list and:
>=20
> > reviewed by Rob a long time ago, and honestly, it's also quite trivial.
> > It's been on the list for a month and there were no objections, so it
> > does pass all of the criteria you mentioned before.
>=20
> No objections because you did not cc people. How can you claim "no
> objections from person foo" if you do not cc person "foo", because you
> do not use get_maintainers.pl?
>=20
> Look, find me here phy mantainers:
>=20
> https://lore.kernel.org/all/20260223143305.3771383-7-thierry.reding@kerne=
l.org/

It's an extremely trivial, one-line change to an existing binding. There
is no interaction with the driver whatsoever, why would anyone outside
of the DT and Tegra maintainers even want to look at this?

> >> And we even had few days ago talk were I explained you how these
> >> bindings must go. Seeing pull request completely ignoring that
> >> discussion is just huge surprise.
> >>
> >> No, it cannot go in. Send patches to proper maintainers first.
> >=20
> > Stop making these baseless accusations, Krzysztof. You were on Cc and
>=20
> Not using get_maintainers.pl so not ccing right address is not baseless.
> This is the fact.

I use get_maintainers.pl but filter down based on common sense.

> Neither phy, nor interrupts, nor clocks were sent to right people.

Again, these are patches that were all on the list previously, sent to
the right people at the time. They hadn't been picked up by now, so I
resent them, to the DT maintainers only, to give you guys a chance to
object in case there were any new things you were looking for since the
original submissions.

> You mixed 6 or 7 different subsystems in on patchset, but you call my
> remarks as baseless. You use several adjectives "trivial", "baseless",
> but no actual facts.
>=20
> Final commentary:
> Stop taking patches from other subsystems, just because you want to
> streamline your DTS. You are bypassing other subsystems review, other
> people trees, and that's not acceptable.

You know, I'll do just that. In fact, I'll just stop working on these
cleanup patches. It's a shame because I really wanted to get off your
wall of shame by this year's LPC, but you're making this needlessly
complicated and I'm out of patience.

Thierry

--usfe2x3hrwjkocru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLq1wACgkQ3SOs138+
s6F40g/9Gm19ZLx1L7N8IJkoh+28EPi9w1WAljI6m1+RYsRafgAChhheNg+nR2Nu
NDxwA4yrxYxDH+yUkY2ACVJ68/qJYjLdVgQuQo9ZeHSNQZqtXhqEQFjXKGAupp3P
NB08YPOwUgNHj9vY21Hh1pleA1V6y+t2y+MVJa/BdVFMD80j0tm9dsY3ddxwIOiT
gXpLIBVJIETg01auOXA21zmqzHWJeAajBXP26Qs3NOwrgc1pm8+hxDN5zE1bUDdu
2HRTlOASRe3tyLtKE1lG9ooEgnMvVzQ9Jlxu36nUM9cxEu8ySONMXQofxylp2rNM
YZrP/e0f/QJtySGUg7deK7eH5wveXvcalMHLbgYEcrjxlqgGYNkc+3MV+1YdIfAR
uG2Dl0tqfSagbLM69I3p8UG4DppH9U+sIT/sss1IbaCeXSKLeGmDh+6x8pMgYhrL
40lGOnREYU8VcBcWZJiRDe1vYOpTBT5ujQkb9KhGxFl3UaVr9u7NPcEOkEJ1qJ6E
L15rjoJPy9XyWEPiw16rxhj/sOQyZVvVEKjanL5VlFfrbpb8SNIojiRnuou5wfzi
b5aVp2RaXnkOIOnLkvcUjTbmI5ggmCzJuV6cdQUtJVHrNGDR348WkLcsCD87ORM7
3LZqzbWSnoEKnSyFlk0bvRatyTGDmxJf1AmH3zy7mDB31ETHY+s=
=Wqy9
-----END PGP SIGNATURE-----

--usfe2x3hrwjkocru--

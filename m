Return-Path: <SRS0=6SxN=ER=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3EFCA0FE9
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 06:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDFA9C433C9; Fri,  1 Sep 2023 06:33:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 590DDC433C7;
	Fri,  1 Sep 2023 06:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 590DDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693550003; x=1725086003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m64vTGuTn+LyymqjWnqc46/AIGoEDr1fAhPkx94h6g8=;
  b=0gejdM8xkx1GMHMgC+3fT7OWz706e8SxOYZ4SaFkDyYae9c8LJBE98Lg
   lJjPtgRwJfw44hFZBCehqgDanMQkZxQ/PWo4kH7B7wSUyxj+GwDc0IPkr
   pERug6UMGnNQKdKp4CAMTA7HSfkIXJKK3ZtHHXixc5CaAmlVhRy5xrzbS
   X/DJEcvmCYATdUlgZtowfEIejFkPLXg3LIh5ey5iFicvg980qM9Mvp2Qp
   sUiwAhd/zvKWSb7VTp2aoO6V68Eudl43gg5vGZvb8//7U/5aLABExNEPl
   Z6/lMHK0F2G1q3dgPLciYHNsL3HlYNeuV0aliKSlE8L8tx4TdSVg1ztu7
   A==;
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="asc'?scan'208";a="232862143"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 23:33:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 23:32:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 23:32:44 -0700
Date: Fri, 1 Sep 2023 07:32:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd
 Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	<loongson-kernel@lists.loongnix.cn>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pm@vger.kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v2 3/5] soc: loongson: loongson_pm2: Drop useless
 of_device_id compatible
Message-ID: <20230901-doubling-multiple-8b72b062e622@wendy>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>
 <20230831-ambition-refusing-08e63b345573@spud>
 <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HoQ3/6k+9svD/8I7"
Content-Disposition: inline
In-Reply-To: <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>

--HoQ3/6k+9svD/8I7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 11:05:12AM +0800, Binbin Zhou wrote:
> Hi Conor:
>=20
> Thanks for your reply.
>=20
> On Thu, Aug 31, 2023 at 11:15=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, Aug 31, 2023 at 07:43:13PM +0800, Binbin Zhou wrote:
> > > Now, "loongson,ls2k0500-pmc" is used as fallback compatible, so the
> > > ls2k1000 compatible in the driver can be dropped directly.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  drivers/soc/loongson/loongson2_pm.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongs=
on/loongson2_pm.c
> > > index 796add6e8b63..5ffb77afd9eb 100644
> > > --- a/drivers/soc/loongson/loongson2_pm.c
> > > +++ b/drivers/soc/loongson/loongson2_pm.c
> > > @@ -197,7 +197,6 @@ static int loongson2_pm_probe(struct platform_dev=
ice *pdev)
> > >
> > >  static const struct of_device_id loongson2_pm_match[] =3D {
> > >       { .compatible =3D "loongson,ls2k0500-pmc", },
> > > -     { .compatible =3D "loongson,ls2k1000-pmc", },
> >
> > What about older devicetrees that do not have the fallback? Aren't you
> > going to remove support for those?
>=20
> This driver was just merged in during the v6.6 window, and no release
> will use it until now.

Ahh, thanks for the info. Your commits 1-3 should then all have Fixes:
tags pointing to the commits tat introduced the problems, if you intend
getting these applied as fixes before v6.6 gets released.

Thanks,
Conor.

> commit 67694c076bd7 soc: loongson2_pm: add power management support
> commit 6054a676e969 soc: dt-bindings: add loongson-2 pm
>=20
> Of course, it was our mistake not to make better use of fallback
> compatible when submitting the driver, and we hope to fix this mistake
> soon.
> Also, this driver will only be used by the LoongArch architecture, no
> need to worry about other architectures.
>=20
> Thanks.
> Binbin
> >
> > >       {},
> > >  };
> > >
> > > --
> > > 2.39.3
> > >

--HoQ3/6k+9svD/8I7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPGFYgAKCRB4tDGHoIJi
0vSUAQDcrB5/73rfmCNAiT2jQA1ruGVppzf3RjC+q0NLyXn7+AD9FlXDDVIXG0U4
83Jc8qNKJVsTNg62hZ8YWLQVEyARvA8=
=1aNe
-----END PGP SIGNATURE-----

--HoQ3/6k+9svD/8I7--

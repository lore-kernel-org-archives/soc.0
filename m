Return-Path: <cixi.geng@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE10C71145
	for <soc@archiver.kernel.org>; Thu, 24 Aug 2023 06:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C87D9C433C7; Thu, 24 Aug 2023 06:27:49 +0000 (UTC)
Received: from out-30.mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCA31C433C9
	for <soc@kernel.org>; Thu, 24 Aug 2023 06:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCA31C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692858465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6IxgWmKRKi+I5lqpm5Wgd0S2sdauV2HZZ0NQlY4DP4=;
	b=dfhY3alx1/XKkgAfnlq82B8EZDL1jL9RntK0zdUXmkn83OszAv5QKemGoodf/iCuojCiwN
	a8HtZWrVsq377brYfWITHfS2t/IEFOkz6vWPlYLutMoYu3slrPeYSdKeN4QuP5p65ZAwWI
	DtIo3mDR00VnADl5HMeppCF5Tjg7WtI=
Date: Thu, 24 Aug 2023 06:27:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: cixi.geng@linux.dev
Message-ID: <2aeec29689a56fcfa60aa499f73f9a10f783c4ec@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] arm64: dts: sprd: fix the cpu node for UMS512
List-Id: <soc.lore.kernel.org>
To: "Chunyan Zhang" <zhang.lyra@gmail.com>, "SoC Team" <soc@kernel.org>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: conor+dt@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cixi.geng1@unisoc.com
In-Reply-To:
 <CAAfSe-sorWk5zhzevAoxwbiyk2YoDU9d47FLXcT43q1ZwHdvdg@mail.gmail.com>
References:
 <CAAfSe-sorWk5zhzevAoxwbiyk2YoDU9d47FLXcT43q1ZwHdvdg@mail.gmail.com>
 <20230711162346.5978-1-cixi.geng@linux.dev>
X-Migadu-Flow: FLOW_OUT

August 17, 2023 at 4:26 PM, "Chunyan Zhang" <zhang.lyra@gmail.com> wrote:


>=20
>=20On Wed, 12 Jul 2023 at 00:24, Cixi Geng <cixi.geng@linux.dev> wrote:
>=20
>=20>=20
>=20> From: Cixi Geng <cixi.geng1@unisoc.com>
> >=20
>=20>  The UMS512 Socs have 8 cores contains 6 a55 and 2 a75.
> >  modify the cpu nodes to correct information.
> >=20
>=20>  Fixes: 2b4881839a39 ("arm64: dts: sprd: Add support for Unisoc's U=
MS512")
> >  Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> >=20
>=20
> Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
>=20
>=20Thanks,
> Chunyan
>=20
Hi=20All=EF=BC=8C
please help to review this patch=EF=BC=8C If there are no issues, I hope =
to apply as soon as possible=EF=BC=8Cthanks=EF=BC=81
> >=20
>=20> ---
> >  arch/arm64/boot/dts/sprd/ums512.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
>=20>  diff --git a/arch/arm64/boot/dts/sprd/ums512.dtsi b/arch/arm64/boo=
t/dts/sprd/ums512.dtsi
> >  index 024be594c47d..97ac550af2f1 100644
> >  --- a/arch/arm64/boot/dts/sprd/ums512.dtsi
> >  +++ b/arch/arm64/boot/dts/sprd/ums512.dtsi
> >  @@ -96,7 +96,7 @@ CPU5: cpu@500 {
> >=20
>=20>  CPU6: cpu@600 {
> >  device_type =3D "cpu";
> >  - compatible =3D "arm,cortex-a55";
> >  + compatible =3D "arm,cortex-a75";
> >  reg =3D <0x0 0x600>;
> >  enable-method =3D "psci";
> >  cpu-idle-states =3D <&CORE_PD>;
> >  @@ -104,7 +104,7 @@ CPU6: cpu@600 {
> >=20
>=20>  CPU7: cpu@700 {
> >  device_type =3D "cpu";
> >  - compatible =3D "arm,cortex-a55";
> >  + compatible =3D "arm,cortex-a75";
> >  reg =3D <0x0 0x700>;
> >  enable-method =3D "psci";
> >  cpu-idle-states =3D <&CORE_PD>;
> >  --
> >  2.34.1
> >
>

Return-Path: <SRS0=kvJR=QD=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AFCCD5BC8
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 13:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4566C4CEC7; Thu,  5 Sep 2024 13:23:58 +0000 (UTC)
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 284E3C4CEC4
	for <soc@kernel.org>; Thu,  5 Sep 2024 13:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 284E3C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2CED0114027F;
	Thu,  5 Sep 2024 09:23:56 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 09:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725542636;
	 x=1725629036; bh=fY+Pos6oeB0Ir967LtcUDK7rxN7His5a1kcumbhcDmM=; b=
	YaejBSKOxQsoBWBrQc4uQhRLDxSOG56GyPZUvwW85M4RAET28nPXcQqfKped8QpU
	/Jn8RQdpS4rEQxjNdimFw/gYdacFhbjTfgQD/JE5QnbiOY0r0oZNK6wgG2KxXh1d
	kX/QrIWEFWHZZJGyhrK+DjUmaxI9ntZSUFH8Ut9tSgaS7TfcWMPz6US8pwOWlH4u
	Z0NBmv06jqRrDU0U/+dDQXz0oVgsaqBAzisI2Grclw8hmJWL+xAgN2UUIAipAPEx
	8lLvAFSmhaL/qLVoMS4m2mhsFI5LR9F9GNkPNCVUF+shmWFsyHTzo7N9A10fv7wg
	5jQtw0wMTc8I4Vbk5ChQrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725542636; x=
	1725629036; bh=fY+Pos6oeB0Ir967LtcUDK7rxN7His5a1kcumbhcDmM=; b=r
	slMrtSm9OMLj9Qvj5eof9ECORPLAMv/xA9v5HTIQwKJg/ZfITjqQNFvTOQPbD3k9
	dFODs9GSN4rpZFEnaxAfZyMtYatu1/RYI36kJJvJ31paSd1I2lQ0SLQDDCFmv+Eq
	QvKpMVEIoYGC/35M/KnNgHJlL6Qp8jO1BZD1CU1BzSm3S/yBBUwY2G+vRVMkbzd2
	cNz+oh+S7Q76DqlvDkczxWWA51HAs78t3y90DlXW4vS7m/LnkHRQLMjlapWIvA+f
	ZnX6pnkmUBIbOblrHIRHNW/BFC7C4wEFiyqkmt3Q2nwgKwTw26sEzh6Rq+xNYDDR
	5h/uhIae4/ENJozq8Mhnw==
X-ME-Sender: <xms:67DZZoA5pZp2NMCErlSXp12rf6Pn8bemUrwnjhpliE-HiHzw-gkeZg>
    <xme:67DZZqiX-JOcYh-lQyhxWolh8ruMQqU3JXGNhDwhX9bz4ZmMNxGwLSKzqDVOwkV0a
    zqlGxuXHmFlZWm8-us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrmhhivghnsehflhgvthihrdhnvg
    htpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrdhnvghtpdhrtghpthhtohephh
    gvihhkohesshhnthgvtghhrdguvg
X-ME-Proxy: <xmx:67DZZrnaWc_lQ-q4Rtp8gqZU4ZQEn-Q_ttuOBsxORryr8pwGHVvcew>
    <xmx:67DZZuzCM1luWnpE8ekPSCijLjWDJufvZFh_3e6ntTx2NRfU72sr-w>
    <xmx:67DZZtTK_RGDQQWn2TmAqr6Gq_7t2WAWAH8UEV6dTep8oFXwAzl8oA>
    <xmx:67DZZpZwoAHQUpwzur4MGRbyAevKkrUfkD7cNZBvw_E5PLDlRVxHzg>
    <xmx:7LDZZmKAf17-4fslsQCsmyZ_eTda6CcXvtdjFpPsxtTFOKPBAfW8eA5D>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B9B442220071; Thu,  5 Sep 2024 09:23:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 05 Sep 2024 13:23:34 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Damien FLETY" <damien@flety.net>, "Olof Johansson" <olof@lixom.net>,
 "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: "soc@kernel.org" <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-Id: <52a52558-2f7a-41ca-a0ee-98ef4eca3e6e@app.fastmail.com>
In-Reply-To: 
 <CBBY-R4n8r7s8-gRkQLEWfFmBE-2ncks_UUQnnajujY-KYz4Xug2rwDI_pOZYLBi2d3qy-gP9c4l0i61ptlm39t_wscyvJPVV5CTlsdm-as=@flety.net>
References: 
 <bZF0liAaH-7lJuzf_4iIfAWAgwYauu7IpIJMMpY7BT8mZXiKZFZ797Sa9gONDEt2wIFlLd4l10qSfs44ZAiBJ7_c3yvAFci4kuOdeYy7ZQU=@flety.net>
 <CBBY-R4n8r7s8-gRkQLEWfFmBE-2ncks_UUQnnajujY-KYz4Xug2rwDI_pOZYLBi2d3qy-gP9c4l0i61ptlm39t_wscyvJPVV5CTlsdm-as=@flety.net>
Subject: Re: PATCH: Turing RK1 DTB Fan
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024, at 08:41, Damien FLETY wrote:
> Sorry I'm not accustomed to patch and even less kernel patches...
>
> Add support for Turing RK1 official fan
> ---


Hi Damien,

I found this patch in the backlog and noticed that you sent it to the
wrong place. Please address future versions to Heiko St=C3=BCbner and the
linux-rockchip mailing list (added to Cc here).

I have not checked the actual patch contents in detail, but please
ensure you follow these steps:

- Make sure that your patch description (everything above the first
  three dashes, ---) makes sense as a git changelog text. See
  'git log arch/arm64/boot/dts/rockchip' for other examples)

- Add a Signed-off-by line, as documented in
  Documentation/process/submitting-patches.rst

- Use 'git send-email' to send the patch in a form that can
  be applied from the mailing list.

      Arnd

(fullquote below, no further comments)

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi=20
> b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> index dbaa94ca69f4..1e4d2d3c469f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> @@ -65,6 +65,47 @@ vcc_1v1_nldo_s3: vcc-1v1-nldo-s3-regulator {
>         };
>  };
>=20
> +&package_thermal {
> +       polling-delay =3D <1000>;
> +
> +       trips {
> +               trip_passive: trip_passive {
> +                       temperature =3D <40000>;
> +                       hysteresis =3D <2000>;
> +                       type =3D "passive";
> +               };
> +    trip_active: trip_active {
> +                       temperature =3D <45000>;
> +                       hysteresis =3D <2000>;
> +                       type =3D "active";
> +               };
> +    trip_hot: trip_hot {
> +                       temperature =3D <80000>;
> +                       hysteresis =3D <2000>;
> +                       type =3D "hot";
> +               };
> +       };
> +
> +       cooling-maps {
> +               map0 {
> +                       trip =3D <&trip_passive>;
> +                       cooling-device =3D <&fan 0 1>;
> +               };
> +    map1 {
> +      trip =3D <&trip_active>;
> +      cooling-device =3D <&fan 1 4>;
> +    };
> +    map2 {
> +      trip =3D <&trip_hot>;
> +      cooling-device =3D <&fan 4 5>;
> +    };
> +    map3 {
> +      trip =3D <&package_crit>;
> +      cooling-device =3D <&fan 5 5>;
> +    };
> +       };
> +};
> +
>  &combphy2_psu {
>         status =3D "okay";
>  };
>
> Le jeudi 1 ao=C3=BBt 2024 =C3=A0 10:16, Damien FLETY <damien@flety.net=
> a =C3=A9crit :
>>=20
>> Support the official cooling fan on Turing RK1.
>>=20
>> --- rk3588-turing-rk1.dtsi 2024-08-01 08:07:42.967506469 +0000
>> +++ src/linux/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi 202=
4-08-01 08:08:58.292765373 +0000
>> @@ -65,47 +65,6 @@
>>   };
>>  };
>> =20
>> -&package_thermal {
>> - polling-delay =3D <1000>;
>> -
>> - trips {
>> - trip_passive: trip_passive {
>> - temperature =3D <40000>;
>> - hysteresis =3D <2000>;
>> - type =3D "passive";
>> - };
>> -    trip_active: trip_active {
>> - temperature =3D <45000>;
>> - hysteresis =3D <2000>;
>> - type =3D "active";
>> - };
>> -    trip_hot: trip_hot {
>> - temperature =3D <80000>;
>> - hysteresis =3D <2000>;
>> - type =3D "hot";
>> - };
>> - };
>> -
>> - cooling-maps {
>> - map0 {
>> - trip =3D <&trip_passive>;
>> - cooling-device =3D <&fan 0 1>;
>> - };
>> -    map1 {
>> -      trip =3D <&trip_active>;
>> -      cooling-device =3D <&fan 1 4>;
>> -    };
>> -    map2 {
>> -      trip =3D <&trip_hot>;
>> -      cooling-device =3D <&fan 4 5>;
>> -    };
>> -    map3 {
>> -      trip =3D <&package_crit>;
>> -      cooling-device =3D <&fan 5 5>;
>> -    };
>> - };
>> -};
>> -
>>  &combphy2_psu {
>>   status =3D "okay";
>>  };
>>=20
>>=20
>> Damien FLETY

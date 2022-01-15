Return-Path: <SRS0=i07D=R7=samsung.com=alim.akhtar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AB2C433F5
	for <soc@archiver.kernel.org>; Sat, 15 Jan 2022 15:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15B05C36AE7; Sat, 15 Jan 2022 15:31:47 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85C41C36AEA
	for <soc@kernel.org>; Sat, 15 Jan 2022 15:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85C41C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220115153133epoutp037270beea908ab13e326bfda6d612abcd~Ke2ZILq4N1511415114epoutp03B
	for <soc@kernel.org>; Sat, 15 Jan 2022 15:31:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220115153133epoutp037270beea908ab13e326bfda6d612abcd~Ke2ZILq4N1511415114epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1642260693;
	bh=GC0IEZYTtOkW8/9dMWkyiur5sOpA+xfbz9fhvia3ruE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=pmMDMdllNTpXSRpzm9NxogbyoO47h+KwyI4eKJXE+2DCD60MXSVeV3H2pwjVI5KO8
	 2qiERjMtO1juyEscRTUXAjGoaY0wASAgnO/9I/qDUBo7qMtCZy/DuEryHjr+fiR5CB
	 YW22qbndFp2v3NkHy9ru15yGxgWaC9KBrjk1Ka9Y=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20220115153132epcas5p1dda2b5b9a6e43f90c432d2d76a4a0e22~Ke2YuNUUh1957819578epcas5p1G;
	Sat, 15 Jan 2022 15:31:32 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4JbhwK5xfSz4x9Ps; Sat, 15 Jan
	2022 15:31:29 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.D0.46822.2D8E2E16; Sun, 16 Jan 2022 00:31:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20220115153128epcas5p1eaf67a9a43b88d6d27bd1e46f60ecba4~Ke2VB11lQ2352023520epcas5p1D;
	Sat, 15 Jan 2022 15:31:28 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220115153128epsmtrp2cf42acd00e212040137d2a4fb286cc33~Ke2U7foCB1909819098epsmtrp2m;
	Sat, 15 Jan 2022 15:31:28 +0000 (GMT)
X-AuditID: b6c32a4a-dfbff7000000b6e6-28-61e2e8d2f3ce
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.09.08738.1D8E2E16; Sun, 16 Jan 2022 00:31:29 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20220115153124epsmtip29068f73df514eee36c15e1f57b8f57e0~Ke2Q2uhzQ2982429824epsmtip2q;
	Sat, 15 Jan 2022 15:31:24 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Rob Herring'" <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "'linux-arm-kernel'" <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, "'SoC Team'" <soc@kernel.org>, "'linux-clk'"
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>, "'Olof
	Johansson'" <olof@lixom.net>, "'Linus Walleij'" <linus.walleij@linaro.org>,
	"'Catalin Marinas'" <catalin.marinas@arm.com>, "'Krzysztof Kozlowski'"
	<krzysztof.kozlowski@canonical.com>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'linux-samsung-soc'"
	<linux-samsung-soc@vger.kernel.org>, "'Pankaj Dubey'"
	<pankaj.dubey@samsung.com>, <linux-fsd@tesla.com>, "'Arjun K V'"
	<arjun.kv@samsung.com>, "'Aswani Reddy'" <aswani.reddy@samsung.com>, "'Ajay
 Kumar'" <ajaykumar.rs@samsung.com>, "'Sriranjani P'"
	<sriranjani.p@samsung.com>, "'Chandrasekar R'" <rcsekar@samsung.com>,
	"'Shashank Prashar'" <s.prashar@samsung.com>
In-Reply-To: <CAL_JsqKDbzy8y61Oj8Ey++atoMn1HYPyDZRc_cJQCe_tfkDGxQ@mail.gmail.com>
Subject: RE: [PATCH 14/23] arm64: dts: fsd: Add initial device tree support
Date: Sat, 15 Jan 2022 21:01:24 +0530
Message-ID: <08ba01d80a24$f79a88f0$e6cf9ad0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIO4TNY4CmXUn6BI0nWbR2hr69QagKuNmZ/AcRhnYYBgiKLY6vG4Thw
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02TeVATZxjG/TbZTWAm7Rpg+ARH6DogYMFEQvohR50RMSozxKo9rDO4AzuB
	kstsoB4MZTi0ImIVqyUjoCKowAglUGOoFhFbLUg5FG1LiwcO96EggwWlCYst//3e45n3fb5D
	yBMPE27CBK2RMWhpNUU48n+46evj3973hJZkdgei+tEbfHThkpWPGsy1AjRamgNQUWMLjr4f
	nsLQiZkLGKp+2omj5zl/4+jxwCeow3qaQN/9dh1Dvz4YJ9C52gkBMrVacJR1rVGAbg4dxFGh
	pQCgpw9mCPTn0GV8rbOiorACKExpRwhFddkhQtHV+SOhMJ//SnHvdjquyK0pA4o36QUCxXj1
	MqXDjsTQeIaOYwyejDZWF5egVYVRm7fGrIsJkkuk/tJg9AHlqaU1TBgVEaX0j0xQ25xRnsm0
	OsmWUtIsS60KDzXokoyMZ7yONYZRjD5OrZfpA1hawyZpVQFaxrhGKpGsDrI17kqMn62K0+e/
	wfZM3w1JA5X3QTZwEEJSBnuPPyGygaNQTNYB+PpyL+CCFwC+zOrBuWAcwDt1Lby3kompNAFX
	sAI4kNstsBfEZD+A5kyJnQnSH1qKDxB2diZ9YPHglTkBj2wjYO3YcdxecCC3wBvFNZidncjN
	MGvQPJfnk16wPOvu3IIiMhiO9oxhHC+Gd/J7+HbmkSth6dnB+Y084atnpTg3LBJml57ncT2u
	sP9W49xgSOY5wH+aO/icIAL2vj5EcOwEB36pEXDsBsdHrtnyQhsnwhxrIJdOgSWFP89LP4T1
	907z7S080hdWWldxo96BR6Z7ME4pgl8fEHPdXjBj5P680h0eO3wY51gBb/3egn8D3jMtMGZa
	YMy0wIDp/2FnAL8MLGH0rEbFsEH61Vrmy//uO1anqQZz795vkwU8fjQW0AAwIWgAUMijnEVH
	Dd20WBRH793HGHQxhiQ1wzaAINtpH+O5ucTqbB9Ha4yRyoIlMrlcLgsOlEspV1GTqooWkyra
	yCQyjJ4xvNVhQge3NOz6imf6geTlm8JDSppfMusnP2r02L6zO299ZsNP1iVVsm2tFdNFbdH7
	J0sqG9dkTHxrLNr9mXAb4+LVIhopZsr/eN6x87ZTyqCLuws5I/P+/GJu5ZjL7ETEhr9SfeXJ
	EwWLK/JbplL7T+lDpF2XlqUz0WOnvBctj/aLal8qwJuuvDD5TnqE7mDNZQ+HVpLeF1t3mVyp
	fSkHT1a+r/ziqlPh0t0fF4AzD8s3yqNivUevllgySkKjzj56tWU7O7uuLdLiPC7t60vYeqJ+
	xblU9y6s4FPHjEUq3KM50b1TYhbs3Rjre1KS0T68592iOnH42vAgZ2xDqynPJ7g718mk9DYb
	9muaKD4bT0v9eAaW/hftCtjigAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02ReUiTYRzHed6977t3A+n1CJ9mdIyyMNK0hKdD6SB7zYIOSMrChr2ouU15
	t7LEcEVTXKYWYfaWmlqzpnnMrGVqtVloUHaY6zJTV/OqKWZomcRcgf994Hv8vvCjBB7vcQkV
	r1SznFIml5Ji/I5FOn/5y74e2Qr7GEIPHY9wVHazHkfm2johcuizACpqfk6gmm/jGLowWYYh
	Y28HgUayPhGoeyASva6/QqL8tiYMPbWOkqik7ocQ8S9MBNI2NguRZSiDQIWmAoB6rZMk+jBU
	Saz3YioKKwDDa86SjNGQSTIfOxpIpvZaGtPecopgsm8bADN1qkDIjBrn7RDtE687xMrjj7Jc
	QOhBcdxURg2ZND6CHauyVGAakNUKdEBEQXoV/DGuEeqAmPKgTQAaLnX+E3ygtSZX6GJPeHPK
	/s9kBzCvzTEtkPRyaCpNJ53sRS+FpYN3p00CupOETzLvA1dCi8EW3RWB0yWid8JHpbcxJ3vS
	EVA7WEs4GacXw3Lts+nTbvRq6LANYy52h62XbLiTBfQyeLZbC/6zvnhQ4Jq3AE580ROuFWFQ
	p78mcHm8Yf/jZmEu8ORnVPEzqvgZVfyMyFWAG8AcNkmliFWoApOClGyyv0qmUB1RxvrHJCqM
	YPr9fn4m0GAY9jcDjAJmACmB1Msth+uSebgdkh1PYbnEaO6InFWZgQ+FS73dXuhaoz3oWJma
	TWDZJJb7r2KUSKLB2BLlguf6fQnWG+7lPmFv46pDlkgvhzt2jb4USRgOiPm+ZN+1ayL2JC5U
	183SfI3/aTxJLFS2NgU9DH1Q3JmjTI5o6kmFWyeke4nvvd0XN554U4l9vmMrmfxONtxqC7Yn
	b94vCfjdcr6/MTGm+lf6cUlQu3Vr4Uclq2IXfTsg316WMldcrm2LVKeChFXcubFF2f1jYxeL
	T/tWeXblvvtUZMYVUburPqgbN0VvocJ6QiavvzNt10d5cXExze20ruhLZIdkJPDwhmAYmi6q
	zu9y37GNt802zvqalun9c+XaP7/PZHR5D9y7a2HDXw2d5CYi80LsBcE2ueW9cUM+bw6W4qo4
	WaCfgFPJ/gIokuhDbQMAAA==
X-CMS-MailID: 20220115153128epcas5p1eaf67a9a43b88d6d27bd1e46f60ecba4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220113122413epcas5p46cb2cafb73936c423017240f98f72845
References: <CGME20220113122413epcas5p46cb2cafb73936c423017240f98f72845@epcas5p4.samsung.com>
	<20220113121143.22280-1-alim.akhtar@samsung.com>
	<20220113121143.22280-15-alim.akhtar@samsung.com>
	<CAL_JsqKDbzy8y61Oj8Ey++atoMn1HYPyDZRc_cJQCe_tfkDGxQ@mail.gmail.com>



>-----Original Message-----
>From: Rob Herring =5Bmailto:robh+dt=40kernel.org=5D
>Sent: Friday, January 14, 2022 8:16 AM
>To: Alim Akhtar <alim.akhtar=40samsung.com>
>Cc: linux-arm-kernel <linux-arm-kernel=40lists.infradead.org>; linux-
>kernel=40vger.kernel.org; SoC Team <soc=40kernel.org>; linux-clk <linux-
>clk=40vger.kernel.org>; devicetree=40vger.kernel.org; Olof Johansson
><olof=40lixom.net>; Linus Walleij <linus.walleij=40linaro.org>; Catalin Ma=
rinas
><catalin.marinas=40arm.com>; Krzysztof Kozlowski
><krzysztof.kozlowski=40canonical.com>; Sylwester Nawrocki
><s.nawrocki=40samsung.com>; linux-samsung-soc <linux-samsung-
>soc=40vger.kernel.org>; Pankaj Dubey <pankaj.dubey=40samsung.com>; linux-
>fsd=40tesla.com; Arjun K V <arjun.kv=40samsung.com>; Aswani Reddy
><aswani.reddy=40samsung.com>; Ajay Kumar <ajaykumar.rs=40samsung.com>;
>Sriranjani P <sriranjani.p=40samsung.com>; Chandrasekar R
><rcsekar=40samsung.com>; Shashank Prashar <s.prashar=40samsung.com>
>Subject: Re: =5BPATCH 14/23=5D arm64: dts: fsd: Add initial device tree su=
pport
>
>On Thu, Jan 13, 2022 at 6:24 AM Alim Akhtar <alim.akhtar=40samsung.com>
>wrote:
>>
>> Add initial device tree support for =22Full Self-Driving=22 (FSD) SoC Th=
is
>> SoC contain three clusters of four cortex-a72 CPUs and various
>> peripheral IPs.
>
>Please make sure you run this thru 'make dtbs_check'. Fix schema warnings =
as
>much as possible and all dtc warnings. If shared with Samsung, there's
>probably a bit still missing. I see several warnings so I won't bother man=
ually
>reporting them here.
>
Thanks Rob for review, let me fix them in patch set v2.

>> Cc: linux-fsd=40tesla.com
>> Signed-off-by: Arjun K V <arjun.kv=40samsung.com>
>> Signed-off-by: Aswani Reddy <aswani.reddy=40samsung.com>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs=40samsung.com>
>> Signed-off-by: Sriranjani P <sriranjani.p=40samsung.com>
>> Signed-off-by: Chandrasekar R <rcsekar=40samsung.com>
>> Signed-off-by: Shashank Prashar <s.prashar=40samsung.com>
>> Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
>> ---
>>  MAINTAINERS                        =7C   8 +
>>  arch/arm64/Kconfig.platforms       =7C   6 +
>>  arch/arm64/boot/dts/Makefile       =7C   1 +
>>  arch/arm64/boot/dts/tesla/Makefile =7C   3 +
>>  arch/arm64/boot/dts/tesla/fsd.dts  =7C 140 ++++++
>> arch/arm64/boot/dts/tesla/fsd.dtsi =7C 715
>+++++++++++++++++++++++++++++
>>  6 files changed, 873 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/tesla/Makefile
>>  create mode 100644 arch/arm64/boot/dts/tesla/fsd.dts  create mode
>> 100644 arch/arm64/boot/dts/tesla/fsd.dtsi
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS index
>> fb18ce7168aa..02d56909c5e2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> =40=40 -2726,6 +2726,14 =40=40 S:       Maintained
>>  F:     Documentation/devicetree/bindings/media/tegra-cec.txt
>>  F:     drivers/media/cec/platform/tegra/
>>
>> +ARM/TESLA FSD SoC SUPPORT
>> +M:     Alim Akhtar <alim.akhtar=40samsung.com>
>> +M:     linux-fsd=40tesla.com
>> +L:     linux-arm-kernel=40lists.infradead.org (moderated for non-subscr=
ibers)
>> +L:     linux-samsung-soc=40vger.kernel.org
>> +S:     Maintained
>> +F:     arch/arm64/boot/dts/tesla*
>> +
>>  ARM/TETON BGA MACHINE SUPPORT
>>  M:     =22Mark F. Brown=22 <mark.brown314=40gmail.com>
>>  L:     linux-arm-kernel=40lists.infradead.org (moderated for non-subscr=
ibers)
>> diff --git a/arch/arm64/Kconfig.platforms
>> b/arch/arm64/Kconfig.platforms index 54e3910e8b9b..bb8a047c2359 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> =40=40 -267,6 +267,12 =40=40 config ARCH_TEGRA
>>         help
>>           This enables support for the NVIDIA Tegra SoC family.
>>
>> +config ARCH_TESLA_FSD
>> +       bool =22ARMv8 based Tesla platform=22
>> +       select ARCH_EXYNOS
>> +       help
>> +         Support for ARMv8 based Tesla platforms.
>> +
>>  config ARCH_SPRD
>>         bool =22Spreadtrum SoC platform=22
>>         help
>> diff --git a/arch/arm64/boot/dts/Makefile
>> b/arch/arm64/boot/dts/Makefile index 639e01a4d855..1ba04e31a438
>100644
>> --- a/arch/arm64/boot/dts/Makefile
>> +++ b/arch/arm64/boot/dts/Makefile
>> =40=40 -27,6 +27,7 =40=40 subdir-y +=3D rockchip  subdir-y +=3D socionex=
t
>> subdir-y +=3D sprd  subdir-y +=3D synaptics
>> +subdir-y +=3D tesla
>>  subdir-y +=3D ti
>>  subdir-y +=3D toshiba
>>  subdir-y +=3D xilinx
>> diff --git a/arch/arm64/boot/dts/tesla/Makefile
>> b/arch/arm64/boot/dts/tesla/Makefile
>> new file mode 100644
>> index 000000000000..a9818cda6b08
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/tesla/Makefile
>> =40=40 -0,0 +1,3 =40=40
>> +=23 SPDX-License-Identifier: GPL-2.0
>> +dtb-=24(CONFIG_ARCH_TESLA_FSD) +=3D =5C
>> +       fsd.dtb
>> diff --git a/arch/arm64/boot/dts/tesla/fsd.dts
>> b/arch/arm64/boot/dts/tesla/fsd.dts
>> new file mode 100644
>> index 000000000000..e9bbd3284de9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/tesla/fsd.dts
>> =40=40 -0,0 +1,140 =40=40
>> +// SPDX-License-Identifier: GPL-2.0
>
>Dual license dts files please.
>
>> +/*
>> + * Tesla FSD board device tree source
>> + *
>> + * Copyright (c) 2017-2021 Samsung Electronics Co., Ltd.
>> + *             https://www.samsung.com
>> + * Copyright (c) 2017-2021 Tesla, Inc.
>> + *             https://www.tesla.com
>> + */
>> +
>> +/dts-v1/;
>> +=23include =22fsd.dtsi=22
>> +
>> +/ =7B
>> +       model =3D =22Tesla Full Self-Driving (FSD) SoC=22;
>> +       compatible =3D =22tesla,fsd=22;
>> +
>> +       aliases =7B
>> +               serial0 =3D &serial_0;
>> +               serial1 =3D &serial_1;
>> +       =7D;
>> +
>> +       chosen =7B
>> +               stdout-path =3D &serial_0;
>
>> +               linux,initrd-start =3D <0xE0000000>;
>> +               linux,initrd-end =3D <0xE4F00000>;
>
>Bootloaders set these.
>
>> +               bootargs =3D =22console=3DttySAC0,115200n8
>
>Not needed with stdout-path.
>
>> +                       earlycon=3Dexynos4210,0x14180000 root=3D/dev/ram=
0
>
>earlycon is a debug option.
>
>> +                       init=3D/linuxrc=22;
>
>init and rootfs are user settings.
>
>> +       =7D;
>> +
>> +       memory=4080000000 =7B
>> +               device_type =3D =22memory=22;
>> +               reg =3D <0x0 0x80000000 0x2 0x00000000>;
>> +       =7D;
>> +=7D;
>> +
>> +&fin_pll =7B
>> +       clock-frequency =3D <24000000>;
>> +=7D;
>> +
>> +&serial_0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&serial_1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&clock_cmu =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&clock_imem =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&clock_peric =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&smmu_isp =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&clock_fsys0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&clock_fsys1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&smmu_peric =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&smmu_imem =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&smmu_fsys0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_2 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_3 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_4 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_5 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_6 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&hsi2c_7 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&pwm_0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&pwm_1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&mdma0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&mdma1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&pdma0 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> +
>> +&pdma1 =7B
>> +       status =3D =22okay=22;
>> +=7D;
>> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
>> b/arch/arm64/boot/dts/tesla/fsd.dtsi
>> new file mode 100644
>> index 000000000000..47cd9f20566e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
>> =40=40 -0,0 +1,715 =40=40
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Tesla Full Self-Driving SoC device tree source
>> + *
>> + * Copyright (c) 2017-2022 Samsung Electronics Co., Ltd.
>> + *             https://www.samsung.com
>> + * Copyright (c) 2017-2022 Tesla, Inc.
>> + *             https://www.tesla.com
>> + */
>> +
>> +=23include <dt-bindings/clock/fsd-clk.h> =23include
>> +<dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ =7B
>> +       compatible =3D =22tesla,fsd=22;
>> +       interrupt-parent =3D <&gic>;
>> +       =23address-cells =3D <2>;
>> +       =23size-cells =3D <2>;
>> +
>> +       aliases =7B
>> +               watchdog0 =3D &watchdog_0;
>> +               watchdog1 =3D &watchdog_1;
>> +               watchdog2 =3D &watchdog_2;
>> +               hsi2c0 =3D &hsi2c_0;
>> +               hsi2c1 =3D &hsi2c_1;
>> +               hsi2c2 =3D &hsi2c_2;
>> +               hsi2c3 =3D &hsi2c_3;
>> +               hsi2c4 =3D &hsi2c_4;
>> +               hsi2c5 =3D &hsi2c_5;
>> +               hsi2c6 =3D &hsi2c_6;
>> +               hsi2c7 =3D &hsi2c_7;
>
>Drop all these non-standard aliases.
>
>> +       =7D;
>> +
>> +       cpus =7B
>> +               =23address-cells =3D <2>;
>> +               =23size-cells =3D <0>;
>> +
>> +               cpu-map =7B
>> +                       cluster0 =7B
>> +                               core0 =7B
>> +                                       cpu =3D <&cpucl0_0>;
>> +                               =7D;
>> +                               core1 =7B
>> +                                       cpu =3D <&cpucl0_1>;
>> +                               =7D;
>> +                               core2 =7B
>> +                                       cpu =3D <&cpucl0_2>;
>> +                               =7D;
>> +                               core3 =7B
>> +                                       cpu =3D <&cpucl0_3>;
>> +                               =7D;
>> +                       =7D;
>> +
>> +                       cluster1 =7B
>> +                               core0 =7B
>> +                                       cpu =3D <&cpucl1_0>;
>> +                               =7D;
>> +                               core1 =7B
>> +                                       cpu =3D <&cpucl1_1>;
>> +                               =7D;
>> +                               core2 =7B
>> +                                       cpu =3D <&cpucl1_2>;
>> +                               =7D;
>> +                               core3 =7B
>> +                                       cpu =3D <&cpucl1_3>;
>> +                               =7D;
>> +                       =7D;
>> +
>> +                       cluster2 =7B
>> +                               core0 =7B
>> +                                       cpu =3D <&cpucl2_0>;
>> +                               =7D;
>> +                               core1 =7B
>> +                                       cpu =3D <&cpucl2_1>;
>> +                               =7D;
>> +                               core2 =7B
>> +                                       cpu =3D <&cpucl2_2>;
>> +                               =7D;
>> +                               core3 =7B
>> +                                       cpu =3D <&cpucl2_3>;
>> +                               =7D;
>> +                       =7D;
>> +               =7D;
>> +
>> +               /* Cluster 0 */
>> +               cpucl0_0: cpu=400 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x000>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl0_1: cpu=401 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x001>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl0_2: cpu=402 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x002>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl0_3: cpu=403 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x003>;
>> +                               enable-method =3D =22psci=22;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               /* Cluster 1 */
>> +               cpucl1_0: cpu=40100 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x100>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl1_1: cpu=40101 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x101>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl1_2: cpu=40102 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x102>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl1_3: cpu=40103 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x103>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               /* Cluster 2 */
>> +               cpucl2_0: cpu=40200 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x200>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl2_1: cpu=40201 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x201>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl2_2: cpu=40202 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x202>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               cpucl2_3: cpu=40203 =7B
>> +                               device_type =3D =22cpu=22;
>> +                               compatible =3D =22arm,cortex-a72=22;
>> +                               reg =3D <0x0 0x203>;
>> +                               enable-method =3D =22psci=22;
>> +                               clock-frequency =3D <2400000000>;
>> +                               cpu-idle-states =3D <&CPU_SLEEP>;
>> +                               next-level-cache =3D <&L2_0>;
>> +               =7D;
>> +
>> +               idle-states =7B
>> +                       entry-method =3D =22arm,psci=22;
>> +
>> +                       CPU_SLEEP: cpu-sleep =7B
>> +                               idle-state-name =3D =22c2=22;
>> +                               compatible =3D =22arm,idle-state=22;
>> +                               local-timer-stop;
>> +                               arm,psci-suspend-param =3D <0x0010000>;
>> +                               entry-latency-us =3D <30>;
>> +                               exit-latency-us =3D <75>;
>> +                               min-residency-us =3D <300>;
>> +                               status =3D =22okay=22;
>> +                       =7D;
>> +               =7D;
>> +
>> +               L2_0: l2-cache0 =7B
>> +                       compatible =3D =22cache=22;
>> +               =7D;
>> +       =7D;
>> +
>> +       arm-pmu =7B
>> +               compatible =3D =22arm,armv8-pmuv3=22;
>> +               interrupts =3D <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
>> +                            <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
>> +               interrupt-affinity =3D <&cpucl0_0>, <&cpucl0_1>, <&cpucl=
0_2>,
>> +                                    <&cpucl0_3>, <&cpucl1_0>, <&cpucl1_=
1>,
>> +                                    <&cpucl1_2>, <&cpucl1_3>, <&cpucl2_=
0>,
>> +                                    <&cpucl2_1>, <&cpucl2_2>, <&cpucl2_=
3>;
>> +       =7D;
>> +
>> +       psci =7B
>> +               compatible =3D =22arm,psci=22;
>> +               method =3D =22smc=22;
>
>> +               cpu_on =3D <0xC4000003>;
>> +               cpu_suspend =3D <0xC4000001>;
>> +               cpu_off =3D <0x84000002>;
>
>These codes are standardized since forever. Fix your firmware.
>
>> +       =7D;
>> +
>> +       timer =7B
>> +               compatible =3D =22arm,armv8-timer=22;
>> +               interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>> +                            <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>> +                            <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>> +                            <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>> +       =7D;
>> +
>> +       fin_pll: clock =7B
>> +               compatible =3D =22fixed-clock=22;
>> +               clock-output-names =3D =22fin_pll=22;
>> +               =23clock-cells =3D <0>;
>> +       =7D;
>> +
>> +       soc: soc =7B
>
>soc=400
>
>You should see a warning for this.
>
>> +               compatible =3D =22simple-bus=22;
>> +               =23address-cells =3D <2>;
>> +               =23size-cells =3D <2>;
>> +               ranges =3D <0x0 0x0 0x0 0x0 0x0 0x18000000>;
>> +               dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
>> +
>> +               gic: interrupt-controller=4010400000 =7B
>> +                       compatible =3D =22arm,gic-v3=22;
>> +                       =23interrupt-cells =3D <3>;
>> +                       interrupt-controller;
>> +                       reg =3D   <0x0 0x10400000 0x0 0x10000>, /* GICD =
*/
>> +                               <0x0 0x10600000 0x0 0x200000>; /* GICR_R=
D+GICR_SGI */
>> +               =7D;
>> +
>> +               smmu_isp: iommu=4012100000 =7B
>> +                       compatible =3D =22arm,mmu-500=22;
>> +                       reg =3D <0x0 0x12100000 0x0 0x10000>;
>> +                       =23iommu-cells =3D <2>;
>> +                       =23global-interrupts =3D <11>;
>> +                       interrupts =3D <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>=
, /* Global
>secure fault */
>> +                                    <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>, =
/* Global non-
>secure fault */
>> +                                    <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>secure interrupt */
>> +                                    <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>non-secure interrupt */
>> +                                    /* Performance counter interrupts *=
/
>> +                                    <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>, =
/* for CAM_CSI
>*/
>> +                                    <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>, =
/* for CAM_DP_0
>*/
>> +                                    <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>, =
/* for CAM_DP_1
>*/
>> +                                    <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CAM_ISP_0 */
>> +                                    <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CAM_ISP_1 */
>> +                                    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CAM_MFC_0 */
>> +                                    <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CAM_MFC_1 */
>> +                                    /* Per context non-secure context i=
nterrupts, 0-7
>interrupts */
>> +                                    <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_0 */
>> +                                    <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_1 */
>> +                                    <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_2 */
>> +                                    <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_3 */
>> +                                    <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_4 */
>> +                                    <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_5 */
>> +                                    <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_6 */
>> +                                    <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>; =
/* for
>CONTEXT_7 */
>> +                       status =3D =22disabled=22;
>
>IOMMU isn't really board specific, should it really be disabled?
>
>> +               =7D;
>> +
>> +               smmu_imem: iommu=4010200000 =7B
>> +                       compatible =3D =22arm,mmu-500=22;
>> +                       reg =3D <0x0 0x10200000 0x0 0x10000>;
>> +                       =23iommu-cells =3D <2>;
>> +                       =23global-interrupts =3D <7>;
>> +                       interrupts =3D <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>=
, /* Global
>secure fault */
>> +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>, =
/* Global non-
>secure fault */
>> +                                    <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>secure interrupt */
>> +                                    <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>non-secure interrupt */
>> +                                    /* Performance counter interrupts *=
/
>> +                                    <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>, =
/* for FSYS1_0 */
>> +                                    <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>, =
/* for FSYS1_1 */
>> +                                    <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>, =
/* for IMEM_0
>*/
>> +                                    /* Per context non-secure context i=
nterrupts, 0-3
>interrupts */
>> +                                    <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_0 */
>> +                                    <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_1 */
>> +                                    <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_2 */
>> +                                    <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>; =
/* for
>CONTEXT_3 */
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               smmu_peric: iommu=4014900000 =7B
>> +                       compatible =3D =22arm,mmu-500=22;
>> +                       reg =3D <0x0 0x14900000 0x0 0x10000>;
>> +                       =23iommu-cells =3D <2>;
>> +                       =23global-interrupts =3D <5>;
>> +                       interrupts =3D <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>=
, /* Global
>secure fault */
>> +                                    <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>, =
/* Global non-
>secure fault */
>> +                                    <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>secure interrupt */
>> +                                    <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, =
/* Combined
>non-secure interrupt */
>> +                                    /* Performance counter interrupts *=
/
>> +                                    <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>, =
/* for PERIC */
>> +                                    /* Per context non-secure context i=
nterrupts, 0-1
>interrupts */
>> +                                    <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>, =
/* for
>CONTEXT_0 */
>> +                                    <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>; =
/* for
>CONTEXT_1 */
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               smmu_fsys0: iommu=4015450000 =7B
>> +                       compatible =3D =22arm,mmu-500=22;
>> +                       reg =3D <0x0 0x15450000 0x0 0x10000>;
>> +                       =23iommu-cells =3D <2>;
>> +                       =23global-interrupts =3D <5>;
>> +                       interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>=
, /* Global
>secure fault */
>> +                                    <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>, /=
* Global non-
>secure fault */
>> +                                    <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /=
* Combined
>secure interrupt */
>> +                                    <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>, /=
* Combined non-
>secure interrupt */
>> +                                    /* Performance counter interrupts *=
/
>> +                                    <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, =
/* for FSYS0   */
>> +                                    /* Per context non-secure context i=
nterrupts, 0-1
>interrupts */
>> +                                    <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>, /=
* for CONTEXT_0
>*/
>> +                                    <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>; /=
* for CONTEXT_1
>*/
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_cmu: clock-controller=4011C10000 =7B
>
>Lowercase hex for unit-addresses.
>
>Also, arrange nodes in address order.
>
>> +                       compatible =3D =22tesla,fsd-clock-cmu=22;
>> +                       reg =3D <0x0 0x11C10000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22fin_pll=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_imem: clock-controller=4010010000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-imem=22;
>> +                       reg =3D <0x0 0x10010000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>,
>> +                               <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
>> +                               <&clock_cmu DOUT_CMU_IMEM_ACLK>,
>> +                               <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
>> +                       clock-names =3D =22fin_pll=22,
>> +                               =22dout_cmu_imem_tcuclk=22,
>> +                               =22dout_cmu_imem_aclk=22,
>> +                               =22dout_cmu_imem_dmaclk=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_peric: clock-controller=4014010000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-peric=22;
>> +                       reg =3D <0x0 0x14010000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>,
>> +                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
>> +                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>=
,
>> +                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_T=
BUCLK>,
>> +                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>=
,
>> +                               <&clock_cmu
>DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
>> +                       clock-names =3D =22fin_pll=22,
>> +                               =22dout_cmu_pll_shared0_div4=22,
>> +                               =22dout_cmu_peric_shared1div36=22,
>> +                               =22dout_cmu_peric_shared0div3_tbuclk=22,
>> +                               =22dout_cmu_peric_shared0div20=22,
>> +                               =22dout_cmu_peric_shared1div4_dmaclk=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_fsys0: clock-controller=4015010000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-fsys0=22;
>> +                       reg =3D <0x0 0x15010000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>,
>> +                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
>> +                               <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
>> +                               <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
>> +                       clock-names =3D =22fin_pll=22,
>> +                               =22dout_cmu_pll_shared0_div6=22,
>> +                               =22dout_cmu_fsys0_shared1div4=22,
>> +                               =22dout_cmu_fsys0_shared0div4=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_fsys1: clock-controller=4016810000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-fsys1=22;
>> +                       reg =3D <0x0 0x16810000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>,
>> +                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
>> +                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
>> +                       clock-names =3D =22fin_pll=22,
>> +                               =22dout_cmu_fsys1_shared0div8=22,
>> +                               =22dout_cmu_fsys1_shared0div4=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_mfc: clock-controller=4012810000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-mfc=22;
>> +                       reg =3D <0x0 0x12810000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22fin_pll=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               clock_csi: clock-controller=4012610000 =7B
>> +                       compatible =3D =22tesla,fsd-clock-cam_csi=22;
>> +                       reg =3D <0x0 0x12610000 0x0 0x3000>;
>> +                       =23clock-cells =3D <1>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22fin_pll=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               mdma0: mdma=4010100000 =7B
>> +                       compatible =3D =22arm,pl330=22, =22arm,primecell=
=22;
>> +                       reg =3D <0x0 0x10100000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23dma-cells =3D <1>;
>> +                       =23dma-channels =3D <8>;
>> +                       =23dma-requests =3D <32>;
>> +                       clocks =3D <&clock_imem IMEM_DMA0_IPCLKPORT_ACLK=
>;
>> +                       clock-names =3D =22apb_pclk=22;
>> +                       iommus =3D <&smmu_imem 0x800 0x0>;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               mdma1: mdma=4010110000 =7B
>> +                       compatible =3D =22arm,pl330=22, =22arm,primecell=
=22;
>> +                       reg =3D <0x0 0x10110000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23dma-cells =3D <1>;
>> +                       =23dma-channels =3D <8>;
>> +                       =23dma-requests =3D <32>;
>> +                       clocks =3D <&clock_imem IMEM_DMA1_IPCLKPORT_ACLK=
>;
>> +                       clock-names =3D =22apb_pclk=22;
>> +                       iommus =3D <&smmu_imem 0x801 0x0>;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               pdma0: pdma=4014280000 =7B
>> +                       compatible =3D =22arm,pl330=22, =22arm,primecell=
=22;
>> +                       reg =3D <0x0 0x14280000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23dma-cells =3D <1>;
>> +                       =23dma-channels =3D <8>;
>> +                       =23dma-requests =3D <32>;
>> +                       clocks =3D <&clock_peric PERIC_DMA0_IPCLKPORT_AC=
LK>;
>> +                       clock-names =3D =22apb_pclk=22;
>> +                       iommus =3D <&smmu_peric 0x2 0x0>;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               pdma1: pdma=4014290000 =7B
>> +                       compatible =3D =22arm,pl330=22, =22arm,primecell=
=22;
>> +                       reg =3D <0x0 0x14290000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23dma-cells =3D <1>;
>> +                       =23dma-channels =3D <8>;
>> +                       =23dma-requests =3D <32>;
>> +                       clocks =3D <&clock_peric PERIC_DMA1_IPCLKPORT_AC=
LK>;
>> +                       clock-names =3D =22apb_pclk=22;
>> +                       iommus =3D <&smmu_peric 0x1 0x0>;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               mct: mct=4010040000 =7B
>> +                       compatible =3D =22samsung,exynos4210-mct=22;
>> +                       reg =3D <0x0 0x10040000 0x0 0x800>;
>> +                       interrupts =3D <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>=
,
>> +                               <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
>> +                               <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&fin_pll>, <&clock_imem IMEM_MCT_PCL=
K>;
>> +                       clock-names =3D =22fin_pll=22, =22mct=22;
>> +               =7D;
>> +
>> +               serial_0: serial=4014180000 =7B
>> +                       compatible =3D =22samsung,exynos4210-uart=22;
>> +                       reg =3D <0x0 0x14180000 0x0 0x100>;
>> +                       interrupts =3D <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       dmas =3D <&pdma1 0>, <&pdma1 1>;
>> +                       dma-names =3D =22tx=22, =22rx=22;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_UART0>,
>> +                                <&clock_peric PERIC_SCLK_UART0>;
>> +                       clock-names =3D =22uart=22, =22clk_uart_baud0=22=
;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               serial_1: serial=4014190000 =7B
>> +                       compatible =3D =22samsung,exynos4210-uart=22;
>> +                       reg =3D <0x0 0x14190000 0x0 0x100>;
>> +                       interrupts =3D <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       dmas =3D <&pdma1 2>, <&pdma1 3>;
>> +                       dma-names =3D =22tx=22, =22rx=22;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_UART1>,
>> +                                <&clock_peric PERIC_SCLK_UART1>;
>> +                       clock-names =3D =22uart=22, =22clk_uart_baud0=22=
;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               pmu_system_controller: system-controller=4011400000 =7B
>> +                       compatible =3D =22samsung,exynos7-pmu=22, =22sys=
con=22;
>> +                       reg =3D <0x0 0x11400000 0x0 0x5000>;
>> +               =7D;
>> +
>> +               watchdog_0: watchdog=40100A0000 =7B
>> +                       compatible =3D =22samsung,exynos7-wdt=22;
>> +                       reg =3D <0x0 0x100A0000 0x0 0x100>;
>> +                       interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       samsung,syscon-phandle =3D <&pmu_system_controll=
er>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22watchdog=22;
>> +                       interrupt-mode =3D <1>;
>> +               =7D;
>> +
>> +               watchdog_1: watchdog=40100B0000 =7B
>> +                       compatible =3D =22samsung,exynos7-wdt=22;
>> +                       reg =3D <0x0 0x100B0000 0x0 0x100>;
>> +                       interrupts =3D <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       samsung,syscon-phandle =3D <&pmu_system_controll=
er>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22watchdog=22;
>> +                       interrupt-mode =3D <1>;
>> +               =7D;
>> +
>> +               watchdog_2: watchdog=40100C0000 =7B
>> +                       compatible =3D =22samsung,exynos7-wdt=22;
>> +                       reg =3D <0x0 0x100C0000 0x0 0x100>;
>> +                       interrupts =3D <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       samsung,syscon-phandle =3D <&pmu_system_controll=
er>;
>> +                       clocks =3D <&fin_pll>;
>> +                       clock-names =3D =22watchdog=22;
>> +                       interrupt-mode =3D <1>;
>> +               =7D;
>> +
>> +               pwm_0: pwm=4014100000 =7B
>> +                       compatible =3D =22samsung,exynos4210-pwm=22;
>> +                       reg =3D <0x0 0x14100000 0x0 0x100>;
>> +                       samsung,pwm-outputs =3D <0>, <1>, <2>, <3>;
>> +                       =23pwm-cells =3D <3>;
>> +                       clocks =3D <&clock_peric PERIC_PWM0_IPCLKPORT_I_=
PCLK_S0>;
>> +                       clock-names =3D =22timers=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               pwm_1: pwm=4014110000 =7B
>> +                       compatible =3D =22samsung,exynos4210-pwm=22;
>> +                       reg =3D <0x0 0x14110000 0x0 0x100>;
>> +                       samsung,pwm-outputs =3D <0>, <1>, <2>, <3>;
>> +                       =23pwm-cells =3D <3>;
>> +                       clocks =3D <&clock_peric PERIC_PWM1_IPCLKPORT_I_=
PCLK_S0>;
>> +                       clock-names =3D =22timers=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_0: hsi2c=4014200000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14200000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c0_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C0>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_1: hsi2c=4014210000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14210000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c1_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C1>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_2: hsi2c=4014220000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14220000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c2_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C2>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_3: hsi2c=4014230000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14230000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c3_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C3>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_4: hsi2c=4014240000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14240000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c4_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C4>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_5: hsi2c=4014250000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14250000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c5_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C5>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_6: hsi2c=4014260000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14260000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c6_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C6>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +
>> +               hsi2c_7: hsi2c=4014270000 =7B
>> +                       compatible =3D =22samsung,exynos7-hsi2c=22;
>> +                       reg =3D <0x0 0x14270000 0x0 0x1000>;
>> +                       interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>=
;
>> +                       =23address-cells =3D <1>;
>> +                       =23size-cells =3D <0>;
>> +                       pinctrl-names =3D =22default=22;
>> +                       pinctrl-0 =3D <&hs_i2c7_bus>;
>> +                       clocks =3D <&clock_peric PERIC_PCLK_HSI2C7>;
>> +                       clock-names =3D =22hsi2c=22;
>> +                       status =3D =22disabled=22;
>> +               =7D;
>> +       =7D;
>> +=7D;
>> --
>> 2.17.1
>>


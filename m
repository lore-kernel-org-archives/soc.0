Return-Path: <SRS0=Wr2J=HC=foss.st.com=prvs=96898be838=etienne.carriere@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E6C61D90
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 15:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01CE8C433C8; Tue, 21 Nov 2023 15:06:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E9F5C433C7;
	Tue, 21 Nov 2023 15:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E9F5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ALDrtQ9014582;
	Tue, 21 Nov 2023 16:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	selector1; bh=NSQTqtkoUPKX1gBN9J3jU6YVYeTm0qXHX7/yeko/snc=; b=Rj
	QV6dGq5OayP1mhKBtG6jq/zR+Wfppw9rbYlSWV1tYmLnRhulN9ZDvCbqloaN3Sk4
	CDbEF8imaXHwBckrK0uCYb4EONkMhOrtQJAHQJjOwzPz1qVOmXp9CWdYz4hX5bL/
	wyiO4UsMd01QHdcr4e4EPdHGGraCzsVFc8hqZgWNKYAuSFcFM7z26EKkV7iQg2se
	ucF30/WXAtexvUn4f2457Q6I6vz5dfNJnwLe1ottp0sCgrtXgoTL7bUp2KIscsY/
	K3l17Wuzd+3GBCeimWYQ+CEjms6ZRP/PtCtOlbUqJNUpEQLb9Hr1MWLstsgfiWqB
	dscE0WdrA0VSCLJtdwlg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ugwtyrane-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:05:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0E6B10002A;
	Tue, 21 Nov 2023 16:05:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA013228A27;
	Tue, 21 Nov 2023 16:05:53 +0100 (CET)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 21 Nov
 2023 16:05:52 +0100
Received: from SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1]) by
 SHFDAG1NODE1.st.com ([fe80::117e:c4ab:ed81:6cb1%13]) with mapi id
 15.01.2507.027; Tue, 21 Nov 2023 16:05:52 +0100
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        "Kevin
 Hilman" <khilman@baylibre.com>,
        "soc@kernel.org" <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Add SCMI reset support
Thread-Topic: [PATCH] ARM: multi_v7_defconfig: Add SCMI reset support
Thread-Index: AQHaDjNLViXe5j1+tUOJsy0uMnBb6rCEimUAgABwUT0=
Date: Tue, 21 Nov 2023 15:05:52 +0000
Message-ID: <87e815c023e3456cbb8cf7c709bbf942@foss.st.com>
References: <20231103085400.2924282-1-etienne.carriere@foss.st.com>,<16304f9a-fbbb-497f-917a-c2e2b8d67d9e@foss.st.com>
In-Reply-To: <16304f9a-fbbb-497f-917a-c2e2b8d67d9e@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.201.20.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_08,2023-11-21_01,2023-05-22_02

Hi Alexandre,

> From: Alexandre TORGUE - foss
> Sent: Tuesday, November 21, 2023 10:19 AM
>=20
> Hi Etienne
>=20
> On 11/3/23 09:54, Etienne Carriere wrote:
> > SCMI reset controllers are used in the ARMv7 STMicroelectronics stm32mp
> > boards:
> > - for STM32MP13: stm32mp135f-dk
> > - for STM32MP15 boards with SCMI variant, introduced by commit 5b7e5831=
3a77
> >    ("ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1=
)")
> >    * stm32mp157c-ev1-scmi
> >    * stm32mp157c-ed1-scmi
> >    * stm32mp157c-dk2-scmi
> >    * stm32mp157a-dk1-scmi
> >
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > ---
> >   arch/arm/configs/multi_v7_defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mul=
ti_v7_defconfig
> > index 23fc49f23d25..01b3797f9317 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -1189,6 +1189,7 @@ CONFIG_PWM_TEGRA=3Dy
> >   CONFIG_PWM_VT8500=3Dy
> >   CONFIG_KEYSTONE_IRQ=3Dy
> >   CONFIG_RESET_MCHP_SPARX5=3Dy
> > +CONFIG_RESET_SCMI=3Dy
> >   CONFIG_PHY_SUN4I_USB=3Dy
> >   CONFIG_PHY_SUN9I_USB=3Dy
> >   CONFIG_PHY_BRCM_USB=3Dm
>=20
> Just one question before to apply this patch. CONFIG_RESET_SCMI is set
> by the following dependency in drivers/reset/Kconfig:
>=20
> RESET_CONTROLLER [=3Dy] && (ARM_SCMI_PROTOCOL [=3Dy] || COMPILE_TEST [=3D=
n])
>=20
> CONFIG_ARM_SCMI is already set in multi_v7_defconfig.
> CONFIG_RESET_CONTROLLER seems to be set in each platform Kconfig.
>=20
> So not sure we need to force CONFIG_RESET_SCMI in the multi_v7_defconfig.

My bad. Thanks for noticing that to me. Indeed the default directive in
drivers/reset/Kconfig together with arm/multi_v7_defconfig makes CONFIG_RES=
ET_SCMI
be enabled.

Sorry for the noise, you can discard my patch request.

Best regards,
Etienne


>=20
> Regards
> Alex
>=20

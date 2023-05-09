Return-Path: <SRS0=I+LZ=A6=foss.st.com=prvs=349316498e=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D750C7EE22
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 06:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FD4DC433AE; Tue,  9 May 2023 06:28:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6264FC433EF;
	Tue,  9 May 2023 06:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6264FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34963lRj025939;
	Tue, 9 May 2023 08:27:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X5XkLQ4CRDZhwr0Yx/HkKtgzcHNa85elXl0Sl0Fa4Tc=;
 b=KasXnT1MAIKsqJXKafcg0ekWDAM7PGgQttsgEfrRa7mLfwZUl1E0tQfE2XT3MaBiheHk
 L6CYs1vlx86Ig9O567Uts8fS6YmBV19A4J08bs5Ssk2SAH/+9th3MnMGxRzbOW/ZfIpa
 3nwvblKopoQJd2QkW7gApQH16Ug4olHx7+Q9JOSlEwlYYOjwAGFuKbq4CuID8GkrrB/f
 qDW7YwgJcTsjkCI9rRrYrdMLh39WecnOaAwaygWxqKsDv7Ppj5BAkvg425N9TqUXY/n8
 hlx1Kh+BFlqE4vk3kGOaP5ss8iDv9b050s3YZB/M3oGNmmtOvJKRUt8Hj9HspXJw0xIc Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf79xae9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 08:27:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03F90100034;
	Tue,  9 May 2023 08:27:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCD96210F86;
	Tue,  9 May 2023 08:27:25 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 08:27:23 +0200
Message-ID: <d70d6266-9b93-92af-814a-1b5ec840e4b6@foss.st.com>
Date: Tue, 9 May 2023 08:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, <soc@kernel.org>,
        Christian Marangi
	<ansuelsmth@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        Antoine Tenart <atenart@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome
 Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Joel Stanley
	<joel@jms.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea
	<claudiu.beznea@microchip.com>,
        Lars Persson <lars.persson@axis.com>,
        Scott
 Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick
 Hawkins <nick.hawkins@hpe.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy
	<vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement
	<gregory.clement@bootlin.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        Peter Rosin <peda@axentia.se>, Nancy Yuen
	<yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>, Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim
	<shiraz.linux.kernel@gmail.com>,
        Marek Vasut <marex@denx.de>, Qin Jian
	<qinjian@cqplus1.com>,
        Jisheng Zhang <jszhang@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Enric Balletbo i Serra <eballetbo@gmail.com>,
        Javier
 Martinez Canillas <javier@dowhile0.org>,
        Michal Simek
	<michal.simek@xilinx.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@axis.com>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01



On 5/5/23 05:29, Rob Herring wrote:
>  arch/arm/boot/dts/{ => st}/stih407-b2120.dts       |    0
>  arch/arm/boot/dts/{ => st}/stih407-clock.dtsi      |    0
>  arch/arm/boot/dts/{ => st}/stih407-family.dtsi     |    0
>  arch/arm/boot/dts/{ => st}/stih407-pinctrl.dtsi    |    0
>  arch/arm/boot/dts/{ => st}/stih407.dtsi            |    0
>  arch/arm/boot/dts/{ => st}/stih410-b2120.dts       |    0
>  arch/arm/boot/dts/{ => st}/stih410-b2260.dts       |    0
>  arch/arm/boot/dts/{ => st}/stih410-clock.dtsi      |    0
>  arch/arm/boot/dts/{ => st}/stih410-pinctrl.dtsi    |    0
>  arch/arm/boot/dts/{ => st}/stih410.dtsi            |    0
>  arch/arm/boot/dts/{ => st}/stih418-b2199.dts       |    0
>  arch/arm/boot/dts/{ => st}/stih418-b2264.dts       |    0
>  arch/arm/boot/dts/{ => st}/stih418-clock.dtsi      |    0
>  arch/arm/boot/dts/{ => st}/stih418.dtsi            |    0
>  arch/arm/boot/dts/{ => st}/stihxxx-b2120.dtsi      |    0

Acked-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
